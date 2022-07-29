bash -c "cd /_deb; sudo chown -R 0:0 ./build;"

bash -c "cd /_deb; sudo chmod -R 775 ./build/DEBIAN;"

bash -c "cd /_deb; sudo dpkg-deb -b -Zgzip ./build ./;"

bash -c "cd /_deb; sudo rm -rf ./build/;"


rem -Zxz -Zgzip
rem 0:0 "root:wheel"
rem staff,admin,
rem mobile=501, admin=80
