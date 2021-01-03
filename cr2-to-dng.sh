#!/bin/bash

find $(pwd)/Pictures/20201230.photoslibrary/originals -type f  -name "*.cr2" -print0 | while read -d $'\0' file
do
    echo "$file"
    if [[ $file =~ .*_4.* ]]; then
      echo "skipping_4"
    else
      jpegfile="${file/.cr2/.jpeg}"
      dngfile="${file/.cr2/.dngfile}"

      if [ -f "$jpegfile" ]; then
          echo "$jpegfile exists."
      elif [ -f "$dngfile" ]; then
          echo "$dngfile exists."
            #rm $dngfile
      else
          echo "$jpegfile does not exist."
          echo "$dngfile does not exist. "

          echo "creating ${file}..."
          echo "open -a /Applications/Adobe\ dngfile\ Converter.app/Contents/MacOS/Adobe\ dngfile\ Converter --args -u ${file}"
          /Applications/Adobe\ dngfile\ Converter.app/Contents/MacOS/Adobe\ dngfile\ Converter --args -p2 -u ${file}

      fi
    fi
done
