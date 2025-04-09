shroud_quest_data:
    type: data
    quests:
        joining_the_keep:
            name: Joining the Keep
            giver: Medalia
            return_npc: Medalia
            description: Complete the tasks given to you to become a Shroud Initiate.
            objectives:
                1:
                    description: TODO
                    required: 0
                2:
                    description: TODO
                    required: 0
                3:
                    description: Return to Medalia
                    required: 0
        proper_equipment:
            name: Proper Equipment
            giver: Medalia
            return_npc: Medalia
            description: Purchase the necessary equipment from Miguel in Shaleight Township.
            objectives:
                1:
                    description: Find Miguel in Shaleight
                    required: 0
                2:
                    description: Purchase the Keep's standard uniform for Miguel Initiates
                    required: 1
                3:
                    description: Return to Medalia
                    required: 0
        the_keep:
            name: The Keep
            giver: Medalia
            return_npc: Petra
            description: Meet your mentor at Wayfair Keep.
            objectives:
                1:
                    description: Ensure your documents are in order and travel via Atlas to Wayfair Keep
                    required: 0
                2:
                    description: Speak with Petra
                    required: 0
                3:
                    description: Find and speak with your mentor
                    required: 0

shroud_quest_scripts:
    type: world
    debug: false
    events:
        on player kills entity flagged:quests.shroud.joining_the_keep:
        - if <player.item_in_hand> matches axe && <context.entity.is_monster> && <player.vehicle.entity_type> == horse:
            - flag <player> quests.shroud.joining_the_keep.objectives.2:++
            - if <player.flag[quests.shroud.joining_the_keep.objectives.2]> == 25:
                - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Objective #2 complete!"
                - if <player.flag[quests.shroud.joining_the_keep.objectives.1]> > 2:
                    - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Return to Medalia!"
        - else:
            - stop
        on player tames horse flagged:quests.shroud.joining_the_keep:
        - if <context.entity.flag[tame_attempt]> <= 3:
            - flag <context.entity> tame_attempt:!
            - flag <player> quests.shroud.joining_the_keep.objectives.1:++
            - if <player.flag[quests.shroud.joining_the_keep.objectives.1]> == 3:
                - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Objective #1 complete!"
                - if <player.flag[quests.shroud.joining_the_keep.objectives.2]> > 24:
                    - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Return to Medalia!"
        - else:
            - flag <context.entity> tame_attempt:!
            - stop
        on player right clicks horse with:apple flagged:quests.shroud.joining_the_keep:
        - flag <context.entity> tame_attempt:++