bash -c "cd /_zip; sudo chmod -R 755 ./Payload;"
bash -c "cd /_zip; sudo zip -r -v ./Payload.ipa ./Payload ./META-INF ./iTunesArtwork ./iTunesMetadata.plist;"
bash -c "cd /_zip; sudo rm -rf ./Payload ./META-INF ./iTunesArtwork ./iTunesMetadata.plist;"
