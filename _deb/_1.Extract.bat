bash -c "cd /_deb; sudo mkdir ./build;"

bash -c "cd /_deb; sudo mv ./*.deb ./build.deb;"

bash -c "cd /_deb; sudo dpkg-deb -e ./build.deb ./build/DEBIAN;"

bash -c "cd /_deb; sudo dpkg-deb -x ./build.deb ./build;"

bash -c "cd /_deb; sudo chown -R $USER:$USER ./build;"

bash -c "cd /_deb; sudo chmod -R 777 ./build/DEBIAN;"

bash -c "cd /_deb; sudo rm -rf ./build.deb;"
