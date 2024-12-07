#! /usr/bin/env bash

#IFS=$'\n'


printArray(){
    array=("${@}")

    printf "printArray with ${#array[@]}\n"
    for i in "${array[@]}" ; do
        printf "%s " $i
    done
    printf "\n"
}

ha=( )
printArray "${ha[@]}"

ha+=("PLAY")
printArray "${ha[@]}"

ha+=("PLAYER_0")
printArray "${ha[@]}"

ha+=("PLAYER_1")
printArray "${ha[@]}"

#printArray "Hans" "Peter"

#delete=( "PLAY" )
#ha=( "${ha[@]/$delete}" )
#printArray "${ha[@]}"

removeElementFromArray () {
    toDelete="$1"
    array="$2"
    t_array=()
    for value in "${ha[@]}" ; do
        [[ "$value" != "$toDelete" ]] && t_array+=($value)
    done
    ha=("${t_array[@]}")
    unset t_array
}

removeElementFromArray "PLAY" "ha"
printArray "${ha[@]}"

removeElementFromArray "PLAYER_1" "ha"
printArray "${ha[@]}"

if (( "${#ha[@]}" == 1 )) ; then
    echo "1=${ha[0]}"
fi




#------------------------------------------------------------------------------
