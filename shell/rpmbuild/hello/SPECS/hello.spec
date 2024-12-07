
%define name        hello
%define version     1.0

Summary:        My Maintenance Scripts
Name:           %{name}
Version:        %{version}
Release:        0
License:        none
BuildArch:      noarch
Group:          System/Base
Vendor:         PfisterA

%description
This package provides my maintenances scripts.

%build
# this section is empty for this example as we're not actually building anything

%install
echo "@@@ INSTALL"
mkdir -p $RPM_BUILD_ROOT/usr/local/bin
mkdir -p $RPM_BUILD_ROOT/usr/local/%{name}/bin
install -m 700 %{_sourcedir}/hello.sh $RPM_BUILD_ROOT/usr/local/%{name}/bin/hello.sh
#ln -s -f /usr/local/hello/bin/hello.sh /usr/local/bin/hello.sh

%post
echo "@@@ POST"
exit 0

%clean
#rm -rf $RPM_BUILD_ROOT
#rm -rf %{_tmppath}/%{name}
#rm -rf %{_topdir}/BUILD
exit 0

%files
%defattr(-,root,root)
/usr/local/bin
/usr/local/hello

%changelog
* Sun Aug 01 2010  Your name here
- 1.0 r1 First release
