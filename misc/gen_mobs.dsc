#ALL INGREDIENTS SHOULD HAVE A UNIQUE FOUR-DIGIT CUSTOM MODEL DATA ID BEGINNING WITH FIVE (5).
#LATEST CUSTOM MODEL DATA NUMBER -> 5001

mandrake:
    type: entity
    debug: false
    entity_type: rabbit
    mechanisms:
        speed: 0.4
        health_data: 7/7

mandrake_actions:
    type: world
    debug: false
    events:
        after player breaks *_sapling with:!botanists_clippers chance:3:
        - spawn mandrake <context.location>
        - playsound <player.location> sound:entity.ghast.death
        - cast confusion <player.location.find_players_within[20]> duration:10s no_ambient no_icon no_clear hide_particles
        - run earmuffs_action
        after player damages mandrake:
        - playsound <player.location> sound:entity.ghast.hurt
        - cast confusion <player.location.find_players_within[20]> duration:10s no_ambient no_icon no_clear hide_particles
        - run earmuffs_action
        on player kills mandrake:
        - cast confusion <player.location.find_players_within[20]> remove
        - drop mandrake_root location:<context.entity.location> quantity:1
        - drop xp quantity:<util.random.int[2].to[5]> location:<context.entity.location>

armored_spider:
    type: entity
    debug: false
    entity_type: spider
    mechanisms:
        speed: 0.3
        health_data: 22/22
        armor_bonus: 14
        custom_name: Armored Spider
        custom_name_visible: true
        potion_effects:
            - [type=WEAVING;amplifier=0;duration=0;ambient=false;particles=true;icon=false]

armored_spider_actions:
    type: world
    debug: false
    events:
        on player kills armored_spider chance:50:
        - random:
            - drop cobweb quantity:<util.random.int[1].to[2]> location<context.entity.location>
            - drop iron_nugget quantity:<util.random.int[2].to[5]> location:<context.entity.location>
            - drop spider_eye quantity:1 location:<context.entity.location>
            - drop string quantity:<util.random.int[1].to[3]> location:<context.entity.location>
        on player kills armored_spider:
        - drop xp quantity:<util.random.int[4].to[7]> location:<context.entity.location>
        on player damaged by armored_spider chance:7:
        - random:
            - cast weaving target:<context.entity> amplifier:0 duration:2m
            - cast slowness target:<context.entity> amplifier:0 duration:30s
            - cast poison target:<context.entity> amplifier:1 duration:10s

skeletal_warrior:
    type: entity
    debug: false
    entity_type: skeleton
    mechanisms:
        speed: 0.3
        health_data: 20/20
        custom_name: Skeletal Warrior
        custom_name_visible: false
        potion_effects:
            - [type=INFESTED;amplifier=0;duration=0;ambient=false;particles=true;icon=false]
        equipment:
            boots: chainmail_boots
            leggings: chainmail_leggings
            chestplate: chainmail_chestplate
            helmet: chainmail_helmet
        item_in_hand: iron_sword

skeletal_warrior_actions:
    type: world
    debug: false
    events:
        on player kills skeletal_warrior chance:50:
        - random:
            - drop chain quantity:<util.random.int[1].to[2]> location:<context.entity.location>
            - drop arrow quantity:<util.random.int[1].to[3]> location:<context.entity.location>
            - drop bread quantity:<util.random.int[1].to[2]> location:<context.entity.location>
        on player kills skeletal_warrior:
        - drop xp quantity:<util.random.int[4].to[7]> location:<context.entity.location>

jungle_spider:
    type: entity
    debug: false
    entity_type: cave_spider
    mechanisms:
        speed: 0.4
        health_data: 16/16
        armor_bonus: 4
        custom_name: Jungle Spider
        custom_name_visible: false
        potion_effects:
            - [type=WEAVING;amplifier=0;duration=0;ambient=false;particles=true;icon=false]

jungle_spider_actions:
    type: world
    debug: false
    events:
        on player kills jungle_spider chance:50:
        - random:
            - drop cobweb quantity:<util.random.int[1].to[2]> location<context.entity.location>
            - drop spider_eye quantity:1 location:<context.entity.location>
            - drop string quantity:<util.random.int[1].to[3]> location:<context.entity.location>
            - drop poison_ivy quantity:1 location:<context.entity.location>
        on player kills jungle_spider:
        - drop xp quantity:<util.random.int[4].to[7]> location:<context.entity.location>
        on player damaged by jungle_spider chance:20:
        - random:
            - cast weaving target:<context.entity> amplifier:0 duration:2m
            - cast slowness target:<context.entity> amplifier:0 duration:30s
            - cast poison target:<context.entity> amplifier:2 duration:10s
            - cast hunger target:<context.entity> amplifier:4 duration:10s

