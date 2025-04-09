

blank_writ:
    type: item
    material: stick
    display name: <&6>Blank Writ
    lore:
        - <&7><&o>A blank writ, void of
        - <&7><&o>any arcane use.
    allow in material recipes: false
    recipes:
        1:
            type: shapeless
            input: burnt_parchment|string
    mechanisms:
        hides: ALL
        custom_model_data: 14101

writ_of_returning:
    type: item
    material: stick
    display name: <&6>Writ of Returning
    lore:
        - <&7><&o>A writ useful for returning to
        - <&7><&o>one's last known location.
    allow in material recipes: false
    mechanisms:
        hides: ALL
        custom_model_data: 14101

writ_of_alacrity:
    type: item
    material: stick
    display name: <&6>Writ of Alacrity
    lore:
        - <&7><&o>An important writ for those adept
        - <&7><&o>in casting, used to clear all cooldowns.
    allow in material recipes: false
    mechanisms:
        hides: ALL
        custom_model_data: 14101

writ_of_taunting:
    type: item
    material: stick
    display name: <&6>Writ of Taunting
    lore:
        - <&7><&o>Forbidden by nearly all institutions and used among few,
        - <&7><&o>when used, this writ will leave whomever it is bound to
        - <&7><&o>trembling with fear, paralyzed by their own insanity.
    allow in material recipes: false
    mechanisms:
        hides: ALL
        custom_model_data: 14101


writ_actions:
    type: world
    debug: true
    events:
        on player right clicks block with:writ_of_returning:
        - take iteminhand quantity:1
        - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
        - define center <player.location>
        - define max_height 2.5
        - define speed 1
        - define base_vertical_step_size 0.1
        - define radius 1
        - define effect dragon_breath
        - define particle_thickness 1
        - define vertical_step_size <[base_vertical_step_size].mul[<[speed]>]>
        - define circumference <[radius].mul[2].mul[<util.pi>]>
        - define point_count <[circumference].mul[1.5]>
        - repeat <[max_height].div[<[vertical_step_size]>]> as:step:
            - define center <[center].add[0,<[vertical_step_size]>,0]>
            - define points <[center].points_around_y[radius=<[radius]>;points=<[point_count]>=]>
            - foreach <[points]> as:points_step:
                - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[points_step]> visibility:100 offset:0.1,0.1,0.1
            - wait 1t
        - playsound sound:entity.shulker.teleport volume:1 <player.location>
        - execute as_op back
        on player right clicks block with:writ_of_alacrity:
        - take iteminhand quantity:1
        - playsound sound:minecraft:entity.breeze.idle_air volume:1 <player.location>
        - playeffect effect:SMALL_GUST at:<player.location.add[0,0.5,0]> offset:1,2,1 quantity:20
        - if <player.has_flag[cooldowns]>:
            - flag <player> cooldowns:!
        on player right clicks block with:writ_of_taunting:
        - if <context.item.has_flag[tagged_player]>:
            - define tagged_player <server.match_player[<context.item.flag[tagged_player]>].if_null[null]>
            - if <[tagged_player]> == null:
                - take iteminhand quantity:1
                - actionbar targets:<player> "<&6>The writ combusts suddenly, leaving only ashes.."
                - stop
            - playeffect at:<player.eye_location> effect:soul_fire_flame offset:1,1,1 quantity:25
            - take iteminhand quantity:1
            - actionbar targets:<[tagged_player]> "<&6>Your stomach suddenly begins to turn, you feel watched.."
            - wait 1.5s
            - adjust <player> spectate:<[tagged_player]>
            - repeat <util.random.int[3].to[6]> as:loop_index:
                - if <[loop_index]> == 2:
                    - adjust <player> spectate:<player>
                - cast confusion target:<[tagged_player]> amplifier:0 duration:<util.random.int[5].to[16]>s no_ambient no_clear no_icon hide_particles
                - cast blindness target:<[tagged_player]> amplifier:0 duration:<util.random.int[3].to[16]>s no_ambient no_clear no_icon hide_particles
                - playsound <[tagged_player].location> sound:entity.witch.celebrate pitch:<util.random.decimal[0.6].to[1.0]> volume:1
                - wait <util.random.int[13].to[35]>s
        - else:
            - take iteminhand quantity:1
            - actionbar targets:<player> "<&6>The writ combusts suddenly, leaving only ashes.."
            - stop


