archer_quest_data:
    type: data
    quests:
        joining_the_keep:
            name: Joining the Keep
            giver: Elarik
            return_npc: Elarik
            description: Complete the tasks given to you by Elarik to become an Archer Initiate.
            objectives:
                1:
                    description: Shoot and kill 30 hostile mobs
                    required: 30
                2:
                    description: Shoot and kill 10 mobs, passive or hostile, from a distance of at least 30 blocks
                    required: 10
                3:
                    description: Return to Elarik
                    required: 0
        proper_equipment:
            name: Proper Equipment
            giver: Elarik
            return_npc: Elarik
            description: Purchase the necessary equipment from James the Tailor in Shaleight.
            objectives:
                1:
                    description: Find James Goodwin in Shaleight
                    required: 0
                2:
                    description: Purchase the Keep's standard uniform for Archer Initiates
                    required: 1
                3:
                    description: Return to Elarik
                    required: 0
        the_keep:
            name: The Keep
            giver: Elarik
            return_npc: Petra
            description: Speak to Petra near Wayfair Keep.
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

archer_quest_scripts:
    type: world
    debug: false
    events:
        on player kills entity flagged:quests.archer.joining_the_keep:
        - if <context.cause> == projectile:
            - if <context.projectile.entity_type> == arrow:
                - if <player.location.distance[<context.entity.location>]> >= 30:
                    - flag <player> quests.archer.joining_the_keep.objectives.2:++
                    - define obj2 <player.flag[quests.archer.joining_the_keep.objectives.2]>
                    - define obj1 <player.flag[quests.archer.joining_the_keep.objectives.1]>
                    - if <[obj2]> == 10:
                        - toast targets:<player> icon:spectral_arrow "<&6>Quest: Joining the Keep <&7>Objective #2 complete!"
                        - if <[obj1]> > 29 && <[obj2]> > 9:
                            - toast targets:<player> icon:spectral_arrow "<&6>Quest: Joining the Keep <&7>Return to Elarik."
                            - stop
                - if <context.entity.is_monster>:
                    - flag <player> quests.archer.joining_the_keep.objectives.1:++
                    - define obj1 <player.flag[quests.archer.joining_the_keep.objectives.1]>
                    - define obj2 <player.flag[quests.archer.joining_the_keep.objectives.2]>
                    - if <[obj1]> == 30:
                        - toast targets:<player> icon:spectral_arrow "<&6>Quest: Joining the Keep <&7>Objective #1 complete!"
                        - if <[obj1]> > 29 && <[obj2]> > 9:
                            - toast targets:<player> icon:spectral_arrow "<&6>Quest: Joining the Keep <&7>Return to Elarik."
                            - stop
                - else:
                    - stop
            - else:
                - stop
        - else:
            - stop