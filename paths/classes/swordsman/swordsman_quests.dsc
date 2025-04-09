swordsman_quest_data:
    type: data
    quests:
        joining_the_keep:
            name: Joining the Keep
            giver: Lieutenant Greene
            return_npc: Lieutenant Greene
            description: Complete the tasks given to you to become a Swordsman Initiate.
            objectives:
                1:
                    description: Kill 30 hostile mobs in a sweeping attack
                    required: 30
                2:
                    description: Kill 10 skeletal warriors, armored spiders, or undead guards
                    required: 10
                3:
                    description: Return to Lieutenant Greene
                    required: 0
            quest_data:
                obj2_entities:
                    - armored_spider
                    - undead_guard
                    - skeletal_warrior
        proper_equipment:
            name: Proper Equipment
            giver: Lieutenant Greene
            return_npc: Lieutenant Greene
            description: Purchase the necessary equipment from Gus the Blacksmith in Shaleight.
            objectives:
                1:
                    description: Find Gus Hartland in Shaleight
                    required: 0
                2:
                    description: Purchase the Keep's standard uniform for Swordsman Initiates
                    required: 1
                3:
                    description: Return to Lieutenant Greene
                    required: 0
        the_keep:
            name: The Keep
            giver: Lieutenant Greene
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

swordsman_quest_scripts:
    type: world
    debug: false
    events:
        on player kills entity flagged:quests.swordsman.joining_the_keep:
        - if <player.item_in_hand> matches *_sword && ( <context.entity.is_monster> || <context.entity.script.name> in <script[swordsman_quest_data].data_key[quests.joining_the_keep.quest_data.obj2_entities]> ):
            - if <context.cause> == entity_sweep_attack:
                - flag <player> quests.swordsman.joining_the_keep.objectives.1:++
                - define obj1 <player.flag[quests.swordsman.joining_the_keep.objectives.1]>
                - if <context.entity.script.name> in <script[swordsman_quest_data].data_key[quests.joining_the_keep.quest_data.obj2_entities]>:
                    - flag <player> quests.swordsman.joining_the_keep.objectives.2:++
                    - define obj2 <player.flag[quests.swordsman.joining_the_keep.objectives.2]>
                - if <[obj1]> == 30:
                    - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Objective #1 complete!"
                    - if <[obj1]> > 29 && <[obj2]> > 9:
                        - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Return to Lieutenant Greene!"
                - if <[obj2]> == 10:
                    - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Objective #2 complete!"
                    - if <[obj1]> > 29 && <[obj2]> > 9:
                        - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Return to Lieutenant Greene!"
            - if <context.entity.script.name> in <script[swordsman_quest_data].data_key[quests.joining_the_keep.quest_data.obj2_entities]> && <context.cause> != entity_sweep_attack:
                - flag <player> quests.swordsman.joining_the_keep.objectives.2:++
                - define obj1 <player.flag[quests.swordsman.joining_the_keep.objectives.1]>
                - define obj2 <player.flag[quests.swordsman.joining_the_keep.objectives.2]>
                - if <[obj2]> == 10:
                    - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Objective #2 complete!"
                    - if <[obj1]> > 29 && <[obj2]> > 9:
                        - toast targets:<player> icon:iron_sword "<&6>Quest: Joining the Keep <&7>Return to Lieutenant Greene!"
            - else:
                - stop
        - else:
            - stop