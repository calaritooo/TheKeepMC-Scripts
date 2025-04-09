automatic_restart:
    type: world
    events:
        on system time 03:55:
        - announce "<&8><&lt><&lt><&c>Announcement<&8><&gt><&gt> <&r>The server will execute its automatic daily restart in five (5) minutes."
        - wait 4m
        - announce "<&8><&lt><&lt><&c>Announcement<&8><&gt><&gt> <&r>The server will automatically restart in one (1) minute."
        - define progress 1
        - define remaining 60
        - bossbar create dailyrestart players:<server.online_players> "title:<&9>Automatic server restart in <&c><&l><[remaining]>s<&9>!" progress:<[progress]> color:pink style:SEGMENTED_6
        - repeat 59 as:duration_in_seconds:
            - define progress <[progress].sub[0.0166667]>
            - define remaining <[remaining].sub[1]>
            - bossbar update dailyrestart players:<server.online_players> "title:<&9>Automatic server restart in <&c><&l><[remaining]>s<&9>!" progress:<[progress]> color:pink style:SEGMENTED_6
            - wait 1s
        - bossbar remove dailyrestart
        - adjust server restart

no_quick_join_world:
    type: world
    debug: false
    events:
        on server prestart:
        - flag server startup_inprog duration:10s
        on player logs in server_flagged:startup_inprog:
        - if <player.is_op>:
            - stop
        - else:
            - determine "<&c>Notice: <&f>Scripts are still activating! This phase may last up to ten seconds."
        on server list ping server_flagged:startup_inprog:
        - determine passively "<&7>Server is loading..."
        - determine passively VERSION_NAME:Loading
        - determine passively PROTOCOL_VERSION:999

chat_pings_world:
    type: world
    debug: false
    events:
        after player chats:
        # You might prefer: contains[regex:\b<[player].name>\b]
        # As that will test "word borders" (ie, don't match if the name is in the middle of a word)
        - foreach <server.online_players.filter_tag[<context.message.contains[<[filter_value].name>]>]> as:player:
            - playsound <[player]> sound:block_note_block_bell
            - toast targets:<[player]> "<&c><player.name><&7> mentioned you!" frame:goal icon:nether_star

creative_restriction_log:
    type: world
    debug: false
    events:
        on player changes gamemode to creative permission:restriction.creative:
        - flag <player> restrictioncreative
        - ~log "<player.name> has entered creative mode. Restriction flag added. Guard initiated." type:warning file:logs/restriction.log
        on player changes gamemode to survival permission:restriction.creative:
        - flag <player> restrictioncreative:!
        - ~log "<player.name> has exited creative mode. Restriction flag removed. Guard closed." type:warning file:logs/restriction.log
        on player clicks item in inventory permission:restriction.creative flagged:restrictioncreative:
        - ~log "<player.name> has clicked the following item, '<context.item>', while in creative mode!" type:info file:logs/restriction.log
        on player right clicks block with:*_spawn_egg permission:restriction.creative:
        - ~log "<player.name> has used '<context.item>' at '<player.location.simple>'. This item is a known spawn egg. Ensure proper method of obtaining and handling." type:warning file:logs/restriction.log

worldguard_region_protections:
    type: world
    debug: false
    events:
        on player right clicks *_trapdoor|spruce_door flagged:interact_restriction permission:!admin:
        - determine passively cancelled
        - narrate "<&c>You don't have permission to do that here!"
        on player changes world to world_flagged:interact_restriction:
        - flag <player> interact_restriction:true
        on player changes world from world_flagged:interact_restriction:
        - flag <player> interact_restriction:!

biomelists:
    type: data
    biomes:
        forests:
        - forest
        - birch_forest
        - cherry_grove
        - bamboo_jungle
        - dark_forest
        - flower_forest
        - grove
        - jungle
        - mangrove_swamp
        - old_growth_spruce_taiga
        - old_growth_pine_taiga
        - old_growth_birch_forest
        - snowy_taiga
        - taiga
        oceans:
        - deep_ocean
        - lukewarm_ocean
        - cold_ocean
        - deep_cold_ocean
        - frozen_ocean
        - deep_frozen_ocean
        - ocean
        - deep_lukewarm_ocean
        - beach
        - warm_ocean
        snowy:
        - snowy_taiga
        - frozen_river
        - snowy_slopes
        - frozen_peaks
        - jagged_peaks
        - ice_spikes
        - snowy_plains
        - snowy_beach
        - grove
        - frozen_ocean
        - deep_frozen_ocean

foodlists:
    type: data
    meats:
        fish:
        - cod
        - cooked_cod
        - salmon
        - cooked_salmon
        - tropical_fish
        - pufferfish

