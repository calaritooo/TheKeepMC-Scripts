woodsman_skill_book_sharper_edge:
    type: item
    material: enchanted_book
    display name: <&d>Skill: A Sharper Edge
    lore:
        - <&7><&o>Gain a slight chance of an extra drop
        - <&7><&o>while chopping wood of any kind.
        - <empty>
        - <&7><&o>- Profession: <&f>Woodsman
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

woodsman_skill_book_onthejob_training:
    type: item
    material: enchanted_book
    display name: <&d>Skill: On-the-job Training
    lore:
        - <&7><&o>Gain a slight chance of earning some
        - <&7><&o>experience chopping wood of any kind.
        - <empty>
        - <&7><&o>- Profession: <&f>Woodsman
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

woodsman_skill_book_extra_fruitful:
    type: item
    material: enchanted_book
    display name: <&d>Skill: Extra Fruitful
    lore:
        - <&7><&o>Gain a slight chance of receiving
        - <&7><&o>extra drops from leaves.
        - <empty>
        - <&7><&o>- Profession: <&f>Woodsman
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

sb_woodsman_world_script:
    type: world
    debug: false
    events:
        after player breaks *_log with:*_axe chance:3 flagged:professions.woodsman.skills.a_sharper_edge:
        - drop <context.material> location:<context.location> quantity:<util.random.int[1].to[3]>
        after player breaks *_log with:*_axe chance:2.5 flagged:professions.woodsman.skills.on_the_job_training:
        - drop xp <context.location> quantity:<util.random.decimal[0.5].to[2]>
        after player breaks *_leaves with:*_axe chance:3 flagged:professions.woodsman.skills.extra_fruitful:
        - random:
            - drop apple location:<context.location> quantity:1
            - drop orange location:<context.location> quantity:1
            - drop stick location:<context.location> quantity:1
            - drop stick location:<context.location> quantity:2
        after player breaks *_leaves with:*_axe chance:2 flagged:professions.woodsman.skills.extra_fruitful:
        - if <context.material.name> == oak_leaves:
                - drop oak_sapling location:<context.location> quantity:1
        - else if <context.material.name> == spruce_leaves:
                - drop spruce_sapling location:<context.location> quantity:1
        - else if <context.material.name> == birch_leaves:
                - drop birch_sapling location:<context.location> quantity:1
        - else if <context.material.name> == jungle_leaves:
                - drop jungle_sapling location:<context.location> quantity:1
        - else if <context.material.name> == acacia_leaves:
                - drop acacia_sapling location:<context.location> quantity:1
        - else if <context.material.name> == dark_oak_leaves:
                - drop dark_oak_sapling location:<context.location> quantity:1
        - else if <context.material.name> == cherry_leaves:
                - drop cherry_sapling location:<context.location> quantity:1