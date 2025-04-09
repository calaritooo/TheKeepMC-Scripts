archer_skill_passives_script:
    type: world
    debug: false
    events:
        on arrow hits entity:* shooter:player flagged:classes.archer.skills.passives:
        - define archer <context.shooter>
        - define hit_entity <context.hit_entity>
        - if <[hit_entity]> in <script[entities_list].data_key[entities.allowed]>:
            - if ( <player.location.in_region> && <player.worldguard.test_flag[pvp]> && <player.worldguard.test_flag[pvp].at[<[hit_entity].location>]> ) || ( <player.location.towny_allows_pvp> && <[hit_entity].location.towny_allows_pvp> ):
                - playsound <context.shooter> sound:entity.experience_orb.pickup volume:1
                - if <util.random_chance[30]>:
                    - glow <[hit_entity]> true for:<[archer]>
                    - wait 1s
                    - glow <[hit_entity]> false for:<[archer]>
                    - stop
                - if <util.random_chance[5]>:
                    - if !<context.shooter.item_in_hand.enchantment_map.contains[infinity]>:
                        - give to:<context.shooter.inventory> arrow quantity:1
            - else:
                - stop
        - else:
            - playsound <[archer]> sound:stonecutter.take_result volume:1

archer_skill_predators_mark_script:
    type: task
    debug: false
    script:
    - define archer <player>
    - define entities <player.location.find_entities[*].within[30].exclude[<[archer]>]>
    - foreach <[entities]> as:entity:
        - if <[entity].entity_type> in <script[entities_list].data_key[entities.tracking]>:
            - define marked <[entity]>
            - foreach stop
    - if !<[marked].exists>:
        - actionbar targets:<[archer]> "<&c>No valid target found in range!"
        - stop
    - if <[marked].entity_type> == player:
        - actionbar "<&6>You've been marked." targets:<[marked]>
    - glow <[marked]> true for:<[archer]>
    - playsound <[archer]> sound:allay.item.thrown volume:1 pitch:0.5
    - if ( <[archer].location.in_region> && <[archer].worldguard.test_flag[pvp]> && <[archer].worldguard.test_flag[pvp].at[<[marked].location>]> ) || ( <[archer].location.towny_allows_pvp> && <[marked].location.towny_allows_pvp> ):
        - cast <[marked]> weakness duration:5
        - cast <[marked]> slow duration:5
    - wait 3s
    - glow <[marked]> false for:<[archer]>

upon_fire_handler:
    type: world
    debug: false
    events:
        on player shoots bow flagged:active_skill|classes.archer:
        - define skill <player.flag[active_skill]>
        - choose <[skill]>:
            - case smoke_bomb:
                - flag <context.projectile> smoke_bomb expire:30s
                - repeat 100 as:step:
                    - if !<context.projectile.has_flag[smoke_bomb]>:
                        - repeat stop
                    - playeffect at:<context.projectile.location> effect:cloud quantity:3 offset:0.1,0.1,0.1 visibility:100
                    - wait 1t
                - stop
            - case heated_tip:
                - flag <context.projectile> heated_tip expire:30s
                - stop

upon_hit_handler:
    type: world
    debug: false
    events:
        on projectile hits shooter:player flagged:active_skill|classes.archer:
        - define skill <player.flag[active_skill]>
        - choose <[skill]>:
            - case smoke_bomb:
                - if <context.projectile.has_flag[smoke_bomb]>:
                    - if <context.hit_block.exists>:
                        - define loc <context.hit_block>
                    - playeffect at:<[loc]> quantity:15 effect:flash visibility:100 offset:5,5,5
                    - playeffect at:<[loc]> quantity:100 effect:cloud visibility:100 offset:5,5,5
                    - playsound sound:block.lava.extinguish <[loc]> volume:2.0
                    - playeffect at:<context.shooter.location> quantity:3 effect:flash visibility:100 offset:1,1,1
                    - playeffect at:<context.shooter.location> quantity:75 effect:cloud visibility:100 offset:3,3,3
                    - cast invisibility target:<context.shooter> duration:5s
                    - flag <context.shooter> active_skill:!
                    - flag <context.projectile> smoke_bomb:!
            - case heated_tip:
                - if <context.hit_block.exists>:
                    - define loc <context.hit_block>
                    - playeffect at:<[loc]> quantity:50 effect:large_smoke offset:.5,.5,.5 visibility:100
                    - playsound sound:item.firecharge.use <[loc]> volume:2.0
                    - explode power:2 <[loc]> fire
                    - flag <context.shooter> active_skill:!
                    - flag <context.projectile> heated_tip:!