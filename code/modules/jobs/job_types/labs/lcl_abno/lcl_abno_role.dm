/datum/job/limbus_specimen
	title = "LC Specimen"
	faction = "Station"
	selection_color = "#BB9999"
	total_positions = 5
	spawn_positions = 5
	departments = DEPARTMENT_SECURITY
	maptype = "limbus_labs"
	job_abbreviation = "LCS"

//Checks if any abnos are available for a latejoin
/datum/job/limbus_specimen/special_check_latejoin(client/C)
	for(var/mob/living/simple_animal/hostile/limbus_abno/lcl_abno in GLOB.mob_living_list)
		if(!lcl_abno.mind && !lcl_abno.ckey)
			return TRUE
	return FALSE

//This is absolute jank but it technically works. The job creates a human whose mind is promptly transfered to an abno before the human body is deleted.
/datum/job/limbus_specimen/equip(mob/living/carbon/human/H, visualsOnly, announce, latejoin, datum/outfit/outfit_override, client/preference_source = null)
	for(var/mob/living/simple_animal/hostile/limbus_abno/lcl_abno in GLOB.mob_living_list)
		if(!lcl_abno.mind && !lcl_abno.ckey)
			if(H?.mind) //If we don't do this, it throws a runtime everytime they setup a character.
				H.mind.transfer_to(lcl_abno)
				qdel(H)
			return lcl_abno

/datum/job/limbus_specimen/override_latejoin_spawn()
	return TRUE
