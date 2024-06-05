            GEN_FILE="lib/src/icons/next_flutter_icons.dart"
            ASSETS_DIR="assets"
            
            EXPECTED_NAMES=("bold.svg" "broken.svg" "bulk.svg" "linear.svg" "outline.svg" "twotone.svg")
            EXPECTED_FILES=${#EXPECTED_NAMES[@]}

            ZIP_FILES=$(find $ASSETS_DIR -type f -name "*.zip")
            echo $ZIP_FILES
            
            for ZIP_FILE in $ZIP_FILES; do
             FOLDER_NAME=$(basename -s.zip "$ZIP_FILE")
             mkdir -p $ASSETS_DIR/$FOLDER_NAME/
             unzip -o "$ZIP_FILE" -d $ASSETS_DIR/$FOLDER_NAME
             SVGS=$(ls $ASSETS_DIR/$FOLDER_NAME)

             for FILE in "${EXPECTED_NAMES[@]}"; do
               BASENAME=$(basename "$FILE")
               FOUND=0
            
               for SVG in $SVGS; do
                 if [[ $SVG == *"$BASENAME"* ]]; then
                   mv $ASSETS_DIR/$FOLDER_NAME/*$SVG $ASSETS_DIR/$FOLDER_NAME/$BASENAME
                   FOUND=1
                   break
                 fi
               done
                SVGS_LEN=$(ls -1 $ASSETS_DIR/$FOLDER_NAME | wc -l)

                if [ "$SVGS_LEN" != "$EXPECTED_FILES" ]; then
                  echo "Expected $EXPECTED_FILES files, but found $SVGS_LEN"
                  exit 1
                fi
            done
             
             if [[ $FOUND -eq 0 ]]; then
               echo "File $FILE not found or did not match expected pattern."
               exit 1
             fi
                       
             rm "$ZIP_FILE"
            
             ASSETS=$(ls assets/)
            
             ENUM_DEFINITION="
                 import 'package:flutter/widgets.dart'; 
                 import 'package:next_flutter_icons/src/core/enum_schema/with_basepath.dart';  
                     
                 /// {@template next_flutter_icons}
                 /// pretty cool icons
                 /// {@endtemplate}
                 @staticIconProvider
                 enum NextIcons implements WithBasePath {
             "
                     
             # Add each directory as an enum case
             for DIR in $ASSETS; do
               DIR_NAME=$(basename $DIR)
               if [[ $DIR_NAME == *"_"* ]]; then
                 continue # Skip directories with underscores (assuming they're not valid enum cases and just used for metadata)
               fi
               ENUM_CASE="$DIR_NAME('$DIR_NAME')"
               ENUM_DEFINITION+="  $ENUM_CASE,"
             done
                     
             ENUM_DEFINITION+=";const NextIcons(super.basePath);}"
                     
             # Output the generated enum definition
             echo "$ENUM_DEFINITION" > "$GEN_FILE"
            
             dart format $GEN_FILE
            done
