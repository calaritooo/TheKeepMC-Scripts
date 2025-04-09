medaliainteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township && <player.flag[peter]> == shroud && ( <player.flag[classes].is_empty> || !<player.has_flag[classes]> ):
                    - chat "Peter told me, you want to be a Shroud? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 2
                - else if !<player.flag[classes].is_empty> && <player.has_flag[classes]>:
                    - chat "You're already initiated a class, denounce and let Peter know once you have to become a Shroud"
                    - zap 1
                - else if <player.has_flag[quests.shroud.joining_the_keep]>:
                    - if <player.flag[quests.shroud.joining_the_keep.objectives.1]> >= 30 && <player.flag[quests.shroud.joining_the_keep.objectives.2]> >= 10:
                        - run completed_quest_handler def.type:shroud def.quest:joining_the_keep
                        - money give quantity:5
                        - narrate "<&7>You have received <&a>₮5.00"
                        - wait 3s
                        - chat "Well done, shall we procede? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 4
                    - else:
                        - run unfinished_quest_handler def.type:shroud def.quest:joining_the_keep
                - else if <player.has_flag[completed_quests.shroud.joining_the_keep]> && <player.has_flag[quests.shroud.proper_equipment]>:
                    - if <player.inventory.contains_item[shroud_uniform_*].quantity[4]>:
                        - run completed_quest_handler def.type:shroud def.quest:proper_equipment
                        - wait 3s
                        - chat "Perfect, last time I'll ask, is the Shroud right for you? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 5
                    - else:
                        - run unfinished_quest_handler def.type:shroud def.quest:proper_equipment
                - else if <player.has_flag[completed_quests.shroud.proper_equipment]> && <player.has_flag[quests.shroud.the_keep]>:
                    - run unfinished_quest_handler def.type:shroud def.quest:the_keep
                - else:
                    - chat "You'll need to talk to Peter in Fort Wakers to become a Shroud."
                    - zap 1
        2:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Well, we like to keep things light, quick, and simple. We're most powerful when we're aware, so the tasks before you are simple but dangerous."
                    - wait 3s
                    - chat "The more in touch you are with your limits, the better a Shroud you'll become. Shall we continue? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Don't worry. It's not always as easy as 'yes'. Let Peter know if you choose otherwise."
                    - flag <player> peter:!
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if !<player.has_flag[quests.shroud.joining_the_keep]>:
                        - flag <player> peter:!
                        - chat "See me when you've completed them."
                        - wait 1.5s
                        - run new_quest_handler def.type:shroud def.quest:joining_the_keep
                        - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Don't worry. It's not always as easy as 'yes'. Let Peter know if you choose otherwise."
                    - flag <player> peter:!
                    - zap 1
        4:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Sounds like you're fit for the rags. Ask James the Tailor in his shop."
                    - wait 3s
                    - run new_quest_handler def.type:shroud def.quest:proper_equipment
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Don't worry. It's not always as easy as 'yes'. Let Peter know if you choose otherwise."
                    - flag <player> quests.shroud:!
                    - flag <player> completed_quests.shroud:!
                    - zap 1
        5:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "I've got your documents registered, let Atlas know you're ready and speak to Petra when you arrive at the Keep. Bye for now."
                    - wait 2s
                    - flag <player> permtravelpass:->:wayfairkeep
                    - flag <player> classes.shroud
                    - flag <player> petra:shroud
                    - run new_quest_handler def.type:shroud def.quest:the_keep
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Don't worry. It's not always as easy as 'yes'. Let Peter know if you choose otherwise."
                    - flag <player> quests.shroud:!
                    - flag <player> completed_quests.shroud:!
                    - zap 1