undead_guard:
    type: entity
    debug: false
    entity_type: zombie
    mechanisms:
        speed: 0.3
        health_data: 25/25
        custom_name: Undead Guard
        custom_name_visible: false
        potion_effects:
            - [type=INFESTED;amplifier=0;duration=0;ambient=false;particles=true;icon=false]
        equipment:
            boots: leather_boots
            leggings: chainmail_leggings
            chestplate: chainmail_chestplate
            helmet: leather_helmet
        item_in_hand: iron_sword

undead_guard_actions:
    type: world
    debug: false
    events:
        on player kills undead_guard chance:50:
        - random:
            - drop rotten_flesh quantity:<util.random.int[1].to[2]> location:<context.entity.location>
            - drop iron_nugget quantity:<util.random.int[1].to[4]> location:<context.entity.location>
            - drop poisonous_potato quantity:1 location:<context.entity.location>
            - drop gold_ingot quantity:1 location:<context.entity.location>
            - drop gold_nugget quantity:<util.random.int[1].to[4]> location:<context.entity.location>
            - drop poisonous_potato quantity:1 location:<context.entity.location>
            - drop rotten_flesh quantity:<util.random.int[1].to[2]> location:<context.entity.location>
            - drop iron_ingot quantity:1 location:<context.entity.location>
        on player kills undead_guard:
        - drop xp quantity:<util.random.int[4].to[7]> location:<context.entity.location>
        on player damaged by undead_guard chance:25:
        - cast hunger target:<context.entity> amplifier:4 duration:10s

frozen_guard:
    type: entity
    debug: false
    entity_type: zombie
    mechanisms:
        speed: 0.25
        health_data: 25/25
        custom_name: Frozen Guard
        armor_bonus: 12
        custom_name_visible: false
        potion_effects:
            - [type=WIND_CHARGED;amplifier=0;duration=0;ambient=false;particles=true;icon=false]
        equipment:
            boots: leather_boots[color=WHITE]
            leggings: leather_leggings[color=WHITE]
            chestplate: iron_chestplate
            helmet: leather_helmet[color=WHITE]
        item_in_hand: stone_sword

frozen_guard_actions:
    type: world
    debug: false
    events:
        on player kills frozen_guard chance:50:
        - random:
            - drop iron_nugget quantity:<util.random.int[1].to[3]> location:<context.entity.location>
            - drop poisonous_potato quantity:1 location:<context.entity.location>
            - drop snowball quantity:<util.random.int[1].to[3]> location:<context.entity.location>
            - drop copper_ingot quantity:1 location:<context.entity.location>
            - drop iron_ingot quantity:1 location:<context.entity.location>
        on player kills frozen_guard:
        - drop xp quantity:<util.random.int[4].to[7]> location:<context.entity.location>
        on player damaged by frozen_guard chance:25:
        - cast slow target:<context.entity> amplifier:2 duration:10s
        - cast slow_digging target:<context.entity> amplifier:0 duration:10s

drifter:
    type: entity
    debug: false
    entity_type: breeze
    mechanisms:
        speed: 0.4
        custom_name: Drifter
        armor_bonus: 10
        custom_name_visible: true
        potion_effects:
            - [type=WIND_CHARGED;amplifier=0;duration=0;ambient=false;particles=true;icon=false]

drifter_actions:
    type: world
    debug: false
    events:
        on player kills drifter chance:50:
        - random:
            - drop wind_charge quantity:<util.random.int[1].to[2]> location:<context.entity.location>
            - drop snowball quantity:<util.random.int[1].to[3]> location:<context.entity.location>
        on drifter dies:
        - determine passively NO_DROPS
        - drop xp quantity:<util.random.int[4].to[7]> location:<context.entity.location>
        - playeffect effect:cloud at:<context.entity.location.add[0,1,0]> quantity:300 offset:5.0,2.0,5.0
        - define <context.entity.location.find.living_entities.within[5]> as:chilled
        - cast slow target:<[chilled]> amplifier:2 duration:20s
        - cast slow_digging target:<[chilled]> amplifier:1 duration:20s
        - cast confusion target:<[chilled]> amplifier:0 duration:6s
        on player damaged by drifter chance:25:
        - cast slow target:<context.entity> amplifier:2 duration:10s
        - cast slow_digging target:<context.entity> amplifier:0 duration:10s

