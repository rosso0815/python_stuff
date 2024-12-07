#!/bin/ksh  
# --------------------------------------------------------- 
# 
# Author: 
# ----------------- 
# Yngve Clausen (yngve.clausen@itpp.no) 
#	it_prosjektpartner 
#	Oslo, Norway 
# 
# --------------------------------------------------------- 
# 
# Script name    : ora2html.sh 
# Script version : see RCCS info further down 
# 
# Input  : none 
# Output : text on stdout or to html-file 
# 
# Successfully run on platforms : 
# - Solaris 2.7 
# - Tru64 4.x, 5.x 
# - Linux (Mandrake 8.2) 
# 
# --------------------------------------------------------- 
# 
# Description: 
# ----------------- 
# Ora2html is a script for collecting information about oracle databases on a server. 
# Output is spooled to either text (stdout) or html. 
# Explanations and interpreted output is available for some tests. 
# 
# This script provides information like 
# - DB initfiles 
# - SQL*Net / tnsnames / listener config 
# - datafile / tablespace information 
# - user / schema information 
# - segment information 
# - limited usage statistics (SGA, sessions) 
# - .. 
# - .. 
# 
# --------------------------------------------------------- 
# 
# Usage: 
# ----------------- 
# This script should be run as the oracle os user, and the oratab must be installed in 
# the correct directory, according to what the platform spesific installation 
# guide specifies.  
# 
#   ./ora2html.sh [-v|-x] 
# 
# Output is spooled to std out if text-output is selected. (Controlled by DBINFO_OUTPUT) 
# Select the correct shell to use by changing the first row in this script. 
# Run it the first time using the -x option to unpack resource files. 
# Run it with the -v option to display version number 
# 
# NOTE : This script assumes the database is 
#        installed using os-group dba and os-user oracle 
#        It might work 100% if another user is used - I have only tested it once ... 
# 
# NOTE2 : Unpacking the embedded resource files requires uudecode. Linux users 
#         can find it in the sharutils package. 
# 
# --------------------------------------------------------- 
# 
# Disclaimer :  
# ----------------- 
# The script has been tested successfully on 8.0.5, 8.0.6, 8.1.6 and 8.1.7 databases  
# running on a mix of Tru64, Solaris and Linux. None of the db's caught fire or  
# vanished mysteriously ... 
# This doesn't mean the script hasn't got code that may harm or encumber your system  
# and databases seriously. 
# Anyone that chooses to use this script, accepts the full responsibility for  
# unwanted and unforeseen consequences of doing so. 
# This disclaimer also extends to any advice and/or information this script provides. 
# 
# Check the script for harmful code, and run it on a test instance the first time. 
#  
# --------------------------------------------------------- 
#  
# btw : 
# ----------------- 
# If you modify or improve the script, please submit the modifications to either  
#  the config2html mailing list, or the author. 
# 
# Suggestions or comments are always welcome. 
# 
# --------------------------------------------------------- 
# 
# Revision history: 
# ----------------- 
# V.1.0 :  
#	Yngve Clausen - March 2002 
#	* Initial script version. 
#	 ... Just waiting for the bugs ... 
# 
# V.1.1 :  
#	Yngve Clausen - March 2002 
#	* Added TEXT/HTML output. Switched on/off by setting DBINFO_OUTPUT variable. 
#	* Minor bugfix for pre-8i databases in GetInstalledProducts fixed. 
#	* Added uuencoded sourcefiles at end of script for easy distribution 
#	  of the needed resources (sql's, images). 
# 
# V.1.11 : 
#	Yngve Clausen - April 2002 
#	* Added additional OS config and setup tests concerning 
#	  oracle database users. 
# 
# V.1.12 : 
#	Yngve Clausen - April 2002 
#	* Restructured script to resolve all OS-spesific code at the top using a case statement. 
#		(Better to have it all in one place) 
#	* Renamed all variables to DBINFO_* prefix for easy removal from ENV-listing. 
#	* Added listing of oracle password users. 
#	* Added listing of unavailable database files 
# 
# V.1.13 : 
#       Yngve Clausen - April 2002 
#	* Added more support for 8.0.x series of databases.  
#	  Using $DBINFO_DB_VERISON / $DBINFO_DB_VERISON_SHORT 
#	  to store version information. Some tests are just skipped for these series of databases ... 
#	* Minor bugfix for test that caused html headerfile $DBINFO_HTML_TOP to be written no matter 
#	  which value DBINFO_OUTPUT was set to. 
#	* Script must now be called with -x to unpack the resource files.  
#	  After unpacking, the script terminates. 
# 
# V.1.2 : 
#       Yngve Clausen - May 2002 
#	* After getting tired of commenting sections in and out while scripting, sections can  
#	  now be enabled/disabled using the DBINFO_CHECK_* variables further down. 
#	* Started a section related to security checks. This includes information about default logins,  
#	  external password users, etc. This probably shouldn't be made public on a website  
#	  by default, since there's no sense in annonuncing your systems weakest spots ... 
#	  Several of the tests in the users section has been moved here. Some other potentially  
#	  revealing tests (ps-listing, etc) are still left for all to see ... 
#	  THIS SECTION IS DISABLED BY DEFAULT. 
#	  Enable it by changing the variable DBINFO_CHECK_SECURITY to YES 
#	* Added a function AddText for adding text to the output. In html-mode the colour  
#	  can be specified as the first argument to the function. In plain-text mode,  
#	  this arg is not used, but must be supplied. 
#	* Rewrote the layout of the script. The content of each $ORACLE_HOME present on the system 
#	  is now processed before any database tests are done. This means resource files like 
#	  tnsnames.ora, sqlnet.ora, installed products etc. will now only be listed once for  
#	  each ORACLE_HOME, and not once for each db. 
#	* Moved external sql-scripts into this script to minimize reliance on external 
#	  sources. Password list is still external for easy editing. 
#	* Restructured layout for tablespaces, datafiles and segments. Added more info. 
#	* Added explanations to several tests for easier understanding of the displayed data. 
#	  This can be turned on/off by changing DBINFO_EXPLAIN to either YES or NO 
#	  If the info provided is unclear or even outright wrong, please let me now,  
#	  and I'll update those sections. 
# 
# V.1.21 : 
#	Yngve Clausen - May 2002 
#	* Added support for linux (bash).  
#	* Removed DBINFO_PS since it's not needed. 
#	* Added /bin:/usr/ucb to PATH in GetSidEnvironment ... *oops* 
#	* Added credits for sql scripts I've found and used. Sorry - I can't remember where I originally  
#	  found them all ... If somebody feels offended or left out -> contact me. 
#	* Added listing of transportable tablespaces (if any) for 8i -> 
#	* RENAMED SCRIPT TO ora2html.sh, in case somebody wants to write one for 
#	  sybase, informix, db2, etc ... 
#	 
# V.1.22 : 
#	Yngve Clausen - May 2002 
#	* Minor bugfixes to make environment setting more robust. Update DBINFO_PATH with  
#	  PATHs you need the script to know about ... Original $PATH will be overwritten... 
# 
# V.1.23 : 
#	Yngve Clausen - June 2002 
#	* Minor change to handle DIV/0 feature and sql optimization 
# 
# --------------------------------------------------------- 
 
export DBINFO_RCCS="@(#)ora2html for oracle - Ver. 1.23"	 
export DBINFO_VERSION=$(echo $DBINFO_RCCS | cut -d" " -f6) 
 
#--------------------------- 
# 
# Set HTML-related information 
# 
#--------------------------- 
export DBINFO_OUTPUT_PATH=/service/log/server_overview
#export DBINFO_OUTPUT=TEXT 
export DBINFO_OUTPUT=HTML 
export DBINFO_HTML_TOP=html_top.html 
export DBINFO_HTML_BOTTOM=html_bottom.html 
export DBINFO_HTML_DOC=${DBINFO_OUTPUT_PATH}/$(uname -n)_oracle.html 
export DBINFO_EXPIRE_CACHE=`LC_TIME="" date "+%a, %d %b %Y "`"23:00 GMT" 
export DBINFO_FONT_COLOR=blue 
 
#--------------------------- 
# 
# Set hardware/OS-dependant variables: 
# - Path to files 
# - Path to spesific executables we need 
# - Special commandline options 
# - Command strings (used by an 'eval' further down) 
# - Default values if not a known system type 
# 
#--------------------------- 
export DBINFO_ID=id 
export DBINFO_GREP=grep 
export DBINFO_ORATAB=/etc/oratab 
export DBINFO_KERNEL_INFO=false 
export DBINFO_SWAP_INFO=false 
export DBINFO_MEM_INFO=false 
 
case $(uname -s) in 
	SunOS ) DBINFO_GREP=/usr/xpg4/bin/grep 
		DBINFO_ID=/usr/xpg4/bin/id 
		DBINFO_KERNEL_INFO="$DBINFO_GREP -E \"set shm|set sem\" /etc/system" 
		DBINFO_MEM_INFO="/usr/sbin/prtconf | $DBINFO_GREP -i ^Memory" 
		DBINFO_SWAP_INFO="/usr/sbin/swap -l;echo;/usr/sbin/swap -s" 
		DBINFO_ORATAB=/var/opt/oracle/oratab;; 
	OSF1  ) DBINFO_GREP=/sbin/grep 
		DBINFO_KERNEL_INFO="/sbin/sysconfig -q ipc" 
		DBINFO_MEM_INFO="/usr/bin/vmstat -P | $DBINFO_GREP ^Total" 
		DBINFO_SWAP_INFO="/sbin/swapon -s";; 
	Linux )	DBINFO_GREP=/bin/grep 
		DBINFO_ID=/bin/id 
		DBINFO_KERNEL_INFO="/sbin/sysctl -a 2>/dev/null | $DBINFO_GREP -E \"kernel.shm|kernel.sem\"" 
		DBINFO_MEM_INFO="/usr/bin/free" 
		DBINFO_SWAP_INFO="/sbin/swapon -s" 
		# We need echo -e or xpg_echo for backspaced chars to work on Linux ... 
		shopt -s xpg_echo;; 
	AIX )	DBINFO_ORATAB=/etc/oratab ;;
	* )	echo "Unable to find system type. This may cause problems ...";; 
esac 
 
#--------------------------- 
# 
# Enable/disable sections of the script 
# 
#--------------------------- 
export DBINFO_CHECK_OS=YES 
export DBINFO_CHECK_OSUSER=YES
export DBINFO_CHECK_COMPONENTS=YES 
export DBINFO_CHECK_DB_FILES=YES 
export DBINFO_CHECK_DB=YES 
export DBINFO_CHECK_BASIC_DB=YES 
export DBINFO_CHECK_STORAGE=YES 
export DBINFO_CHECK_USERS=YES 
export DBINFO_CHECK_OBJECTS=YES 
export DBINFO_CHECK_SESSIONS=YES 
export DBINFO_CHECK_SECURITY=NO 
 
#--------------------------- 
# 
# Other variables 
# 
#--------------------------- 
# Should we print background information on some of the tests we perform? 
export DBINFO_EXPLAIN=YES 
 
# Count encountered problems while executing the script 
typeset -i DBINFO_ERRORS=0 
 
# Save original PATH variable ... 
export DBINFO_ORGPATH=$PATH 
 
# Set the paths we know we need. This will get used in GetSidEnvironment to set PATH later on. 
# In the meantime, set PATH=DBINFO_PATH to make sure we can do what we need before that happens. 
export DBINFO_PATH=/bin:/sbin:/usr/sbin:/usr/bin:/usr/bin/X11:/usr/local/bin:/bin:/usr/ucb:/usr/ccs/bin:/usr/contrib/bin 
export PATH=$DBINFO_PATH 
 
#--------------------------- 
# Common exit procedure 
# Input : (1) Errorcode (2) Exitmessage 
# Output: (1) Exitcode  (2) Exitmessage 
#--------------------------- 
ExitScript () 
	{ 
	[ "$DBINFO_OUTPUT" = "TEXT" ] && echo "$1 : $2" 
	[ "$DBINFO_OUTPUT" = "HTML" ] && HtmlFooter 
	exit $1 
	} 
 
#--------------------------- 
# Common errormessage procedure 
# Input : (1) Errorcode (2) Exitmessage 
# Output: (1) Errorcode (2) Exitmessage 
#--------------------------- 
Error () 
	{ 
	[ "$DBINFO_OUTPUT" = "TEXT" ] && echo "!! Error $1 : $2" 
	[ "$DBINFO_OUTPUT" = "HTML" ] && echo "<CENTER><FONT COLOR=red><B>!! Error $1 : $2</font></center></B>\n" >> $DBINFO_HTML_BOTTOM 
	let DBINFO_ERRORS+=1 
	return $1 
	} 
 
#--------------------------- 
# Common func to exec other functions with  
# calls to html-generating code. 
# Input : (1) Indendation  
#	  (2) Paragraph heading  
#	  (3) Function to exec  
# Output: (1) Errorcode 
#--------------------------- 
Exec () 
	{ 
	if [ "$DBINFO_OUTPUT" = "HTML" ] ; then 
		HtmlSectionHeader $1 "$2" 
		echo "<PRE><B>" >> $DBINFO_HTML_BOTTOM 
		$3 >> $DBINFO_HTML_BOTTOM 
		DBINFO_EC=$? 
		echo "</B></PRE>\n" >> $DBINFO_HTML_BOTTOM 
		echo "<meta http-equiv=\"expires\" content=\"${DBINFO_EXPIRE_CACHE}\">" >> $DBINFO_HTML_BOTTOM 
		return $DBINFO_EC 
	fi 
 
	[ "$DBINFO_OUTPUT" = "TEXT" ] && TextSectionHeader $1 "$2" 
	$3  
	return $? 
	} 
 
