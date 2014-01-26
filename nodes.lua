minetest.register_node("moonrealm:stone", {
	description = "Moonstone",
	tiles = {"moonrealm_stone.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moonrealm:ironore", {
	description = "MR Iron Ore",
	tiles = {"moonrealm_stone.png^default_mineral_iron.png"},
	groups = {cracky=2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moonrealm:dust", {
	description = "Moondust",
	tiles = {"moonrealm_dust.png"},
	groups = {crumbly=3, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.05},
	}),
})

minetest.register_node("moonrealm:vacuum", {
	description = "Vacuum",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drowning = 1,
})

minetest.register_node("moonrealm:air", {
	description = "Life Support Air",
	drawtype = "glasslike",
	tiles = {"moonrealm_air.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	post_effect_color = {a=16, r=0, g=0, b=16},
})

minetest.register_node("moonrealm:airgen", {
	description = "Air Generator",
	tiles = {"moonrealm_airgen.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local env = minetest.env
		local x = pos.x
		local y = pos.y
		local z = pos.z
		for i = -1,1 do
		for j = -1,1 do
		for k = -1,1 do
			if not (i == 0 and j == 0 and k == 0) then
				local nodename = env:get_node({x=x+i,y=y+j,z=z+k}).name
				if nodename == "moonrealm:vacuum" then
					env:add_node({x=x+i,y=y+j,z=z+k},{name="moonrealm:air"})
					print ("[moonrealm] Added air node")
				end
			end
		end
		end
		end
		
	end
})

minetest.register_node("moonrealm:waterice", {
	description = "Water Ice",
	tiles = {"moonrealm_waterice.png"},
	light_source = 1,
	paramtype = "light",
	sunlight_propagates = true,
	groups = {cracky=3,melts=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("moonrealm:hlflowing", {
	description = "Flowing Hydroponics",
	inventory_image = minetest.inventorycube("moonrealm_hl.png"),
	drawtype = "flowingliquid",
	tiles = {"moonrealm_hl.png"},
	special_tiles = {
		{
			image="moonrealm_hlflowing_animated.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2}
		},
		{
			image="moonrealm_hlflowing_animated.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2}
		},
	},
	alpha = 224,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	liquidtype = "flowing",
	liquid_alternative_flowing = "moonrealm:hlflowing",
	liquid_alternative_source = "moonrealm:hlsource",
	liquid_viscosity = 1,
	post_effect_color = {a=224, r=115, g=55, b=24},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1},
})

minetest.register_node("moonrealm:hlsource", {
	description = "Hydroponic Source",
	inventory_image = minetest.inventorycube("moonrealm_hl.png"),
	drawtype = "liquid",
	tiles = {"moonrealm_hl.png"},
	alpha = 224,
	paramtype = "light",
	walkable = false,
	pointable = false,
	buildable_to = true,
	liquidtype = "source",
	liquid_alternative_flowing = "moonrealm:hlflowing",
	liquid_alternative_source = "moonrealm:hlsource",
	liquid_viscosity = 1,
	post_effect_color = {a=224, r=115, g=55, b=24},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_node("moonrealm:moonsoil", {
	description = "Moonsoil",
	tiles = {"moonrealm_soil.png"},
	groups = {crumbly=3, falling_node=1},
	drop = "moonrealm:dust",
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("moonrealm:airlock", {
	description = "Airlock",
	tiles = {"moonrealm_airlock.png"},
	light_source = 14,
	walkable = false,
	post_effect_color = {a=255, r=0, g=0, b=0},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moonrealm:glass", {
	description = "Moonglass",
	drawtype = "glasslike",
	tiles = {"moonrealm_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("moonrealm:sapling", {
	description = "MR Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling.png"},
	inventory_image = "default_sapling.png",
	wield_image = "default_sapling.png",
	paramtype = "light",
	walkable = false,
	groups = {snappy=2,dig_immediate=3,flammable=2},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("moonrealm:leaves", {
	description = "MR Leaves",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"default_leaves.png"},
	paramtype = "light",
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{items = {"moonrealm:sapling"},rarity = 20,},
			{items = {"moonrealm:leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("moonrealm:stonebrick", {
	description = "Moonstone Brick",
	tiles = {"moonrealm_stonebricktop.png", "moonrealm_stonebrickbot.png", "moonrealm_stonebrick.png"},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moonrealm:stoneslab", {
	description = "Moonstone Slab",
	tiles = {"moonrealm_stonebricktop.png", "moonrealm_stonebrickbot.png", "moonrealm_stonebrick.png"},
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	buildable_to = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5}
		},
	},
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moonrealm:stonestair", {
	description = "Moonstone Stair",
	tiles = {"moonrealm_stonebricktop.png", "moonrealm_stonebrickbot.png", "moonrealm_stonebrick.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

-- Items

minetest.register_craftitem("moonrealm:spacesuit", {
	description = "MR Spacesuit",
	inventory_image = "moonrealm_spacesuit.png",
	--groups = {not_in_creative_inventory=1},
})

-- Crafting

minetest.register_craft({
    output = "moonrealm:airgen",
    recipe = {
        {"default:steel_ingot", "moonrealm:waterice", "default:steel_ingot"},
        {"moonrealm:waterice", "", "moonrealm:waterice"},
        {"default:steel_ingot", "moonrealm:waterice", "default:steel_ingot"},
    },
})

minetest.register_craft({
	output = "default:water_source",
	recipe = {
		{"moonrealm:waterice"},
	},
})

minetest.register_craft({
    output = "moonrealm:hlsource",
    recipe = {
        {"moonrealm:leaves", "moonrealm:leaves", "moonrealm:leaves"},
        {"moonrealm:leaves", "moonrealm:waterice", "moonrealm:leaves"},
        {"moonrealm:leaves", "moonrealm:leaves", "moonrealm:leaves"},
    },
})

minetest.register_craft({
	output = "moonrealm:stonebrick 4",
	recipe = {
		{"moonrealm:stone", "moonrealm:stone"},
		{"moonrealm:stone", "moonrealm:stone"},
	}
})

minetest.register_craft({
	output = "moonrealm:stonestair 4",
	recipe = {
		{"moonrealm:stone", ""},
		{"moonrealm:stone", "moonrealm:stone"},
	}
})

minetest.register_craft({
    output = "moonrealm:airlock",
    recipe = {
        {"default:steel_ingot", "", "default:steel_ingot"},
        {"default:steel_ingot", "", "default:steel_ingot"},
        {"default:steel_ingot", "", "default:steel_ingot"},
    },
})

minetest.register_craft({
    output = "default:furnace",
    recipe = {
        {"moonrealm:stone", "moonrealm:stone", "moonrealm:stone"},
        {"moonrealm:stone", "", "moonrealm:stone"},
        {"moonrealm:stone", "moonrealm:stone", "moonrealm:stone"},
    },
})

minetest.register_craft({
	output = "moonrealm:stoneslab 4",
	recipe = {
		{"moonrealm:stone", "moonrealm:stone"},
	}
})

-- Cooking

minetest.register_craft({
	type = "cooking",
	output = "moonrealm:glass",
	recipe = "moonrealm:dust",
})