bloated:
    type: entity
    debug: false
    entity_type: zombie
    mechanisms:
        speed: 0.20
        health_data: 20/20
        custom_name: Bloated
        custom_name_visible: true
        potion_effects:
            - [type=CONFUSION;amplifier=0;duration=0;ambient=false;particles=true;icon=false]
        equipment:
            boots: leather_boots
            leggings: AIR
            chestplate: AIR
            helmet: AIR
        item_in_hand: wooden_axe

bloated_actions:
    type: world
    debug: false
    events:
        on player kills bloated chance:50:
        - random:
            - drop water_artichoke quantity:1 location:<context.entity.location>
            - drop red_mushroom quantity:<util.random.int[1].to[2]> location:<context.entity.location>
            - drop brown_mushroom quantity:<util.random.int[1].to[2]> location:<context.entity.location>
            - drop poison_ivy quantity:<util.random.int[1].to[2]> location:<context.entity.location>
            - drop blue_orchid quantity:1 location:<context.entity.location>
        on bloated dies:
        - drop xp quantity:<util.random.int[4].to[7]> location:<context.entity.location>
        - playeffect effect:spore_blossom_air at:<context.entity.location.add[0,1,0]> quantity:1000 offset:4.0,2.0,4.0
        - define <context.entity.location.find.living_entities.within[4]> as:infected
        - cast hunger target:<[infected]> amplifier:5 duration:1m
        - cast poison target:<[infected]> amplifier:1 duration:20s
        - cast weakness target:<[infected]> amplifier:0 duration:40s
        - cast confusion target:<[infected]> amplifier:0 duration:20s
        on player damaged by bloated chance:25:
        - cast poison target:<context.entity> amplifier:2 duration:5s
        - cast confusion target:<context.entity> amplifier:0 duration:7s

rabbid_wolf:
    type: entity
    debug: false
    entity_type: wolf
    mechanisms:
        health_data: 18/18
        angry: true
        custom_name: Rabbid Wolf
        custom_name_visible: false

rabbid_wolf_actions:
    type: world
    debug: false
    events:
        on player kills rabbid_wolf chance:50:
        - random:
            - drop tongue_of_dog quantity:1 location:<context.entity.location>
            - drop bone quantity:<util.random.int[1].to[2]> location:<context.entity.location>
        on player damages rabbid_wolf:
        - define <player.location.find_entities[rabbid_wolf].within[50]> as:wolf_pack
        - attack <[wolf_pack]> target:<context.player>
        on rabbid_wolf dies:
        - drop xp quantity:<util.random.int[4].to[7]> location:<context.entity.location>
        on rabbid_wolf steps on block chance:15:
        - ratelimit <context.entity> 15s
        - attack <context.entity> target:<context.entity.location.find.living_entities.within[10]>

wolf_spawn_variations:
    type: world
    debug: false
    events:
        on wolf spawns because natural chance:3:
        - spawn rabbid_wolf|rabbid_wolf|rabbid_wolf|rabbid_wolf location:<context.location> reason:CUSTOM
        - define <context.entity.location.find_players_within[100]> as:prey
        - playsound sound:entity.wolf.howl <[prey].location>

skeleton_spawn_variations:
    type: world
    debug: false
    events:
        on skeleton spawns because natural chance:3:
        - spawn skeletal_warrior location:<context.location> reason:CUSTOM

spider_spawn_variations:
    type: world
    debug: false
    events:
        on spider spawns because natural chance:3:
        - if <context.location.biome.name> == jungle || <context.location.biome.name> == sparse_jungle:
            - spawn jungle_spider location:<context.location> reason:CUSTOM
        - else:
            - spawn armored_spider location:<context.location> reason:CUSTOM

creeper_spawn_variations:
    type: world
    debug: false
    events:
        on creeper spawns because natural chance:3:
        - if <context.location.biome.name> in <script[biomelists].data_key[biomes.snowy]>:
            - spawn drifter location:<context.location> reason:CUSTOM
        - else if <context.location.biome.name> == swamp || <context.location.biome.name> == mangrove_swamp || <context.location.biome.name> == dark_forest || <context.location.biome.name> == lush_caves:
            - spawn bloated location:<context.location> reason:CUSTOM
        - else:
            - stop

zombie_spawn_variations:
    type: world
    debug: false
    events:
        on zombie spawns because natural chance:3:
        - if <context.location.biome.name> in <script[biomelists].data_key[biomes.snowy]>:
            - spawn frozen_guard location:<context.location> reason:CUSTOM
        - else:
            - spawn undead_guard location:<context.location> reason:CUSTOM