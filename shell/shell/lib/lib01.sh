#------------------------------------------------------------------------------
function hallo {
	echo 'greetings from hallo'
}

#------------------------------------------------------------------------------
function halloArg {
	echo "halloArg Value=$1 Port=$2"
}

#------------------------------------------------------------------------------
function verbose {
	echo "[INFO] " $*
}

#------------------------------------------------------------------------------
function error {
	echo "[ERROR] " $*
}

#------------------------------------------------------------------------------
function registerVAR {
  echo "registerVAR" $*
}

#------------------------------------------------------------------------------
function runCommander {
  verbose "runCommander $* $#"
  
  case $1 in
	  stop) 
		  verbose "stop"
		  ;;
      status) 
		  verbose "status"
  		  ;;
      exe)
		  verbose "exe"
		  ;;
	   help)
		   verbose "help"
		   exit
		   ;;
  esac
}
#------------------------------------------------------------------------------
function appINIT () {
	verbose 'init structure'
	verbose 'shure y|n'
}
#------------------------------------------------------------------------------
function runJenkins () {
	java -Dhudson.DNSMultiCast.disabled=true -jar /usr/local/opt/jenkins/libexec/jenkins.war
}
#------------------------------------------------------------------------------
