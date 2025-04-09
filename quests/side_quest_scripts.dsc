side_quest_data:
    type: data
    quests:
        something_hot_to_drink:
            name: Something Hot to Drink
            giver: Rhodes
            return_npc: Rhodes
            money_reward: 1.5
            description: Bring Rhodes a perfectly brewed Chamomile Tea
            objectives:
                1:
                    description: Brew or obtain a perfect Chamomile Tea
                    required: 0
                2:
                    description: Return to Rhodes
                    required: 0
        links_of_valor:
            name: Links of Valor
            giver: Lorath
            return_npc: Lorath
            money_reward: 1.75
            description: Craft and bring Lorath a new set of Chainmail Armor
            objectives:
                1:
                    description: Craft a set of Chainmail Armor
                    required: 4
                2:
                    description: Return to Lorath
                    required: 0
        taking_the_edge_off:
            name: Taking the Edge off
            giver: Nicholas
            return_npc: Nicholas, Lieutenant Greene
            money_reward: 2.5
            description: Find or purchase Belladonna for Nicholas or report him
            objectives:
                1:
                    description: Obtain Belladonna or report Nicholas to Lia
                    required: 0
                2:
                    description: Return to Nicholas or Lieutenant Greene
                    required: 0
        mouths_to_feed:
            name: Mouths to Feed
            giver: Lizzie
            return_npc: Lizzie
            money_reward: 2.15
            description: Catch 15 salmon and take them to Laura in the mess tent
            objectives:
                1:
                    description: Catch 15 salmon
                    required: 15
                2:
                    description: Take the salmon to Laura
                    required: 0
                3:
                    description: Return to Lizzie
                    required: 0

side_quest_scripts:
    type: world
    debug: false
    events:
        on player crafts chainmail_* flagged:quests.side.links_of_valor:
        - flag <player> quests.side.links_of_valor.objectives.1:++
        - if <player.flag[quests.side.links_of_valor.objectives.1]> == 4:
            - run objective_completion_handler def.type:side def.quest:links_of_valor def.obj:1
        on player fishes salmon flagged:quests.side.mouths_to_feed:
        - flag <player> quests.side.mouths_to_feed.objectives.1:++
        - if <player.flag[quests.side.mouths_to_feed.objectives.1]> == 15:
            - run objective_completion_handler def.type:side def.quest:mouths_to_feed def.obj:1