#--------------------------- 
# Unpack necessary resourcefiles 
# Input : none 
# Output: none. Returncode. 
#--------------------------- 
UnpackResourceFiles () 
	{ 
	echo "Unpacking resourcefiles ..." 
	uudecode $(basename $0)	|| return $? 
	gunzip -cf src.tgz | tar xvf - >/dev/null 2>&1 || return $? 
	rm -f src.tgz 
	} 
 
#--------------------------- 
# Print section header 
# Input : (1) Header size 
#	  (2) String to print to stdout 
# Output: String to print to stdout 
#--------------------------- 
TextSectionHeader () 
	{ 
	case $1 in 
		H1)	DBINFO_BAR="######################################################################################";; 
		H2)	DBINFO_BAR="#####################################################################";; 
		H3)	DBINFO_BAR="######################################################";; 
		H4)	DBINFO_BAR="############################################";; 
	esac 
	echo "\n$DBINFO_BAR\n# $2\n$DBINFO_BAR\n" 
	return $? 
	} 
 
#--------------------------- 
# Print section header in HTML 
# Input : (1) Header size 
#	  (2) String to print to stdout 
# Output: String to print to stdout 
#--------------------------- 
HtmlSectionHeader () 
	{ 
	echo "<A NAME=\"$2\">" >> $DBINFO_HTML_BOTTOM 
	echo "<A HREF=\"#Content-$2\"><$1> $2 </$1></A><P>" >> $DBINFO_HTML_BOTTOM 
 
	# Update content section of html document 
	case $1 in 
		H1) echo "</UL></UL></UL></UL><IMG SRC="button.gif" WIDTH=14 HEIGHT=14><A NAME=\"Content-$2\"></A><A HREF=\"#$2\">$2</A><br><UL><UL><UL><UL>" >> $DBINFO_HTML_TOP;; 
		H2) echo "</UL></UL></UL><LI><A NAME=\"Content-$2\"></A><A HREF=\"#$2\">$2</A><br><UL><UL><UL>" >> $DBINFO_HTML_TOP;; 
		H3) echo "</UL></UL><LI><A NAME=\"Content-$2\"></A><A HREF=\"#$2\">$2</A><br><UL><UL>" >> $DBINFO_HTML_TOP;; 
		H4) echo "</UL><LI><A NAME=\"Content-$2\"></A><A HREF=\"#$2\">$2</A><br><UL>" >> $DBINFO_HTML_TOP;; 
	esac 
	return $? 
	} 
 
#--------------------------- 
# Print HTML document header  
# Input : none 
# Output: String to print to stdout 
#--------------------------- 
HtmlHeader () 
	{ 
	echo "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\"> 
	<HTML> <HEAD> 
	<META NAME=\"GENERATOR\" CONTENT=\"$DBINFO_RCCS\"> 
 	<META NAME=\"AUTHOR\" CONTENT=\"yngve.clausen@itpp.nospam.no\"> 
 	<META NAME=\"CREATED\" CONTENT=\"Yngve Clausen\"> 
 	<META NAME=\"CHANGED\" CONTENT=\"`$DBINFO_ID` %A%\"> 
 	<META NAME=\"DESCRIPTION\" CONTENT=\"$(basename $0) ver. $DBINFO_VERSION $(date)\"> 
 	<META NAME=\"subject\" CONTENT=\"ora2html.sh $DBINFO_VERSION on $(uname -n)\"> 
	<TITLE>Documentation - $DBINFO_VERSION</TITLE> 
	</HEAD><BODY> 
	<BODY LINK=\"#0000ff\" VLINK=\"#800080\" BACKGROUND=\"cfg2html_back.jpg\"> 
	<H1><CENTER><FONT COLOR=$DBINFO_FONT_COLOR> 
	<P><hr><B>$(uname -n) - $(uname -s) - $(uname -r) - Oracle System Documentation</P></H1> 
	<hr><H2><FONT COLOR=$DBINFO_FONT_COLOR><small>Created $(date) with ora2html $DBINFO_VERSION</font></center></B></small></H2>\n<HR> 
	<H1>Contents\n</font></H1>\n<UL><UL><UL><UL>" >| $DBINFO_HTML_TOP 
	return $? 
	} 
 
#--------------------------- 
# Print HTML document footer 
# Input : none 
# Output: String to print to stdout 
#--------------------------- 
HtmlFooter () 
	{ 
	echo "</P><P>\n<hr><center><FONT COLOR=$DBINFO_FONT_COLOR>Created $(date) with ora2html $DBINFO_VERSION by <A HREF="mailto:yngve.clausen@itpp.nospam.no?subject=ora2html_$DBINFO_VERSION">Yngve Clausen, SysAdm</A></center></P></font>" >> $DBINFO_HTML_BOTTOM 
	echo "<hr><center><A HREF="http://come.to/cfg2html">  [ Download cfg2html collectors from the cfg2html home page ] </b></A></center></P><hr></BODY></HTML>\n" >> $DBINFO_HTML_BOTTOM 
	# Update contents section of html page 
	echo "</UL></UL></UL></UL><hr>" >> $DBINFO_HTML_TOP 
	cat $DBINFO_HTML_TOP $DBINFO_HTML_BOTTOM >| $DBINFO_HTML_DOC 
	rm -f $DBINFO_HTML_TOP $DBINFO_HTML_BOTTOM 
	return $? 
	} 
 
#--------------------------- 
# Print to screen specified text 
# Input : (1) Colour to use in html mode (Specify 'std' to use $DBINFO_FONT_COLOR) 
#	  (2) Text string to print 
# Output: String to print to stdout 
#--------------------------- 
AddText () 
	{ 
	[ "$DBINFO_OUTPUT" = "TEXT" ] && echo "$2" 
	# If in html-mode,  
	if [ "$DBINFO_OUTPUT" = "HTML" ] ; then 
		[ "$1" = "std" ] && echo "<FONT COLOR=$DBINFO_FONT_COLOR>$2</font>" >> $DBINFO_HTML_BOTTOM 
		[ "$1" != "std" ] && echo "<FONT COLOR=$1>$2</font>" >> $DBINFO_HTML_BOTTOM 
	fi 
	return $? 
	} 
 

#--------------------------- 
# copy glogin.sql   
# from : /service/scripts/oracle/admin
# to   : $ORACLE_HOME/sqlplus/admin 
#--------------------------- 
CopyGlogin()
{
	cp /service/scripts/oracle/admin/glogin.sql $ORACLE_HOME/sqlplus/admin/glogin.sql
}

#--------------------------- 
# copy glogin_whoami.sql   
# from : /service/scripts/oracle/admin
# to   : $ORACLE_HOME/sqlplus/admin 
#--------------------------- 
CopyGloginWhoami()
{
	cp /service/scripts/oracle/admin/glogin_whoami.sql $ORACLE_HOME/sqlplus/admin/glogin.sql
}

#--------------------------- 
# Run specified sql  
# Input : (1) pagesize (2) String to run 
# Output: Output of command 
#--------------------------- 
RunSql () 
	{ 
	DBINFO_OUT=$(echo "whenever sqlerror exit sql.sqlcode\nset pagesize $1\nset linesize 2000\n$2" | sqlplus -s internal) 
	DBINFO_EC=$? 
	[ $DBINFO_EC -gt 0 ] && return $DBINFO_EC 
 
	# OK to return no rows ... 
	echo "$DBINFO_OUT" | $DBINFO_GREP "^no rows selected" && return 0 
	 
	# ... else strip output of unwanted lines 
	echo "$DBINFO_OUT" | $DBINFO_GREP -v -E "^$|[0-9] rows selected|PL/SQL procedure successfully" 
	return $? 
	} 
 
#--------------------------- 
# Run specified sql script  
# Input : (1) Script to run 
# Output: Output to stdout 
#--------------------------- 
RunSqlScript () 
	{ 
	DBINFO_OUT=$(sqlplus -s internal @$1) 
	DBINFO_EC=$? 
	[ $DBINFO_EC -gt 0 ] && return $DBINFO_EC 
 
	# OK to return no rows ... 
	echo "$DBINFO_OUT" | $DBINFO_GREP "^no rows selected" && return 0 
 
	# ... else strip output of unwanted lines 
	echo "$DBINFO_OUT" | $DBINFO_GREP -v -E "^$|[0-9] rows selected|PL/SQL procedure successfully" 
	return $? 
	} 
 
#--------------------------- 
# Get information about OS 
# Input : None 
# Output: information to stdout 
#--------------------------- 
GetOsInfo () 
	{ 
	echo "Server name       : $(uname -n)"  
	echo "Server HW type    : $(uname -m)" 
	#echo "Server processor  : $(uname -p)" 
	echo "Server OS         : $(uname -s)" 
	echo "Server OS relase  : $(uname -r)" 
	echo "Server OS version : $(uname -v)" 
	return $? 
	} 
 
#--------------------------- 
# Get information about active kernel parameters 
# Input : None 
# Output: information to stdout 
#--------------------------- 
GetKernelInfo () 
	{ 
	eval $DBINFO_KERNEL_INFO 
	return $? 
	} 
 
#--------------------------- 
# Get information about available 
# physical / swap memory 
# Input : None 
# Output: information to stdout 
#--------------------------- 
GetMemInfo () 
	{ 
	# Installed memory info 
	eval $DBINFO_MEM_INFO || return $? 
	echo 
	# Swap info 
	eval $DBINFO_SWAP_INFO || return $? 
	return 0 
	} 
 
#--------------------------- 
# Get information about filesystems 
# Input : None 
# Output: information to stdout 
#--------------------------- 
GetDfInfo () 
	{ 
	df -k 
	return $? 
	} 
 
#--------------------------- 
# Get information about OS-users 
# that can startup, shutdown and  
# admin databases 
# Input : None 
# Output: information to stdout 
#--------------------------- 
GetOraUsers () 
	{ 
	echo "(Assuming database is installed using default os-group dba.)\n" 
 
	# Users with group membership in dba group 
	echo "Database admin-user(s) seems to be:" 
 	awk -F: ' /^dba:/ {print "Group "$1,"(gid "$3") : "$4}' /etc/group || return $? 
 
	# Primary users with default group membership in dba group 
	echo "\nPrimary database user(s) seems to be:" 
	DBINFO_DBAGROUP=$($DBINFO_GREP ^dba /etc/group | cut -d: -f3) 
	DBINFO_ORAUSERS=$(cut -d: -f1,4 /etc/passwd | $DBINFO_GREP :$DBINFO_DBAGROUP\$ | cut -d: -f1) 
 
	if [ "$DBINFO_ORAUSERS" = "" ] ; then 
		echo "Unable to find any primary user of database(s) using /etc/group and /etc/passwd" 
		return 1 
	else 
		echo "$DBINFO_ORAUSERS" 
		return 0 
	fi 
	} 
 
#--------------------------- 
# Get information about the current OS-user 
# running this script 
# Input : None 
# Output: information to stdout 
#--------------------------- 
GetOsUserInfo () 
	{ 
	echo "Username    : $(whoami)" 
	echo "Userid      : $($DBINFO_ID -u $(whoami))" 
	echo "Pri. group  : $($DBINFO_ID -g $(whoami))" 
	echo "Sec. groups : $($DBINFO_ID -G $(whoami))" 
	echo "Shell       : $($DBINFO_GREP ^$(whoami) /etc/passwd | awk -F: '{print $NF}')" 
	echo "Homedir     : $($DBINFO_GREP ^$(whoami) /etc/passwd | cut -d: -f6)" 
	return $? 
	} 
 
#--------------------------- 
# List the content of the crontab  
# Input :  none 
# Output:  crontab for user oracle listed 
#--------------------------- 
GetCrontab () 
	{ 
	crontab -l 
	return $? 
	} 
 
#--------------------------- 
# List the environment settings for user 
# Note that you'll also get the env's we've set  
# while runnig this script 
# Input :  none 
# Output:  environment settings 
#--------------------------- 
GetUserenv () 
	{ 
	# Restore original PATH for this function only ... 
	export PATH=$DBINFO_ORGPATH 
	env | $DBINFO_GREP -v ^DBINFO_ 
	EC=$? 
	export PATH=$DBINFO_PATH 
	return $EC 
	} 
 
#--------------------------- 
# List the active user processes on the server  
# Input :  none 
# Output:  environment settings 
#--------------------------- 
GetUserProcs () 
	{ 
	ps -fu $(whoami) 
	return $?  
	} 
 
#--------------------------- 
# Find the location of the oratab 
# Input :  OS type (uname -s) 
# Output:  None. Location of oratab stored in DBINFO_ORATAB var 
#--------------------------- 
GetOratab () 
	{ 
	if [ -f $DBINFO_ORATAB ] ; then 
		echo "Content of oratab file $DBINFO_ORATAB:\n" 
		cat $DBINFO_ORATAB 
		return $? 
	else 
		echo "\nNOT ABLE TO LOCATE AN ORATAB FILE FOR SERVER $(uname -n) !!!" 
		return 1 
	fi 
	} 
 
