================================================================================
                    RCBot2 Menu Customization Resource Pack
================================================================================

This resource pack customizes SourceMod menu appearance for HL2DM clients.
It provides smaller fonts, adjusted colors, and improved menu styling.

================================================================================
                              INSTALLATION
================================================================================

CLIENT-SIDE INSTALLATION (for individual players):
--------------------------------------------------

1. Navigate to your HL2DM installation folder:

   Steam\steamapps\common\Half-Life 2 Deathmatch\hl2mp\

2. Create a "custom" folder if it doesn't exist:

   hl2mp\custom\

3. Copy the entire "rcbot_menu_customization" folder into the custom folder:

   hl2mp\custom\rcbot_menu_customization\

4. Your final folder structure should look like:

   hl2mp\
     custom\
       rcbot_menu_customization\
         resource\
           ClientScheme.res
         scripts\
           HudLayout.res
           HudAnimations.txt

5. Restart HL2DM for changes to take effect.


SERVER-SIDE DISTRIBUTION (optional, for server operators):
----------------------------------------------------------

If you want to distribute these files to all connecting clients:

1. Enable sv_downloadurl and FastDL on your server
2. Upload the files to your FastDL server maintaining the folder structure
3. Add the files to your server's download list


================================================================================
                            CUSTOMIZATION
================================================================================

FONT SIZE ADJUSTMENT:
--------------------

To change font sizes, edit resource\ClientScheme.res:

  "MenuTextFont"       - Title and description text
  "MenuItemFont"       - Selectable menu items
  "MenuItemFontPulsing" - Highlighted/selected items

Adjust the "tall" value to change font size:
  - Smaller: 10-12
  - Normal:  13-14
  - Larger:  16-18


COLOR CUSTOMIZATION:
-------------------

In ClientScheme.res, find the "Colors" section:

  "MenuColor"    - Title/description text color (RGBA: 0-255)
  "ItemColor"    - Selectable item text color
  "MenuBoxBg"    - Background box color

Example RGBA values:
  White:         "255 255 255 255"
  Black:         "0 0 0 255"
  Semi-trans:    "0 0 0 200"
  Gold/Yellow:   "255 208 64 255"
  Orange:        "255 176 0 255"
  Green:         "0 255 0 255"
  Red:           "255 0 0 255"


MENU POSITION:
-------------

In scripts\HudLayout.res, find "HudMenu":

  "xpos"  - Horizontal position (16 = left margin)
  "ypos"  - Vertical position (0 = auto-center)
  "wide"  - Available width
  "tall"  - Available height


ANIMATION SPEED:
---------------

In scripts\HudAnimations.txt:

  MenuOpen duration:   Change "0.15" to faster (0.05) or slower (0.3)
  MenuClose duration:  Change "0.2" to faster (0.1) or slower (0.4)
  MenuPulse effect:    Adjust "Blur" values for highlight intensity


================================================================================
                          FONT SIZE PRESETS
================================================================================

TINY (minimal screen space):
  MenuTextFont:        tall "10"
  MenuItemFont:        tall "11"
  MenuItemFontPulsing: tall "11"

SMALL (compact, good readability):
  MenuTextFont:        tall "12"
  MenuItemFont:        tall "13"
  MenuItemFontPulsing: tall "13"

NORMAL (balanced):
  MenuTextFont:        tall "14"
  MenuItemFont:        tall "15"
  MenuItemFontPulsing: tall "15"

LARGE (high visibility):
  MenuTextFont:        tall "16"
  MenuItemFont:        tall "18"
  MenuItemFontPulsing: tall "18"


================================================================================
                            TROUBLESHOOTING
================================================================================

Changes not appearing:
- Make sure the folder structure is correct
- Restart HL2DM completely (not just reconnect)
- Check for syntax errors in .res files (missing quotes, braces)

Menu looks broken:
- Restore original files by deleting the custom folder
- Verify file encoding is UTF-8 or ANSI

Fonts not loading:
- Make sure font names match system fonts ("Verdana", "Arial", "Tahoma")
- Try simpler font definitions without blur/scanlines


================================================================================
                              LICENSE
================================================================================

This resource pack is provided as-is for use with RCBot2.
Feel free to modify and redistribute.

================================================================================
