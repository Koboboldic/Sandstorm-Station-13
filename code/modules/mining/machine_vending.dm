/**********************Mining Equipment Vendor**************************/

/obj/machinery/mineral/equipment_vendor
	name = "mining equipment vendor"
	desc = "An equipment vendor for miners, points collected at an ore redemption machine can be spent here."
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "mining"
	density = TRUE
	circuit = /obj/item/circuitboard/machine/mining_equipment_vendor
	var/icon_deny = "mining-deny"
	var/obj/item/card/id/inserted_id
	var/list/prize_list = list( //if you add something to this, please, for the love of god, sort it by price/type. use tabs and not spaces.
		new /datum/data/mining_equipment("1 Marker Beacon",				/obj/item/stack/marker_beacon,										10),
		new /datum/data/mining_equipment("10 Marker Beacons",			/obj/item/stack/marker_beacon/ten,									100),
		new /datum/data/mining_equipment("30 Marker Beacons",			/obj/item/stack/marker_beacon/thirty,								300),
		new /datum/data/mining_equipment("Whiskey",						/obj/item/reagent_containers/food/drinks/bottle/whiskey,			100),
		new /datum/data/mining_equipment("Absinthe",					/obj/item/reagent_containers/food/drinks/bottle/absinthe/premium,	100),
		new /datum/data/mining_equipment("Cigar",						/obj/item/clothing/mask/cigarette/cigar/havana,						150),
		new /datum/data/mining_equipment("Soap",						/obj/item/soap/nanotrasen,											200),
		new /datum/data/mining_equipment("Laser Pointer",				/obj/item/laser_pointer,											300),
		new /datum/data/mining_equipment("Alien Toy",					/obj/item/clothing/mask/facehugger/toy,								300),
		new /datum/data/mining_equipment("Stabilizing Serum",			/obj/item/hivelordstabilizer,										400),
		new /datum/data/mining_equipment("Fulton Beacon",				/obj/item/fulton_core,												400),
		new /datum/data/mining_equipment("Shelter Capsule",				/obj/item/survivalcapsule,											400),
		new /datum/data/mining_equipment("Survival Knife",				/obj/item/kitchen/knife/combat/survival,							450),
		new /datum/data/mining_equipment("GAR Meson Scanners",			/obj/item/clothing/glasses/meson/gar,								500),
		new /datum/data/mining_equipment("Explorer's Webbing",			/obj/item/storage/belt/mining,										500),
		new /datum/data/mining_equipment("Larger Ore Bag",				/obj/item/storage/bag/ore/large,									500),
		new /datum/data/mining_equipment("Mining Point Transfer Card", 	/obj/item/card/mining_point_card,									500),
		new /datum/data/mining_equipment("Tracking Implant Kit", 		/obj/item/storage/box/minertracker,									600),
		new /datum/data/mining_equipment("Jaunter",						/obj/item/wormhole_jaunter,											750),
		new /datum/data/mining_equipment("Kinetic Crusher",				/obj/item/kinetic_crusher,											750),
		new /datum/data/mining_equipment("Kinetic Accelerator",			/obj/item/gun/energy/kinetic_accelerator,							750),
		new /datum/data/mining_equipment("Survival Medipen",			/obj/item/reagent_containers/hypospray/medipen/survival,			750),
		new /datum/data/mining_equipment("Brute First-Aid Kit",			/obj/item/storage/firstaid/brute,									800),
		new /datum/data/mining_equipment("Burn First-Aid Kit",			/obj/item/storage/firstaid/fire,									800),
		new /datum/data/mining_equipment("First-Aid Kit",				/obj/item/storage/firstaid/regular,									800),
		new /datum/data/mining_equipment("Advanced Scanner",			/obj/item/t_scanner/adv_mining_scanner,								800),
		new /datum/data/mining_equipment("Resonator",					/obj/item/resonator,												800),
		new /datum/data/mining_equipment("Mini Extinguisher",			/obj/item/extinguisher/mini,										1000),
		new /datum/data/mining_equipment("Fulton Pack",					/obj/item/extraction_pack,											1000),
		new /datum/data/mining_equipment("Lazarus Injector",			/obj/item/lazarus_injector,											1000),
		new /datum/data/mining_equipment("Silver Pickaxe",				/obj/item/pickaxe/silver,											1000),
		new /datum/data/mining_equipment("Mining Conscription Kit",		/obj/item/storage/backpack/duffelbag/mining/conscript,				1000),
		new /datum/data/mining_equipment("Jetpack Upgrade",				/obj/item/tank/jetpack/suit,										2000),
		new /datum/data/mining_equipment("Space Cash",					/obj/item/stack/spacecash/c1000,									2000),
		new /datum/data/mining_equipment("Mining Hardsuit",				/obj/item/clothing/suit/space/hardsuit/mining,						2000),
		new /datum/data/mining_equipment("Diamond Pickaxe",				/obj/item/pickaxe/diamond,											2000),
		new /datum/data/mining_equipment("Spare Suit Voucher",			/obj/item/suit_voucher,												2000),
		new /datum/data/mining_equipment("Super Resonator",				/obj/item/resonator/upgraded,										2500),
		new /datum/data/mining_equipment("Jump Boots",					/obj/item/clothing/shoes/bhop,										2500),
		new /datum/data/mining_equipment("Ice hiking boots",            /obj/item/clothing/shoes/winterboots/ice_boots,				        2500),
		new /datum/data/mining_equipment("Luxury Shelter Capsule",		/obj/item/survivalcapsule/luxury,									3000),
		new /datum/data/mining_equipment("Luxury Bar Capsule",			/obj/item/survivalcapsule/luxury/elitebar,							10000),
		new /datum/data/mining_equipment("Empty Capsule",				/obj/item/survivalcapsule/luxury/empty,								5000),
		new /datum/data/mining_equipment("Penthouse Capsule",			/obj/item/survivalcapsule/luxury/penthouse,							7500),
		new /datum/data/mining_equipment("Garden & Kitchen Capsule",	/obj/item/survivalcapsule/luxury/garden,							7500),
		new /datum/data/mining_equipment("Nanotrasen Minebot",			/mob/living/simple_animal/hostile/mining_drone,						800),
		new /datum/data/mining_equipment("Minebot Melee Upgrade",		/obj/item/mine_bot_upgrade,											400),
		new /datum/data/mining_equipment("Minebot Armor Upgrade",		/obj/item/mine_bot_upgrade/health,									400),
		new /datum/data/mining_equipment("Minebot Cooldown Upgrade",	/obj/item/borg/upgrade/modkit/cooldown/minebot,						600),
		new /datum/data/mining_equipment("Minebot AI Upgrade",			/obj/item/slimepotion/slime/sentience/mining,						1000),
		new /datum/data/mining_equipment("KA Minebot Passthrough",		/obj/item/borg/upgrade/modkit/minebot_passthrough,					100),
		new /datum/data/mining_equipment("KA White Tracer Rounds",		/obj/item/borg/upgrade/modkit/tracer,								100),
		new /datum/data/mining_equipment("KA Adjustable Tracer Rounds",	/obj/item/borg/upgrade/modkit/tracer/adjustable,					150),
		new /datum/data/mining_equipment("KA Super Chassis",			/obj/item/borg/upgrade/modkit/chassis_mod,							250),
		new /datum/data/mining_equipment("KA Hyper Chassis",			/obj/item/borg/upgrade/modkit/chassis_mod/orange,					300),
		new /datum/data/mining_equipment("KA Range Increase",			/obj/item/borg/upgrade/modkit/range,								1000),
		new /datum/data/mining_equipment("KA Damage Increase",			/obj/item/borg/upgrade/modkit/damage,								1000),
		new /datum/data/mining_equipment("KA Cooldown Decrease",		/obj/item/borg/upgrade/modkit/cooldown,								1000),
		new /datum/data/mining_equipment("KA AoE Damage",				/obj/item/borg/upgrade/modkit/aoe/mobs,								2000),
		new /datum/data/mining_equipment("Miner Full Replacement",		/obj/item/storage/backpack/duffelbag/mining/cloned,					3000),
		new /datum/data/mining_equipment("Premium Accelerator",			/obj/item/gun/energy/kinetic_accelerator/premiumka,					8000),
		new /datum/data/mining_equipment("Premium Kinetic Melee Kit",	/obj/item/storage/backpack/duffelbag/mining/glaivekit,				2250),
		new /datum/data/mining_equipment("Survival Dagger",				/obj/item/kitchen/knife/combat/survival/knuckledagger,				550),
		new /datum/data/mining_equipment("Premium KA borg Upgrade",		/obj/item/borg/upgrade/premiumka,									8000),
		new /datum/data/mining_equipment("Kinetic Destroyer",			/obj/item/kinetic_crusher/premiumcrusher,							12000), //boop
		)

