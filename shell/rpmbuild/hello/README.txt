
mkdir BUILD
mkdir SOURCES
touch SOURCES/hello.sh
rpmbuild -v --define "_topdir $PWD" -bb SPECS/hello.spec 
