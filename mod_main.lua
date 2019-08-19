-- To avoid collisions with built-in game assets and assets defined in other mods
-- all mod specific asset names should be put into namespace. To avoid repeating
-- the (possibly quite long) namespace everywhere, it's set up here once. All 
-- occurrences of '$mod' in strings in Lua code are automatically replaced with
-- the namespace. For example, the asset name "$mod.test_box" is converted to
-- "xxxxxx.test_box", where "xxxxxx" is your unique namespace.

namespace "ctrl_alt_ninja_gauntlet_glade" -- TODO: replace with your name and mod name in lower case and separated using underscores (e.g. "john_doe_awesome_mod")

-- define a new site on the world map
def_site{
	name = "$mod.gauntlet_glade",
	ui_name = "Gauntlet Glade",
}

def_mission{
	name = "$mod.thoks_challenge",
	site = "$mod.gauntlet_glade",
	ui_name = "Thok's Challenge",
	level_filename = "mod_data/levels/gauntlet_glade.level",
	letter_text =
		"From: Thok the Champion\n" ..
		"To: All fighters in the Menhir Forest\n" ..
		"Subject: Fight!\n\n" ..
		"I challenge all fighters in the Menhir Forest to come to the Gauntlet Glade and fight. " ..
		"I bet my minions will knock you out in three rounds. Mwahaha!",
	locked = false,
}

-- make alterations to the world map
register_global_hook("on_enter_world_map", function(map)
	local site = spawn("map_grove", map, 0, 0, 0)
	register_named_obj(map, site, "$mod.gauntlet_glade")
	set_world_pos3(site, 83.307404, 2.928288, -138.010513)
	set_world_rot_euler(site, 0.000000, -0.000000, 0.000000)
	set_obj_scale3(site, 1.339419, 1.339419, 1.339419)
end)
