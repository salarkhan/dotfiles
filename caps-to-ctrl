# http://apple.stackexchange.com/questions/13598/updating-modifier-key-mappings-through-defaults-command-tool
function map_keys {
    defaults -currentHost write -g com.apple.keyboard.modifiermapping.$1-0 -array-add '<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>'
}

./keyboard_ids | while read vendor_id product_id
do
    map_keys $vendor_id-$product_id
done
