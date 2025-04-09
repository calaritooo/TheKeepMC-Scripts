shroud_axe_handler:
    type: world
    debug: true
    events:
        on player swaps items flagged:classes.shroud:
        - ratelimit <player> 0.1s
        - if <player.held_item_slot> = 9:
            - determine cancelled passively
            - if !<player.has_flag[shroud_weapon_active]> && !<player.flag[classes.shroud.skills].exclude[passives].is_empty>:
                - playsound sound:item.book.page_turn <player.location>
                - flag <player> shroud_weapon_active
                - run shroud_save_inventory_script
                - repeat 36 as:hotbar_slot:
                    - inventory set slot:<[hotbar_slot]> o:air
                - define shroud_weapon_slot <player.held_item_slot>
                - inventory set d:<player.inventory> slot:<[shroud_weapon_slot]> o:<player.flag[shroud_weapon_data_f]>
                - define base_# 9
                - define skills <player.flag[classes.shroud.skills].exclude[passives]>
                - foreach <[skills]> key:skill:
                    - inventory set slot:<[base_#].add[<[loop_index]>]> o:<item[shroud_skill_gui_<[skill]>]>
                - define hotbar <player.inventory.find_empty_slots.get[1].to[8]>
                - if !<player.has_flag[classes.shroud.qb_skills]> || <player.flag[classes.shroud.qb_skills].is_empty>:
                    - stop
                - if <player.has_flag[classes.shroud.qb_skills]> && <player.flag[classes.shroud.qb_skills].any>:
                    - foreach <[hotbar]> as:slot:
                        - if !<player.flag[classes.shroud.qb_skills].contains[<[slot]>]>:
                            - inventory set d:<player.inventory> slot:<[slot]> o:air
                        - else:
                            - inventory set d:<player.inventory> slot:<[slot]> o:<item[shroud_skill_gui_<player.flag[classes.shroud.qb_skills.<[slot]>]>]>
            - else if <player.has_flag[shroud_weapon_active]>:
                - playsound sound:item.book.page_turn <player.location>
                - run shroud_restore_inventory_script
                - flag <player> shroud_weapon_active:!
                - flag <player> entire_inv:!
            - else:
                - actionbar targets:<player> "<&6>You have not yet learned any skills!"
        - else:
            - stop
        on player scrolls their hotbar flagged:shroud_weapon_active:
        - determine passively cancelled
        - define active_skill_item <player.inventory.list_contents.get[<context.new_slot>].if_null[null]>
        - if <[active_skill_item]> == null || <[active_skill_item]> matches air:
            - stop
        - else:
            - define skill <[active_skill_item].script.name.after[shroud_skill_gui_]>
            - define skill_level <player.flag[classes.shroud.skills.<[skill]>]>
            - define cooldown_duration <script[shroud_skill_data].data_key[<[skill]>].deep_get[cooldown.<[skill_level]>]>
            - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[skill]>:
                - define cooldown_flag cooldowns.<[skill]>
                - define cooldown_remainder <player.flag_expiration[cooldowns.<[skill]>].from_now.formatted>
                - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
                - stop
            - flag <player> cooldowns.<[skill]> expire:<[cooldown_duration]>s
            - define active_skill_display <[active_skill_item].display>
            - if <script[shroud_skill_data].data_key[<[skill]>.type]> == activation:
                - actionbar targets:<player> "<&6>Active Skill: <[active_skill_display]>"
                - flag <player> active_skill:<[skill]> expire:<script[shroud_skill_data].data_key[<[skill]>].deep_get[time_to_use.<[skill_level]>]>
                - stop
            - else if <script[shroud_skill_data].data_key[<[skill]>.type]> == immediate:
                - run shroud_skill_<[skill]>_script
                - stop
            - else:
                - actionbar targets:<player> "<&c>Error! Contact a server administrator."
        on player drops item flagged:shroud_weapon_active:
        - determine passively cancelled
        - actionbar targets:<player> "<&c>You can not drop this while in skill mode!"
        on player picks up item flagged:shroud_weapon_active:
        - determine cancelled
        on player dies flagged:classes.shroud:
        - if <player.has_flag[shroud_weapon_active]>:
            - determine passively <player.flag[no_soulbound_inv]>
            - flag <player> no_soulbound_inv:!
            - flag <player> active_skill:!
            - flag <player> shroud_weapon_active:!
            - flag <player> entire_inv:!
        - else:
            - determine <player.inventory.exclude_item[item_flagged:soulbound].list_contents>
        on player picks up launched arrow flagged:shroud_weapon_active:
        - determine cancelled
        on player swaps items flagged:shroud_weapon_active:
        - determine cancelled
        on player clicks in inventory flagged:shroud_weapon_active:
        - if <context.inventory> == <player.inventory>:
            - if <context.click> == creative:
                - actionbar targets:<player> "<&c>The skills inventory is not usable in creative mode!"
                - determine cancelled
            - if <context.click> == right || <context.click> == left:
                - determine passively cancelled
                - if <context.slot> <= 8:
                    - flag <player> classes.shroud.qb_skills.<context.slot>:!
                    - inventory set d:<context.inventory> slot:<context.slot> o:air
                    - inventory update
                - else:
                    - actionbar targets:<player> "<&c>Hover over a skill and use your number keys to assign it a skill slot!"
            - else if <context.click> == number_key:
                - determine passively cancelled
                - if !<player.has_flag[classes.shroud.qb_skills]>:
                    - flag <player> classes.shroud.qb_skills
                    - define skills <player.flag[classes.shroud.qb_skills]>
                - if <player.has_flag[classes.shroud.qb_skills]>:
                    - define skills <player.flag[classes.shroud.qb_skills]>
                - if <context.slot> > 9 && <[skills].values> !contains <context.item.script.name.after[shroud_skill_gui_]> && <context.hotbar_button> != 9 && <context.hotbar_button> != 0:
                    - define slot_number <context.hotbar_button>
                    - flag <player> classes.shroud.qb_skills.<[slot_number]>:<context.item.script.name.after[shroud_skill_gui_]>
                    - inventory set d:<context.inventory> slot:<[slot_number]> o:<context.item>
                    - inventory update d:<context.inventory>
                - else if <[skills].values> contains <context.item.script.name.after[shroud_skill_gui_]>:
                    - actionbar targets:<player> "<&c>This skill is already assigned! Remove it from the skillbar to reassign it."
                - else if <context.hotbar_button> == 9:
                    - actionbar targets:<player> "<&c>You may not assign a skill to your hand slot!"
                - else:
                    - stop
            - else:
                - determine cancelled
        - else:
            - actionbar targets:<player> "<&c>You can't do that in skill mode!"

shroud_save_inventory_script:
    type: task
    debug: false
    script:
    - define og_hotbar <player.inventory.list_contents.get[1].to[8]>
    - define og_inv <player.inventory.list_contents>
    - define og_inv_no_soulbound <player.inventory.exclude_item[item_flagged:soulbound].list_contents>
    - define shroud_weapon_slot <player.held_item_slot>
    - define shroud_weapon_data <player.item_in_hand>
    - flag <player> entire_inv:<[og_inv]>
    - flag <player> no_soulbound_inv:<[og_inv_no_soulbound]>
    - flag <player> shroud_weapon_slot_#:<[shroud_weapon_slot]>
    - flag <player> shroud_weapon_data_f:<[shroud_weapon_data]>
    - flag <player> hotbar_contents:<[og_hotbar]>

shroud_restore_inventory_script:
    type: task
    debug: false
    script:
    - repeat 36 as:new_slot:
        - inventory set d:<player.inventory> slot:<[new_slot]> o:air
    - define entire_inv <player.flag[entire_inv]>
    - foreach <player.flag[entire_inv]> as:item:
        - define item <[entire_inv].get[<[loop_index]>]>
        - if <[item]> != air:
            - inventory set slot:<[loop_index]> o:<[item]>
        - if <[loop_index]> == 9:
            - define shroud_weapon_slot <player.flag[shroud_weapon_slot_#]>
            - define shroud_weapon_data <player.flag[shroud_weapon_data_f]>
            - inventory set d:<player.inventory> slot:<player.flag[shroud_weapon_slot_#]> o:<player.flag[shroud_weapon_data_f]>
    - flag <player> shroud_weapon_data_f:!
    - flag <player> shroud_weapon_slot_#:!
    - flag <player> hotbar_contents:!
    - flag <player> entire_inv:!