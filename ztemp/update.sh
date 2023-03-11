#!/bin/sh
echo "------------------"

echo "Building Packages...."
apt-ftparchive packages ./debs/ > ./Packages;
#sed -i -e '/^SHA/d' ./Packages;
bzip2 -c9k ./Packages > ./Packages.bz2;
echo "Build Packages Done"

echo "Building Release...."
printf "Origin: Hoàng Tuân Repository\nLabel: Hoàng Tuân\nSuite: stable\nVersion: 1.0\nCodename: ios\nArchitectures: iphoneos-arm\nComponents: main\nDescription: Kho lưu trữ Cydia của Hoàng Tuân\nMD5Sum:\n "$(cat ./Packages | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages --printf="%s")" Packages\n "$(cat ./Packages.bz2 | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages.bz2 --printf="%s")" Packages.bz2\n" >Release;
echo "Build Release Done"

echo "Building all.packages...."
ls ./debs/ -t | grep '.deb' | perl -e 'use JSON; @in=grep(s/\n$//, <>); $count=0; foreach $fileNow (@in) { $fileNow = "./debs/$fileNow"; $size = -s $fileNow; $debInfo = `dpkg -f $fileNow`; $section = `echo "$debInfo" | grep "Section: " | cut -c 10- | tr -d "\n\r"`; $name= `echo "$debInfo" | grep "Name: " | cut -c 7- | tr -d "\n\r"`; $version= `echo "$debInfo" | grep "Version: " | cut -c 10- | tr -d "\n\r"`; $package= `echo "$debInfo" | grep "Package: " | cut -c 10- | tr -d "\n\r"`; $time= `date -r $fileNow +%s | tr -d "\n\r"`; @in[$count] = {section=>$section, package=>$package, version=>$version, size=>$size+0, time=>$time+0, name=>$name}; $count++; } print encode_json(\@in)."\n";' > all.packages;
echo "Build all.packages Done"

echo "------------------"
echo "Done!"
exit 0;