GLOBAL_LIST_INIT(low_security, list(
	/mob/living/simple_animal/hostile/limbus_abno/scorched_girl,
	/mob/living/simple_animal/hostile/limbus_abno/pisc_mermaid,
	/mob/living/simple_animal/hostile/limbus_abno/laetitia,
	/mob/living/simple_animal/hostile/limbus_abno/simple_smile
))

GLOBAL_LIST_INIT(high_security, list(
	/mob/living/simple_animal/hostile/limbus_abno/mountain,
	/mob/living/simple_animal/hostile/limbus_abno/queen_bee
))

/obj/effect/landmark/limbus_abnospawn
	name = "Limbus abno spawner"
	desc = "It spawns a limbus abno. Notify a coder. Thanks!"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x4"

//Split into Lowsec and Highsec
/obj/effect/landmark/limbus_abnospawn/lowsec
	name = "lowsec limbus abno spawner"
	icon_state = "x3"

/obj/effect/landmark/limbus_abnospawn/lowsec/Initialize()
	..()
	var/spawning = pick_n_take(GLOB.low_security)
	if(!isnull(spawning))
		new spawning(get_turf(src))
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/limbus_abnospawn/highsec
	name = "highsec limbus abno spawner"
	icon_state = "x2"

/obj/effect/landmark/limbus_abnospawn/highsec/Initialize()
	..()
	var/spawning = pick_n_take(GLOB.high_security)
	if(!isnull(spawning))
		new spawning(get_turf(src))
	return INITIALIZE_HINT_QDEL

