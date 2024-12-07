
#------------------------------------------------------------------------------
# replaces variable with default value if variable not exists
#  1 : variable to analyze
#  2 : variable for return value
#  3 : variable default value
_handleVariableAlternativ () {

   [[ -z "${DEBUG-}" ]] \
      || \
      >&2 printf "      function _handleVariableAlternativ 1:%s,2:%s,3:%s\n" "${1}" "${2}" "${3}"

   local V_A="$1"
   local V_R="$2"
   local V_D="$3"

   if ! eval "[[ -z \"\${${1}-}\" ]]" ; then
      ( [[ -z "${DEBUG-}" ]] || >&2 printf "      variable defined\n" )
      eval "${V_R}=\${${1}}"
      ( [[ -z "${DEBUG-}" ]] || >&2 printf "      V_R=${V_R}, ${1}\n" )
   else
      eval "${V_R}=${V_D}"
   fi
}

#------------------------------------------------------------------------------
_handleVariable () {
   [[ -z "${DEBUG-}" ]] || >&2 printf "      function _handleVariable 1:%s,2:%s\n" "${1}" "${2}"
   local V_A="$1" # variable to analyze
   local V_R="$2" # variable for return value

   # found only variable
   if [[ "$V_A" =~  ^([a-zA-Z0-9]*)$ ]] ; then

      ( [[ -z "${DEBUG-}" ]] || >&2 printf "      found=${BASH_REMATCH[1]}\n" )

      if ! eval "[[ -z \"\${${BASH_REMATCH[1]}-}\" ]]" ; then
         ( [[ -z "${DEBUG-}" ]] || >&2 printf "      variable defined\n" )
         eval "${V_R}=\${${BASH_REMATCH[1]}}"
         ( [[ -z "${DEBUG-}" ]] || >&2 printf "      V_R=${V_R}, ${BASH_REMATCH[1]}\n" )
      else
         ( >&2 echo "[ERROR] variable undefined" )
         false
      fi
   else
      ( >&2 echo "[ERROR] something strange happen = $V_A" )
      false
   fi

}