/datum/data/mining_equipment
	var/equipment_name = "generic"
	var/equipment_path = null
	var/cost = 0

/datum/data/mining_equipment/New(name, path, cost)
	src.equipment_name = name
	src.equipment_path = path
	src.cost = cost

/obj/machinery/mineral/equipment_vendor/Initialize(mapload)
	. = ..()
	build_inventory()

/obj/machinery/mineral/equipment_vendor/proc/build_inventory()
	for(var/p in prize_list)
		var/datum/data/mining_equipment/M = p
		GLOB.vending_products[M.equipment_path] = 1

/obj/machinery/mineral/equipment_vendor/update_icon_state()
	if(powered())
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-off"

/obj/machinery/mineral/equipment_vendor/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/spritesheet/vending),
	)

/obj/machinery/mineral/equipment_vendor/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MiningVendor", name)
		ui.open()

/obj/machinery/mineral/equipment_vendor/ui_static_data(mob/user)
	. = list()
	.["product_records"] = list()
	for(var/datum/data/mining_equipment/prize in prize_list)
		var/list/product_data = list(
			path = replacetext(replacetext("[prize.equipment_path]", "/obj/item/", ""), "/", "-"),
			name = prize.equipment_name,
			price = prize.cost,
			ref = REF(prize)
		)
		.["product_records"] += list(product_data)

