scholar_skill_glacius_script:
    type: task
    debug: false
    script:
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.eye_location>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    - define range 80
    - define speed 8
    - define impact_amount 3
    - define effect dust_color_transition
    - define particle_thickness 10
    - define hit_effect snowflake
    - define hit_particle_thickness 200
    - define base_step_distance 0.1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>].round_up> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[current_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|aqua
        - playeffect effect:snowflake quantity:1 at:<[current_location]> visibility:100 offset:0.1,0.1,0.1
        - if <[current_location].material.is_solid>:
            - playeffect at:<[current_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:.5,.5,.5 visibility:100
            - playsound sound:block.amethyst_block.break <[current_location]> volume:2.0
            - stop
        - if <[current_location].is_liquid>:
            - playeffect at:<[current_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:.5,.5,.5 visibility:100
            - playsound sound:block.amethyst_block.break <[current_location]> volume:2.0
            - define water_to_be_frozen <[current_location].find_blocks[water].within[2].if_null[null]>
            - if <[water_to_be_frozen]> == null:
                - stop
            - else:
                - modifyblock <[water_to_be_frozen]> ice 75
                - playeffect at:<[current_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:2,0.2,2 visibility:100
                - wait 7s
                - modifyblock <[water_to_be_frozen]> water 100
                - playeffect at:<[current_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:2,0.2,2 visibility:100
            - stop
        - if !<[current_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[current_location].find.living_entities.within[0.4].first>
            - playeffect at:<[hit_entity].location.add[0,1,0]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:.5,.5,.5 visibility:100
            - playsound sound:block.amethyst_block.break <[hit_entity].location> volume:2.0
            - hurt <[impact_amount]> target:<[hit_entity]>
            - cast slow target:<[hit_entity]> duration:8s
            - cast weakness target:<[hit_entity]> duration:8s
            - adjust <[hit_entity]> freeze_duration:15s
            - stop
        - wait 1t

scholar_skill_maltempo_script:
    type: task
    debug: false
    script:
    - if <player.location.pitch> >= -30:
        - actionbar "<&c>You must face the sky to cast this!"
        - stop
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.location.add[0,2,0]>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    - define range 25
    - define speed 5
    - define effect dust_color_transition
    - define particle_thickness 10
    - define hit_effect smoke
    - define hit_particle_thickness 100
    - define base_step_distance 0.1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>].round_up> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[current_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|gray|navy
        - playeffect effect:snowflake quantity:1 at:<[current_location]> visibility:100 offset:0.1,0.1,0.1
        - wait 1t
        - if <[current_location].material.is_solid>:
            - playeffect at:<[current_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:.5,.5,.5 visibility:100
            - playsound sound:block.fire.extinguish <[current_location]> volume:2.0
            - stop
        - if !<[current_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[current_location].find.living_entities.within[0.4].first>
            - playeffect at:<[hit_entity].eye_location> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:.5,.5,.5 visibility:100
            - playsound sound:block.fire.extinguish <[hit_entity].location> volume:2.0
            - stop
        - if <[step]> == <[range].div[<[step_distance]>].round_up>:
            - playsound sound:entity.lightning_bolt.impact <[current_location]> volume:8
            - playeffect effect:cloud quantity:3000 at:<[current_location]> visibility:100 offset:30,0,30
            - playeffect effect:flash quantity:5 at:<[current_location]> visibility:100 offset:1,1,1
            - weather global thunder
            - define center <[current_location]>
            - define radius 0
            - define radius_increment 0.3
            - define max_radius 30
            - define angle 0
            - define angle_increment 15
            - define effect dust_color_transition
            - define particle_thickness 10
            - define impact_amount 5
            - repeat <[max_radius].div[<[radius_increment]>]> as:step:
                - define angle_to_radians <[angle].to_radians>
                - define cos_angle <[angle_to_radians].cos>
                - define sin_angle <[angle_to_radians].sin>
                - define x_offset <[radius].mul[<[cos_angle]>]>
                - define z_offset <[radius].mul[<[sin_angle]>]>
                - define particle_location <[center].add[<[x_offset]>,0,<[z_offset]>]>
                - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[particle_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|navy|navy
                - playeffect effect:snowflake quantity:1 at:<[particle_location]> visibility:100 offset:0.1,0.1,0.1
                - define radius <[radius].add[<[radius_increment]>]>
                - define angle <[angle].add[<[angle_increment]>]>
            - repeat 4:
                - playsound sound:ambient.basalt_deltas.mood <[current_location]> volume:8
                - wait <util.random.int[2].to[5]>s

scholar_skill_beltempo_script:
    type: task
    debug: false
    script:
    - if <player.location.pitch> >= -30:
        - actionbar "<&c>You must face the sky to cast this!"
        - stop
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.location.add[0,2,0]>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    - define range 25
    - define speed 5
    - define effect dust_color_transition
    - define particle_thickness 10
    - define hit_effect smoke
    - define hit_particle_thickness 100
    - define base_step_distance 0.1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>].round_up> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[current_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|orange|yellow
        - playeffect effect:composter quantity:1 at:<[current_location]> visibility:100 offset:0.1,0.1,0.1
        - wait 1t
        - if <[current_location].material.is_solid>:
            - playeffect at:<[current_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:.5,.5,.5 visibility:100
            - playsound sound:block.fire.extinguish <[current_location]> volume:2.0
            - stop
        - if !<[current_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[current_location].find.living_entities.within[0.4].first>
            - playeffect at:<[hit_entity].eye_location> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:.5,.5,.5 visibility:100
            - playsound sound:block.fire.extinguish <[hit_entity].location> volume:2.0
            - stop
        - if <[step]> == <[range].div[<[step_distance]>].round_up>:
            - playsound sound:item.trident.riptide_3 <[current_location]> volume:8
            - playeffect effect:cloud quantity:3000 at:<[current_location]> visibility:100 offset:30,0,30
            - playeffect effect:flash quantity:5 at:<[current_location]> visibility:100 offset:1,1,1
            - weather global sunny
            - define center <[current_location]>
            - define radius 0
            - define radius_increment 0.3
            - define max_radius 30
            - define angle 0
            - define angle_increment 15
            - define effect dust_color_transition
            - define particle_thickness 10
            - define impact_amount 5
            - repeat <[max_radius].div[<[radius_increment]>]> as:step:
                - define angle_to_radians <[angle].to_radians>
                - define cos_angle <[angle_to_radians].cos>
                - define sin_angle <[angle_to_radians].sin>
                - define x_offset <[radius].mul[<[cos_angle]>]>
                - define z_offset <[radius].mul[<[sin_angle]>]>
                - define particle_location <[center].add[<[x_offset]>,0,<[z_offset]>]>
                - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[particle_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|orange|yellow
                - playeffect effect:composter quantity:1 at:<[particle_location]> visibility:100 offset:0.1,0.1,0.1
                - define radius <[radius].add[<[radius_increment]>]>
                - define angle <[angle].add[<[angle_increment]>]>

scholar_skill_noctio_hostis_script:
    type: task
    debug: false
    script:
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:entity.parrot.imitate.phantom <player.location> volume:2.0
    - define origin <player.eye_location>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    # default range = 50
    - define range 50
    # default speed = 6
    - define speed 7
    # default effect = dust_color_transition (if you change from dust, you must remove or modify the special data portion on the - playeffect command below)
    - define effect dust_color_transition
    # default particle_thickness = 10
    - define particle_thickness 10
    # default hit_effect = flash
    - define hit_effect flash
    # default hit_particle_thickness = 5
    - define hit_particle_thickness 1
    # default base_step_distance = 0.1 -> Do not change
    - define base_step_distance 0.1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    # default gravity_factor = -0.0025 --> Adjust very slightly, -0.0050 is much heavier than -0.0025.
    - define gravity_factor -0.0060
    - define gravity_activation <[range].div[6].round>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>].round_up> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - if <[step].div[<[step_distance]>]> < <[gravity_activation]>:
            - define curved_location <[current_location].add[<[step_vector]>]>
        - else if <[step].div[<[step_distance]>]> > <[gravity_activation]>:
            - define gravity_step <[step].div[<[step_distance]>].sub[<[gravity_activation]>]>
            - define downward_movement <[gravity_factor].mul[<[gravity_step]>]>
            - define curved_location <[curved_location].add[<[step_vector]>].add[0,<[downward_movement]>,0]>
        - define curved_location <location[<[curved_location]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[curved_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|black|silver
        - playeffect effect:sculk_soul quantity:3 at:<[curved_location]> visibility:100 offset:0.1,0.1,0.1
        - if <[curved_location].material.is_solid>:
            - define hit_location <[curved_location]>
            - playeffect at:<[hit_location]> quantity:<[hit_particle_thickness]> effect:sculk_soul visibility:100
            - playsound sound:entity.warden.attack_impact <[hit_location]> volume:2.0
            - playsound sound:ambient.soul_sand_valley.mood <[hit_location]> volume:2.0
            - repeat 20 as:doubled_duration_in_seconds_solid:
                - playeffect at:<[hit_location]> effect:sculk_soul quantity:50 visibility:100 offset:2,0.5,2
                - define affected_entities <[hit_location].find_players_within[4]>
                - cast wither target:<[affected_entities]> amplifier:0 duration:5s
                - cast blindness target:<[affected_entities]> duration:6s
                - wait 0.5s
            - stop
        - if !<[curved_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[curved_location].find.living_entities.within[0.4].first>
            - playeffect at:<[hit_entity].location> quantity:1 effect:<[hit_effect]> offset:0,0.5,0 visibility:100
            - playsound sound:entity.phantom.bite <[hit_entity].location> volume:2.0
            - cast wither target:<[hit_entity]> amplifier:1 duration:8s
            - cast blindness target:<[hit_entity]> duration:10s
            - repeat 14 as:doubled_duration_in_seconds_entity:
                - playeffect at:<[hit_entity].eye_location> effect:dust_color_transition quantity:30 visibility:100 offset:0.5,0.5,0.5 special_data:1.0|black|gray
                - playeffect effect:sculk_soul quantity:10 at:<[hit_entity]> visibility:100 offset:0.5,0.5,0.5
                - wait 0.5s
            - stop
        - wait 1t

scholar_skill_renovatio_script:
    type: task
    debug: false
    script:
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.eye_location>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    # default range = 50
    - define range 35
    # default speed = 2
    - define speed 4
    - define impact_amount 4
    # default effect = dust_color_transition (if you change from dust, you must remove or modify the special data portion on the - playeffect command below)
    - define effect dust_color_transition
    # default particle_thickness = 10
    - define particle_thickness 10
    # default hit_effect = flash
    - define hit_effect heart
    # default hit_particle_thickness = 5
    - define hit_particle_thickness 5
    # default base_step_distance = 0.25 --> Do not change
    - define base_step_distance 0.25
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>]> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[current_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|red
        - if <[current_location].material.is_solid>:
            - playeffect at:<[current_location]> quantity:100 effect:smoke visibility:100
            - playsound sound:block.fire.extinguish <[current_location]> volume:2.0
            - stop
        - if !<[current_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[current_location].find.living_entities.within[0.4].first>
            - playeffect at:<[current_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> visibility:100
            - playsound sound:block.amethyst_block.resonate <[hit_entity].location> volume:2.0
            - heal <[impact_amount]> target:<[hit_entity]>
            - cast regeneration target:<[hit_entity]> duration:10s
            - stop
        - wait 1t

scholar_skill_emberus_script:
    type: task
    debug: false
    script:
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:entity.wither.shoot <player.location> volume:0.5
    - define origin <player.eye_location>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    - define range 80
    - define speed 8
    - define impact_amount 3
    - define effect dust_color_transition
    - define particle_thickness 6
    - define hit_effect flame
    - define hit_particle_thickness 100
    - define base_step_distance 0.1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>].round_up> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[current_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|orange|white
        - playeffect effect:small_flame quantity:1 at:<[current_location]> visibility:100 offset:0.1,0.1,0.1
        - playeffect effect:smoke quantity:5 at:<[current_location]> visibility:100 offset:0.3,0.3,0.3
        - if <[current_location].material.is_solid>:
            - playeffect at:<[current_location]> quantity:50 effect:large_smoke offset:.5,.5,.5 visibility:100
            - playsound sound:item.firecharge.use <[current_location]> volume:2.0
            - explode power:2 <[current_location]> fire
            - stop
        - if !<[current_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[current_location].find.living_entities.within[0.4].first>
            - playeffect at:<[hit_entity].location.add[0,1,0]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:.5,.5,.5 visibility:100
            - playsound sound:entity.blaze.shoot <[hit_entity].location> volume:2.0
            - hurt <[impact_amount]> target:<[hit_entity]>
            - burn <[hit_entity]> duration:5s
            - stop
        - wait 1t

scholar_skill_defendere_aliatis_script:
    type: task
    debug: false
    script:
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define center <player.location>
    - define radius_increment 0.1
    - define max__spiral_radius 5
    - define radius <[max__spiral_radius]>
    - define angle 0
    - define dome_radius 0
    - define max_dome_radius 10
    - define angle_increment 15
    - define effect dust_color_transition
    - define particle_thickness 10
    - repeat <[max__spiral_radius].div[<[radius_increment]>]> as:step_spiral:
        - define angle_to_radians <[angle].to_radians>
        - define cos_angle <[angle_to_radians].cos>
        - define sin_angle <[angle_to_radians].sin>
        - define x_offset <[radius].mul[<[cos_angle]>]>
        - define z_offset <[radius].mul[<[sin_angle]>]>
        - define particle_location <[center].add[<[x_offset]>,0,<[z_offset]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[particle_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|yellow
        - playeffect effect:totem_of_undying quantity:3 at:<[particle_location]> visibility:100 offset:0.5,0.3,0.5
        - define radius <[radius].sub[<[radius_increment]>]>
        - define angle <[angle].sub[<[angle_increment]>]>
        - wait 1t
    - playsound sound:block.beacon.activate <[center]> volume:2
    - repeat <[max_dome_radius].div[<[radius_increment]>]> as:step_dome:
        - effectlib type:Sphere origin:<[center]> effect_data:[duration=<duration[2t].in_milliseconds>;particle=electric_spark;radius=<[dome_radius]>]
        - cast damage_resistance target:<[center].find_players_within[<[dome_radius]>]> duration:1.1s amplifier:1
        - cast increase_damage target:<[center].find_players_within[<[dome_radius]>]> duration:1.1s
        - define dome_radius <[dome_radius].add[<[radius_increment]>]>
        - wait 1t
        - if <[step_dome]> == <[max_dome_radius].div[<[radius_increment]>]>:
            - repeat 10 as:dome_duration_in_seconds:
                - effectlib type:Sphere origin:<[center]> effect_data:[duration=<duration[1.1s].in_milliseconds>;particle=electric_spark;radius=<[max_dome_radius]>]
                - cast damage_resistance target:<[center].find_players_within[<[max_dome_radius]>]> duration:1.1s amplifier:1
                - cast increase_damage target:<[center].find_players_within[<[max_dome_radius]>]> duration:1.1s
                - wait 1s
                - if <[dome_duration_in_seconds]> == 10:
                    - playsound sound:block.beacon.deactivate <[center]> volume:2
                    - stop

scholar_skill_solanine_script:
    type: task
    debug: false
    script:
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:entity.slime.attack <player.location> volume:2.0
    - define origin <player.eye_location>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    # default range = 50
    - define range 50
    # default speed = 6
    - define speed 7
    # default effect = dust_color_transition (if you change from dust, you must remove or modify the special data portion on the - playeffect command below)
    - define effect dust_color_transition
    # default particle_thickness = 10
    - define particle_thickness 10
    # default hit_effect = flash
    - define hit_effect flash
    # default hit_particle_thickness = 5
    - define hit_particle_thickness 1
    # default base_step_distance = 0.1 -> Do not change
    - define base_step_distance 0.1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    # default gravity_factor = -0.0025 --> Adjust very slightly, -0.0050 is much heavier than -0.0025.
    - define gravity_factor -0.0060
    - define gravity_activation <[range].div[6].round>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>].round_up> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - if <[step].div[<[step_distance]>]> < <[gravity_activation]>:
            - define curved_location <[current_location].add[<[step_vector]>]>
        - else if <[step].div[<[step_distance]>]> > <[gravity_activation]>:
            - define gravity_step <[step].div[<[step_distance]>].sub[<[gravity_activation]>]>
            - define downward_movement <[gravity_factor].mul[<[gravity_step]>]>
            - define curved_location <[curved_location].add[<[step_vector]>].add[0,<[downward_movement]>,0]>
        - define curved_location <location[<[curved_location]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[curved_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|olive|lime
        - playeffect effect:item_slime quantity:<[particle_thickness]> at:<[curved_location]> visibility:100 offset:0.1,0.1,0.1
        - if <[curved_location].material.is_solid>:
            - define hit_location <[curved_location]>
            - playeffect at:<[hit_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> visibility:100
            - playsound sound:entity.warden.attack_impact <[hit_location]> volume:2.0
            - playsound sound:ambient.soul_sand_valley.mood <[hit_location]> volume:2.0
            - repeat 20 as:doubled_duration_in_seconds_solid:
                - playeffect at:<[hit_location]> effect:dust_color_transition quantity:250 visibility:100 offset:2,0.5,2 special_data:1.0|olive|green
                - define affected_entities <[hit_location].find_players_within[4]>
                - cast poison target:<[affected_entities]> amplifier:0 duration:10s
                - cast hunger target:<[affected_entities]> amplifier:2 duration:15s
                - wait 0.5s
            - stop
        - if !<[curved_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[curved_location].find.living_entities.within[0.4].first>
            - playeffect at:<[hit_entity].location> quantity:1 effect:<[hit_effect]> offset:0,0.5,0 visibility:100
            - playsound sound:entity.warden.attack_impact <[hit_entity].location> volume:2.0
            - cast poison target:<[hit_entity]> amplifier:1 duration:7s
            - cast hunger target:<[hit_entity]> amplifier:3 duration:10s
            - cast confusion target:<[hit_entity]> duration:8s
            - repeat 14 as:doubled_duration_in_seconds_entity:
                - playeffect at:<[hit_entity].eye_location> effect:dust_color_transition quantity:10 visibility:100 offset:0.5,0.5,0.5 special_data:1.0|olive|green
                - wait 0.5s
            - stop
        - wait 1t

scholar_skill_nullus_script:
    type: task
    debug: false
    script:
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.eye_location>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    - define range 50
    - define speed 4
    - define effect dust_color_transition
    - define particle_thickness 10
    - define hit_effect flash
    - define hit_particle_thickness 2
    - define base_step_distance 0.25
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>]> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[current_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|maroon|silver
        - if <[current_location].material.is_solid>:
            - playeffect at:<[current_location]> quantity:100 effect:smoke visibility:100
            - playsound sound:block.fire.extinguish <[current_location]> volume:0.8
            - stop
        - if !<[current_location].find_players_within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[current_location].find.living_entities.within[0.4].first>
            - flag <[hit_entity]> weapon_disarmed expire:<util.random.int[7].to[12]>s
            - actionbar targets:<[hit_entity]> "<&6>An opponent has disarmed you!"
            - playeffect at:<[current_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> visibility:100
            - playsound sound:entity.firework_rocket.large_blast <[hit_entity].location> volume:2.0
            - stop
        - wait 1t

scholar_skill_remedia_totaeus_script:
    type: task
    debug: false
    script:
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.location>
    - define radius 0
    - define max_radius 5
    - define outward_step 0.2
    # default effect = dust_color_transition (if you change from dust, you must remove or modify the special data portion on the - playeffect command below)
    - define effect dust_color_transition
    # default particle_thickness = 10
    - define particle_thickness 1
    - repeat <[max_radius].div[<[outward_step]>]> as:repeat_index:
        - define radius <[radius].add[<[outward_step]>]>
        - define circumference <[radius].mul[2].mul[<util.pi>]>
        - define point_count <[circumference]>
        - define border_points <[origin].points_around_y[radius=<[radius]>;points=<[point_count]>=]>
        - foreach <[border_points]> as:border:
            - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[border]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|aqua|white
        - wait 1t
        - if <[repeat_index]> == <[max_radius].div[<[outward_step]>].sub[<[max_radius]>]>:
            - playsound at:<[origin]> sound:block.bell.resonate volume:2
        - if <[repeat_index]> == <[max_radius].div[<[outward_step]>]>:
            - define center <[origin]>
            - define max_height 3.5
            - define speed 3
            - define base_vertical_step_size 0.1
            - define radius 5
            - define effect electric_spark
            - define particle_thickness 1
            - define vertical_step_size <[base_vertical_step_size].mul[<[speed]>]>
            - define circumference <[radius].mul[2].mul[<util.pi>]>
            - define point_count <[circumference].mul[0.75]>
            - if !<[center].find.living_entities.within[<[radius]>].is_empty>:
                - define affected_entities <[center].find.living_entities.within[<[radius]>]>
                - cast remove blindness target:<[affected_entities]>
                - cast remove poison target:<[affected_entities]>
                - cast remove weakness target:<[affected_entities]>
                - cast remove confusion target:<[affected_entities]>
                - cast remove slow target:<[affected_entities]>
                - cast remove slow_digging target:<[affected_entities]>
            - repeat <[max_height].div[<[vertical_step_size]>]> as:step:
                - define center <[center].add[0,<[vertical_step_size]>,0]>
                - define points <[center].points_around_y[radius=<[radius]>;points=<[point_count]>=]>
                - foreach <[points]> as:points_step:
                    - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[points_step]> visibility:100 offset:0.6,0.1,0.6
                - wait 1t

scholar_skill_locum_invertus_script:
    type: task
    debug: false
    script:
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:entity.allay.ambient_without_item <player.location> volume:2.0
    - define target <player.eye_location.ray_trace_target[ignore=<player>;range=35;entities=*;default=null]>
    - if <[target]> == null || <[target].is_npc>:
        - playeffect at:<player.location> quantity:100 effect:dust_color_transition visibility:100 offset:0.4,0.4,0.4 special_data:1.0|purple|black
        - playsound sound:block.amethyst_block.step <player.location> volume:2.0
        - stop
    - else:
        - define caster_loc <player.location>
        - define target_loc <[target].location>
        - playsound sound:entity.allay.ambient_without_item <[target_loc]> volume:2.0 pitch:2
        - cast blindness target:<[target]> duration:2.5s
        - cast invisibility target:<[target]> duration:1.5s
        - cast invisibility target:<player> duration:1.5s
        - cast blindness target:<player> duration:2.5s
        - playeffect effect:dust_color_transition quantity:100 at:<[target_loc]> visibility:100 offset:0.4,0.4,0.4 special_data:1.0|purple|black
        - playeffect effect:dust_color_transition quantity:100 at:<[caster_loc]> visibility:100 offset:0.4,0.4,0.4 special_data:1.0|purple|black
        - wait 1s
        - teleport <player> <[target_loc]>
        - teleport <[target]> <[caster_loc]>
        - playeffect effect:dust_color_transition quantity:100 at:<[caster_loc]> visibility:100 offset:0.4,0.4,0.4 special_data:1.0|purple|black
        - playeffect effect:wax_off quantity:5 at:<[caster_loc]> visibility:100 offset:0.4,0.4,0.4
        - playeffect effect:dust_color_transition quantity:100 at:<[target_loc]> visibility:100 offset:0.4,0.4,0.4 special_data:1.0|purple|black
        - playeffect effect:wax_off quantity:5 at:<[target_loc]> visibility:100 offset:0.4,0.4,0.4
        - playsound sound:entity.allay.ambient_without_item <[target_loc]> volume:2.0 pitch:2
        - playsound sound:entity.allay.ambient_without_item <[caster_loc]> volume:2.0 pitch:2

scholar_skill_potentia_imperium_script:
    type: task
    debug: false
    script:
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - if <player.has_flag[potentia_imperium_active]> || <player.has_flag[potentia_imperium_inactive]>:
        - stop
    - playsound sound:entity.wither.shoot <player.location> volume:0.5
    - define origin <player.eye_location>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    - define range 50
    - define speed 7
    - define effect dust_color_transition
    - define particle_thickness 10
    - define hit_effect flash
    - define hit_particle_thickness 1
    - define base_step_distance 0.1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - define gravity_factor -0.0065
    - define gravity_activation <[range].div[6].round>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>].round_up> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - if <[step].div[<[step_distance]>]> < <[gravity_activation]>:
            - define curved_location <[current_location].add[<[step_vector]>]>
        - if <[step].div[<[step_distance]>]> > <[gravity_activation]>:
            - define gravity_step <[step].div[<[step_distance]>].sub[<[gravity_activation]>]>
            - define downward_movement <[gravity_factor].mul[<[gravity_step]>]>
            - define curved_location <[curved_location].add[<[step_vector]>].add[0,<[downward_movement]>,0]>
        - if <[step]> == 5:
            - flag <player> potentia_imperium_inactive
        - define curved_location <location[<[curved_location]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[curved_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|black|silver
        - playeffect effect:flame quantity:3 at:<[curved_location]> visibility:100 offset:0.2,0.2,0.2
        - if <player.has_flag[potentia_imperium_active]>:
            - define hit_location <[curved_location]>
            - playeffect at:<[hit_location]> quantity:<[hit_particle_thickness]> effect:explosion_emitter visibility:100
            - playsound sound:entity_dragon_fireball_explode <[hit_location]> volume:2.0
            - playeffect at:<[hit_location]> quantity:50 effect:large_smoke offset:1,1,1 visibility:100
            - playsound sound:item.firecharge.use <[hit_location]> volume:2.0
            - explode power:2 <[hit_location]> fire
            - flag <player> potentia_imperium_active:!
            - flag <player> potentia_imperium_inactive:!
            - stop
        - if <[curved_location].material.is_solid>:
            - flag <player> potentia_imperium_inactive:!
            - flag <player> potentia_imperium_active:!
            - define hit_location <[curved_location]>
            - playeffect at:<[hit_location]> quantity:<[hit_particle_thickness]> effect:explosion_emitter visibility:100
            - playsound sound:entity_dragon_fireball_explode <[hit_location]> volume:2.0
            - playeffect at:<[hit_location]> quantity:50 effect:large_smoke offset:1,1,1 visibility:100
            - playsound sound:item.firecharge.use <[hit_location]> volume:2.0
            - explode power:3 <[hit_location]> fire
            - stop
        - if !<[curved_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - flag <player> potentia_imperium_inactive:!
            - flag <player> potentia_imperium_active:!
            - define hit_entities <[curved_location].find.living_entities.within[5].first>
            - playeffect at:<[curved_location]> quantity:<[hit_particle_thickness]> effect:explosion_emitter visibility:100
            - playsound sound:entity_dragon_fireball_explode <[hit_location]> volume:2.0
            - playeffect at:<[curved_location]> quantity:50 effect:large_smoke offset:1,1,1 visibility:100
            - playsound sound:item.firecharge.use <[hit_location]> volume:2.0
            - explode power:2 <[curved_location]> fire
            - hurt 11 target:<[hit_entities]>
            - stop
        - wait 1t
    - flag <player> potentia_imperium_active:!
    - flag <player> potentia_imperium_inactive:!

potentia_imperium_flag_event:
    type: world
    debug: false
    events:
        after player left clicks block flagged:potentia_imperium_inactive:
        - flag <player> potentia_imperium_inactive:!
        - flag <player> potentia_imperium_active

scholar_skill_levitio_script:
    type: task
    debug: false
    script:
    - define spell <script.name.after[scholar_skill_].before[_script]>
    - define caster_level <player.flag[classes.scholar.skills.<[spell]>]>
    - define cooldown_duration <script[scholar_skill_data].data_key[<[spell]>].deep_get[cooldown.<[caster_level]>]>
    - if <player.has_flag[cooldowns]> && <player.flag[cooldowns]> contains <[spell]>:
        - define cooldown_flag cooldowns.<[spell]>
        - define cooldown_remainder <player.flag_expiration[cooldowns.<[spell]>].from_now.formatted>
        - actionbar targets:<player> "<&6>Cooldown: <&c><[cooldown_remainder]> <&6>remaining!"
        - stop
    - flag <player> cooldowns.<[spell]> expire:<[cooldown_duration]>s
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.eye_location>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    - define range 50
    - define speed 10
    - define effect dust_color_transition
    - define particle_thickness 15
    - define hit_effect cloud
    - define hit_particle_thickness 5
    - define base_step_distance 0.1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>]> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[current_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|silver
        - if <[current_location].material.is_solid>:
            - playeffect at:<[current_location]> quantity:20 effect:<[hit_effect]> offset:0.5,0.5,0.5 visibility:100
            - playsound sound:block.fire.extinguish <[current_location]> volume:2.0
            - stop
        - if !<[current_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[current_location].find.living_entities.within[0.4].first>
            - if <[hit_entity].is_npc>:
                - playeffect at:<[current_location]> quantity:20 effect:<[hit_effect]> offset:0.5,0.5,0.5 visibility:100
                - playsound sound:block.fire.extinguish <[current_location]> volume:2.0
                - stop
            - playsound sound:block.portal.trigger <[hit_entity].location> volume:2.0
            - cast levitation <[hit_entity]> duration:5s
            - define radius_increment 0.1
            - define max_radius 10
            - define radius <[max_radius]>
            - define angle 0
            - define angle_increment 15
            - define effect dust_color_transition
            - define particle_thickness 10
            - repeat <[max_radius].div[<[radius_increment]>]> as:step:
                - define center <[hit_entity].location.add[0,1,0]>
                - define angle_to_radians <[angle].to_radians>
                - define cos_angle <[angle_to_radians].cos>
                - define sin_angle <[angle_to_radians].sin>
                - define x_offset <[radius].mul[<[cos_angle]>]>
                - define z_offset <[radius].mul[<[sin_angle]>]>
                - define particle_location <[center].add[<[x_offset]>,0,<[z_offset]>]>
                - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[particle_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|silver|white
                - playeffect effect:cloud quantity:3 at:<[hit_entity].location> offset:0.5,0.1,0.5 visibility:100
                - define radius <[radius].sub[<[radius_increment]>]>
                - define angle <[angle].sub[<[angle_increment]>]>
                - wait 1t
            - playsound sound:entity.phantom.flap at:<[hit_entity].location> volume:2.0
            - stop
        - wait 1t

scholar_skill_petrificus_totaeus_script:
    type: task
    debug: false
    script:
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.eye_location>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    - define range 30
    - define speed 6
    - define effect dust_color_transition
    - define particle_thickness 10
    - define hit_effect flash
    - define hit_particle_thickness 5
    - define base_step_distance 0.1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>]> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[current_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|silver|black
        - if <[current_location].material.is_solid>:
            - playeffect at:<[current_location]> quantity:100 effect:<[effect]> visibility:100 offset:0.5,0.5,0.5 special_data:1.0|silver|black
            - playsound sound:block.stone.hit <[current_location]> volume:1.0
            - stop
        - if !<[current_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[current_location].find.living_entities.within[0.4].first>
            - playeffect at:<[hit_entity].location> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:0,1,0 visibility:100
            - playsound sound:ui.stonecutter.take_result <[hit_entity].location> volume:1
            - cast slow target:<[hit_entity]> amplifier:8 duration:8s
            - define ent_speed <[hit_entity].speed>
            - adjust <[hit_entity]> speed:0
            - look <[hit_entity]> <[origin]> duration:7s
            - flag <[hit_entity]> petrified expire:8s
            - repeat 5:
                - playeffect at:<[hit_entity].location> effect:cloud quantity:3 offset:0.2,0.1,0.2 visibility:100
                - playsound sound:block.sniffer_egg.crack <[hit_entity].location> pitch:0.8 volume:1
                - wait 1s
            - adjust <[hit_entity]> speed:<[ent_speed]>
            - stop
        - wait 1t

petrificus_totaeus_jump_prevent:
    type: world
    debug: false
    events:
        on player jumps flagged:petrified:
        - determine cancelled
