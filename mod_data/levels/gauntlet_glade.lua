thok_spawned = false

function on_init_map(map)
	add_reinforcements(map, 2, 1)
	add_reinforcements(map, 3, 4)
	add_reinforcements(map, 4, 2)
	add_reinforcements(map, 5, 3)
	add_reinforcements(map, 6, 5)
end

function on_draw_objectives(map, ctx)
	local status
	if thok_spawned and not find_obj(map, "eoten_champion") then status = true end
	ctx.objective("survive", "Defeat Thok", status, "X")

	local status
	if not find_named_obj(map, "cyst") then status = true end
	ctx.bonus_objective("destroy_cyst", "Destroy the cyst", status, "G")
	ctx.bonus_objective_no_knock_outs("P")
end

function on_battle_round(map, round)
	if round == 6 then
		-- setup thok
		local thok = find_obj(map, "eoten_champion")
		thok.hp = 20
		thok.max_hp = thok.hp
		thok.ui_name = "Thok the Champion"
		thok_spawned = true
	end
end