#--------------------------- 
# Get and set basic environment for specified sid 
# Assuming standard TNS_ADMIN setup 
# Input :  ORACLE_SID 
# Output:  none 
#--------------------------- 
GetSidEnvironment () 
	{ 
	export ORACLE_SID=$1 
	export ORACLE_HOME=$($DBINFO_GREP -E "^$1:" $DBINFO_ORATAB | cut -d":" -f2) 
	export ORACLE_PATH=$ORACLE_HOME/bin 
	export LD_LIBRARY_PATH=$ORACLE_HOME/lib 
	export PATH=$ORACLE_PATH:$DBINFO_PATH 
	#export PATH=$ORACLE_PATH:/usr/ccs/bin:/sbin:/usr/sbin:/usr/bin:/usr/bin/X11:/usr/local/bin:/bin:/usr/ucb 
	export TNS_ADMIN=$ORACLE_HOME/network/admin 
	return 0 
	} 
 
#--------------------------- 
# Get basic info for sid  
# Input :  (None - passed by env) 
# Output:   
#--------------------------- 
GetSidInfo () 
	{ 
	case $DBINFO_DB_VERISON_SHORT in 
		80* )	DBINFO_SID_INFO="col HOST_NAME form a15\nselect INSTANCE_NAME, HOST_NAME, VERSION, PARALLEL, STATUS, ARCHIVER, STARTUP_TIME from v\$instance;";; 
		81* )	DBINFO_SID_INFO="col HOST_NAME form a15\nselect INSTANCE_NAME, HOST_NAME, VERSION, PARALLEL, DATABASE_STATUS, STATUS, ARCHIVER, STARTUP_TIME from v\$instance;";; 
	esac 
		 
	RunSql 999 "$DBINFO_SID_INFO" || return $? 
	echo "\n" 
	RunSql 999 "col GLOBAL_NAME form a20\nselect * from global_name;" || return $? 
	echo "\n" 
	RunSql 999 "select * from v\$version;" || return $? 
	DBINFO_ALLOCATED_SPACE=$(RunSql 0 "col BYTES form 9,999,999\nselect sum(bytes)/1024/1024 bytes from dba_data_files;") || return $? 
	DBINFO_USED_SPACE=$(RunSql 0 "col BYTES form 9,999,999\nselect sum(bytes)/1024/1024 bytes from dba_segments;") || return $? 
	echo "\nStorage summary :\n-------------------------------\n$DBINFO_USED_SPACE MB used\n$DBINFO_ALLOCATED_SPACE MB total" 
	return $? 
	} 
 
#--------------------------- 
# Get instance license info 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetLicenseInfo () 
	{ 
	RunSql 999 "select * from v\$license;" 
	return $? 
	} 
 
#--------------------------- 
# Get a list of installed products 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetInstalledProducts () 
	{ 
	if [ -f $ORACLE_HOME/orainst/inspdver ] ; then 
		DBINFO_ORA_INSTALLED=$($ORACLE_HOME/orainst/inspdver) 
		DBINFO_ORA_INSTALLED_SOURCE="command $ORACLE_HOME/orainst/inspdver" 
	elif [ -f $ORACLE_HOME/install/unix.rgs ] ; then 
		DBINFO_ORA_INSTALLED=$(cat $ORACLE_HOME/install/unix.rgs) 
		DBINFO_ORA_INSTALLED_SOURCE="file $ORACLE_HOME/install/unix.rgs" 
	else 
		DBINFO_ORA_INSTALLED="" 
	fi 
	[ "$DBINFO_ORA_INSTALLED" = "" ] && return 1 
	echo "(info from $DBINFO_ORA_INSTALLED_SOURCE)\n" 
	echo "$DBINFO_ORA_INSTALLED" 
	return 0 
	} 
 
#--------------------------- 
# Get name of and content of initfile 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetInitFile () 
	{ 
	if [ -f $ORACLE_HOME/dbs/init$ORACLE_SID.ora ] ; then 
		echo "Content of $ORACLE_SID initialization file $ORACLE_HOME/dbs/init$ORACLE_SID.ora"	 
		echo "(Comments and empty lines removed)\n" 
		$DBINFO_GREP -v -E "^$|^#" $ORACLE_HOME/dbs/init$ORACLE_SID.ora  
		return $? 
	else 
		echo "No oracle initfile found in directory $ORACLE_HOME/dbs" 
		return 1 
	fi 
	} 
 
#--------------------------- 
# Get archiving information 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetArchiveInfo () 
	{ 
	# Must use srvmgrl for pre-8i for this info. 
	case $DBINFO_DB_VERISON_SHORT in 
		80* )   DBINFO_OUT=$(echo "connect internal\narchive log list" | svrmgrl | $DBINFO_GREP -E "log|Automatic|Archive" | sed 's/SVRMGR> //');; 
		*)	DBINFO_OUT=$(RunSql 999 "archive log list;");; 
	esac 
 
	[ "$DBINFO_OUT" = "" ] && return 1 
 
	echo "$DBINFO_OUT" 
 
	# Are we archiving? And where to? 
	DBINFO_ARCHIVE_ENABLED=$(echo "$DBINFO_OUT" | $DBINFO_GREP "Database log mode" | awk '{print $4}')	 
	DBINFO_ARCHIVE_DESTINATION=$(echo "$DBINFO_OUT" | $DBINFO_GREP "Archive destination" | awk '{print $3}')	 
 
	echo "\nCurrent status of archive destination area:" 
	echo "(This will not display correctly if you are linking\nto the archive area across filesystems)" 
	echo "--------------------------------------------" 
	if [ "$DBINFO_ARCHIVE_ENABLED" = "No" ] ; then 
		echo "Database is not running in archive mode" 
	else 
		df -k $DBINFO_ARCHIVE_DESTINATION 
	fi 
	return $? 
	} 
 
#--------------------------- 
# Get information for System Global Area 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetSgaInfo () 
	{ 
	case $DBINFO_DB_VERISON_SHORT in 
		80* )	RunSql 0 "col NAME form a24\nselect 'Total System Global Area', sum(value) from v\$sga;\nselect * from v\$sga;" || return $? 
			echo "\nSGA activity summary/advice is not currently available for pre-8i databases" 
			return 0;; 
	esac 
	RunSql 0 "show sga;" || return $?  
	echo  
	# SQL script by Anjan Roy found on the net http://www.orafaq.com 
	RunSql 9999 "set serveroutput on size 2000 
			whenever sqlerror exit sql.sqlcode 
			DECLARE 
      			libcac number(10,2); 
      			rowcac number(10,2); 
      			bufcac number(10,2); 
      			redlog number(10,2); 
      			spsize number; 
      			blkbuf number; 
      			logbuf number; 
			BEGIN 
			select value into redlog from v\$sysstat 
			where name = 'redo log space requests'; 
			select 100*(sum(pins)-sum(reloads))/sum(pins) into libcac from v\$librarycache; 
			select 100*(sum(gets)-sum(getmisses))/sum(gets) into rowcac from v\$rowcache; 
			select 100*(cur.value + con.value - phys.value)/(cur.value + con.value) into bufcac 
			from v\$sysstat cur,v\$sysstat con,v\$sysstat phys,v\$statname ncu,v\$statname nco,v\$statname nph 
			where cur.statistic# = ncu.statistic# 
				and ncu.name = 'db block gets' 
				and con.statistic# = nco.statistic# 
				and nco.name = 'consistent gets' 
				and phys.statistic# = nph.statistic# 
				and nph.name = 'physical reads'; 
			select value into spsize  from v\$parameter where name = 'shared_pool_size'; 
			select value into blkbuf  from v\$parameter where name = 'db_block_buffers'; 
			select value into logbuf  from v\$parameter where name = 'log_buffer'; 
			dbms_output.put_line('|                   SGA CACHE STATISTICS'); 
			dbms_output.put_line('|                   ********************'); 
			dbms_output.put_line('|              SQL Cache Hit rate = '||libcac); 
			dbms_output.put_line('|             Dict Cache Hit rate = '||rowcac); 
			dbms_output.put_line('|           Buffer Cache Hit rate = '||bufcac); 
			dbms_output.put_line('|         Redo Log space requests = '||redlog); 
			dbms_output.put_line('| '); 
			dbms_output.put_line('|                     INIT.ORA SETTING'); 
			dbms_output.put_line('|                     ****************'); 
			dbms_output.put_line('|               Shared Pool Size = '||round(spsize/1024/1024,2)||' MBytes'); 
			dbms_output.put_line('|                DB Block Buffer = '||blkbuf||' Blocks'); 
			dbms_output.put_line('|                     Log Buffer = '||round(logbuf/1024/1024,2)||' MBytes'); 
			dbms_output.put_line('| '); 
			if 
				libcac < 99  then dbms_output.put_line('*** HINT: Library Cache too low! Increase the Shared Pool Size.'); 
			END IF; 
			if 
				rowcac < 85  then dbms_output.put_line('*** HINT: Row Cache too low! Increase the Shared Pool Size.'); 
			END IF; 
			if 
				bufcac < 90  then dbms_output.put_line('*** HINT: Buffer Cache too low! Increase the DB Block Buffer value.'); 
			END IF; 
			if 
				redlog > 100 then dbms_output.put_line('*** HINT: Log Buffer value is rather low!'); 
			END IF; 
			END;\n/" || return $? 
 
        echo "\nFree database memory :\n---------------------------------\n" 
	RunSql 999 "select * from v\$sgastat where name like '%free %';" 
	return $? 
	} 
			 
#--------------------------- 
# Get information on which functionality 
# the database supports ... parttioning, transportable tbs ... 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetOptionInfo () 
	{ 
	RunSql 999 "col VALUE form a15 
		select PARAMETER, VALUE from v\$option;" || return $? 
	return $? 
	} 
 
#--------------------------- 
# Get database parameters 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetParameters () 
	{ 
	RunSql 999 "col name form a35 
			col value form a60 
			set linesize 2000 
			select name,value from v\$parameter 
			order by name;" || return $? 
	return $? 
	} 
 
#--------------------------- 
# Get only the security-related database  
# parameters 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetSecParameters () 
	{ 
	RunSql 0 "select name || '=' || value "PARAMTER" 
		from   sys.v_\$parameter  
		where  name in ('remote_login_passwordfile', 'remote_os_authent',  
	       'os_authent_prefix', 'dblink_encrypt_login', 
	       'audit_trail', 'transaction_auditing');" || return $? 
	return $? 
	} 
 
#--------------------------- 
# Get configuration for oracle listener 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetListenerConfig () 
	{ 
	if [ -f $TNS_ADMIN/listener.ora ] ; then 
		DBINFO_LISTENER=$TNS_ADMIN/listener.ora 
	elif [ -f /etc/listener.ora ] ; then 
		DBINFO_LISTENER=/etc/listener.ora 
	elif [ -f /var/opt/oracle/listener.ora ] ; then 
		DBINFO_LISTENER=/var/opt/oracle/listener.ora 
	elif [ -f $ORACLE_HOME/network/admin/listener.ora ] ; then 
		DBINFO_LISTENER=$ORACLE_HOME/network/admin/listener.ora 
	else 
		echo "No listener configuration file found under either directory:" 
		echo "- \$TNS_ADMIN\n- /etc\n- /var/opt/oracle\n- \$ORACLE_HOME/network/admin\n"  
		return 1 
	fi 
	echo "Content of listener configuration file $DBINFO_LISTENER:" 
	echo "(Comments and empty lines removed)\n" 
	$DBINFO_GREP -v -E "^$|^#" $DBINFO_LISTENER 
	return $? 
	} 
 
#--------------------------- 
# Get configuration for SQL*Net 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetSqlnetConfig () 
	{ 
	if [ -f $TNS_ADMIN/sqlnet.ora ] ; then 
		DBINFO_SQLNET=$TNS_ADMIN/sqlnet.ora 
	elif [ -f /etc/sqlnet.ora ] ; then 
		DBINFO_SQLNET=/etc/sqlnet.ora 
	elif [ -f /var/opt/oracle/sqlnet.ora ] ; then 
		DBINFO_SQLNET=/var/opt/oracle/sqlnet.ora 
	elif [ -f $ORACLE_HOME/network/admin/sqlnet.ora ] ; then 
		DBINFO_SQLNET=$ORACLE_HOME/network/admin/sqlnet.ora 
	else 
		echo "No SQL*Net configuration file found under either directory:" 
		echo "- \$TNS_ADMIN\n- /etc\n- /var/opt/oracle\n- \$ORACLE_HOME/network/admin\n" 
		return 1 
	fi 
	echo "Content of SQL*Net configuration file $DBINFO_SQLNET:" 
	echo "(Comments and empty lines removed)\n" 
	$DBINFO_GREP -v -E "^$|^#" $DBINFO_SQLNET 
	return $? 
	} 
 