/obj/machinery/mineral/equipment_vendor/ui_data(mob/user)
	. = list()
	var/mob/living/carbon/human/H
	var/obj/item/card/id/C
	if(ishuman(user) || iscyborg(user))
		H = user
		C = H.get_idcard(TRUE)
		if(C)
			.["user"] = list()
			.["user"]["points"] = C.mining_points
			if(C.registered_account)
				.["user"]["name"] = C.registered_account.account_holder
				if(C.registered_account.account_job)
					.["user"]["job"] = C.registered_account.account_job.title
				else
					.["user"]["job"] = "No Job"

/obj/machinery/mineral/equipment_vendor/ui_act(action, params)
	if(..())
		return

	switch(action)
		if("purchase")
			var/mob/M = usr
			var/obj/item/card/id/I = M.get_idcard(TRUE)
			if(!istype(I))
				to_chat(usr, "<span class='alert'>Error: An ID is required!</span>")
				flick(icon_deny, src)
				return
			var/datum/data/mining_equipment/prize = locate(params["ref"]) in prize_list
			if(!prize || !(prize in prize_list))
				to_chat(usr, "<span class='alert'>Error: Invalid choice!</span>")
				flick(icon_deny, src)
				return
			if(prize.cost > I.mining_points)
				to_chat(usr, "<span class='alert'>Error: Insufficient points for [prize.equipment_name] on [I]!</span>")
				flick(icon_deny, src)
				return
			I.mining_points -= prize.cost
			to_chat(usr, "<span class='notice'>[src] clanks to life briefly before vending [prize.equipment_name]!</span>")
			playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
			new prize.equipment_path(loc)
			SSblackbox.record_feedback("nested tally", "mining_equipment_bought", 1, list("[type]", "[prize.equipment_path]"))
			. = TRUE

/obj/machinery/mineral/equipment_vendor/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/mining_voucher))
		RedeemVoucher(I, user)
		return
	if(default_deconstruction_screwdriver(user, "mining-open", "mining", I))
		return
	if(default_deconstruction_crowbar(I))
		return
	return ..()

