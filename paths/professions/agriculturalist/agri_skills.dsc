agriculturalist_skill_book_harvest_season:
    type: item
    material: enchanted_book
    display name: <&d>Skill: Harvest Season
    lore:
        - <&7><&o>Gain a slight chance of an
        - <&7><&o>extra drop while harvesting.
        - <empty>
        - <&7><&o>- Profession: <&f>Agriculturalist
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

agriculturalist_skill_book_farmhands_luck:
    type: item
    material: enchanted_book
    display name: <&d>Skill: Farmhand's Luck
    lore:
        - <&7><&o>While harvesting mature crops, you have a
        - <&7><&o>slight chance of gaining some experience.
        - <empty>
        - <&7><&o>- Profession: <&f>Agriculturalist
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

agriculturalist_skill_book_buried_treasure:
    type: item
    material: enchanted_book
    display name: <&d>Skill: Buried Treasure
    lore:
        - <&7><&o>Upon harvesting mature crops,
        - <&7><&o>you stumble upon lost treasures.
        - <empty>
        - <&7><&o>- Profession: <&f>Agriculturalist
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

sb_agriculturalist_world_script:
    type: world
    debug: false
    events:
        on player breaks wheat chance:1 flagged:professions.agriculturalist.skills.harvest_season:
        - if <context.material.age> >= 7:
                - drop wheat location:<context.location> quantity:<util.random.int[1].to[2]>
        - else:
            - stop
        on player breaks potatoes chance:1 flagged:professions.agriculturalist.skills.harvest_season:
        - if <context.material.age> >= 7:
                - drop potato location:<context.location> quantity:<util.random.int[1].to[2]>
        - else:
            - stop
        on player breaks carrots chance:1 flagged:professions.agriculturalist.skills.harvest_season:
        - if <context.material.age> >= 7:
                - drop carrot location:<context.location> quantity:<util.random.int[1].to[2]>
        - else:
            - stop
        on player breaks beetroots chance:1 flagged:professions.agriculturalist.skills.harvest_season:
        - if <context.material.age> >= 3:
                - drop beetroot location:<context.location> quantity:<util.random.int[1].to[2]>
        - else:
            - stop
        on player breaks wheat|carrots|potatoes chance:1 flagged:professions.agriculturalist.skills.farmhands_luck:
        - if <context.material.age> >= 7:
            - drop xp <context.location> quantity:<util.random.decimal[0.2].to[2.5]>
        - else:
            - stop
        on player breaks beetroots chance:1 flagged:professions.agriculturalist.skills.farmhands_luck:
        - if <context.material.age> >= 3:
            - drop xp <context.location> quantity:<util.random.decimal[0.2].to[1.5]>
        - else:
            - stop
        on player breaks wheat|carrots|potatoes chance:0.3 flagged:professions.agriculturalist.skills.buried_treasure:
        - if <context.material.age> >= 7:
            - random:
                - drop bone location:<context.location> quantity:1
                - drop flint location:<context.location> quantity:1
                - drop raw_iron location:<context.location> quantity:1
                - drop charcoal location:<context.location> quantity:1
        - else:
            - stop
        on player breaks beetroots chance:0.3 flagged:professions.agriculturalist.skills.buried_treasure:
        - if <context.material.age> >= 3:
            - random:
                - drop bone location:<context.location> quantity:1
                - drop flint location:<context.location> quantity:1
                - drop raw_iron location:<context.location> quantity:1
                - drop charcoal location:<context.location> quantity:1
        - else:
            - stop