#--------------------------- 
# Get content of tnsnames file 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetTnsnamesConfig () 
	{ 
	if [ -f $TNS_ADMIN/tnsnames.ora ] ; then 
		DBINFO_TNSNAMES=$TNS_ADMIN/tnsnames.ora 
	elif [ -f /etc/tnsnames.ora ] ; then 
		DBINFO_TNSNAMES=/etc/tnsnames.ora 
	elif [ -f /var/opt/oracle/tnsnames.ora ] ; then 
		DBINFO_TNSNAMES=/var/opt/oracle/tnsnames.ora 
	elif [ -f $ORACLE_HOME/network/admin/tnsnames.ora ] ; then 
		DBINFO_TNSNAMES=$ORACLE_HOME/network/admin/tnsnames.ora 
	else 
		echo "No tnsnames configuration file found under either directory:" 
		echo "- \$TNS_ADMIN\n- /etc\n- /var/opt/oracle\n- \$ORACLE_HOME/network/admin\n" 
		return 1 
	fi 
	echo "Content of tnsnames configuration file $DBINFO_TNSNAMES:" 
	echo "(Comments and empty lines removed)\n" 
	$DBINFO_GREP -v -E "^$|^#" $DBINFO_TNSNAMES 
	return $? 
	} 
 
#--------------------------- 
# Get last lines of alertlog 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetAlertlog () 
	{ 
	[ -e $ORACLE_HOME/dbs/init$ORACLE_SID.ora ] && DBINFO_BDUMP=$($DBINFO_GREP ^background_dump_dest $ORACLE_HOME/dbs/init$ORACLE_SID.ora | cut -d= -f2) 
	if [ -e $DBINFO_BDUMP/alert_$ORACLE_SID.log ] ; then 
		echo "Content of database alertlog $DBINFO_BDUMP/alert_$ORACLE_SID.log" 
		tail -100 $DBINFO_BDUMP/alert_$ORACLE_SID.log 
		return $? 
	else 
		echo Unable to find alertlog file for database $ORACLE_SID 
		return $? 
	fi 
	} 
 
#--------------------------- 
# Find out wether the databse $ORACLE_SID is up 
# or not. 
# Input : None 
# Output: return code 
#--------------------------- 
CheckDbStatus () 
	{ 
	ps -ef | $DBINFO_GREP -v $DBINFO_GREP | $DBINFO_GREP smon_$ORACLE_SID > /dev/null 2>&1 
	return $? 
	} 
 
#--------------------------- 
# Find the active NLS parameters  
# for the database 
# Input : None 
# Output: return code 
#--------------------------- 
GetNlsParameters () 
	{ 
	RunSql 999 "select * from nls_database_parameters;"  
	return $? 
	} 
 
