axeguard_quest_data:
    type: data
    quests:
        joining_the_keep:
            name: Joining the Keep
            giver: Logan
            return_npc: Logan
            description: Complete the tasks given to you to become a Axeguard Initiate.
            objectives:
                1:
                    description: Tame 3 horses in less than 3 attempts
                    required: 3
                2:
                    description: Kill 25 hostile mobs with an axe while mounted on a horse
                    required: 25
                3:
                    description: Return to Logan
                    required: 0
        proper_equipment:
            name: Proper Equipment
            giver: Logan
            return_npc: Logan
            description: Purchase the necessary equipment from Davis the Stablemaster in Camp Cinder.
            objectives:
                1:
                    description: Find Davis in Camp Cinder
                    required: 0
                2:
                    description: Purchase the Keep's standard uniform for Axeguard Initiates
                    required: 1
                3:
                    description: Return to Logan
                    required: 0
        the_keep:
            name: The Keep
            giver: Logan
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

axeguard_quest_scripts:
    type: world
    debug: false
    events:
        on player kills entity flagged:quests.axeguard.joining_the_keep:
        - if <player.item_in_hand> matches axe && <context.entity.is_monster> && <player.vehicle.entity_type> == horse:
            - flag <player> quests.axeguard.joining_the_keep.objectives.2:++
            - if <player.flag[quests.axeguard.joining_the_keep.objectives.2]> == 25:
                - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Objective #2 complete!"
                - if <player.flag[quests.axeguard.joining_the_keep.objectives.1]> > 2:
                    - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Return to Logan!"
        - else:
            - stop
        on player tames horse flagged:quests.axeguard.joining_the_keep:
        - if <context.entity.flag[tame_attempt]> <= 3:
            - flag <context.entity> tame_attempt:!
            - flag <player> quests.axeguard.joining_the_keep.objectives.1:++
            - if <player.flag[quests.axeguard.joining_the_keep.objectives.1]> == 3:
                - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Objective #1 complete!"
                - if <player.flag[quests.axeguard.joining_the_keep.objectives.2]> > 24:
                    - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Return to Logan!"
        - else:
            - flag <context.entity> tame_attempt:!
            - stop
        on player right clicks horse with:apple flagged:quests.axeguard.joining_the_keep:
        - flag <context.entity> tame_attempt:++