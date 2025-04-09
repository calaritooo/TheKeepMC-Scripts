# Mainly for straight, moving particle projectiles.
beam_template_script:
    type: task
    debug: false
    script:
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.location.add[0,1,0]>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    # default range = 50
    - define range 50
    # default speed = 6
    - define speed 6
    #- define impact_amount 10
    # default effect = dust_color_transition (if you change from dust, you must remove or modify the special data portion on the - playeffect command below)
    - define effect dust_color_transition
    # default particle_thickness = 10
    - define particle_thickness 10
    # default hit_effect = flash
    - define hit_effect flash
    # default hit_particle_thickness = 5
    - define hit_particle_thickness 5
    # default base_step_distance = 0.1 --> Do not change
    - define base_step_distance 0.1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>]> as:step:
        - define current_location <[current_location].add[<[step_vector]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[current_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|red
        - if <[current_location].material.is_solid>:
            - playeffect at:<[current_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> visibility:100
            - playsound sound:entity.firework_rocket.large_blast <[current_location]> volume:2.0
            - stop
        - if !<[current_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[current_location].find.living_entities.within[0.4].first>
            - playeffect at:<[hit_entity].location> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:0,1,0 visibility:100
            - playsound sound:entity.firework_rocket.large_blast <[hit_entity].location> volume:2.0
            #- hurt <[impact_amount]> target:<[hit_entity]>
            - stop
        - wait 1t

# Mainly for straight, twisting particle projectiles.
corkscrew_template_script:
    type: task
    debug: false
    script:
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.location.add[0,1,0]>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector.normalize>
    # default range = 50
    - define range 50
    # de fault speed = 2 (Ensure that speed and range are proportionate, otherwise you risk losing the animation and having "teleporting" particles)
    - define speed 2
    #- define impact_amount 10
    # default effect = dust_color_transition (if you change from dust, you must remove or modify the special data portion on the - playeffect command below)
    - define effect dust_color_transition
    # default particle_thickness = 10
    - define particle_thickness 10
    # default hit_effect = flash
    - define hit_effect flash
    # default hit_particle_thickness = 5
    - define hit_particle_thickness 5
    # default base_step_distance = 0.25 --> Do not change
    - define base_step_distance 0.25
    - define spiral_radius 0.5
    - define spiral_angle_increment 20
    - define angle 0
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - define step_vector <[direction].mul[<[step_distance]>]>
    - repeat <[range].div[<[step_distance]>].round_up> as:step:
        - define angle_to_radians <[angle].to_radians>
        - define cos_angle <[angle_to_radians].cos>
        - define sin_angle <[angle_to_radians].sin>
        - define x_offset <[spiral_radius].mul[<[cos_angle]>]>
        - define y_offset 0
        - define z_offset <[spiral_radius].mul[<[sin_angle]>]>
        - define current_location <[current_location].add[<[step_vector]>]>
        - define particle_location <[current_location].add[<[x_offset]>,<[y_offset]>,<[z_offset]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[particle_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|red
        - define angle <[angle].add[<[spiral_angle_increment]>]>
        - if <[current_location].material.is_solid>:
            - playeffect at:<[particle_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> visibility:100
            - playsound sound:entity.firework_rocket.large_blast <[particle_location]> volume:2.0
            - stop
        - if !<[current_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 10:
            - define hit_entity <[current_location].find.living_entities.within[0.4].first>
            - playeffect at:<[hit_entity].location> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:0,1,0 visibility:100
            - playsound sound:entity.firework_rocket.large_blast <[hit_entity].location> volume:2.0
            #- hurt <[impact_amount]> target:<[hit_entity]>
            - stop
        - wait 1t

corkscrew_test_template_script:
    type: task
    debug: true
    script:
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.location.add[0,1,0]>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    # default range = 50
    - define range 50
    # default speed = 6
    - define speed 3
    #- define impact_amount 10
    # default effect = dust_color_transition (if you change from dust, you must remove or modify the special data portion on the - playeffect command below)
    - define effect dust_color_transition
    # default particle_thickness = 10
    - define particle_thickness 10
    # default hit_effect = flash
    - define hit_effect flash
    # default hit_particle_thickness = 5
    - define hit_particle_thickness 2
    # default base_step_distance = 0.1 --> Do not change
    - define base_step_distance 0.1
    - define spiral_radius 0.7
    - define coil_tightness 20
    - define point 1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    - repeat <[range].div[<[step_distance]>]> as:step:
        - define current_location <[current_location].forward[<[step_distance]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[current_location].points_around_z[radius=<[spiral_radius]>;points=<[coil_tightness]>].parse_tag[<player.location.relative[<[parse_value]>]>].get[<[point]>]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|red
        - if <[current_location].material.is_solid>:
            - playeffect at:<[current_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> visibility:100
            - playsound sound:entity.firework_rocket.large_blast <[current_location]> volume:2.0
            - stop
        - if !<[current_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[current_location].find.living_entities.within[0.4].first>
            - playeffect at:<[hit_entity].location> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:0,1,0 visibility:100
            - playsound sound:entity.firework_rocket.large_blast <[hit_entity].location> volume:2.0
            #- hurt <[impact_amount]> target:<[hit_entity]>
            - stop
        - define point <[point].add[1]>
        - if <[point]> >= <[coil_tightness]>:
            - define point <[point].sub[<[coil_tightness]>]>
        - wait 1t

# Mainly for gravity-affected, moving projectiles.
arc_beam_template_script:
    type: task
    debug: false
    script:
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.location.add[0,1,0]>
    - define current_location <[origin]>
    - define direction <player.location.direction.vector>
    # default range = 50
    - define range 50
    # default speed = 6
    - define speed 6
    #- define impact_amount 10
    # default effect = dust_color_transition (if you change from dust, you must remove or modify the special data portion on the - playeffect command below)
    - define effect dust_color_transition
    # default particle_thickness = 10
    - define particle_thickness 10
    # default hit_effect = flash
    - define hit_effect flash
    # default hit_particle_thickness = 5
    - define hit_particle_thickness 5
    # default base_step_distance = 0.1 -> Do not change
    - define base_step_distance 0.1
    - define step_distance <[base_step_distance].mul[<[speed]>]>
    # default gravity_factor = -0.0025 --> Adjust very slightly, -0.0050 is much heavier than -0.0025.
    - define gravity_factor -0.0045
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
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[curved_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|red
        - if <[curved_location].material.is_solid>:
            - playeffect at:<[curved_location]> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> visibility:100
            - playsound sound:entity.firework_rocket.large_blast <[curved_location]> volume:2.0
            - stop
        - if !<[curved_location].find.living_entities.within[0.4].is_empty> && <[step]> >= 6:
            - define hit_entity <[curved_location].find.living_entities.within[0.4].first>
            - playeffect at:<[hit_entity].location> quantity:<[hit_particle_thickness]> effect:<[hit_effect]> offset:0,1,0 visibility:100
            - playsound sound:entity.firework_rocket.large_blast <[hit_entity].location> volume:2.0
            #- hurt <[impact_amount]> target:<[hit_entity]>
            - stop
        - wait 1t

# Mainly for non-lingering (cast and immediate dissipation) AOE use.
circle_template_script:
    type: task
    debug: false
    script:
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define origin <player.location>
    # default radius = 4
    - define radius 4
    - define impact_amount 10
    # default effect = dust_color_transition (if you change from dust, you must remove or modify the special data portion on the - playeffect command below)
    - define effect dust_color_transition
    # default particle_thickness = 10
    - define particle_thickness 10
    - define circumference <[radius].mul[2].mul[<util.pi>]>
    - define point_count <[circumference].mul[0.75]>
    - define border_points <[origin].points_around_y[radius=<[radius]>;points=<[point_count]>=]>
    - if !<[origin].find.living_entities.within[<[radius]>].is_empty>:
        - define affected_entity <[origin].find.living_entities.within[<[radius]>]>
        #- heal <[impact_amount]> target:<[affected_entity]> --> KEEP THIS - IF COMMAND FOR AOE EFFECT.
    # FOR EFFECTS ON CASTER, REPLACE - IF COMMAND WITH SIMPLE COMMANDS AT SAME INDENTATION AS THIS HASHTAG AND REMOVE - IF AND INDENTED CONSTITUENTS.
    - foreach <[border_points]> as:border:
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[border]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|red

rising_circle_template_script:
    type: task
    debug: false
    script:
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define center <player.location>
    # default max_height = 3.5 (how many blocks tall will the circle animation reach)
    - define max_height 3.5
    # default speed = 1
    - define speed 1
    # default base_vertical_step_size = 0.25 (how close together will each particle be as it moved toward the max height)
    - define base_vertical_step_size 0.25
    # default radius = 4
    - define radius 4
    - define impact_amount 10
    # default effect = electric_spark
    - define effect electric_spark
    # default particle_thickness = 1 (adjust this if your particle effect is too weak or too strong)
    - define particle_thickness 1
    - define vertical_step_size <[base_vertical_step_size].mul[<[speed]>]>
    - define circumference <[radius].mul[2].mul[<util.pi>]>
    - define point_count <[circumference].mul[0.75]>
    - if !<[center].find.living_entities.within[<[radius]>].is_empty>:
        - define affected_entities <[center].find.living_entities.within[<[radius]>]>
        #- heal <[impact_amount]> target:<[affected_entities]> --> KEEP THIS - IF COMMAND FOR AOE EFFECT.
    # FOR EFFECTS ON CASTER, REPLACE - IF COMMAND WITH SIMPLE COMMANDS AT SAME INDENTATION AS THIS HASHTAG AND REMOVE - IF AND INDENTED CONSTITUENTS.
    - repeat <[max_height].div[<[vertical_step_size]>]> as:step:
        - define center <[center].add[0,<[vertical_step_size]>,0]>
        - define points <[center].points_around_y[radius=<[radius]>;points=<[point_count]>=]>
        - foreach <[points]> as:points_step:
            - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[points_step]> visibility:100 offset:0.1,0.1,0.1
        - wait 1t

flat_outward_spiral_template_script:
    type: task
    debug: false
    script:
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define center <player.location>
    # default radius = 0 (DO NOT CHANGE)
    - define radius 0
    - define radius_increment 0.1
    # default max_radius = 10 (Size of spiral)
    - define max_radius 10
    - define angle 0
    - define angle_increment 15
    # default effect = dust_color_transition
    - define effect dust_color_transition
    # default particle thickness = 10
    - define particle_thickness 10
    - define impact_amount 5
    - if !<[center].find.living_entities.within[<[max_radius]>].is_empty>:
        - define affected_entities <[center].find.living_entities.within[<[max_radius]>]>
        #- heal <[impact_amount]> target:<[affected_entities]> --> KEEP THIS - IF COMMAND FOR AOE EFFECT.
    # FOR EFFECTS ON CASTER, REPLACE - IF COMMAND WITH SIMPLE COMMANDS AT SAME INDENTATION AS THIS HASHTAG AND REMOVE - IF AND INDENTED CONSTITUENTS.
    - repeat <[max_radius].div[<[radius_increment]>]> as:step:
        - define angle_to_radians <[angle].to_radians>
        - define cos_angle <[angle_to_radians].cos>
        - define sin_angle <[angle_to_radians].sin>
        - define x_offset <[radius].mul[<[cos_angle]>]>
        - define z_offset <[radius].mul[<[sin_angle]>]>
        - define particle_location <[center].add[<[x_offset]>,0,<[z_offset]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[particle_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|red
        - define radius <[radius].add[<[radius_increment]>]>
        - define angle <[angle].add[<[angle_increment]>]>
        - wait 1t

flat_inward_spiral_template_script:
    type: task
    debug: false
    script:
    - playsound sound:block.trial_spawner.spawn_item_begin <player.location> volume:2.0
    - define center <player.location>
    - define radius_increment 0.1
    # default max_radius = 10
    - define max_radius 10
    - define radius <[max_radius]>
    - define angle 0
    - define angle_increment 15
    # default effect = dust_color_transition
    - define effect dust_color_transition
    # default particle thickness = 10
    - define particle_thickness 10
    - define impact_amount 5
    - if !<[center].find.living_entities.within[<[max_radius]>].is_empty>:
        - define affected_entities <[center].find.living_entities.within[<[max_radius]>]>
        #- heal <[impact_amount]> target:<[affected_entities]> --> KEEP THIS - IF COMMAND FOR AOE EFFECT.
    # FOR EFFECTS ON CASTER, REPLACE - IF COMMAND WITH SIMPLE COMMANDS AT SAME INDENTATION AS THIS HASHTAG AND REMOVE - IF AND INDENTED CONSTITUENTS.
    - repeat <[max_radius].div[<[radius_increment]>]> as:step:
        - define angle_to_radians <[angle].to_radians>
        - define cos_angle <[angle_to_radians].cos>
        - define sin_angle <[angle_to_radians].sin>
        - define x_offset <[radius].mul[<[cos_angle]>]>
        - define z_offset <[radius].mul[<[sin_angle]>]>
        - define particle_location <[center].add[<[x_offset]>,0,<[z_offset]>]>
        - playeffect effect:<[effect]> quantity:<[particle_thickness]> at:<[particle_location]> visibility:100 offset:0.1,0.1,0.1 special_data:1.0|white|red
        - define radius <[radius].sub[<[radius_increment]>]>
        - define angle <[angle].sub[<[angle_increment]>]>
        - wait 1t

test_spell_scroll_actions:
    type: world
    debug: false
    events:
        on player right clicks block with:test_scroll_beam:
        - take iteminhand quantity:1
        - run beam_template_script
        on player right clicks block with:test_scroll_corkscrew:
        - take iteminhand quantity:1
        - run corkscrew_test_template_script
        on player right clicks block with:test_scroll_arc_beam:
        - take iteminhand quantity:1
        - run arc_beam_template_script
        on player right clicks block with:test_scroll_circle:
        - take iteminhand quantity:1
        - run circle_template_script
        on player right clicks block with:test_scroll_rising_circle:
        - take iteminhand quantity:1
        - run rising_circle_template_script
        on player right clicks block with:test_scroll_flat_inward_spiral:
        - take iteminhand quantity:1
        - run flat_inward_spiral_template_script
        on player right clicks block with:test_scroll_flat_outward_spiral:
        - take iteminhand quantity:1
        - run flat_outward_spiral_template_script

test_scroll_beam:
    type: item
    material: stick
    display name: <&d>Test Scroll - Beam
    lore:
        - <&7><&o>Right click to cast
        - <&7><&o>a beam form.
    mechanisms:
        hides: ALL
        custom_model_data: 14023

test_scroll_corkscrew:
    type: item
    material: stick
    display name: <&d>Test Scroll - Corkscrew
    lore:
        - <&7><&o>Right click to cast
        - <&7><&o>a corkscrew form.
    mechanisms:
        hides: ALL
        custom_model_data: 14023

test_scroll_arc_beam:
    type: item
    material: stick
    display name: <&d>Test Scroll - Arc Beam
    lore:
        - <&7><&o>Right click to cast
        - <&7><&o>an arc beam form.
    mechanisms:
        hides: ALL
        custom_model_data: 14023

test_scroll_circle:
    type: item
    material: stick
    display name: <&d>Test Scroll - Circle
    lore:
        - <&7><&o>Right click to cast
        - <&7><&o>a circle form.
    mechanisms:
        hides: ALL
        custom_model_data: 14023

test_scroll_rising_circle:
    type: item
    material: stick
    display name: <&d>Test Scroll - Rising Circle
    lore:
        - <&7><&o>Right click to cast
        - <&7><&o>a rising circle form.
    mechanisms:
        hides: ALL
        custom_model_data: 14023

test_scroll_flat_outward_spiral:
    type: item
    material: stick
    display name: <&d>Test Scroll - Flat Outward Spiral
    lore:
        - <&7><&o>Right click to cast
        - <&7><&o>a flat, outward spiral form.
    mechanisms:
        hides: ALL
        custom_model_data: 14023

test_scroll_flat_inward_spiral:
    type: item
    material: stick
    display name: <&d>Test Scroll - Flat Inward Spiral
    lore:
        - <&7><&o>Right click to cast
        - <&7><&o>a flat, inward spiral form.
    mechanisms:
        hides: ALL
        custom_model_data: 14023