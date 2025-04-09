loganinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township && <player.flag[peter]> == axeguard && ( <player.flag[classes].is_empty> || !<player.has_flag[classes]> ):
                    - chat "I heard from Peter! You wantin' to be a Wayfair Axeguard? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 2
                - else if !<player.flag[classes].is_empty> && <player.has_flag[classes]>:
                    - chat "It looks like you've already initiated in another class. Denounce it and let Peter know."
                    - zap 1
                - else if <player.has_flag[quests.axeguard.joining_the_keep]>:
                    - if <player.flag[quests.axeguard.joining_the_keep.objectives.1]> >= 30 && <player.flag[quests.axeguard.joining_the_keep.objectives.2]> >= 10:
                        - run completed_quest_handler def.type:axeguard def.quest:joining_the_keep
                        - money give quantity:5
                        - narrate "<&7>You have received <&a>₮5.00"
                        - wait 3s
                        - chat "Well done! To be honest I didn't have much faith... you still in? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 4
                    - else:
                        - run unfinished_quest_handler def.type:axeguard def.quest:joining_the_keep
                - else if <player.has_flag[completed_quests.axeguard.joining_the_keep]> && <player.has_flag[quests.axeguard.proper_equipment]>:
                    - if <player.inventory.contains_item[axeguard_uniform_*].quantity[4]>:
                        - run completed_quest_handler def.type:axeguard def.quest:proper_equipment
                        - wait 3s
                        - chat "Lookin' good! Final chance, if the Axeguard still the right path for you? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 5
                    - else:
                        - run unfinished_quest_handler def.type:axeguard def.quest:proper_equipment
                - else if <player.has_flag[completed_quests.axeguard.proper_equipment]> && <player.has_flag[quests.axeguard.the_keep]>:
                    - run unfinished_quest_handler def.type:axeguard def.quest:the_keep
                - else:
                    - chat "I train Wayfair Axeguards. To become one, speak with Peter at Fort Wakers!"
                    - zap 1
        2:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "So let's get started then. I hope you know a thing or two about axes and horses, sometimes animals in general. That's the sum of what we're good at!"
                    - wait 3s
                    - chat "The first task involves some swinging and domesticating. Good with you? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Okay, no worries. Just let Peter know if you'd like to try again some time."
                    - flag <player> peter:!
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if !<player.has_flag[quests.axeguard.joining_the_keep]>:
                        - flag <player> peter:!
                        - chat "Here it is! The first tasks, come back when you're finished."
                        - wait 1.5s
                        - run new_quest_handler def.type:axeguard def.quest:joining_the_keep
                        - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Okay, no worries. Just let Peter know if you'd like to try again some time."
                    - flag <player> peter:!
                    - zap 1
        4:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Okay, visit the Davis in Camp Cinder for your gear. He runs the stables but is one of us."
                    - wait 3s
                    - run new_quest_handler def.type:axeguard def.quest:proper_equipment
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Okay, no worries. Just let Peter know if you'd like to try again some time."
                    - flag <player> quests.axeguard:!
                    - flag <player> completed_quests.axeguard:!
                    - zap 1
        5:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "I've got your documents registered, speak to Atlas and off you go! Best of luck."
                    - wait 2s
                    - flag <player> permtravelpass:->:wayfairkeep
                    - flag <player> classes.axeguard
                    - flag <player> petra:axeguard
                    - run new_quest_handler def.type:axeguard def.quest:the_keep
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Okay, no worries. Just let Peter know if you'd like to try again some time."
                    - flag <player> quests.axeguard:!
                    - flag <player> completed_quests.axeguard:!
                    - zap 1
