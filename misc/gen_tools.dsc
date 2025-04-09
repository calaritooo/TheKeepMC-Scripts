#ALL ITEMS SHOULD HAVE A UNIQUE FOUR-DIGIT CUSTOM MODEL DATA ID BEGINNING WITH FOUR (4).
#LATEST CUSTOM MODEL DATA NUMBER -> 4007

botanists_clippers:
    type: item
    material: stick
    display name: <&d>Botanist's Clippers
    lore:
        - <&7><&o>A fine pair of clippers,
        - <&7><&o>if you know what to do with 'em!
    allow in material recipes: false
    recipes:
        1:
            type: shapeless
            input: herbal_paste|shears
    mechanisms:
        hides: ALL
        custom_model_data: 4001
    flags:
        botanists_clippers: true

botanists_clippers_actions:
    type: world
    debug: false
    events:
        after player breaks seagrass with:botanists_clippers chance:2:
        - if <player.cursor_on[5].biome.name> == river:
            - drop water_artichoke location:<player.cursor_on> quantity:1
        - else:
            - stop
        after player breaks vine with:botanists_clippers chance:2:
        - if <player.cursor_on[5].biome.name> == jungle || <player.cursor_on[5].biome.name> == sparse_jungle:
            - drop poison_ivy location:<player.cursor_on> quantity:1
        - else:
            - stop
        after player breaks dead_bush with:botanists_clippers chance:2:
        - if <player.cursor_on[5].biome.name> == desert || <player.cursor_on[5].biome.name> == eroded_badlands || <player.cursor_on[5].biome.name> == wooded_badlands || <player.cursor_on[5].biome.name> == badlands:
            - drop dryroot location:<player.cursor_on> quantity:1
        - else:
            - stop
        after player breaks short_grass with:botanists_clippers chance:2:
        - if <player.cursor_on[5].biome.name> in <script[biomelists].data_key[biomes.forests]>:
            - drop wormwood location:<player.cursor_on> quantity:1
        - if <player.cursor_on[5].biome.name> == plains || <player.cursor_on[5].biome.name> == sunflower_plains || <player.cursor_on[5].biome.name> == flower_forest || <player.cursor_on[5].biome.name> == meadow || <player.cursor_on[5].biome.name> == lush_cave:
            - random:
                - drop wolfsbane location:<player.cursor_on> quantity:1
                - drop lovers_longing location:<player.cursor_on> quantity:1
        - if <player.cursor_on[5].biome.name> == swamp || <player.cursor_on[5].biome.name> == mangrove_swamp || <player.cursor_on[5].biome.name> == jungle || <player.cursor_on[5].biome.name> == dark_forest || <player.cursor_on[5].biome.name> == lush_cave || <player.cursor_on[5].biome.name> == sparse_jungle:
            - drop mystdew location:<player.cursor_on> quantity:1
        - if <player.cursor_on[5].biome.name> == swamp || <player.cursor_on[5].biome.name> == mangrove_swamp || <player.cursor_on[5].biome.name> == dark_forest:
            - drop belladonna location:<player.cursor_on> quantity:1
        - else:
            - stop
        after player breaks poppy with:botanists_clippers chance:1:
        - drop elysias_allure location:<player.cursor_on> quantity:1

bone_needle:
    type: item
    material: stick
    display name: Bone Needle
    lore:
        - <&7><&o>Used for extracting blood.
    allow in material recipes: false
    mechanisms:
        hides: ALL
        custom_model_data: 4002

bone_needle_actions:
    type: world
    debug: true
    events:
        on player damages player with:bone_needle:
        - ratelimit <player> 2s
        - if ( <context.entity.food_level> > 6 ) && ( <player.inventory.contains_item[name_tag]> ) && ( <player.inventory.contains_item[glass_bottle]> ) && ( !<context.entity.has_permission[bloods.vampire.passives]> ) && ( <player.is_sneaking> ) && ( !<context.entity.has_flag[drained]> ):
            - playsound <player.location> sound:item.honey_bottle.drink
            - take item:glass_bottle quantity:1
            - take item:name_tag quantity:1
            - give item:human_blood_tagged quantity:1
            - define tagged_slot <player.inventory.find_item[human_blood_tagged]>
            - inventory flag slot:<[tagged_slot]> tagged_player:<context.entity.name>
            - inventory adjust slot:<[tagged_slot]> "lore:<&7><&o>Carefully extracted for the<&nl><&7><&o>right reasons surely...<&nl><&nl><&7><&o>Collected from <context.entity.name>."
            - cast confusion target:<context.entity> amplifier:0 duration:10 no_ambient no_clear no_icon hide_particles
            - feed <context.entity> amount:-6 saturation:-3
            - flag <context.entity> drained expire:5m
            - narrate targets:<context.entity> "<&7>You suddenly feel faint.."
        - else if !<context.entity.food_level> > 6:
            - actionbar "<&c>This player does not have enough blood!"
        - else if !<player.inventory.contains_item[glass_bottle]> || !<player.inventory.contains_item[name_tag]>:
            - actionbar "<&c>You must have an empty glass bottle and a name tag!"
        - else if <context.entity.has_permission[bloods.vampire.passives]>:
            - actionbar "<&c>You cannot collect blood from this player!"
        - else if <context.entity.has_flag[drained]>:
            - actionbar "<&c>You cannot collect blood that fast!"
        - else:
            - actionbar "<&c>You cannot collect blood from this player!"

daily_reward_voucher:
    type: item
    material: paper
    display name: <&d>Daily Reward Voucher
    lore:
        - <&7><&o>Exchange me for something special!
    allow in material recipes: false
    mechanisms:
        hides: ALL
        custom_model_data: 4003

ritual_dagger:
    type: item
    material: stick
    display name: <&e>Ritual Dagger
    lore:
        - <&7><&o>Useful for numerous
        - <&7><&o>witchy applications.
    mechanisms:
        hides: ALL
        custom_model_data: 4004

wayfinders_guide:
    type: item
    material: enchanted_book
    display name: <&5>The Wayfinder's Guide
    lore:
        - <&7><&o>Your means of travel
        - <&7><&o>throughout the realm!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 4005

divining_rod:
    type: item
    material: stick
    display name: <&5>Divining Rod
    lore:
        - <&7><&o>Only those adept in its
        - <&7><&o>knowledge can maneuver it..
    mechanisms:
        hides: ALL
        custom_model_data: 4006