#------------------------------------------------------------------------------
# 1 : File
# 2 : SplitToken
# 3 : Variable
b_gen_cfg () {
   local file="${1-/dev/stdin}"
   local tk="@"
   local IFS=$'\n'

   ( [[ -z "${DEBUG-}" ]] || >&2 printf "\nfunction b_gen_cfg file:$file tk:$tk\n" )

   while read line ; do
      ( [[ -z "${DEBUG-}" ]] || >&2 printf "  read line:$line\n" )

      local LINE_SCANNED="false"  # found a matcher , default yes
      local LINE_SCAN="$line"     # lets start to scan the hole line
      local LINE_NEW=""           # the new generated line
      local HIDE_ARRAY=()         # save STOPBLOCK == true
      
      while [[ "$LINE_SCANNED" != "true" ]] ; do
         ( [[ -z "${DEBUG-}" ]] || >&2 printf "\n    LINE_NEW=$LINE_NEW;LINE_SCAN=$LINE_SCAN\n")

         if [[ "$LINE_SCAN" =~ ^$ ]] ; then
            # empty line
            ( [[ -z "${DEBUG-}" ]] || >&2 printf "    found empty line\n" )
            LINE_SCANNED="true"

         elif [[ "$LINE_SCAN" =~ ^([^$tk]+)(.*) ]] ; then
            # line starts with no token

            ( [[ -z "${DEBUG-}" ]] || >&2 printf "    found line start with no token " )
            ( [[ -z "${DEBUG-}" ]] || >&2 printf "( 1=${BASH_REMATCH[1]},2=${BASH_REMATCH[2]} )\n" )

            if [[ "${#HIDE_ARRAY[*]}" -eq "0" ]] ; then
               LINE_NEW="${LINE_NEW}${BASH_REMATCH[1]}"
            else
               LINE_NEW="${LINE_NEW}"
            fi

            LINE_SCAN="${BASH_REMATCH[2]}"
            if [[ "${#LINE_SCAN}" -lt 1 ]];then  
               LINE_SCANNED="true"
            fi

         elif [[ "$LINE_SCAN" =~ ^([$tk])STARTBLOCK:([a-zA-Z0-9_]+)([$tk])(.*)$ ]] ; then
            # line starts with token and startblock value
            local B_RM_2="${BASH_REMATCH[2]}"
            local B_RM_4="${BASH_REMATCH[4]}"
            ( [[ -z "${DEBUG-}" ]] || >&2 printf "    found line start with startblock" )
            ( [[ -z "${DEBUG-}" ]] || >&2 printf " 2:${B_RM_2} 4:${B_RM_4}\n" )

            if eval "[[ \${${B_RM_2}} != 'true' ]]" ; then
               HIDE_ARRAY+=( "\${${B_RM_2}}" )
            fi

            LINE_SCAN="${B_RM_4}"
            if [[ "${#LINE_SCAN}" -lt 1 ]];then  
               LINE_SCANNED="true"
            fi

         elif [[ "$LINE_SCAN" =~ ^([$tk])STOPBLOCK:([a-zA-Z0-9_]+)([$tk])(.*)$ ]] ; then
            # line starts with token and stopblock value
            
            local B_RM_2="${BASH_REMATCH[2]}"
            local B_RM_4="${BASH_REMATCH[4]}"
            
            ( [[ -z "${DEBUG-}" ]] || >&2 printf "    found line start with stopblock" )
            ( [[ -z "${DEBUG-}" ]] || >&2 printf " 2=${BASH_REMATCH[2]}\n" )

            if eval "[[ \${${BASH_REMATCH[2]}} != 'true' ]]" ; then
               HIDE_ARRAY="${HIDE_ARRAY[@]/${BASH_REMATCH[2]}}"
            fi

            LINE_SCAN="${BASH_REMATCH[4]}"
            if [[ "${#LINE_SCAN}" -lt 1 ]];then  
               LINE_SCANNED="true"
            fi

         elif [[ "$LINE_SCAN" =~ ^([$tk])([a-zA-Z0-9_]+)([$tk])(.*)$ ]] ; then
            # line starts with token

            ( [[ -z "${DEBUG-}" ]] || >&2 printf "    found line start with token " )
            ( [[ -z "${DEBUG-}" ]] || >&2 printf "( 2=${BASH_REMATCH[2]},4=${BASH_REMATCH[4]} )\n" )

            LINE_SCAN="${BASH_REMATCH[4]}"
            if [[ "${#LINE_SCAN}" -lt 1 ]];then  
               LINE_SCANNED="true"
            fi

            _handleVariable "${BASH_REMATCH[2]}" V_TMP
            ( [[ -z "${DEBUG-}" ]] || >&2 printf "    add TMP=${V_TMP-}\n" )

            if [[ "${#HIDE_ARRAY[*]}" -eq "0" ]] ; then
               LINE_NEW="${LINE_NEW}${V_TMP-}"
            else
               LINE_NEW="${LINE_NEW}"
            fi

         elif [[ "$LINE_SCAN" =~ ^([$tk])([a-zA-Z0-9_]+):([a-zA-Z0-9_]+)([$tk])(.*)$ ]] ; then
            # line starts with token and alternativ value

            ( [[ -z "${DEBUG-}" ]] || >&2 printf "    found line start with token and alternativ value" )
            ( [[ -z "${DEBUG-}" ]] || >&2 printf " 2=${BASH_REMATCH[2]},4=${BASH_REMATCH[3]}\n" )

            LINE_SCAN="${BASH_REMATCH[5]}"
            if [[ "${#LINE_SCAN}" -lt 1 ]];then  
               LINE_SCANNED="true"
            fi

            _handleVariableAlternativ "${BASH_REMATCH[2]}" V_TMP "${BASH_REMATCH[3]}"
            ( [[ -z "${DEBUG-}" ]] || >&2 printf "    add TMP=${V_TMP-}\n" )

            LINE_NEW="${LINE_NEW}${V_TMP-}"

         else
            # unexpected situation
            ( >&2 echo "not found line_new=${LINE_NEW} line_scan=${LINE_SCAN}" && false )
            false
         fi

         ( [[ -z "${DEBUG-}" ]] || >&2 printf "    scan done\n" )
         if [[ "$LINE_SCANNED" == "true" ]];then
            printf "$LINE_NEW\n"
         fi

      done

      ( [[ -z "${DEBUG-}" ]] || >&2 echo "while done" )

   done < $file
}

#------------------------------------------------------------------------------
