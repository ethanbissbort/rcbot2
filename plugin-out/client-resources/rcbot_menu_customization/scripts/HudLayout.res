"Resource/HudLayout.res"
{
	//
	// SourceMod Menu Panel Configuration
	// This controls the ShowMenu (radio-style) menu display
	//
	"HudMenu"
	{
		"fieldName"		"HudMenu"
		"visible"		"1"
		"enabled"		"1"
		"xpos"			"16"			// Left margin from screen edge
		"ypos"			"0"				// Top position (0 = auto-center vertically)
		"wide"			"f0"			// Full screen width (f = full, 0 = no offset)
		"tall"			"480"			// Height available for menu

		// Animation settings (referenced by HudAnimations.txt)
		"Alpha"				"255"
		"SelectionAlpha"	"255"
		"TextScan"			"1.0"
		"Blur"				"0"
		"OpenCloseTime"		"0.15"		// Speed of menu open/close animation
	}

	//
	// Voice/Command Menu (used by some games for quick voice commands)
	//
	"HudVoiceMenu"
	{
		"fieldName"		"HudVoiceMenu"
		"visible"		"1"
		"enabled"		"1"
		"xpos"			"c-100"			// Centered horizontally
		"ypos"			"c-100"			// Centered vertically
		"wide"			"200"
		"tall"			"200"
	}

	//
	// Close Caption / Subtitle panel (if your menus use this)
	//
	"HudCloseCaption"
	{
		"fieldName"		"HudCloseCaption"
		"visible"		"1"
		"enabled"		"1"
		"xpos"			"c-250"
		"ypos"			"276"
		"wide"			"500"
		"tall"			"136"

		"BgAlpha"		"128"

		"GrowTime"		"0.25"
		"ItemHiddenTime"	"0.2"
		"ItemFadeInTime"	"0.15"
		"ItemFadeOutTime"	"0.3"
	}

	//
	// Health display
	//
	"HudHealth"
	{
		"fieldName"		"HudHealth"
		"xpos"			"16"
		"ypos"			"432"
		"wide"			"102"
		"tall"			"36"
		"visible"		"1"
		"enabled"		"1"
	}

	//
	// Suit/Armor display
	//
	"HudSuit"
	{
		"fieldName"		"HudSuit"
		"xpos"			"140"
		"ypos"			"432"
		"wide"			"108"
		"tall"			"36"
		"visible"		"1"
		"enabled"		"1"
	}

	//
	// Ammo display
	//
	"HudAmmo"
	{
		"fieldName"		"HudAmmo"
		"xpos"			"r150"
		"ypos"			"432"
		"wide"			"136"
		"tall"			"36"
		"visible"		"1"
		"enabled"		"1"
	}

	//
	// Secondary ammo display
	//
	"HudAmmoSecondary"
	{
		"fieldName"		"HudAmmoSecondary"
		"xpos"			"r76"
		"ypos"			"432"
		"wide"			"60"
		"tall"			"36"
		"visible"		"1"
		"enabled"		"1"
	}

	//
	// Chat panel
	//
	"HudChat"
	{
		"fieldName"		"HudChat"
		"visible"		"1"
		"enabled"		"1"
		"xpos"			"10"
		"ypos"			"275"
		"wide"			"320"
		"tall"			"120"
	}

	//
	// Message/Hint panel
	//
	"HudMessage"
	{
		"fieldName"		"HudMessage"
		"visible"		"1"
		"enabled"		"1"
		"xpos"			"0"
		"ypos"			"0"
		"wide"			"f0"
		"tall"			"f0"
	}

	//
	// Crosshair
	//
	"HudCrosshair"
	{
		"fieldName"		"HudCrosshair"
		"visible"		"1"
		"enabled"		"1"
		"wide"			"640"
		"tall"			"480"
	}

	//
	// Death notice panel
	//
	"HudDeathNotice"
	{
		"fieldName"		"HudDeathNotice"
		"visible"		"1"
		"enabled"		"1"
		"xpos"			"r640"
		"ypos"			"18"
		"wide"			"628"
		"tall"			"468"
	}
}
