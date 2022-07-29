bash -c "cd /_deb; sudo mv ./*.deb ./build.deb;"

bash -c "cd /_deb; sudo dpkg-deb -e ./build.deb ./DEBIAN;"

bash -c "cd /_deb; sudo chown -R $USER:$USER ./DEBIAN;"

bash -c "cd /_deb; sudo chmod -R 777 ./DEBIAN;"

bash -c "cd /_deb; sudo rm -rf ./build.deb;"
