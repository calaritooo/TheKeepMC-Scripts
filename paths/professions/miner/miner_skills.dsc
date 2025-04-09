miner_skill_book_chipping_away:
    type: item
    material: enchanted_book
    display name: <&d>Skill: Chipping Away
    lore:
        - <&7><&o>Gain a slight chance of an extra drop
        - <&7><&o>while mining any ore.
        - <empty>
        - <&7><&o>- Profession: <&f>Miner
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

miner_skill_book_that_extra_sparkle:
    type: item
    material: enchanted_book
    display name: <&d>Skill: That Extra Sparkle
    lore:
        - <&7><&o>Gain a slight chance of earning some
        - <&7><&o>experience mining any ore.
        - <empty>
        - <&7><&o>- Profession: <&f>Miner
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

miner_skill_book_excavating:
    type: item
    material: enchanted_book
    display name: <&d>Skill: Excavating
    lore:
        - <&7><&o>Gain a slight chance of finding
        - <&7><&o>hidden or wedged objects whiling mining.
        - <empty>
        - <&7><&o>- Profession: <&f>Miner
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

sb_miner_world_script:
    type: world
    debug: false
    events:
        after player breaks *_ore with:*_pickaxe chance:2 flagged:professions.miner.skills.chipping_away:
        - if <context.material.name> == coal_ore:
                - drop coal location:<context.location> quantity:<util.random.int[1].to[2]>
        - else if <context.material.name> == iron_ore:
                - drop raw_iron location:<context.location> quantity:<util.random.int[1].to[2]>
        - else if <context.material.name> == gold_ore:
                - drop raw_gold location:<context.location> quantity:1
        - else if <context.material.name> == diamond_ore:
                - drop diamond location:<context.location> quantity:1
        - else if <context.material.name> == emerald_ore:
                - drop emerald location:<context.location> quantity:1
        - else if <context.material.name> == copper_ore:
                - drop raw_copper location:<context.location> quantity:<util.random.int[1].to[2]>
        - else if <context.material.name> == ancient_debris:
                - drop ancient_debris location:<context.location> quantity:1
        - else if <context.material.name> == nether_gold_ore:
                - drop raw_gold location:<context.location> quantity:1
        after player breaks *_ore with:*_pickaxe chance:2 flagged:professions.miner.skills.that_extra_sparkle:
        - drop xp <context.location> quantity:<util.random.decimal[0.5].to[5]>
        after player breaks stone|granite|diorite|andesite|deepslate|tuff|*_ore with:*_pickaxe chance:2 flagged:professions.miner.skills.excavating:
        - random:
            - drop bone location:<context.location> quantity:1
            - drop flint location:<context.location> quantity:1
            - drop cavern_mucus location:<context.location> quantity:1
            - drop charcoal location:<context.location> quantity:1
            - drop amethyst_shard location:<context.location> quantity:1