"Scheme"
{
	"BaseSettings"
	{
		// Menu panel settings
		"Menu.TextColor"				"255 255 255 255"
		"Menu.BgColor"					"0 0 0 200"
		"Menu.ArmedTextColor"			"255 208 64 255"
		"Menu.ArmedBgColor"				"0 0 0 200"
		"Menu.TextInset"				"6"
	}

	"Fonts"
	{
		//
		// SourceMod/Radio Menu Fonts - Customized for better readability
		//

		// Menu title and description text (non-selectable lines)
		"MenuTextFont"
		{
			"1"	[$WIN32]
			{
				"name"			"Verdana"
				"tall"			"12"
				"weight"		"600"
				"antialias"		"1"
			}
			"2"	[$WIN32]
			{
				"name"			"Verdana"
				"tall"			"13"
				"weight"		"600"
				"antialias"		"1"
				"range"			"0x0000 0x017F"
			}
			"3"	[$X360]
			{
				"name"			"Verdana"
				"tall"			"14"
				"weight"		"600"
				"antialias"		"1"
			}
		}

		// Menu item font (selectable numbered options)
		"MenuItemFont"
		{
			"1"	[$WIN32]
			{
				"name"			"Verdana"
				"tall"			"13"
				"weight"		"700"
				"antialias"		"1"
			}
			"2"	[$WIN32]
			{
				"name"			"Verdana"
				"tall"			"14"
				"weight"		"700"
				"antialias"		"1"
				"range"			"0x0000 0x017F"
			}
			"3"	[$X360]
			{
				"name"			"Verdana"
				"tall"			"16"
				"weight"		"700"
				"antialias"		"1"
			}
		}

		// Pulsing/highlighted menu item (when selected)
		"MenuItemFontPulsing"
		{
			"1"	[$WIN32]
			{
				"name"			"Verdana"
				"tall"			"13"
				"weight"		"900"
				"antialias"		"1"
				"blur"			"3"
				"scanlines"		"2"
			}
			"2"	[$WIN32]
			{
				"name"			"Verdana"
				"tall"			"14"
				"weight"		"900"
				"antialias"		"1"
				"blur"			"3"
				"range"			"0x0000 0x017F"
			}
			"3"	[$X360]
			{
				"name"			"Verdana"
				"tall"			"16"
				"weight"		"900"
				"antialias"		"1"
				"blur"			"3"
			}
		}

		//
		// Alternative smaller fonts - Use these names in HudLayout.res if you want even smaller text
		//

		"MenuTextFontSmall"
		{
			"1"
			{
				"name"			"Verdana"
				"tall"			"10"
				"weight"		"500"
				"antialias"		"1"
			}
		}

		"MenuItemFontSmall"
		{
			"1"
			{
				"name"			"Verdana"
				"tall"			"11"
				"weight"		"600"
				"antialias"		"1"
			}
		}

		//
		// General HUD fonts that may affect other elements
		//

		"Default"
		{
			"1"
			{
				"name"			"Verdana"
				"tall"			"12"
				"weight"		"500"
				"antialias"		"1"
			}
		}

		"DefaultSmall"
		{
			"1"
			{
				"name"			"Verdana"
				"tall"			"10"
				"weight"		"500"
				"antialias"		"1"
			}
		}

		"DefaultLarge"
		{
			"1"
			{
				"name"			"Verdana"
				"tall"			"16"
				"weight"		"600"
				"antialias"		"1"
			}
		}

		// HUD element fonts
		"HudNumbers"
		{
			"1"
			{
				"name"			"Verdana"
				"tall"			"32"
				"weight"		"700"
				"antialias"		"1"
			}
		}
	}

	"Colors"
	{
		// Menu colors (RGBA format)
		"MenuColor"				"255 255 255 255"		// Title/description text color
		"ItemColor"				"255 208 64 255"		// Selectable item color (gold/yellow)
		"MenuBoxBg"				"20 20 20 220"			// Background box color (dark, semi-transparent)

		// Additional useful colors
		"White"					"255 255 255 255"
		"Black"					"0 0 0 255"
		"TransparentBlack"		"0 0 0 200"
		"Green"					"0 255 0 255"
		"Red"					"255 0 0 255"
		"Yellow"				"255 255 0 255"
		"Orange"				"255 176 0 255"
		"LightBlue"				"128 200 255 255"
	}

	"Borders"
	{
		"MenuBorder"
		{
			"inset"	"0 0 1 1"
			"Left"
			{
				"1"
				{
					"color"		"60 60 60 255"
					"offset"	"0 1"
				}
			}
			"Right"
			{
				"1"
				{
					"color"		"60 60 60 255"
					"offset"	"1 0"
				}
			}
			"Top"
			{
				"1"
				{
					"color"		"60 60 60 255"
					"offset"	"0 0"
				}
			}
			"Bottom"
			{
				"1"
				{
					"color"		"60 60 60 255"
					"offset"	"0 0"
				}
			}
		}
	}
}
