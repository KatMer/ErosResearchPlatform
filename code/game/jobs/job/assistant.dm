/datum/job/assistant
	title = "Assistant"
	flag = ASSISTANT
	department = "Civilian"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#515151"
	economic_modifier = 1
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	alt_titles = list("Technical Assistant","Medical Intern","Research Assistant","Security Cadet","Visitor","Resident","Colonist")

/datum/job/assistant/equip(var/mob/living/carbon/human/H, var/alt_title)
	if(!H)	return 0
	switch(H.backbag)
		if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(H), slot_back)
		if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel/norm(H), slot_back)
		if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
	if(has_alt_title(H, alt_title,"Visitor")) //I doubt someone visiting the station would want to wear an ugly grey uniform
		H.equip_to_slot_or_del(new /obj/item/clothing/under/assistantformal(H), slot_w_uniform)
	else if(has_alt_title(H, alt_title,"Resident"))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/color/white(H), slot_w_uniform)
	else if(has_alt_title(H, alt_title,"Security Cadet"))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/seccadet(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
	else if(has_alt_title(H, alt_title,"Technical Assistant"))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/techassist(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/workboots(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/techassist(H), slot_head)
	else if(has_alt_title(H, alt_title,"Medical Intern"))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/medintern(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(H), slot_shoes)
	else if(has_alt_title(H, alt_title,"Research Assistant"))
		H.equip_to_slot_or_del(new /obj/item/clothing/under/sciassist(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/white(H), slot_shoes)
	else if(has_alt_title(H, alt_title,"Colonist"))
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/brown(H), slot_shoes)
		if(prob(33))
			H.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/colonist2(H), slot_w_uniform)
		if(prob(33))
			H.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/colonist3(H), slot_w_uniform)
		else
			H.equip_to_slot_or_del(new /obj/item/clothing/under/colonist(H), slot_w_uniform)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/color/grey(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
	return 1

/datum/job/assistant/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()