blank_writ_actions:
    type: world
    debug: true
    events:
        on player right clicks amethyst_block with:blank_writ in:*_ritual_grounds flagged:!no_ritual:
        - if <player.inventory.contains_item[gold_dust].quantity[4]> && <player.inventory.contains_item[iron_dust].quantity[4]> && <player.inventory.contains_item[rotten_flesh].quantity[8]>:
            - take item:gold_dust quantity:4
            - take item:iron_dust quantity:4
            - take item:rotten_flesh quantity:8
            - take item:blank_writ quantity:1
            - run writ_ritual_script def.context_location:<context.location>
            - give writ_of_returning quantity:1
        - else if <player.inventory.contains_item[wind_charge].quantity[2]> && <player.inventory.contains_item[pink_petals].quantity[4]> && <player.inventory.contains_item[lovers_longing].quantity[3]>:
            - take item:wind_charge quantity:4
            - take item:pink_petals quantity:3
            - take item:lovers_longing quantity:2
            - take item:blank_writ quantity:1
            - run writ_ritual_script def.context_location:<context.location>
            - give writ_of_alacrity quantity:1
        - else if <player.inventory.contains_item[human_blood_tagged].quantity[1]> && <player.inventory.contains_item[hags_liver].quantity[1]> && <player.inventory.contains_item[eye_of_newt]>:
            - define slot <player.inventory.find_item[human_blood_tagged]>
            - define tagged_human_blood <player.inventory.slot[<[slot]>]>
            - define tagged_player <[tagged_human_blood].flag[tagged_player]>
            - take item:human_blood_tagged quantity:1
            - take item:hags_liver quantity:1
            - take item:eye_of_newt quantity:1
            - take item:blank_writ quantity:1
            - run writ_ritual_script def.context_location:<context.location>
            - wait 6.5s
            - give writ_of_taunting quantity:1
            - define writ <player.inventory.find_all_items[writ_of_taunting].exclude[item_flagged:tagged_player].first>
            - inventory flag slot:<[writ]> tagged_player:<[tagged_player]>
            - inventory adjust slot:<[writ]> "lore:<&7><&o>Forbidden by nearly all institutions and used among few,<&nl><&7><&o>when used, this writ will leave whomever is bound to<&nl><&7><&o>trembling with fear, paralyzed by their own insanity.<&nl><&nl><&7><&o>Bound to <[tagged_player]>."
        - else:
            - stop

writ_ritual_script:
    type: task
    debug: false
    definitions: context_location
    script:
    - wait 3s
    - playsound sound:block.trial_spawner.spawn_item_begin <[context_location]> volume:2.0
    - define loc <[context_location].center>
    - define max_height 20
    - define speed 5
    - define base_vertical_step_size 0.1
    - define vertical_step_size <[base_vertical_step_size].mul[<[speed]>]>
    - define effect dust_color_transition
    - define particle_thickness 10
    - repeat <[max_height].div[<[vertical_step_size]>]> as:step:
        - define loc <[loc].add[0,<[vertical_step_size]>,0]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[loc]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|black
        - wait 1t
        - if <[step]> == <[max_height].div[<[vertical_step_size]>]>:
            - playeffect at:<[loc]> effect:dust_color_transition quantity:2000 offset:20,0,20 special_data:1.0|white|black visibility:100
            - playsound sound:entity.wither.ambient volume:2 <[loc]>
    - wait 1s