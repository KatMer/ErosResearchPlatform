/obj/item/clothing/suit/storage
	var/obj/item/weapon/storage/internal/pockets

/obj/item/clothing/suit/storage/New()
	..()
	pockets = new/obj/item/weapon/storage/internal(src)
	pockets.max_w_class = 2		//fit only pocket sized items
	pockets.max_storage_space = 4

/obj/item/clothing/suit/storage/Destroy()
	qdel(pockets)
	pockets = null
	..()

/obj/item/clothing/suit/storage/attack_hand(mob/user as mob)
	if (pockets.handle_attack_hand(user))
		..(user)

/obj/item/clothing/suit/storage/MouseDrop(obj/over_object as obj)
	if (pockets.handle_mousedrop(usr, over_object))
		..(over_object)

/obj/item/clothing/suit/storage/attackby(obj/item/W as obj, mob/user as mob)
	..()
	pockets.attackby(W, user)

/obj/item/clothing/suit/storage/emp_act(severity)
	pockets.emp_act(severity)
	..()

//Jackets with buttons, used for labcoats, IA jackets, First Responder jackets, and brown jackets.
/obj/item/clothing/suit/storage/toggle
	hide_boobs = 0 //Used to see if it hides breasts  or not.
	hide_genitals = 0 //Used to see if it hides genitals or not.
	var/icon_open
	var/icon_closed
	verb/toggle()
		set name = "Toggle Coat Buttons"
		set category = "Object"
		set src in usr
		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		if(icon_state == icon_open) //Will check whether icon state is currently set to the "open" or "closed" state and switch it around with a message to the user
			icon_state = icon_closed
			hide_boobs = 1 //Used to see if it hides breasts  or not.
			usr << "You button up the coat."
		else if(icon_state == icon_closed)
			icon_state = icon_open
			hide_boobs = 0 //Used to see if it hides breasts  or not.
			usr << "You unbutton the coat."
		else //in case some goofy admin switches icon states around without switching the icon_open or icon_closed
			usr << "You attempt to button-up the velcro on your [src], before promptly realising how silly you are."
			return
		update_clothing_icon()	//so our overlays update

/obj/item/clothing/suit/storage/track
	hide_boobs = 1 //Used to see if it hides breasts  or not.
	hide_genitals = 0 //Used to see if it hides genitals or not.
	var/icon_open = "trackjacket_open"
	var/icon_closed = "trackjacket"
	verb/toggle()
		set name = "Toggle Coat Buttons"
		set category = "Object"
		set src in usr
		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		if(icon_state == icon_open) //Will check whether icon state is currently set to the "open" or "closed" state and switch it around with a message to the user
			icon_state = icon_closed
			usr << "You button up the coat."
		else if(icon_state == icon_closed)
			icon_state = icon_open
			usr << "You unbutton the coat."
		else //in case some goofy admin switches icon states around without switching the icon_open or icon_closed
			usr << "You attempt to button-up the velcro on your [src], before promptly realising how silly you are."
			return
		update_clothing_icon()	//so our overlays update

/obj/item/clothing/suit/storage/hooded/toggle
	var/icon_open
	var/icon_closed
	verb/toggle()
		set name = "Toggle Coat Buttons"
		set category = "Object"
		set src in usr
		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		if(icon_state == icon_open) //Will check whether icon state is currently set to the "open" or "closed" state and switch it around with a message to the user
			icon_state = icon_closed
			usr << "You button up the coat."
		else if(icon_state == icon_closed)
			icon_state = icon_open
			usr << "You unbutton the coat."
		else //in case some goofy admin switches icon states around without switching the icon_open or icon_closed
			usr << "You attempt to button-up the velcro on your [src], before promptly realising how silly you are."
			return
		update_clothing_icon()	//so our overlays update


//New Vest 4 pocket storage and badge toggles, until suit accessories are a thing.
/obj/item/clothing/suit/storage/vest/heavy/New()
	..()
	pockets = new/obj/item/weapon/storage/internal(src)
	pockets.max_w_class = 2
	pockets.max_storage_space = 8

/obj/item/clothing/suit/storage/vest
	var/icon_badge
	var/icon_nobadge
	verb/toggle()
		set name ="Adjust Badge"
		set category = "Object"
		set src in usr
		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		if(icon_state == icon_badge)
			icon_state = icon_nobadge
			usr << "You conceal \the [src]'s badge."
		else if(icon_state == icon_nobadge)
			icon_state = icon_badge
			usr << "You reveal \the [src]'s badge."
		else
			usr << "\The [src] does not have a badge."
			return
		update_clothing_icon()

