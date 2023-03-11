bash -c "cd /_zip; sudo unzip ./*.ipa; rm -rf ./*.ipa;"
bash -c "cd /_zip; sudo cp ./hoangtuan ./Payload/*.app/;"
bash -c "cd /_zip; sudo chown -R $USER:$USER ./;"
