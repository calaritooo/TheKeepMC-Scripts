elarikinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder && <player.flag[peter]> == archer && ( <player.flag[classes].is_empty> || !<player.has_flag[classes]> ):
                    - chat "Peter told me you were lookin' into Archery at the Keep? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 2
                - else if !<player.flag[classes].is_empty> && <player.has_flag[classes]>:
                    - chat "It looks like you've already initiated in another class. I can't help you unless you denounce it and talk to Peter about starting fresh in Archery!"
                    - zap 1
                - else if <player.has_flag[quests.archer.joining_the_keep]>:
                    - if <player.flag[quests.archer.joining_the_keep.objectives.1]> >= 30 && <player.flag[quests.archer.joining_the_keep.objectives.2]> >= 10:
                        - run completed_quest_handler def.type:archer def.quest:joining_the_keep
                        - money give quantity:5
                        - narrate "<&7>You have received <&a>₮5.00"
                        - wait 2s
                        - chat "Well done! Easy enough, right? Remember, during this initiation phase, nothing is final. Do you still believe this is the path for you? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 4
                    - else:
                        - run unfinished_quest_handler def.type:archer def.quest:joining_the_keep
                - else if <player.has_flag[completed_quests.archer.joining_the_keep]> && <player.has_flag[quests.archer.proper_equipment]>:
                    - if <player.inventory.contains_item[archer_uniform_*].quantity[4]>:
                        - run completed_quest_handler def.type:archer def.quest:proper_equipment
                        - wait 2s
                        - chat "Trials check.. uniform check.. ah! Of course, one last time, is becoming a Wayfair Archer still your path? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 5
                    - else:
                        - run unfinished_quest_handler def.type:archer def.quest:proper_equipment
                - else if <player.has_flag[completed_quests.archer.proper_equipment]> && <player.has_flag[quests.archer.the_keep]>:
                    - run unfinished_quest_handler def.type:archer def.quest:the_keep
                - else:
                    - chat "I can get you started in Archery, but you gotta speak with Peter first. Head on over to his tent and come back when you're ready!"
                    - zap 1
        2:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if <player.flag[peter]> == archer:
                        - chat "Sounds great, he mentioned you seemed the Archer type. Now, the Keep has tasked me with ensuring that each new initiate is up to the test."
                        - wait 3s
                        - chat "To get you into the Keep, you're gonna need to prove yourself by completing a few tasks. We need to be sure you've got the basics down."
                        - wait 3s
                        - chat "What do you say? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 3
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Ah, must be the wrong person. Let him know later if you decided you're interested."
                    - flag <player> peter:!
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if !<player.has_flag[quests.archer.joining_the_keep]> && <player.flag[peter]> == archer:
                        - flag <player> peter:!
                        - chat "Alright! To begin, you'll need a bow and some arrows."
                        - wait 1.5s
                        - run new_quest_handler def.type:archer def.quest:joining_the_keep
                        - wait 3s
                        - chat "Come back when you've finished!"
                        - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Ah, I see. Let Peter know later if you decide you're interested."
                    - flag <player> peter:!
                    - zap 1
        4:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "That's what I like to hear. Now, before sending you off to the Keep, you'll need proper garments. Goodwin Tailoring in Shaleight is where you can find them."
                    - wait 3s
                    - chat "Come back when you've got them and we'll see about sending you off."
                    - wait 3s
                    - run new_quest_handler def.type:archer def.quest:proper_equipment
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Don't worry about it. Let Peter know later if you decided you're interested."
                    - flag <player> quests.archer:!
                    - flag <player> completed_quests.archer:!
                    - zap 1
        5:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Then it's settled. Here's your documents for the Keep. Head to Atlas, they'll get you settled. Good luck!"
                    - flag <player> permtravelpass:->:wayfairkeep
                    - flag <player> petra:archer
                    - flag <player> classes.archer
                    - wait 2s
                    - run new_quest_handler def.type:archer def.quest:the_keep
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Don't worry about it. Let Peter know later if you decided you're interested."
                    - flag <player> quests.archer:!
                    - flag <player> completed_quests.archer:!
                    - zap 1