misclists:
    type: data
    animals:
        boneneedle:
        - wandering_trader
        vampirepunchable1:
        - cow
        - pig
        - sheep
        - chicken
        - mooshroom
        - witch
        - villager
        - illager
        - pillager
        - evoker
        - illusionist
        - ocelot
        - cat
        - wolf
        - fox
        - dog
        - turtle
        - goat
        - wandering_trader
        - vindicator
        vampirepunchable2:
        - horse
        - llama
        - panda
        - player
        - trader_llama
        - camel
        - donkey
        - mule
        - polar_bear
        - sniffer
        timeperiods:
            day:
            - day
            - dawn
            night:
            - night
            - dusk
        weatherperiods:
            poor:
            - rain
            - storm
        food:
            vampirefood:
            - potion
            - impure_blood
            - purified_blood
            - divine_blood
            - infernal_blood
            werewolffood:
            - potion
            - beef
            - chicken
            - cooked_chicken
            - cooked_beef
            - rabbit
            - cooked_rabbit
            - mutton
            - cooked_mutton
            - salmon
            - cooked_salmon
            - cod
            - cooked_cod
            - porkchop
            - cooked_porkchop
            allfood:
            #to be finished!#
            - beef
            - chicken
            - cooked_chicken
            - cooked_beef
            - rabbit
            - cooked_rabbit
            - mutton
            - cooked_mutton
            - porkchop
            - cooked_porkchop
            - salmon
            - cooked_salmon
            - cod
            - cooked_cod
            - apple
            - melon_slice
            - sweet_berries
            - glow_berries
            - chorus_fruit
            meat:
            - beef
            - chicken
            - cooked_chicken
            - cooked_beef
            - rabbit
            - cooked_rabbit
            - mutton
            - cooked_mutton
            - porkchop
            - cooked_porkchop
            - salmon
            - cooked_salmon
            - cod
            - cooked_cod
        spawneggs:
        - allay_spawn_egg
        - armadillo_spawn_egg
        - axolotl_spawn_egg
        - bat_spawn_egg
        - bee_spawn_egg
        - blaze_spawn_egg
        - bogged_spawn_egg
        - breeze_spawn_egg
        - camel_spawn_egg
        - cat_spawn_egg
        - cave_spider_spawn_egg
        - chicken_spawn_egg
        - cod_spawn_egg
        - cow_spawn_egg
        - creeper_spawn_egg
        - dolphin_spawn_egg
        - donkey_spawn_egg
        - drowned_spawn_egg
        - elder_guardian_spawn_egg
        - enderman_spawn_egg
        - endermite_spawn_egg
        - evoker_spawn_egg
        - fox_spawn_egg
        - frog_spawn_egg
        - ghast_spawn_egg
        - glow_squid_spawn_egg
        - goat_spawn_egg
        - guardian_spawn_egg
        - hoglin_spawn_egg
        - horse_spawn_egg
        - husk_spawn_egg
        - iron_golem_spawn_egg
        - llama_spawn_egg
        - magma_cube_spawn_egg
        - mooshroom_spawn_egg
        - mule_spawn_egg
        - ocelot_spawn_egg
        - panda_spawn_egg
        - parrot_spawn_egg
        - phantom_spawn_egg
        - pig_spawn_egg
        - piglin_spawn_egg
        - piglin_brute_spawn_egg
        - pillager_spawn_egg
        - polar_bear_spawn_egg
        - pufferfish_spawn_egg
        - rabbit_spawn_egg
        - ravager_spawn_egg
        - salmon_spawn_egg
        - sheep_spawn_egg
        - shulker_spawn_egg
        - silverfish_spawn_egg
        - skeleton_spawn_egg
        - skeleton_horse_spawn_egg
        - slime_spawn_egg
        - sniffer_spawn_egg
        - snow_golem_spawn_egg
        - spider_spawn_egg
        - squid_spawn_egg
        - stray_spawn_egg
        - strider_spawn_egg
        - tadpole _spawn_egg
        - trader_llama_spawn_egg
        - tropical_fish_spawn_egg
        - turtle_spawn_egg
        - vex_spawn_egg
        - villager_spawn_egg
        - vindicator_spawn_egg
        - wandering_trader_spawn_egg
        - warden_spawn_egg
        - witch_spawn_egg
        - wither_skeleton_spawn_egg
        - wolf_spawn_egg
        - zoglin_spawn_egg
        - zombie_spawn_egg
        - zombie_horse_spawn_egg
        - zombie_villager_spawn_egg
        - zombified_piglin_spawn_egg

entities_list:
    type: data
    entities:
        allowed:
        - allay
        - armadillo
        - axolotl
        - bat
        - bee
        - bogged
        - blaze
        - breeze
        - camel
        - cat
        - cave_spider
        - chicken
        - cod
        - cow
        - creaking
        - creeper
        - dolphin
        - donkey
        - drowned
        - elder_guardian
        - ender_dragon
        - enderman
        - endermite
        - evoker
        - fox
        - frog
        - ghast
        - giant
        - glow_squid
        - goat
        - guardian
        - hoglin
        - horse
        - husk
        - illusioner
        - iron_golem
        - llama
        - magma_cube
        - mooshroom
        - mule
        - ocelot
        - panda
        - parrot
        - phantom
        - pig
        - piglin
        - piglin_brute
        - pillager
        - player
        - polar_bear
        - pufferfish
        - rabbit
        - ravager
        - salmon
        - sheep
        - shulker
        - silverfish
        - skeleton
        - skeleton_horse
        - slime
        - sniffer
        - snow_golem
        - spider
        - squid
        - stray
        - strider
        - tadpole
        - trader_llama
        - tropical_fish
        - turtle
        - vex
        - villager
        - vindicator
        - wandering_trader
        - warden
        - witch
        - wither
        - wither_skeleton
        - wolf
        - zoglin
        - zombie
        - zombie_horse
        - zombie_villager
        - zombified_piglin
        tracking:
        - bogged
        - blaze
        - breeze
        - cave_spider
        - creaking
        - creeper
        - drowned
        - elder_guardian
        - ender_dragon
        - enderman
        - endermite
        - evoker
        - ghast
        - guardian
        - hoglin
        - husk
        - illusioner
        - magma_cube
        - player
        - piglin
        - piglin_brute
        - pillager
        - ravager
        - shulker
        - silverfish
        - skeleton
        - slime
        - spider
        - vex
        - vindicator
        - warden
        - witch
        - wither
        - wither_skeleton
        - zoglin
        - zombie
        - zombie_villager
        - zombified_piglin