/obj/machinery/mineral/equipment_vendor/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/mining_voucher))
		RedeemVoucher(I, user)
		return
	if(istype(I, /obj/item/suit_voucher))
		RedeemSVoucher(I, user)
		return
	if(istype(I, /obj/item/premium_crusher_voucher))
		RedeemPCVoucher(I, user)
		return
	if(default_deconstruction_screwdriver(user, "mining-open", "mining", I))
		updateUsrDialog()
		return
	if(default_deconstruction_crowbar(I))
		return
	return ..()

/obj/machinery/mineral/equipment_vendor/proc/RedeemVoucher(obj/item/mining_voucher/voucher, mob/redeemer)
	var/items = list(	"Survival Capsule and Explorer's Webbing" = image(icon = 'icons/obj/storage.dmi', icon_state = "explorerpack"),
						"Resonator Kit" = image(icon = 'icons/obj/mining.dmi', icon_state = "resonator"),
						"Minebot Kit" = image(icon = 'icons/mob/aibots.dmi', icon_state = "mining_drone"),
						"Extraction and Rescue Kit" = image(icon = 'icons/obj/fulton.dmi', icon_state = "extraction_pack"),
						"Crusher Kit" = image(icon = 'icons/obj/mining.dmi', icon_state = "crusher"),
						"Mining Conscription Kit" = image(icon = 'icons/obj/storage.dmi', icon_state = "duffel"))

	var/selection = show_radial_menu(redeemer, src, items, require_near = TRUE, tooltips = TRUE)
	if(!selection || !Adjacent(redeemer) || QDELETED(voucher) || voucher.loc != redeemer)
		return
	var/drop_location = drop_location()
	switch(selection)
		if("Survival Capsule and Explorer's Webbing")
			new /obj/item/storage/belt/mining/vendor(drop_location)
		if("Resonator Kit")
			new /obj/item/extinguisher/mini(drop_location)
			new /obj/item/resonator(drop_location)
		if("Minebot Kit")
			new /mob/living/simple_animal/hostile/mining_drone(drop_location)
			new /obj/item/weldingtool/hugetank(drop_location)
			new /obj/item/clothing/head/welding(drop_location)
			new /obj/item/borg/upgrade/modkit/minebot_passthrough(drop_location)
		if("Extraction and Rescue Kit")
			new /obj/item/extraction_pack(drop_location)
			new /obj/item/fulton_core(drop_location)
			new /obj/item/stack/marker_beacon/thirty(drop_location)
		if("Crusher Kit")
			new /obj/item/extinguisher/mini(drop_location)
			new /obj/item/kinetic_crusher(drop_location)
		if("Mining Conscription Kit")
			new /obj/item/storage/backpack/duffelbag/mining/conscript(drop_location)
	playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
	SSblackbox.record_feedback("tally", "mining_voucher_redeemed", 1, selection)
	qdel(voucher)

/obj/machinery/mineral/equipment_vendor/proc/RedeemSVoucher(obj/item/suit_voucher/voucher, mob/redeemer)
	var/items = list(	"Exo-suit" = image(icon = 'icons/obj/clothing/suits.dmi', icon_state = "exo"),
						"SEVA suit" = image(icon = 'icons/obj/clothing/suits.dmi', icon_state = "seva"))

	var/selection = show_radial_menu(redeemer, src, items, require_near = TRUE, tooltips = TRUE)
	if(!selection || !Adjacent(redeemer) || QDELETED(voucher) || voucher.loc != redeemer)
		return
	var/drop_location = drop_location()
	switch(selection)
		if("Exo-suit")
			new /obj/item/clothing/suit/hooded/explorer/exo(drop_location)
			new /obj/item/clothing/mask/gas/exo(drop_location)
		if("SEVA suit")
			new /obj/item/clothing/suit/hooded/explorer/seva(drop_location)
			new /obj/item/clothing/mask/gas/seva(drop_location)
	playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
	SSblackbox.record_feedback("tally", "suit_voucher_redeemed", 1, selection)
	qdel(voucher)

