#ALL ITEMS SHOULD HAVE A UNIQUE FOUR-DIGIT CUSTOM MODEL DATA ID BEGINNING WITH THREE (3).
#LATEST CUSTOM MODEL DATA NUMBER -> 3002

earmuffs:
    type: item
    material: leather_helmet
    display name: <&8>Earmuffs
    mechanisms:
        custom_model_data: 3001
    lore:
        - <&7><&o>Protection against the lil' buggers.
    allow in material recipes: false
    recipes:
        1:
            type: shaped
            output_quantity: 1
            input:
            - string|rabbit_hide|string
            - leather|mandrake_root|leather
            - air|air|air

absyntheastralhattest:
    type: item
    material: netherite_helmet
    display name: <&5>Absynthe's Astral Hat
    mechanisms:
        custom_model_data: 3002
    lore:
        - <&7><&o>
    allow in material recipes: false

# SCRIPTS BELOW THIS POINT

earmuffs_flag:
    type: world
    debug: false
    events:
        on player equips earmuffs:
        - flag <player> muffed
        on player unequips earmuffs:
        - flag <player> muffed:!

earmuffs_action:
    type: task
    script:
    - cast confusion <server.players_flagged[muffed]> remove