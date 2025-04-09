fisherman_skill_book_lucky_catch:
    type: item
    material: enchanted_book
    display name: <&d>Skill: Lucky Catch
    lore:
        - <&7><&o>Gain a slight chance of an
        - <&7><&o>extra catch while fishing.
        - <empty>
        - <&7><&o>- Profession: <&f>Fisherman
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

fisherman_skill_book_getting_the_hang_of_it:
    type: item
    material: enchanted_book
    display name: <&d>Skill: Getting the Hang of it
    lore:
        - <&7><&o>Gain a slight chance of earning some
        - <&7><&o>experience while fishing.
        - <empty>
        - <&7><&o>- Profession: <&f>Fisherman
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

fisherman_skill_book_some_spare_change:
    type: item
    material: enchanted_book
    display name: <&d>Skill: Some Spare Change
    lore:
        - <&7><&o>Gain a slight chance of reeling
        - <&7><&o>in some loose change.
        - <empty>
        - <&7><&o>- Profession: <&f>Fisherman
        - <&7><&o>- Required Training: <&f>Novice
    allow in material recipes: false

sb_fisherman_world_script:
    type: world
    debug: false
    events:
        after player fishes entity chance:2 flagged:professions.fisherman.skills.lucky_catch:
        - random:
            - drop raw_iron location:<player.location> quantity:1
            - drop gold_nugget location:<player.location> quantity:<util.random.int[1].to[3]>
            - drop diamond location:<player.location> quantity:1
            - drop emerald location:<player.location> quantity:1
            - drop lapis_lazuli location:<player.location> quantity:1
        after player fishes entity chance:3 flagged:professions.fisherman.skills.getting_the_hang_of_it:
        - drop xp location:<player.location> quantity:<util.random.decimal[0.5].to[4]>
        after player fishes entity chance:2 flagged:professions.fisherman.skills.some_spare_change:
        - money give quantity:<util.random.decimal[0.01].to[0.50]>
        - actionbar targets:<player> "<&7>You found some spare change!"