/obj/machinery/mineral/equipment_vendor/proc/RedeemPCVoucher(obj/item/premium_crusher_voucher/voucher, mob/redeemer) // someone should REALLY just refactor this
	var/items = list("Kinetic Glaive" = image(icon = 'icons/obj/mining.dmi', icon_state = "crusher-glaive"),
					"Kinetic Gauntlets" = image(icon = 'icons/obj/mining.dmi', icon_state = "crusher-hands"))

	var/selection = show_radial_menu(redeemer, src, items, require_near = TRUE, tooltips = TRUE)
	if(!selection || !Adjacent(redeemer) || QDELETED(voucher) || voucher.loc != redeemer)
		return
	var/drop_location = drop_location()
	switch(selection)
		if("Kinetic Glaive")
			new /obj/item/kinetic_crusher/glaive(drop_location)
		if("Kinetic Gauntlets")
			new /obj/item/kinetic_crusher/glaive/gauntlets(drop_location)
	playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
	SSblackbox.record_feedback("tally", "crusher_voucher_redeemed", 1, selection)
	qdel(voucher)

/obj/machinery/mineral/equipment_vendor/ex_act(severity, target, origin)
	do_sparks(5, TRUE, src)
	if(prob(50 / severity) && severity < 3)
		qdel(src)

/****************Golem Point Vendor**************************/

/obj/machinery/mineral/equipment_vendor/golem
	name = "golem ship equipment vendor"
	circuit = /obj/item/circuitboard/machine/mining_equipment_vendor/golem

/obj/machinery/mineral/equipment_vendor/golem/Initialize(mapload)
	. = ..()
	desc += "\nIt seems a few selections have been added."
	prize_list += list(
		new /datum/data/mining_equipment("Extra ID",       				/obj/item/card/id/mining, 				                   		250),
		new /datum/data/mining_equipment("Science Goggles",       		/obj/item/clothing/glasses/science,								250),
		new /datum/data/mining_equipment("Monkey Cube",					/obj/item/reagent_containers/food/snacks/cube/monkey,        	300),
		new /datum/data/mining_equipment("Toolbelt",					/obj/item/storage/belt/utility,	    							350),
		new /datum/data/mining_equipment("Royal Cape of the Liberator", /obj/item/bedsheet/rd/royal_cape, 								500),
		new /datum/data/mining_equipment("Grey Slime Extract",			/obj/item/slime_extract/grey,									1000),
		new /datum/data/mining_equipment("Modification Kit",    		/obj/item/borg/upgrade/modkit/trigger_guard,					1700),
		new /datum/data/mining_equipment("The Liberator's Legacy",  	/obj/item/storage/box/rndboards,								2000)
		)

/**********************Mining Equipment Vendor Items**************************/

/**********************Mining Equipment Voucher**********************/

/obj/item/mining_voucher
	name = "mining voucher"
	desc = "A token to redeem a piece of equipment. Use it on a mining equipment vendor."
	icon = 'icons/obj/mining.dmi'
	icon_state = "mining_voucher"
	w_class = WEIGHT_CLASS_TINY

/obj/item/suit_voucher
	name = "suit voucher"
	desc = "A token to redeem a new suit. Use it on a mining equipment vendor."
	icon = 'icons/obj/mining.dmi'
	icon_state = "mining_voucher"
	w_class = WEIGHT_CLASS_TINY

/obj/item/premium_crusher_voucher
	name = "premium crusher voucher"
	desc = "A token to redeem for a premium proto-kinetic melee weapon. Use it on a mining equipment vendor."
	icon = 'icons/obj/mining.dmi'
	icon_state = "mining_voucher"
	w_class = WEIGHT_CLASS_TINY

/**********************Mining Point Card**********************/
//mp = Miner Pointers
//c  =  Cash
//TODO add in cr = Credits for cargo
/obj/item/card/mining_point_card
	name = "mining points card"
	desc = "A small card for transferring mining points. Swipe your ID card over it to start the process."
	icon_state = "data_1"
	var/points = 500