#--------------------------- 
# Locate database controlfiles 
# Get a dump of tracefile 
# Input : None 
# Output: return code 
#--------------------------- 
GetControlFiles () 
	{ 
	RunSql 999 "col NAME form a60\n select * from v\$controlfile;" || return $? 
 
	echo "\nContents of controlfile dump:\n------------------------------------------------------------" 
	DBINFO_UDUMP_DEST=$(RunSql 0 "select value from v\$parameter where name = 'user_dump_dest';") 
	[ "$DBINFO_UDUMP_DEST" = "" ] && return 1 
 
	RunSql 0 "alter database backup controlfile to trace;" > /dev/null 2>&1 || return $? 
	DBINFO_TRACEFILE=$(ls -1rt $DBINFO_UDUMP_DEST/*.trc 2>/dev/null | tail -1) 
 
	[ "$DBINFO_TRACEFILE" = "" ] && return 1 
	cat $DBINFO_TRACEFILE 
	return $? 
	} 
 
#--------------------------- 
# Get information about database 
# redolog files 
# Input : None 
# Output: return code 
#--------------------------- 
GetRedologFiles () 
	{ 
	RunSql 999 "col member form a60\nselect member, a.group# log_group, round(b.bytes/1024/1024,0) MB  
		from v\$logfile a,v\$log b where a.group#=b.group#;" || return $? 
	echo 
	RunSql 0 "select 'Current sequence# is '||max(sequence#) from v\$log;" 
	return $? 
	} 
 
#--------------------------- 
# Get information about all datafiles  
# in the database 
# Input : None 
# Output: return code 
#--------------------------- 
GetDatafileInfo () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green "To simplify maintenance and backup/recovery scenarios, datafile placement should be planned well."  
		AddText green "Place them in dedicated directories, and if possible, place the directories on filesystems that are only used by oracle." 
		AddText green "Last but not least, try to balance i/o over all the available filesystems.\n\n" 
	fi 
 
	echo "All datafiles in database:\n---------------------------------\n" 
	RunSql 9999 "col tablespace_name form a23 
		col FILE_ID form 999 
		col FILE_NAME form a50 
		col AutoExt form a8 
		set linesize 2000 
		break on tablespace_name 
		select tablespace_name, file_id, file_name, round(bytes/1024/1024,0) MB, autoextensible AutoExt, status 
		from dba_data_files 
		order by tablespace_name;" 
	return $? 
	} 
 
#--------------------------- 
# Get information about datafiles 
# that have autoextend enabled 
# Input : None 
# Output: return code 
#--------------------------- 
GetDatafileAutoextend () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green "Autoextending datafiles will increase their size when they need to allocate extra storage." 
		AddText green "The positive benefit of this is that the DBA will not have to pay as close attention to the" 
		AddText green "free space in the tablespaces," 
		AddText green "The downside is that the system runs the risk of filling an entire filesystems without anybody noticing." 
		AddText green "For some filesystem types, this is fatal." 
		AddText green "\nData corruption may occur if the datafile is in some way extended beyond the upper filesize-limit" 
		AddText green "oracle currently imposes (4194303 * size of db_block_size). There are several reported bugs" 
		AddText green "concerning this.\n" 
	fi 
	 
	echo "Datafiles with autoextend enabled:\n---------------------------------\n" 
	RunSql 9999 "col tablespace_name form a23 
		col FILE_ID form 999 
		col FILE_NAME form a50 
		col AutoExt form a8 
		set linesize 2000 
		break on tablespace_name 
		select tablespace_name, file_id, file_name, round(bytes/1024/1024,0) MB, autoextensible AutoExt, status 
		from dba_data_files 
		where autoextensible='YES' 
		order by tablespace_name;" 
	return $? 
	} 
 
#--------------------------- 
# Get information about datafiles 
# that are not listed as AVAILABLE 
# Input : None 
# Output: return code 
#--------------------------- 
GetDatafileAvailibility () 
	{ 
	echo "Datafiles not listed as available:\n---------------------------------\n" 
	RunSql 9999 "select file_name, status 
			from dba_data_files 
			where status != 'AVAILABLE';" || return $? 
	return 0 
	} 
 
#--------------------------- 
# Get information about current  
# IO for datafiles in the database 
# Input : None 
# Output: return code 
#--------------------------- 
GetFileIO () 
	{ 
	RunSql 9999 "col phyrds form 999,999,999 
		col phywrts form 999,999,999 
		set linesize 2000 
		select substr(a.file#,1,4) \"#\", 
		substr(a.name,1,60) "Name", 
		a.status, 
		round(a.bytes/1024/1024,0) MB, 
		b.phyrds, 
		b.phywrts 
		from v\$datafile a, v\$filestat b 
		where a.file# = b.file#;" || return $? 
	} 
 
#--------------------------- 
# Get summary of information about tablespaces 
# in the database 
# Input : None 
# Output: return code 
#--------------------------- 
GetTablespaceInfo () 
	{ 
	# SQL script by Allan Webster found on the net http://www.dbasupport.com 
	RunSql 9999 "column tablespace_name heading Tablespace format a19 
                        column object_count heading 'Objects|(#)' format 999,990 
                        column mb heading Mb format 9990 
                        column sum(frags) heading 'Frags|(#)' format 9,999 
                        column avail heading 'Max|(Mb)' format 999,999 
                        column free heading 'Free|(%)' format 999.9 
                        column bytesize heading 'Size|(Mb)' format 99,999,999 
                        column byteused heading 'Used|(Mb)' format 99,999,999 
                        column bytefree heading 'Free|(Mb)' format 99,999,999 
                        column init_ext heading 'Initial|(K)' format 999,999 
                        column next_ext heading 'Next|(K)' format 999,999 
                        break on report 
                        compute sum of object_count bytesize byteused bytefree on report 
                        select tablespace_name, sum(obj_cnt) object_count, sum(ini_ext) init_ext, sum(nex_ext) next_ext, sum(byte)/1048576 bytesize 
                        ,(sum(byte)/1048576)- (sum(fbyte)/1048576) byteused, sum(fbyte)/1048576 bytefree, sum(frags), sum(largest)/1048576 avail 
                        , DECODE (sum(byte),0,NULL,round((sum(fbyte)/sum(byte))*100,1)) free 
			from (select tablespace_name, 0 obj_cnt, 0 ini_ext, 0 nex_ext, 0 byte, sum(bytes) fbyte, count(*) frags, max(bytes) largest 
				from dba_free_space  
				group by tablespace_name 
			union 
			select tablespace_name, 0, 0, 0, sum(bytes), 0, 0, 0 
				from dba_data_files  
				group by tablespace_name 
			union 
			select tablespace_name, 0, initial_extent/1024 ini_ext, next_extent/1024 nex_ext, 0,0,0,0 
				from dba_tablespaces 
			union 
			select tablespace_name, count(*) obj_cnt, 0, 0, 0, 0, 0, 0 
				from dba_segments 
				group by tablespace_name) 
				group by tablespace_name;" 
	return $? 
	} 
 
#--------------------------- 
# Get an overview over when  
# the tablespaces in the database 
# has been added to. 
# Input : None 
# Output: return code 
#--------------------------- 
GetTablespaceIncreases () 
	{ 
	# SQL script by Frank Naude found on the net http://www.orafaq.com 
	echo "Tablespace increases (only summing up additions to the tablespaces):\n-------------------------------------------------------------\n" 
	RunSql 999 "col \"Growth in MB\" form 999,999,999 
		select to_char(creation_time, 'RRRR MM (Month)') \"Month\", 
       		round(sum(bytes)/1024/1024,0) \"Growth in MB\" 
       		from sys.v_\$datafile 
       		where creation_time > SYSDATE-365 
       		group by to_char(creation_time, 'RRRR MM (Month)');" 
	return $? 
	} 
 
#--------------------------- 
# Get a list of tablespaces  
# not listed as online. 
# Input : None 
# Output: return code 
#--------------------------- 
GetTablespaceStatus () 
	{ 
	echo "\nTablespaces not listed as online:\n-------------------------------------\n" 
	RunSql 999 "select tablespace_name, status 
			from dba_tablespaces 
			where status != 'ONLINE';"  
	return $? 
	} 
 
#--------------------------- 
# Get a list of temporary tablespaces  
# Input : None 
# Output: return code 
#--------------------------- 
GetTempTablespaces () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green "When a temporary tablespace is created, it has to be created with the TEMPORARY option" 
		AddText green "for oracle to be able to distinguish it from a regular tablespace." 
		AddText green "If the tablespace intended to be temporary is NOT listed below," 
		AddText green "correct this by issuing the sql statement:" 
		AddText green "alter tablespace TABLESPACE_NAME temporary;" 
		AddText green "For performance reasons the temporary tablespace should be created with these" 
		AddText green "storage parameters: initial = next = (multiple of SORT_AREA_SIZE + DB_BLOCK_SIZE), pctincrease = 0" 
	fi 
 
	echo "\nTablespaces listed as temporary:\n---------------------------------------\n" 
	OUTPUT=$(RunSql 9999 "select TABLESPACE_NAME, INITIAL_EXTENT, NEXT_EXTENT, PCT_INCREASE, STATUS, CONTENTS 
			from dba_tablespaces 
			where CONTENTS='TEMPORARY';") 
	echo "$OUTPUT" | $DBINFO_GREP -q TEMPORARY  
	if [ $? -eq 0 ] ; then 
		echo "$OUTPUT" 
		return 
	else 
		echo "This database has no temporary tablespaces defined." 
		return 1 
	fi 
	} 
 
 
#--------------------------- 
# List transportable tablespaces 
# Input : None 
# Output: return code 
#--------------------------- 
GetTransTablespaces () 
	{ 
	echo "\nTransportable tablespaces:\n---------------------------------------\n" 
	case $DBINFO_DB_VERISON_SHORT in 
		7*|80* )	echo "\nTransportable tablespaces are not available for pre-8i databases" 
				return 0;; 
	esac 
 
	RunSql 999 "select TABLESPACE_NAME, STATUS, CONTENTS, PLUGGED_IN 
			from DBA_TABLESPACES 
			where PLUGGED_IN <> 'NO';" 
	return $? 
	} 
 
#--------------------------- 
# Get a summary of tablespace fragmentation 
# Input : None 
# Output: return code 
#--------------------------- 
GetTablespaceFragmentation () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green "Heavily fragmented tablespaces can have an impact on the performance, especially  when" 
		AddText green "a lot of full table scans are occurring on the system." 
		AddText green "Another disadvantage of fragmentation is that the database will not be able to re-use" 
		AddText green "the smaller freespace-segments because the indexes and tables are requesting larger extents" 
		AddText green "than what the tablespace has available." 
		AddText green "The only way to resolve fragmentation is drop and recreate the objects in the tablespace." 
		AddText green "\nNote that you can decrease reported fragmentation by running an coalesce on each tablespace." 
		AddText green "alter tablespace TABLESPACE_NAME coalesce;" 
	fi 
 
	# 
	# This one is _not_ done yet. Consider this to be a placeholder. 
	# Still looking for an easy way of showing tablespace fragmentation.  
	# Don't want miles of lines to read ...  The tablespace overview has the CHK_FREE column that shows  
	# the number of free segments in the tablespaces. This can be used as a guideline when looking 
	# for fragmentation. 
	# 
 
	return $? 
	} 
 
#--------------------------- 
# Print info for RBS 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetRbsInfo () 
	{ 
	RunSql 9999 "col name for a7 
       			col xacts for 9990 head 'Actv|Trans' 
       			col InitExt for 990.00 head 'Init|Ext|(Mb)' 
       			col NextExt for 990.00 head 'Next|Ext|(Mb)' 
       			col MinExt for 99 head 'Min|Ext' 
       			col MaxExt for 99999999 head 'Max|Ext' 
       			col optsize for 9990.00 head 'Optimal|Size|(Mb)' 
       			col rssize for 9990.00 head 'Curr|Size|(Mb)' 
       			col hwmsize for 9990.00 head 'High|Water|Mark|(Mb)' 
       			col wraps for 99999 head 'W|R|A|P|S' 
       			col extends for 999900 head 'E|X|T|E|N|D|S' 
       			col shrinks for 9990 head 'S|H|R|I|N|K|S' 
       			col aveshrink for 990.00 head 'AVG|Shrink|(Mb)' 
       			col gets head 'Header|Gets' 
       			col waits for 99990 head 'Header|Waits' 
       			col writes for 999,999,990 head 'Total|Writes|Since|Startup|(Kb)' 
       			col wpg for 9990 head 'AVG|Writes|Per|HedGet|(bytes)' 
       			set lines 9999 pages 40 feed off  
       			break on report 
       			compute sum of gets on report 
       			compute sum of waits on report 
       			compute avg of aveshrink on report 
       			compute avg of wpg on report 
       			select name, v\$rollstat.status, XACTS, initial_extent/1048576 InitExt, 
       			next_extent/1048576 NextExt, min_extents MinExt, max_extents MaxExt, 
       			optsize/1048576 optsize, RSSIZE/1048576 rssize, HWMSIZE/1048576 hwmsize 
			-- wraps, extends, shrinks, aveshrink/1048576 aveshrink, gets, waits, 
			-- writes/1024 writes, writes/gets wpg 
       			from v\$rollstat,v\$rollname,dba_rollback_segs 
       			where v\$rollstat.usn=v\$rollname.usn 
       			and dba_rollback_segs.segment_id=v\$rollname.usn 
       			order by name;" 
	return $? 
	} 
 
#--------------------------- 
# Print info about segements 
# that should be relocated because 
# they're in the wrong tablespace. 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetRelocSegs () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green "User objects should not be created in the system tablespace, as this can lead to fragmentation" 
		AddText green "and preventing system tables of growing."   
		AddText green "Also note that some users/schemas are created by default when you install oracle, and" 
		AddText green "that some of these objects may be placed in the SYSTEM tablespace." 
		AddText green "Don't remove or relocate segments unless you are absolutely sure this does not cause any problems" 
	fi 
	echo "\nSegments placed in the SYSTEM tablespace:" 
	echo "--------------------------------------------------------------------------------\n" 
	RunSql 9999 "col SEGMENT_NAME form a30 
			col SEGMENT_TYPE form a16 
			col OWNER form a15 
			col TABLESPACE_NAME form a25 
			select SEGMENT_TYPE, OWNER, SEGMENT_NAME, PARTITION_NAME, TABLESPACE_NAME 
			from dba_segments 
			where TABLESPACE_NAME='SYSTEM' 
			and OWNER not in ('SYS','SYSTEM');" || return $? 
 
	echo "\n\nPermanent segments should not be located in tablespaces marked as TEMPORARY." 
	echo "--------------------------------------------------------------------------------\n" 
	RunSql 9999 "col SEGMENT_NAME form a30 
			col TABLESPACE_NAME form a25 
			col OWNER form a15 
			col SEGMENT_TYPE form a16 
			select segment_type, owner, segment_name, round(bytes/1024/1024,0) MB, tablespace_name 
			from dba_segments 
			where tablespace_name in (select tablespace_name from dba_tablespaces where contents='TEMPORARY') 
			and segment_type <> 'TEMPORARY';" 
	return $? 
	} 
 
#--------------------------- 
# Print info about segements 
# that are running out of allowable extents 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetMaxExtents () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green "Database segments that reach the maximum specified number of extents will fail when they try" 
		AddText green "to allocate more space for data." 
		AddText green "To increase the max extents value, execute this sql for every segment that is affected :" 
		AddText green "alter SEGMENT_NAME storage (maxextents NEW_VALUE);" 
	fi 
	echo "\nSegments approaching maxextents (within 10 extents of max):\n----------------------------------------------------------\n" 
	RunSql 999 "col SEGMENT_NAME form a30 
		col OWNER form a20 
		col TABLESPACE_NAME form a20 
		col SEGMENT_TYPE form a10 heading T/I 
		col \"NEXT (KB)\" form 9,999,999 
		select SEGMENT_TYPE, OWNER, SEGMENT_NAME, TABLESPACE_NAME,EXTENTS,MAX_EXTENTS, round(NEXT_EXTENT/1024,0) \"NEXT (KB)\" 
		from dba_segments 
		where EXTENTS+10 >= MAX_EXTENTS 
		and segment_type in ('TABLE','INDEX');" 
	return $? 
	} 
 
#--------------------------- 
# Print info about segements 
# that can't allocate the next extent 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetNextExtent () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green "When the database tablespaces run out of contiguos free space, segments which request large datablocks" 
		AddText green "for their next extent may not receive this." 
		AddText green "If this happens, add a datafile to the tablespace that is running out of space, or decrease the size" 
		AddText green "of the next extent for the offending segment\n\nFor example:" 
		AddText green "alter SEGMENT_NAME storage (next_extent NEW_VALUE MB);" 
		AddText green "alter tablespace TABLESPACE_NAME add datafile 'DATAFILE_NAME' size SIZE MB;"  
	fi 
 
	echo "\nSegments unable to allocate next extent:\n----------------------------------------------------------\n" 
	RunSql 999 "col SEGMENT_NAME form a30 
			col SEGMENT_TYPE form a16 
			col OWNER form a15 
			col NEXT_EXTENT form 999,999,999,999 
			select s.segment_type, s.owner, s.segment_name, s.partition_name,  
			s.tablespace_name, s.next_extent 
			from dba_segments s 
			where s.next_extent > (select MAX(f.bytes) 
			from dba_free_space f 
			where f.tablespace_name = s.tablespace_name);" 
	return $? 
	} 
 
#--------------------------- 
# Print info about segements 
# that are using a large number of extents 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetExcessiveExtents () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green "Having occasional segments that are spread over a large number of extents does not generally degrade" 
		AddText green "database performance significantly." 
		AddText green "If, however, the database has a lot of segments where this is the case, performance may suffer." 
		AddText green "To fix this, recreate the segments with larger extent sizes." 
		AddText green "(export/import or create as ..)" 
	fi 
 
	# Oracle suggests that all segments using more than 100-200 extents are candidates for recreation. 
	# We'll try using 300 as a limit here. 
 
	echo "\nPotentially overextended segments:\n----------------------------------------------------------\n" 
	RunSql 9999 "col SEGMENT_NAME form a30 
			col SEGMENT_TYPE form a16 
			col OWNER form a15 
			select SEGMENT_TYPE, OWNER, SEGMENT_NAME, PARTITION_NAME, TABLESPACE_NAME, EXTENTS 
			from dba_segments 
			where extents > 300 
			order by extents desc;" 	 
	return $? 
	} 
 
#--------------------------- 
# Print info about submitted jobs 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetDBJobs () 
	{ 
	RunSql 999 "set linesize 2000 
		col jid  format 999  heading 'Id'  
		col subu format a10  heading 'Submitter'     trunc  
		col secd format a10  heading 'Security'      trunc  
		col proc format a40  heading 'Job'           word_wrapped  
		col lsd  format a5   heading 'Last|Ok|Date'   
		col lst  format a5   heading 'Last|Ok|Time'  
		col nrd  format a5   heading 'Next|Run|Date'  
		col nrt  format a5   heading 'Next|Run|Time'  
		col fail format 999  heading 'Errs'  
		col ok   format a2   heading 'Ok'  
		ttitle -  
  		left  'List Submitted Jobs' skip 2  
		select  
  		job                        jid,  
  		log_user                   subu,  
  		priv_user                  secd,  
  		what                       proc,  
  		to_char(last_date,'MM/DD') lsd,  
  		substr(last_sec,1,5)       lst,  
  		to_char(next_date,'MM/DD') nrd,  
  		substr(next_sec,1,5)       nrt,  
  		failures fail,  
  		decode(broken,'Y','N','Y') ok  
		from  
  		sys.dba_jobs;" || return $? 
	} 
 
#--------------------------- 
# Print info about database users 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetUsersInfo () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green "No users except SYS and SYSTEM should have SYSTEM as the default and/or temporary tablespace." 
		AddText green "To prevent fragmentation, the SYS and SYSTEM users can safely be given" 
		AddText green "another temporary tablespace than the default value SYSTEM.\n" 
	fi 
	RunSql 999 "set pagesize 9999 
		set linesize 2000 
		col username form a20 
		col def_tblspc form a15 
		col tmp_tblspc form a15 
		col profile form a10 
		col status form a10 
		col MB_USED form 999,999,999 
		select  username, user_id, default_tablespace def_tblspc,  
			temporary_tablespace tmp_tblspc, created, profile, 
			account_status status, round(sum(bytes/1024/1024),0) MB_USED 
			from dba_users du, dba_segments ds 
			where username=owner 
			group by username, user_id,default_tablespace, 
			temporary_tablespace,created,profile,account_status;" 
	return $? 
	} 
 
#--------------------------- 
# Print info about database roles 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetRoleInfo () 
	{ 
	RunSql 999 "set pagesize 9999 
		set linesize 2000 
		select * from dba_roles;" 
	return $? 
	} 
 
#--------------------------- 
# Print info about database  
# users with bad roles assigned 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetBadRoles () 
	{ 
	RunSql 999 "select grantee, granted_role, admin_option 
	from   sys.dba_role_privs  
	where  granted_role in ('DBA', 'AQ_ADMINISTRATOR_ROLE', 
		       'EXP_FULL_DATABASE', 'IMP_FULL_DATABASE', 
		       'OEM_MONITOR');" 
# Add these lines if you want to exclude the default db users that have extended privs. 
#  	and  grantee not in ('SYS', 'SYSTEM', 'OUTLN', 'AQ_ADMINISTRATOR_ROLE', 
#		       'DBA', 'EXP_FULL_DATABASE', 'IMP_FULL_DATABASE', 
#		       'OEM_MONITOR', 'CTXSYS', 'DBSNMP', 'IFSSYS', 
#		       'IFSSYS$CM', 'MDSYS', 'ORDPLUGINS', 'ORDSYS', 
#		       'TIMESERIES_DBA');"  
	return $? 
	} 
 
#--------------------------- 
# Print info about database  
# users with bad roles assigned 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetBadPrivs () 
	{ 
	RunSql 999 "break on grantee\nselect grantee, privilege, admin_option 
		from   sys.dba_sys_privs  
		where  (privilege like '% ANY %' 
  		or   privilege in ('BECOME USER', 'UNLIMITED TABLESPACE') 
  		or   admin_option = 'YES');" 
# Add these lines if you want to exclude the default db users that have extended privs. 
# 		and   grantee not in ('SYS', 'SYSTEM', 'OUTLN', 'AQ_ADMINISTRATOR_ROLE', 
#		       'DBA', 'EXP_FULL_DATABASE', 'IMP_FULL_DATABASE', 
#		       'OEM_MONITOR', 'CTXSYS', 'DBSNMP', 'IFSSYS', 
#		       'IFSSYS$CM', 'MDSYS', 'ORDPLUGINS', 'ORDSYS', 
#		       'TIMESERIES_DBA');" 
	return $? 
	} 
 
#--------------------------- 
# Print info about users that  
# are identified externally 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetBadUsers () 
	{ 
	RunSql 999 "select username, password from dba_users where password = 'EXTERNAL';" 
	return $? 
	} 
 
#--------------------------- 
# Print info about users that 
# are listed ass password file  
# users. 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetPwFileUsers () 
	{ 
	RunSql 999 "select * from V\$PWFILE_USERS;" 
	return $? 
	} 
 
#--------------------------- 
# Print info about security settings 
# in profiles 
# users. 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetProfileSecuritySettings () 
	{ 
	RunSql 999 "select profile, resource_name, limit  
		from   dba_profiles 
		where  resource_name like '%PASSWORD%'  
   		or  resource_name like '%LOGIN%';" || return $? 
	return $? 
	} 
 
#--------------------------- 
# Print info about invalid objects 
# in the database. 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetInvalidObjects () 
	{ 
	RunSql 999 "col owner form a20 
		col object_name form a40 
		select owner, object_name, object_type, status from dba_objects where status = 'INVALID' 
		order by owner,object_name;" 
	return $? 
	} 
 
#--------------------------- 
# Print info about objects 
# per user 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetObjectInfo () 
	{ 
	RunSql 999 "set linesize 2000 
			COLUMN owner FORMAT a20 HEADING "Owner" 
			COLUMN sum_table FORMAT 999,999 HEADING "Tables" 
			COLUMN sum_index FORMAT 999,999 HEADING "Indexes" 
			COLUMN sum_view FORMAT 999,999 HEADING "Views" 
			COLUMN sum_sequence FORMAT 999,999 HEADING "Sequences" 
			COLUMN sum_synonym FORMAT 999,999 HEADING "Synonyms" 
			COLUMN sum_cluster FORMAT 999,999 HEADING "Clusters" 
			COLUMN sum_procedure FORMAT 999,999 HEADING "Procedures" 
			COLUMN sum_package FORMAT 999,999 HEADING "Packages" 
			COLUMN sum_package_body FORMAT 999,999 HEADING \"Pckg Bodies\" 
			COLUMN sum_db_link FORMAT 999,999 HEADING \"DB Links\" 
			COMPUTE SUM OF sum_table ON REPORT 
			COMPUTE SUM OF sum_index ON REPORT 
			COMPUTE SUM OF sum_view ON REPORT 
			COMPUTE SUM OF sum_sequence ON REPORT 
			COMPUTE SUM OF sum_synonym ON REPORT 
			COMPUTE SUM OF sum_cluster ON REPORT 
			COMPUTE SUM OF sum_procedure ON REPORT 
			COMPUTE SUM OF sum_package ON REPORT 
			COMPUTE SUM OF sum_package_body ON REPORT 
			COMPUTE SUM OF sum_db_link ON REPORT 
			SELECT O.owner, 
  			Sum( Decode( O.object_type, 'TABLE', 1, 0 ) ) AS "sum_table", 
  			Sum( Decode( O.object_type, 'INDEX', 1, 0 ) ) AS "sum_index", 
  			Sum( Decode( O.object_type, 'VIEW', 1, 0 ) ) AS "sum_view", 
  			Sum( Decode( O.object_type, 'SEQUENCE', 1, 0 ) ) AS "sum_sequence", 
  			Sum( Decode( O.object_type, 'SYNONYM', 1, 0 ) ) AS "sum_synonym", 
  			Sum( Decode( O.object_type, 'CLUSTER', 1, 0 ) ) AS "sum_cluster", 
  			Sum( Decode( O.object_type, 'PROCEDURE', 1, 0 ) ) AS "sum_procedure", 
  			Sum( Decode( O.object_type, 'PACKAGE', 1, 0 ) ) AS "sum_package", 
  			Sum( Decode( O.object_type, 'PACKAGE BODY', 1, 0 ) ) AS "sum_package_body", 
  			Sum( Decode( O.object_type, 'DATABASE LINK', 1, 0 ) ) AS "sum_db_link" 
			FROM dba_objects O 
			GROUP BY O.owner 
			ORDER BY O.owner;" 
	return $? 
	} 
 
#--------------------------- 
# Print info about large tables 
# that are unpartitioned 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetLargeTabInfo () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green  "Large tables should be placed in a dedicated tablespace." 
		AddText green  "Extremely large tables should be partitioned.\n" 
	fi 
 
	case $DBINFO_DB_VERISON_SHORT in 
		80* )   echo "\nInformation about this is currently not available for pre-8i databases" 
			return 0;; 
	esac 
 
	RunSql 999 "col OWNER form a20 
		col TABLE_NAME form a30 
		col MB form 999,999,999 
		set linesize 2000 
		select * from  
			(select OWNER, SEGMENT_NAME TABLE_NAME, TABLESPACE_NAME, round(BYTES/1024/1024,0) MB 
			from dba_segments 
			where PARTITION_NAME is NULL 
			and SEGMENT_TYPE = 'TABLE' 
			order by MB desc) 
		where rownum < 10;"  
	return $? 
	} 
 
#--------------------------- 
# Print info about partitioned 
# tables 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetTabPartInfo () 
	{ 
	RunSql 999 "set linesize 2000 
		col OWNER form a20 
		col TABLE_NAME form a40 truncate 
		col MB form 999,999,999 
		break on TABLE_NAME 
		select OWNER||'.'||SEGMENT_NAME TABLE_NAME, PARTITION_NAME, TABLESPACE_NAME, round(BYTES/1024/1024,0) MB 
		from dba_segments 
		where PARTITION_NAME is not NULL 
		and SEGMENT_TYPE = 'TABLE PARTITION' 
		order by TABLE_NAME, PARTITION_NAME, TABLESPACE_NAME;" 
	return $? 
	} 
 
#--------------------------- 
# Print info about large indexes 
# that are unpartitioned 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetLargeIndInfo () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green "Large indexes should be placed in a dedicated tablespace." 
		AddText green "Extremely large indexes should be partitioned.\n" 
	fi 
 
	case $DBINFO_DB_VERISON_SHORT in 
		80* )   echo "\nInformation about this is currently not available for pre-8i databases" 
			return 0;; 
	esac 
 
	RunSql 999 "col OWNER form a20 
		col INDEX_NAME form a30 
		col MB form 999,999,999 
		set linesize 2000 
		select * from 
			(select OWNER, SEGMENT_NAME INDEX_NAME, TABLESPACE_NAME, round(BYTES/1024/1024,0) MB 
			from dba_segments 
			where PARTITION_NAME is NULL 
			and SEGMENT_TYPE = 'INDEX' 
			order by MB desc) 
		where rownum < 10;" 
	return $? 
	} 
 
#--------------------------- 
# Print info about partitioned 
# indexes 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetIndPartInfo () 
	{ 
	RunSql 999 "set linesize 2000 
		col OWNER form a20 
		col INDEX_NAME form a40 
		col MB form 999,999,999 
		break on INDEX_NAME 
		select OWNER||'.'||SEGMENT_NAME INDEX_NAME, PARTITION_NAME, TABLESPACE_NAME, round(BYTES/1024/1024,0) MB 
		from dba_segments 
		where PARTITION_NAME is not NULL 
		and SEGMENT_TYPE = 'INDEX PARTITION' 
		order by INDEX_NAME, PARTITION_NAME, TABLESPACE_NAME;" 
	return $? 
	} 
 
#--------------------------- 
# Print info about chaining 
# and migration. 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetChainingInfo () 
	{ 
	if [ "$DBINFO_EXPLAIN" = "YES" ] ; then 
		AddText green "Chaining occurs when an inserted row is too large to fit into a single datablock." 
		AddText green "Oracle then stores the data in a chain of datablocks that are reserved for this" 
		AddText green "segment alone.\n" 
		AddText green "Migration occurs when a row is updated so that it can no longer fit in a single datablock." 
		AddText green "The row is then moved to a new datablcok, and the old location is updated with a pointer to the new" 
		AddText green "location.\n" 
		AddText green "Both chaining and migration decrease oracle performance significantly." 
		AddText green "Migration can be decreased by increasing the PCTFREE setting for segments." 
		AddText green "Chaining can only be decreased by recreating the database using a larger data blocksize." 
	fi 
 
	# This test is wildly innaccurate if a) the analyze is old b) the sample is small 
	# Also - finding good advice on a threshold value seems impossible - so we're using 10% here 
	echo "\nChaining statistics for all analyzed tables (10% threshold):\n----------------------------------------------------------\n" 
	RunSql 9999 "col OWNER form a20 
			select OWNER, TABLE_NAME, TABLESPACE_NAME, NUM_ROWS, CHAIN_CNT, LAST_ANALYZED, SAMPLE_SIZE, round(CHAIN_CNT*100/NUM_ROWS,0) \"% Chained\" 
			from dba_tables 
			where LAST_ANALYZED is not NULL 
			and (CHAIN_CNT/NUM_ROWS)*100 > 10 
			and CHAIN_CNT > 0;" 
 
	return 
	} 
 
#--------------------------- 
# Print info about slow indexes 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetSlowInd () 
	{ 
	echo "Indexes that should probably be rebuilt because of" 
	echo "high index depth or high percentage of deleted entries\n" 
	RunSql 9999 "set serveroutput on 
			set linesize 2000 
			declare 
 			c_name        INTEGER; 
 			ignore        INTEGER; 
 			height        index_stats.height%TYPE := 0; 
 			lf_rows       index_stats.lf_rows%TYPE := 0; 
 			del_lf_rows   index_stats.del_lf_rows%TYPE := 0; 
 			distinct_keys index_stats.distinct_keys%TYPE := 0; 
 			cursor c_indx is 
  			select owner, table_name, index_name 
  			from dba_indexes 
  			where owner not in ('SYS','SYSTEM'); 
			begin 
 			dbms_output.enable (1000000); 
 			dbms_output.put_line ('Owner     Index Name                     % Deleted Entries  Blevel Distinctiveness'); 
 			dbms_output.put_line ('--------- ------------------------------ ----------------- ------- ---------------'); 
 			c_name := dbms_sql.open_cursor; 
 			for r_indx in c_indx loop 
  			dbms_sql.parse(c_name, 
		 			'analyze index ' || r_indx.owner || '.' || r_indx.index_name || ' validate structure', 
		 			dbms_sql.native); 
  			ignore := dbms_sql.execute(c_name); 
  			select HEIGHT, decode (LF_ROWS,0,1,LF_ROWS), DEL_LF_ROWS, 
	 			decode (DISTINCT_KEYS,0,1,DISTINCT_KEYS) 
	 			into height, lf_rows, del_lf_rows, distinct_keys 
  			from index_stats; 
  			if ( height > 5 ) OR ( (del_lf_rows/lf_rows) > 0.2 ) then 
    			dbms_output.put_line (rpad(r_indx.owner,10,' ') || rpad(r_indx.index_name,32,' ') || 
			  			lpad(round((del_lf_rows/lf_rows)*100,3),17,' ') || 
			  			lpad(height-1,7,' ') || lpad(round((lf_rows-distinct_keys)*100/lf_rows,3),16,' ')); 
  			end if; 
 			end loop; 
 			dbms_sql.close_cursor(c_name); 
			end; 
			/"; 
	return $? 
	} 
 
#--------------------------- 
# Print info about sessions  
# in the database. 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetSessionInfo () 
	{ 
	RunSql 999 "col USERNAME form a25 
		col SID form 999 
		col SERIAL form 99999 
		col OSUSER form a12 
		col USERNAME form a12 
		col MACHINE form a18 
		col PROGRAM form a30 
		select SID 
		--, SERIAL# 
		, STATUS, USERNAME,  OSUSER, MACHINE 
		, PROCESS, PROGRAM, to_char(LOGON_TIME,'DD/MM HH24:MI:SS') LOGON 
		from v\$session 
		order by type, status, username;" 
	return $? 
	} 
 
#--------------------------- 
# Print info about top CPU- 
# using sessions in the database. 
# Input : None 
# Output: Info on stdout 
#--------------------------- 
GetTopSessionInfo () 
	{ 
	case $DBINFO_DB_VERISON_SHORT in 
		80* )   echo "Top sessions information is currently not available for pre-8i databases" 
			return 0;; 
	esac 
 
	RunSql 999 "col username form a20 
		col osuser form a12 
		col machine form a20 
		col rank form 99 
		col sid form 999 
		select rownum as rank, a.* 
		from (SELECT v.sid, username, osuser, machine, program, round(v.value/(100*60),0) CPUMins 
    		FROM v\$statname s , v\$sesstat v, v\$session sess 
   		WHERE s.name = 'CPU used by this session' 
     		and sess.sid = v.sid 
     		and v.statistic#=s.statistic# 
     		and v.value>0 
   		ORDER BY v.value DESC) a 
		where rownum < 11;" 
	return $? 
	} 
 
#--------------------------- 
# Check to see if some of the 
# most common login/password  
# strings are valid.  
# They really _really_ shouldn't be ... 
#--------------------------- 
GetDefaultLogins () 
	{ 
	if [ ! -r password_list.sql ] ; then 
		echo "No password list found." 
		return 1 
	else 
		DBINFO_DEFAULT_LOGINS=$($DBINFO_GREP -v -E "^$|^#" password_list.sql) 
		for i in $DBINFO_DEFAULT_LOGINS ; do 
			echo "select 'LOGGED_ON' from dual;" | sqlplus -s $i | $DBINFO_GREP -q "LOGGED_ON" 
			[ $? -eq 0 ] && AddText red "User $(echo $i | cut -d"/" -f1) has a default password. CHANGE IT!" 
		done 
	fi 
	return 0	# ... always return 0. 
	} 
 
##################################################################### 
##################################################################### 
#####                                                           ##### 
#####                      M  A  I N                            ##### 
#####                                                           ##### 
##################################################################### 
##################################################################### 
 
set +C			# Allow clobbering of files 
cd $(dirname $0)	# Change to same dir as script resides in 
exec 2>&1		# Redirect stderr to stdout.  
			# Need this for sql's to dump correctly 
 
 
# See what we're called with. 
# -v  =  Show version and exit 
# -x  =  Unpack necessary *sql and image-files 
# ----------------------------------------------- 
case $1 in 
	-v) 	echo $DBINFO_VERSION 
		exit 0;; 
	-x)	UnpackResourceFiles || ExitScript $? "Unable to unpack necessary files" 
		exit $?;; 
	*)	;; 
esac 
 
# Print header based on which output mode we'll use 
if [ "$DBINFO_OUTPUT" = "HTML" ] ; then 
	HtmlHeader || ExitScript $? "Unable to print html header" 
else 
	echo "\nOracle database report for server $(uname -n)\n$(date)\n" 
fi 
 
################################ 
# 
# OS and Hardware section starts here 
# 
################################ 
 
#Exec H1 "1 - Basic system / platform information"  
# if [ "$DBINFO_CHECK_OS" = "YES" ] ; then 
# 	Exec H2 "1.1 - Hardware and OS" GetOsInfo || Error $? "Unable to find basic OS information" 
# 	Exec H2 "1.2 - System memory configuration" GetMemInfo || Error $? "Unable to find system memory information" 
# 	Exec H2 "1.3 - System kernel IPC-parameters" GetKernelInfo || Error $? "Unable to find kernel parameter information" 
# 	Exec H2 "1.4 - Filesystem layout and status" GetDfInfo || Error $? "Unable to retrieve filesystem status" 
#else 
# 	AddText std "\nThis section has been disabled." 
# 	AddText std "To enable it, change the parameter DBINFO_CHECK_OS to YES and re-run the collection script.\n" 
# fi 
 
################################ 
# 
# User setup and environment 
# Assuming user oracle and dba group dba 
# 
################################ 
 
Exec H1 "2 - OS user configuration and environment" 
if [ "$DBINFO_CHECK_OSUSER" = "YES" ] ; then 
	Exec H2 "2.1 - OS-users with admin rights on databases" GetOraUsers \ 
		 Error $? "Problems retrieveing oracle users" 
	Exec H2 "2.2 - User $(whoami) basic information" GetOsUserInfo \ 
		 Error $? "Unable to get user environment for user oracle"  
	Exec H2 "2.3 - User $(whoami) environment" GetUserenv \ 
		 Error $? "Unable to get user environment for user oracle"  
	Exec H2 "2.4 - User $(whoami) crontab" GetCrontab \ 
		 Error $? "Unable to locate a crontab entry for user oracle" 
	Exec H2 "2.5 - User $(whoami) OS-processes" GetUserProcs \ 
		 Error $? "Unable to retrieve active os-processes" 
else 
	AddText std "\nThis section has been disabled." 
	AddText std "To enable it, change the parameter DBINFO_CHECK_OSUSER to YES and re-run the collection script.\n" 
fi 
 
 
################################ 
# 
# Oracle spesific section starts here 
# 
################################ 

 
################################ 
# 
# Installed components and basic configuration 
#    - List out info from each installed ORACLE_HOME 
# 
################################ 
 
Exec H1 "3 - Oracle software and components" 
Exec H2 "3.1 - System oratab" GetOratab \ 
		 #ExitScript $? "Unable to locate an oratab entry for server $(uname -n)" 
 
typeset -i DBINFO_COUNTER=1 
export DBINFO_ORACLE_HOMES=$($DBINFO_GREP -v -E "^$|^#|^\*" $DBINFO_ORATAB | cut -d":" -f2 | sort -u) 
for ORACLE_HOME in $DBINFO_ORACLE_HOMES ; do 
	let DBINFO_COUNTER+=1 
 
	Exec H2 "3.$DBINFO_COUNTER - Components and config for ORACLE_HOME=$ORACLE_HOME" 
 
	if [ "$DBINFO_CHECK_COMPONENTS" = "YES" ] ; then 
		Exec H3 "3.$DBINFO_COUNTER.1 - $ORACLE_HOME : Installed products" GetInstalledProducts \ 
			 Error $? "Unable to find a list of installed products under $ORACLE_HOME/install" 
		Exec H3 "3.$DBINFO_COUNTER.2 - $ORACLE_HOME : Listener configuration" GetListenerConfig \ 
			 Error $? "Unable to find configuration for listener" 
		Exec H3 "3.$DBINFO_COUNTER.3 - $ORACLE_HOME : SQL*Net configuration" GetSqlnetConfig \ 
			 Error $? "Unable to find SQL*Net config file" 
		Exec H3 "3.$DBINFO_COUNTER.4 - $ORACLE_HOME : Tnsnames" GetTnsnamesConfig \ 
			 Error $? "Unable to find configuration-file for name lookup" 
	else 
		AddText std "\nThis section has been disabled." 
		AddText std "To enable it, change the parameter DBINFO_CHECK_COMPONENTS to YES and re-run the collection script.\n" 
	fi 
done 
 
################################ 
# 
# Database config and log files 
# 
################################ 
 
typeset -i DBINFO_COUNTER=3 
export DBINFO_ORACLE_SIDS=$($DBINFO_GREP -v -E "^$|^#|^\*" $DBINFO_ORATAB | cut -d":" -f1) 
for ORACLE_SID in $DBINFO_ORACLE_SIDS ; do 
	let DBINFO_COUNTER+=1 
 
	GetSidEnvironment $ORACLE_SID 

	CopyGlogin

	Exec H1 "$DBINFO_COUNTER - Database $ORACLE_SID  ($ORACLE_HOME)"  
 
	Exec H2 "$DBINFO_COUNTER.1 - $ORACLE_SID : Database configuration and logfile" 
	if [ "$DBINFO_CHECK_DB_FILES" = "YES" ] ; then 
		Exec H3 "$DBINFO_COUNTER.1.1 - $ORACLE_SID : Initfile" GetInitFile \ 
			 Error $? "Unable to find database initfile" 
		Exec H3 "$DBINFO_COUNTER.1.2 - $ORACLE_SID : Last 100 entires in alertlog" GetAlertlog \ 
			 Error $? "Unable to find last entires of alertlog" 
	else 
		AddText std "\nThis section has been disabled." 
		AddText std "To enable it, change the parameter DBINFO_CHECK_DB_FILES to YES and re-run the collection script.\n" 
	fi 
 
################################ 
# 
# Test from here on can only be 
# performed on open databases 
# 
################################ 
 
	Exec H2 "$DBINFO_COUNTER.2 - $ORACLE_SID : Internal database setup and configuration" 
 
	if [ ! "$DBINFO_CHECK_DB" = "YES" ] ; then 
		AddText std "\nTests that require an online database has been disabled." 
		AddText std "To enable it, change the parameter DBINFO_CHECK_DB to YES and re-run the collection script.\n" 
	elif ! CheckDbStatus ; then 
		Error 1 "The database $ORACLE_SID is not currently running. Skipping pending tests." 
	else 
	################################ 
	# 
	# Set the correct RDBMS version.  
	# Some SQL's are version spesific,  
	# and we neeed this to select what to run 
	# 
	################################ 
 
		# Full version info 
		export DBINFO_DB_VERISON=$(RunSql 0 "select VERSION from v\$instance;") 
 
		# Abbreviated version info 
		export DBINFO_DB_VERISON_SHORT=$(echo $DBINFO_DB_VERISON | sed 's/\.//g' | cut -c1-3) 
 
	################################ 
	# 
	# Database internal setup 
	#   - Tests that needs an open 
	#     database to be performed 
	# 
	################################ 
		if [ "$DBINFO_CHECK_BASIC_DB" = "YES" ] ; then 
			Exec H3 "$DBINFO_COUNTER.2.1 - $ORACLE_SID : Basic instance information" GetSidInfo \ 
				 Error $? "Unable to collect basic db-info for database $ORACLE_SID" 
			Exec H3 "$DBINFO_COUNTER.2.2 - $ORACLE_SID : License information" GetLicenseInfo \ 
				 Error $? "Unable to collect instance license information" 
			Exec H3 "$DBINFO_COUNTER.2.3 - $ORACLE_SID : Available database options" GetOptionInfo \ 
				 Error $? "Unable to list available database options" 
			Exec H3 "$DBINFO_COUNTER.2.4 - $ORACLE_SID : NLS Parameters" GetNlsParameters \ 
				 Error $? "Unable to collect NLS information from database" 
			Exec H3 "$DBINFO_COUNTER.2.5 - $ORACLE_SID : System Global Area - SGA" GetSgaInfo \ 
				 Error $? "Unable to collect SGA information for database $ORACLE_SID" 
			Exec H3 "$DBINFO_COUNTER.2.6 - $ORACLE_SID : Active database parameters" GetParameters \ 
				 Error $? "Unable to get system parameters for database $ORACLE_SID" 
		else 
			AddText std "\nThis section has been disabled." 
			AddText std "To enable it, change the parameter DBINFO_CHECK_BASIC_DB to YES and re-run the collection script.\n" 
		fi 
	 
	################################ 
	# 
	# Database storage setup and datafiles 
	#   - Tests that needs an open 
	#     database to be performed 
	# 
	################################ 
		Exec H2 "$DBINFO_COUNTER.3 - $ORACLE_SID : Datafiles and storage setup" 
		if [ "$DBINFO_CHECK_STORAGE" = "YES" ] ; then 
			Exec H3 "$DBINFO_COUNTER.3.1 - $ORACLE_SID : Archive information" GetArchiveInfo \ 
				 Error $? "Unable to collect archiver information for database $ORACLE_SID" 
			Exec H3 "$DBINFO_COUNTER.3.2 - $ORACLE_SID : Database controlfiles" GetControlFiles \ 
				 Error $? "Unable to find database controlfiles" 
			Exec H3 "$DBINFO_COUNTER.3.3 - $ORACLE_SID : Database redolog files" GetRedologFiles \ 
				 Error $? "Unable to collect redolog information" 
			Exec H3 "$DBINFO_COUNTER.3.4 - $ORACLE_SID : Rollback segments" GetRbsInfo \ 
				 Error $? "Unable to collect RBS info" 
 
			Exec H3 "$DBINFO_COUNTER.3.5 - $ORACLE_SID : Tablespaces" 
			Exec H4 "$DBINFO_COUNTER.3.5.1 - $ORACLE_SID : Tablespace summary" GetTablespaceInfo \ 
				 Error $? "Unable to collect tablespace summary information" 
			Exec H4 "$DBINFO_COUNTER.3.5.2 - $ORACLE_SID : Tablespace increases" GetTablespaceIncreases \ 
				  Error $? "Unable to collect tablespace increase information" 
			Exec H4 "$DBINFO_COUNTER.3.5.3 - $ORACLE_SID : Tablespaces not listed as online" GetTablespaceStatus \ 
				 Error $? "Unable to collect tablespace status information" 
			Exec H4 "$DBINFO_COUNTER.3.5.4 - $ORACLE_SID : Temporary tablespaces" GetTempTablespaces \ 
				 Error $? "Unable to collect information about temp tablespaces" 
			Exec H4 "$DBINFO_COUNTER.3.5.5 - $ORACLE_SID : Transportable tablespaces" GetTransTablespaces \ 
				 Error $? "Unable to collect information about transportanle tablespaces" 
#			Exec H4 "$DBINFO_COUNTER.3.5.6 - $ORACLE_SID : Tablespace fragmentation" GetTablespaceFragmentation \ 
#				 Error $? "Unable to collect tablespace framgentation info" 
				 
			Exec H3 "$DBINFO_COUNTER.3.6 - $ORACLE_SID : Datafiles" 
			Exec H4 "$DBINFO_COUNTER.3.6.1 - $ORACLE_SID : Datafile summary" GetDatafileInfo \ 
				 Error $? "Unable to collect datafile summary information" 
			Exec H4 "$DBINFO_COUNTER.3.6.2 - $ORACLE_SID : Datafiles with autextend enabled" GetDatafileAutoextend \ 
				 Error $? "Unable to collect datafile autoextend info" 
			Exec H4 "$DBINFO_COUNTER.3.6.3 - $ORACLE_SID : Datafiles not listed as online" GetDatafileAvailibility \ 
				 Error $? "Unable to collect datafile availibility info" 
			Exec H4 "$DBINFO_COUNTER.3.6.4 - $ORACLE_SID : Datafile IO information" GetFileIO \ 
				 Error $? "Unable to collect datafile IO information" 
		else 
			AddText std "\nThis section has been disabled." 
			AddText std "To enable it, change the parameter DBINFO_CHECK_STORAGE to YES and re-run the collection script.\n" 
		fi 
	 
	################################ 
	# 
	# Database users and roles 
	# 
	################################ 
		Exec H2 "$DBINFO_COUNTER.4 - $ORACLE_SID : Users and Roles" 
		if [ "$DBINFO_CHECK_USERS" = "YES" ] ; then 
			Exec H3 "$DBINFO_COUNTER.4.1 - $ORACLE_SID : Users" GetUsersInfo \ 
				 Error $? "Unable to collect user information" 
			Exec H3 "$DBINFO_COUNTER.4.6 - $ORACLE_SID : Roles" GetRoleInfo \ 
				 Error $? "Unable to collect role information" 
			Exec H3 "$DBINFO_COUNTER.4.7 - $ORACLE_SID : DB Jobs" GetDBJobs \ 
				 Error $? "Unable to collect DB jobs information" 
		else 
			AddText std "\nThis section has been disabled." 
			AddText std "To enable it, change the parameter DBINFO_CHECK_USERS to YES and re-run the collection script.\n" 
		fi 
 
	################################ 
	# 
	# Database objects 
	# 
	################################ 
		Exec H2 "$DBINFO_COUNTER.5 - $ORACLE_SID : Database objects" 
		if [ "$DBINFO_CHECK_OBJECTS" = "YES" ] ; then 
			Exec H3 "$DBINFO_COUNTER.5.1 - $ORACLE_SID : Summary of objects by user" GetObjectInfo \ 
				 Error $? "Unable to collect object information" 
			Exec H3 "$DBINFO_COUNTER.5.2 - $ORACLE_SID : Invalid objects" GetInvalidObjects \ 
				 Error $? "Unable to collect object status information" 
 
			Exec H3 "$DBINFO_COUNTER.5.3 - $ORACLE_SID : Database segments" 
			Exec H4 "$DBINFO_COUNTER.5.3.1 - $ORACLE_SID : Segments that should be relocated" GetRelocSegs \ 
				 Error $? "Unable to collect segs. relocation candidates" 
			Exec H4 "$DBINFO_COUNTER.5.3.2 - $ORACLE_SID : Segments reaching max extents" GetMaxExtents \ 
				 Error $? "Unable to collect segs. reaching maxextents" 
			Exec H4 "$DBINFO_COUNTER.5.3.3 - $ORACLE_SID : Segments with high # extents" \ 
				 GetExcessiveExtents  Error $? "Unable to collect overextended segs." 
			Exec H4 "$DBINFO_COUNTER.5.3.4 - $ORACLE_SID : Segments unable to allocate next extent" GetNextExtent \ 
				 Error $? "Unable to collect segs. unable to increase" 
			Exec H4 "$DBINFO_COUNTER.5.3.5 - $ORACLE_SID : Largest unpartitoned tables" GetLargeTabInfo \ 
				 Error $? "Unable to collect object status information" 
			Exec H4 "$DBINFO_COUNTER.5.3.6 - $ORACLE_SID : Largest partitoned tables" GetTabPartInfo \ 
				 Error $? "Unable to collect table partition information" 
			Exec H4 "$DBINFO_COUNTER.5.3.7 - $ORACLE_SID : Largest unpartitoned indexes" GetLargeIndInfo \ 
				 Error $? "Unable to collect object status information" 
			Exec H4 "$DBINFO_COUNTER.5.3.8 - $ORACLE_SID : Largest partitoned indexes" GetIndPartInfo \ 
				 Error $? "Unable to collect table partition information" 
			Exec H4 "$DBINFO_COUNTER.5.3.9 - $ORACLE_SID : Chaining and migration" GetChainingInfo \ 
				 Error $? "Unable to collect table chaining/migration information" 
# This test is *slow* on large databases. Comment in if you feel you *really* need it. 
#			Exec H4 "$DBINFO_COUNTER.5.3.9 - $ORACLE_SID : Potentially slow indexes" GetSlowInd \ 
#				 Error $? "Unable to collect index performance information" 
 
 
		else 
			AddText std "\nThis section has been disabled." 
			AddText std "To enable it, change the parameter DBINFO_CHECK_OBJECTS to YES and re-run the collection script.\n" 
		fi 
	 
	################################ 
	# 
	# Current sessions 
	# 
	################################ 
		Exec H2 "$DBINFO_COUNTER.6 - $ORACLE_SID : Database sessions" 
		if [ "$DBINFO_CHECK_SESSIONS" = "YES" ] ; then 
			Exec H3 "$DBINFO_COUNTER.6.1 - $ORACLE_SID : Current sessions" GetSessionInfo \ 
				 Error $? "Unable to collect session information" 
			Exec H3 "$DBINFO_COUNTER.6.2 - $ORACLE_SID : Top CPU users" GetTopSessionInfo \ 
				 Error $? "Unable to collect top usage information" 
		else 
			AddText std "\nThis section has been disabled." 
			AddText std "To enable it, change the parameter DBINFO_CHECK_SESSIONS to YES and re-run the collection script.\n" 
		fi 
 
	################################ 
	# 
	# Security and access related section 
	# - Enable this section by changing the DBINFO_CHECK_SECURITY variable 
	# - Note that some of this info has already been shown in other sections 
	# 
	################################ 
		Exec H2 "$DBINFO_COUNTER.7 - $ORACLE_SID : Security overview" 
		if [ "$DBINFO_CHECK_SECURITY" = "YES" ] ; then 
			Exec H3 "$DBINFO_COUNTER.7.1 - $ORACLE_SID : Oracle security parameters" GetSecParameters \ 
				 Error $? "Unable to collect security-related parameters" 
			Exec H3 "$DBINFO_COUNTER.7.2 - $ORACLE_SID : Profile security information" GetProfileSecuritySettings \ 
				 Error $? "Unable to profile security information" 
			Exec H3 "$DBINFO_COUNTER.7.3 - $ORACLE_SID : Database password file users" GetPwFileUsers \ 
				 Error $? "Unable to collect password file information" 
			Exec H3 "$DBINFO_COUNTER.7.4 - $ORACLE_SID : Users authenticated externally" GetBadUsers \ 
				 Error $? "Unable to collect user auth. nformation" 
			Exec H3 "$DBINFO_COUNTER.7.5 - $ORACLE_SID : Users/roles with worrying roles granted" GetBadRoles \ 
				 Error $? "Unable to collect bad role information" 
			Exec H3 "$DBINFO_COUNTER.7.6 - $ORACLE_SID : Users/roles with worrying privs granted" GetBadPrivs \ 
				 Error $? "Unable to collect bad privs. information" 
			Exec H3 "$DBINFO_COUNTER.7.7 - $ORACLE_SID : Default logins" GetDefaultLogins \ 
				 Error $? "Unable to collect information about default logins" 
		else 
			AddText std "\nThis section has been disabled." 
			AddText std "To enable it, change the parameter DBINFO_CHECK_SECURITY to YES and re-run the collection script.\n" 
		fi 
	fi	 
done 
	 
CopyGloginWhoami

echo 
[ $DBINFO_ERRORS -ne 0 ] && ExitScript $DBINFO_ERRORS "Problems encountered while running script" 
ExitScript 0 "Script terminates successfully" 
 
# Might be added: 
- More session statistics.  
- Security for SQL*Net, etc.  
- RBS explained - shrinks wraps ... 
########################################################################### 
# IMAGE AND SQL SOURCE UUENCODED (src.tgz) BELOW THIS POINT. DO NOT REMOVE. 
########################################################################### 
begin 644 src.tgz 
M'XL("`QWWSP``W-R8RYT87(`[59K<!/7%5X;,/:UH3A`!D)-UN`,)!-8R9)M 
M'@VPEE;2VKM:>7<EXP<V:VDE+^CA:"4;0VB3)J'4*2_SL'D6<`RT*8U+84)" 
M0J&#0QL(38?I(TF;DI;.=-KF1Z8S[4_W[%W)-.VTF;80)C/Z;-WONW?/GGOO 
MN><>J2.=2B7BBR-:F+AGL%@LU78[:;#-6H79:K5A-F"M@8ZEQFZOJK;8*NU6 
MTF*U6:T6>'[OEG0':3VE)&$IB:02C*K_WB[4H?Q'/^9>R''^G,#-NI;4*%.( 
M*<3?"&)L;.PO/_O%QY=&/QK]T4<CK_SI_5_?_NG-W_WJO=\<&?[@YLUW;]SX 
M^;5K/[ERY?KER]<O7KQV\<*U4Z??`KSQVH\O7+AZ]>J;WWQQ='3T!X"S9]\X 
M=>KUX5.O]P]<.'OFPLC(JR^]=/Z[WSG_C=VO`+Y]\MS)D^>&AKYWXL3(T-&7 
M;[_],N#8L=.G3Y\"#!PZ"3AX^`3@X,'AVV\.#P^_"-BW9PBP>]]0_\[CQX\? 
M.WKLR)$CAP\?/G3HT,$#!P_L'=R_?__@X.#`P,"^??OV`';T[]Z^L[^_?R?@ 
MA>T[^K9M[^O;MJ5OR_-;GMO\S+,]FY_>].7->L]3@)Z-FS9MZNWMW:!W]W2E 
MNKN[GP1$$UT`+98`Q!/Q9D^L<UVL68I&H^O#G>M#G>L#[G5J9Z>B=@JK(H!P 
M)"RL4`&M;>H3]@Y`6YL":&E7?"O6-K>M;6QJ;V]O6WNTK:FEC5NZIB6RIG[) 
M&K:FM:6UM:ZF);"FQ=_4(J]N;FIN]J]>+2N-LJ]1]`?$]H"X.M`@^WV2#!!$ 
M"=`@2=X&$="P1N3D!E]#`R<8J..]+,=[ZKEZCG/7U0.@\3CJ`&P="_"P'K?' 
MPZQRN]TNQN6JK648Q@EP.!V`6D<M@*ZE:7KERI60')<N7;K?^?F9XG&C,>X" 
M43A"N-<>W54^H8]D!_^P==K$26C2U%D574_?+CJPK-57,?O#6V`ZZ<#6;SF^ 
MWK_W0?L7GYIH6?OL3-L+KM]KNY3+=?ESSHR4+^TKWE)<D%^X:N29*<<&GTA7 
M-/UVXEL%EM"-6Z6/?/_Y&0L[KK_S<<>"'0]_:>B=B1^*7WM[7MVZ@G.SST;D 
M/63#]O!#YR*[RAT;_GCV_+3;?VY];=-?.71\B"E>_)SKU8=&!Z</_+"\9`$] 
M???.F64SONHK+"26_T];#H8CE9VI6+2]0PFN7[RN*W(7PYG%I]1_B[VF,EO_ 
MJVQ6T%:[S9*K_Y\)QGXY=HN85N=B741>'D'DP1\Q]C[A(`H+"B873"J</'ER 
M45$A*IDYM:2XN&3V`]._,'/N'/+AN7/*RLH?L3Q:/G]115G98TL?6V2U55=7 
MDPN7KUQF7V&IJK893O**BHI*BDMF39TZRS:O;)[MO\;8):*TD"@A2B;DS2/R 
M2_,FE.:-72$>A*7F?6(7^<1D&)\[C<@']0_C>1.(_`>FVV@IV0_/9_S36\;V 
M8;3T7T??,V:$"2>4$BN)#_8,[_4=D`_-[SPS<%6H#&Q;MO765\;>O?MG<3_0 
MI>AZ3R(9:H]J>FJQ_F3T'LSQ*???#K_ZC/M?;:^TV^V01'#_JVSVW/W_+#"? 
M7'2W@>:3'"03F0B3(36LI*,I,JVK22J;:F0P$>O0XDI*2\1U$JS#B70\1";B 
MI'D&I!:',XE&30,T'RS8,*G$>PV/J4Y55TEU`TSP.!G1NE5C)$8J9%SM(<=G 
M*(=WU`U*K`N\+>SIU(""B7A<#:;4$*GHI-ZKI]38H^0R4HFFU"1>'TD[:5XB 
MM9`:3VEA#0P[>DDOT]CNHR6I41"=R]&]"!8XE1(Q=3Q4V3WH$)8D*9@1H;NZ 
MHEHP$Q!:I&@1N3G*S2':Y^.D)HER>9U9[?/74O`!OPXEOB!%)M58A_&?)#4C 
M?)H.D888ZQ"19!(B8KR'WX<WG)E%F/&A@.ZL!QGS.#RTU\VT"]YVUBO)-,<9 
MHS+#4SSMI=V,:#BAHWJ"#':JP?5X"^:)196-O60T$8&SS;YB4K8GB+2#8Y!) 
MV1YX<R43,3*=BNK&:1H%"N%SHAH%P8EJ.;J>H7RT#V9V<+183SDX0?:@.L'+ 
M2!3X96"!#D&6*9G-K$Z`]20AVK$$/G4=.9P,+RRII#)L]AV"2&6%.2*R3BHK 
MS!&_HY;*"N0369X6FZ@,([_$B!8*MUA;L;9B78EU)=8VK&U8V[&V8UV%=176 
MU5A78UV#=0W62[!>@O52K)<B)L!X90JW"+)`,I,!"/F$1D9TT*)L&%*?Z"&) 
MP1NA,HQXEN/`R"0$>V9H/V42<OM<3LIH0'&&XB#U&K!3DZ!71P=HRB3$\T(E 
M930(!YC"+:P&EH`@[7#J!40(D-'`X7)X)1E&@H.5&4FF,HQ<K)?V.A@JPXAW 
MN2GX((?`^VAO$Y5A5,=+>$D91@'6R0AX9%PAVN]DS;%QA>#TW`P>&U?PKIAY 
M$S.2)2<3H'`+&C\R">\0;Q!Y1,HC(@$RF4&2AY(\X[D<#2E=I*ZFTEU(9'RT 
MDV>]5%8@P2E1\#$8=L(+7FI<C3N0O+POX\!9:W0HD^X8R+0L^6A'?<8*;H?+ 
M&*.R`EL:U:4KI<6TC7`??%$E3DHII4.+:JE>$@E^F8.YC7;<V"Q%,I`*CI/= 
M:A+)<$T9*0#[-\2XI>@D%V7MM3@46%X-:0IX%9U&$3')Z/DXOQL*"75'(AZ; 
MX!8YY-5&)\LFX1*33L)W!4Q42U)DG=*MP%F*4#,J8*3"[Z7]L@<N`.N@9<9) 
ML=X`S;&XOM&A;B4>A-+>D%;3JA:/0*Y"GAJ/>$T/DC$MDL15-EL;))YU4[B% 
M.^$6P1^585Q+S"UZE9BJ9T/BI7DH/;@UW0:3"3T13I&II!+7E2#VGK'E90EO 
M%A.NO[UQ):8%20F>:T%51TYLX,P^QXM,Q^&;0(TDDG!RH6Q-I1O,:X,)P<9I 
M3H"5FXP82!+XP$UVXMO4!(L3&4@[)/(TRU&X11+-^Z#VFH3N]R^3''+((8<< 
><L@AAQQRR"&'''+((8<<<LCA_\7?`:VZ0P8`*``` 
` 
end 
