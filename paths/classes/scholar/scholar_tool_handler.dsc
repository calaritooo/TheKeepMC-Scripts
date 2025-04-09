#ALL ITEMS SHOULD HAVE A UNIQUE FOUR-DIGIT CUSTOM MODEL DATA ID BEGINNING WITH FIFTEEN (15).
#LATEST CUSTOM MODEL DATA NUMBER -> 15003
#

scholar_panflute_wand:
    type: item
    material: stick
    display name: <&e>Panflute
    flags:
        wand_level: 2
    lore:
        - <&7><&o>A musical device capable of so much more...
        - <empty>
        - <&7><&o>Right click to enter casting mode.
        - <&7><&o>Left click to cast a spell.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 15106
        hides: ALL

scholar_harp_wand:
    type: item
    material: stick
    display name: <&6>Harp
    flags:
        wand_level: 2
    lore:
        - <&7><&o>INSERT QUOTE HERE
        - <&7><&o>
        - <empty>
        - <&7><&o>Right click to enter casting mode.
        - <&7><&o>Left click to cast a spell.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 15105
        hides: ALL

scholar_novice_wand:
    type: item
    material: stick
    display name: <&color[#637AEE]>Novice's Wand
    flags:
        wand_level: 1
    lore:
        - <&7><&o>A simple training wand for
        - <&7><&o>novice spellcasters.
        - <empty>
        - <&7><&o>Right click to enter casting mode.
        - <&7><&o>Left click to cast a spell.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 15100
        hides: ALL

scholar_wand_handler:
    type: world
    debug: false
    events:
        on player right clicks block with:*_wand flagged:classes.scholar:
        - ratelimit <player> 0.1s
        - if <player.held_item_slot> = 9:
            - if !<player.has_flag[scholar_weapon_active]>:
                - if <player.has_flag[classes.scholar.qb_skills]> && <player.flag[classes.scholar.qb_skills].any>:
                    - playsound sound:item.book.page_turn <player.location>
                    - flag <player> scholar_weapon_active
                    - run save_inventory_script
                    - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<player.flag[scholar_wand_data_f]>
                    - define scholar_wand_slot <player.held_item_slot>
                    - repeat 8 as:hotbar_slot:
                        - inventory set slot:<[hotbar_slot]> o:air
                    - define hotbar <player.inventory.find_empty_slots.get[1].to[8]>
                    - foreach <[hotbar]> as:slot:
                        - if !<player.flag[classes.scholar.qb_skills].contains[<[slot]>]>:
                            - inventory set d:<player.inventory> slot:<[slot]> o:air
                        - else:
                            - inventory set d:<player.inventory> slot:<[slot]> o:<item[scholar_skill_gui_<player.flag[classes.scholar.qb_skills].get[<[slot]>]>]>
                - else:
                    - actionbar targets:<player> "<&c>You do not have any spells assigned to your wand!"
                    - stop
            - else if <player.has_flag[scholar_weapon_active]>:
                - playsound sound:item.book.page_turn <player.location>
                - flag <player> active_skill:!
                - flag <player> scholar_weapon_active:!
                - flag <player> entire_inv:!
                - run restore_inventory_script
            - else:
                - actionbar targets:<player> "<&c>Error! Contact an administrator."
        - else:
            - actionbar targets:<player> "<&c>You must have your wand in the final slot!"
        on player swaps items main:AIR offhand:air flagged:absynthe:
        - ratelimit <player> 0.1s
        - if <player.held_item_slot> = 9:
            - if !<player.has_flag[scholar_weapon_active]>:
                - if <player.flag[classes.scholar.qb_skills].any>:
                    - playsound sound:item.book.page_turn <player.location>
                    - flag <player> scholar_weapon_active
                    - run save_inventory_script
                    - inventory set d:<player.inventory> slot:<player.held_item_slot> o:<player.flag[scholar_wand_data_f]>
                    - define scholar_wand_slot <player.held_item_slot>
                    - repeat 8 as:hotbar_slot:
                        - inventory set slot:<[hotbar_slot]> o:air
                    - define hotbar <player.inventory.find_empty_slots.get[1].to[8]>
                    - foreach <[hotbar]> as:slot:
                        - if !<player.flag[classes.scholar.qb_skills].contains[<[slot]>]>:
                            - inventory set d:<player.inventory> slot:<[slot]> o:air
                        - else:
                            - inventory set d:<player.inventory> slot:<[slot]> o:<item[scholar_skill_gui_<player.flag[classes.scholar.qb_skills].get[<[slot]>]>]>
                - else:
                    - actionbar targets:<player> "<&c>You do not have any spells assigned to your wand!"
                    - stop
            - else if <player.has_flag[scholar_weapon_active]>:
                - playsound sound:item.book.page_turn <player.location>
                - flag <player> active_skill:!
                - flag <player> scholar_weapon_active:!
                - run restore_inventory_script
            - else:
                - actionbar targets:<player> "<&c>Error! Contact an administrator."
        - else:
            - actionbar targets:<player> "<&c>You must have your wand in the final slot!"
        on player scrolls their hotbar flagged:scholar_weapon_active:
        - determine passively cancelled
        - define active_skill_item <player.inventory.list_contents.get[<context.new_slot>].if_null[null]>
        - if <[active_skill_item]> == null || <[active_skill_item]> matches air:
            - stop
        - else:
            - define active_skill_display <[active_skill_item].display>
            - define active_skill <[active_skill_item].script.name.after[scholar_skill_gui_]>
            - actionbar targets:<player> "<&color[#637AEE]>Active Spell: <[active_skill_display]>"
            - flag <player> active_skill:<[active_skill]>
        on player left clicks block flagged:scholar_weapon_active:
        - ratelimit <player> 0.1s
        - if ( <player.location.in_region> && !<player.worldguard.test_flag[pvp]> ) || ( <player.location.world.name> != world && !<player.location.towny_allows_pvp> ):
            - if <player.flag[active_skill]> !in <script[scholar_skill_permissions].data_key[unprotected_skills]> && !<player.is_op>:
                - actionbar targets:<player> "<&c>You may not cast that spell here!"
                - stop
        - if <player.has_flag[active_skill]>:
            - if <player.has_flag[weapon_disarmed]>:
                - actionbar targets:<player> "<&6>You're temporarily disarmed!"
                - stop
            - else:
                - run scholar_skill_<player.flag[active_skill]>_script
                - stop
        - else if !<player.has_flag[scholar_weapon_active]>:
            - actionbar targets:<player> "<&c>You must be in casting mode!"
        - else if !<player.has_flag[active_skill]>:
            - actionbar targets:<player> "<&c>You must select a spell!"
        on player clicks in inventory flagged:scholar_weapon_active:
        - determine cancelled
        on player drops item flagged:scholar_weapon_active:
        - determine passively cancelled
        - actionbar targets:<player> "<&c>You can not drop this while in casting mode!"
        on player picks up item flagged:scholar_weapon_active:
        - determine cancelled
        on player dies flagged:classes.scholar:
        - if <player.has_flag[scholar_weapon_active]>:
            - determine passively <player.flag[no_soulbound_inv]>
            - flag <player> no_soulbound_inv:!
            - flag <player> active_skill:!
            - flag <player> scholar_weapon_active:!
            - flag <player> entire_inv:!
        - else:
            - determine <player.inventory.exclude_item[item_flagged:soulbound].list_contents>
        on player picks up launched arrow flagged:scholar_weapon_active:
        - determine cancelled
        on player breaks block flagged:scholar_weapon_active:
        - determine cancelled
        on player swaps items flagged:scholar_weapon_active:
        - determine cancelled
        on player takes item flagged:scholar_weapon_active:
        - determine cancelled

save_inventory_script:
    type: task
    debug: false
    script:
    - define og_hotbar <player.inventory.list_contents.get[1].to[8]>
    - define og_inv <player.inventory.list_contents>
    - define og_inv_no_soulbound <player.inventory.exclude_item[item_flagged:soulbound].list_contents>
    - define scholar_wand_slot <player.held_item_slot>
    - define scholar_wand_data <player.item_in_hand>
    - flag <player> entire_inv:<[og_inv]>
    - flag <player> no_soulbound_inv:<[og_inv_no_soulbound]>
    - flag <player> scholar_wand_slot_#:<[scholar_wand_slot]>
    - flag <player> scholar_wand_data_f:<[scholar_wand_data]>
    - flag <player> hotbar_contents:<[og_hotbar]>

restore_inventory_script:
    type: task
    debug: false
    script:
    - repeat 8 as:new_slot:
        - inventory set d:<player.inventory> slot:<[new_slot]> o:air
    - define scholar_wand_slot <player.flag[scholar_wand_slot_#]>
    - define scholar_wand_data <player.flag[scholar_wand_data_f]>
    - inventory set d:<player.inventory> slot:<player.flag[scholar_wand_slot_#]> o:<player.flag[scholar_wand_data_f]>
    - define hotbar_contents <player.flag[hotbar_contents]>
    - repeat <[hotbar_contents].size> as:slot:
        - define item <[hotbar_contents].get[<[slot]>]>
        - if <[item]> != air:
            - inventory set slot:<[slot]> o:<[item]>
    - flag <player> scholar_wand_data_f:!
    - flag <player> scholar_wand_slot_#:!
    - flag <player> hotbar_contents:!
    - flag <player> entire_inv:!

scholar_novice_spellbook:
    type: item
    material: stick
    display name: <&color[#637AEE]>Novice's Spellbook
    flags:
        spellbook_level: 1
    lore:
        - <&7><&o>A simple spellbook for
        - <&7><&o>novice spellcasters.
        - <empty>
        - <&7><&o>Right click to manage your spells.
        - <&7><&o>Assign spells to the bottom row to
        - <&7><&o>modify your wand's hotbar.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 15200
        hides: ALL

scholar_spellbook_handler:
    type: world
    debug: false
    events:
        on player right clicks block with:*_spellbook:
        - ratelimit <player> 2s
        - if !<player.has_flag[classes.scholar]>:
            - actionbar targets:<player> "<&6>You can't seem to decipher the words in this book..."
            - stop
        - if <player.has_flag[classes.scholar.skills]>:
            - define learned_spells <player.flag[classes.scholar.skills]>
            - foreach <[learned_spells]> key:spell:
                - flag <player> cat_spells.<script[scholar_skill_data].data_key[<[spell]>].deep_get[type]>:->:<[spell]>
            - playsound sound:entity.villager.work_cartographer <player.location>
            - inventory open d:scholar_spellbook_inventory
            - inventory update
        - else:
            - actionbar targets:<player> "<&6>You have not yet learned any spells!"
            - stop
        on player number_key clicks in scholar_spellbook_inventory:
        - define spells <player.flag[classes.scholar.qb_skills]>
        - if <context.slot> != 1 && <context.slot> != 4 && <context.slot> != 7 && <context.slot> != 54 && <context.slot> < 46 && <[spells].values> !contains <context.item.script.name.after[scholar_skill_gui_]> && <context.hotbar_button> != 9 && <context.hotbar_button> != 0:
            - define slot_number <context.hotbar_button>
            - flag <player> classes.scholar.qb_skills.<[slot_number]>:<context.item.script.name.after[scholar_skill_gui_]>
            - inventory set d:<context.inventory> slot:<[slot_number].add[45]> o:<context.item>
            - inventory update
        - else if <[spells].values> contains <context.item.script.name.after[scholar_skill_gui_]>:
            - actionbar targets:<player> "<&c>This spell is already assigned! Remove it from the spellbar to reassign it."
        - else if <context.hotbar_button> == 9:
            - actionbar targets:<player> "<&c>You may not assign a spell to your wand slot!"
        - else:
            - stop
        on player left|right clicks in scholar_spellbook_inventory:
        - if <context.slot> >= 46 && <context.slot> < 54:
            - flag <player> classes.scholar.qb_skills.<context.slot.sub[45]>:!
            - inventory set d:<context.inventory> slot:<context.slot> o:empty_wand_slot
            - inventory update
        - else if <context.slot> != 54 && <context.slot> < 46:
            - actionbar targets:<player> "<&c>Hover over a spell and use your number keys to assign it a wand slot!"
        on player closes scholar_spellbook_inventory:
        - flag <player> cat_spells:!

scholar_spellbook_inventory:
    type: inventory
    inventory: chest
    title: <&color[#637AEE]>Novice's Spellbook
    size: 54
    gui: true
    slots:
    - [spb_a_cat] [air] [air] [spb_d_cat] [air] [air] [spb_u_cat] [air] [air]
    - [<proc[spb_a_1]>] [<proc[spb_a_5]>] [<proc[spb_a_9]>] [<proc[spb_d_1]>] [<proc[spb_d_5]>] [<proc[spb_d_9]>] [<proc[spb_u_1]>] [<proc[spb_u_5]>] [<proc[spb_u_9]>]
    - [<proc[spb_a_2]>] [<proc[spb_a_6]>] [<proc[spb_a_10]>] [<proc[spb_d_2]>] [<proc[spb_d_6]>] [<proc[spb_d_10]>] [<proc[spb_u_2]>] [<proc[spb_u_6]>] [<proc[spb_u_10]>]
    - [<proc[spb_a_3]>] [<proc[spb_a_7]>] [<proc[spb_a_11]>] [<proc[spb_d_3]>] [<proc[spb_d_7]>] [<proc[spb_d_11]>] [<proc[spb_u_3]>] [<proc[spb_u_7]>] [<proc[spb_u_11]>]
    - [<proc[spb_a_4]>] [<proc[spb_a_8]>] [<proc[spb_a_12]>] [<proc[spb_d_4]>] [<proc[spb_d_8]>] [<proc[spb_d_12]>] [<proc[spb_u_4]>] [<proc[spb_u_8]>] [<proc[spb_u_12]>]
    - [<proc[spb_qb_1]>] [<proc[spb_qb_2]>] [<proc[spb_qb_3]>] [<proc[spb_qb_4]>] [<proc[spb_qb_5]>] [<proc[spb_qb_6]>] [<proc[spb_qb_7]>] [<proc[spb_qb_8]>] [close_button]

scholar_spell_permissions:
    type: data
    unprotected_spells:
        - renovatio
        - maltempo
        - beltempo
        - nullus
        - remedia_totaeus