/obj/item/card/mining_point_card/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/card/id))
		var/obj/item/card/id/id = I
		to_chat(user, span_info("You swipe [id] on [src] and start the transfer process."))
		var/choice = alert(user, "Do you want to transfer points to or from the point card's storage?", "Mining Points Transfer", "From Point Card/Storage", "To Point Card/Storage", "Cancel")
		if(choice != "Cancel")
			var/amount = input(user, "How much do you want to transfer? ID Balance: [id.mining_points], Transfer Card Balance: [points]", "Transfer Points") as num|null
			if(!amount || amount <= 0)
				return
			amount = round(amount, 1)
			if(choice == "To Point Card/Storage")
				if(amount && amount <= id.mining_points)
					id.mining_points -= amount
					points += amount
					to_chat(user, span_info("You transfer [amount] points to [src] from [id]."))
			else if(choice == "From Point Card/Storage")
				if(amount && amount <= points)
					id.mining_points += amount
					points -= amount
					to_chat(user, span_info("You transfer [amount] points to [id] from [src]."))
	/*
		if(points)
			var/obj/item/card/id/C = I
			C.mining_points += points
			to_chat(user, "<span class='info'>You transfer [points] points to [C].</span>")
			points = 0
		else
			to_chat(user, "<span class='info'>There's no points left on [src].</span>")
	*/
	..()

/obj/item/card/mining_point_card/examine(mob/user)
	. = ..()
	. += "There's [points] point\s on the card."

///Conscript kit
/obj/item/card/mining_access_card
	name = "mining access card"
	desc = "A small card, that when used on any ID, will add mining access."
	icon_state = "data_1"

/obj/item/card/mining_access_card/afterattack(atom/movable/AM, mob/user, proximity)
	. = ..()
	if(istype(AM, /obj/item/card/id) && proximity)
		var/obj/item/card/id/I = AM
		I.access |=	ACCESS_MINING
		I.access |= ACCESS_MINING_STATION
		I.access |= ACCESS_MINERAL_STOREROOM
		I.access |= ACCESS_CARGO
		to_chat(user, "You upgrade [I] with mining access.")
		qdel(src)

/obj/item/storage/backpack/duffelbag/mining/conscript
	name = "mining conscription kit"
	desc = "A kit containing everything a crewmember needs to support a shaft miner in the field."

/obj/item/storage/backpack/duffelbag/mining/conscript/PopulateContents()
	new /obj/item/pickaxe/mini(src)
	new /obj/item/clothing/glasses/meson(src)
	new /obj/item/t_scanner/adv_mining_scanner/lesser(src)
	new /obj/item/storage/bag/ore(src)
	new /obj/item/clothing/suit/hooded/explorer/standard(src)
	new /obj/item/encryptionkey/headset_cargo(src)
	new /obj/item/clothing/mask/gas/explorer(src)
	new /obj/item/card/mining_access_card(src)
	new /obj/item/gun/energy/kinetic_accelerator(src)
	new /obj/item/kitchen/knife/combat/survival(src)
	new /obj/item/flashlight/seclite(src)

	//CITADEL ADDITIONS BELOW

/obj/item/storage/backpack/duffelbag/mining/cloned
	name = "mining replacement kit"
	desc = "A large bag that has advanced tools and a spare jumpsuit, boots, and gloves for a newly cloned miner to get back in the field. Even has a new ID!"

/obj/item/storage/backpack/duffelbag/mining/cloned/PopulateContents()
	new /obj/item/pickaxe/mini(src)
	new /obj/item/clothing/under/rank/cargo/miner/lavaland(src)
	new /obj/item/clothing/shoes/workboots/mining(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/implanter/tracking/gps(src)
	new /obj/item/gun/energy/kinetic_accelerator(src)
	new /obj/item/kitchen/knife/combat/survival(src)
	new /obj/item/storage/firstaid/regular(src)
	new /obj/item/reagent_containers/hypospray/medipen/survival(src)
	new /obj/item/t_scanner/adv_mining_scanner(src)
	new /obj/item/clothing/suit/hooded/explorer/standard(src)
	new /obj/item/encryptionkey/headset_cargo(src)
	new /obj/item/clothing/mask/gas/explorer(src)
	new /obj/item/card/id/mining(src)
	new /obj/item/storage/bag/ore(src)
	new /obj/item/clothing/glasses/meson/prescription(src)

/obj/item/storage/backpack/duffelbag/mining/glaivekit

/obj/item/storage/backpack/duffelbag/mining/glaivekit/PopulateContents()
	new /obj/item/kitchen/knife/combat/survival/knuckledagger(src)
	new /obj/item/premium_crusher_voucher(src)
