lieutenantgreeneinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.has_flag[quests.side.taking_the_edge_off]>:
                    - chat "A report against Nicholas on the lookout? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 6
                - else if <player.flag[unlocked_areas]> contains camp_cinder && <player.flag[peter]> == swordsman && ( <player.flag[classes].is_empty> || !<player.has_flag[classes]> ):
                    - chat "Yeah, Peter told me. You serious about bein' a Swordsman? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 2
                - else if !<player.flag[classes].is_empty> && <player.has_flag[classes]>:
                    - chat "It looks like you've already initiated in another class. Denounce it and let Peter know when you've come to your senses."
                    - zap 1
                - else if <player.has_flag[quests.swordsman.joining_the_keep]>:
                    - if <player.flag[quests.swordsman.joining_the_keep.objectives.1]> >= 30 && <player.flag[quests.swordsman.joining_the_keep.objectives.2]> >= 10:
                        - run completed_quest_handler def.type:swordsman def.quest:joining_the_keep
                        - wait 3s
                        - chat "Well I guess you made it through the hard part. Give up yet? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 4
                    - else:
                        - run unfinished_quest_handler def.type:swordsman def.quest:joining_the_keep
                - else if <player.has_flag[completed_quests.swordsman.joining_the_keep]> && <player.has_flag[quests.swordsman.proper_equipment]>:
                    - if <player.inventory.contains_item[swordsman_uniform_*].quantity[4]>:
                        - run completed_quest_handler def.type:swordsman def.quest:proper_equipment
                        - wait 3s
                        - chat "If I send you off without all that heavy crap they'll throw a tantrum. Anyway, last chance. Ready to tap out? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 5
                    - else:
                        - run unfinished_quest_handler def.type:swordsman def.quest:proper_equipment
                - else if <player.has_flag[completed_quests.swordsman.proper_equipment]> && <player.has_flag[quests.swordsman.the_keep]>:
                    - run unfinished_quest_handler def.type:swordsman def.quest:the_keep
                - else:
                    - chat "Talk to Peter first. Now stop distracting me."
                    - zap 1
        2:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Just great. I took an oath to at least let you attempt the trials, so I guess that's that."
                    - wait 3s
                    - chat "I hope you know how to use a sword, if not you have two options. Go to town on a training dummy till you do, or drop out now."
                    - wait 3s
                    - chat "Still committed? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "I figured. Off you go."
                    - flag <player> peter:!
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if !<player.has_flag[quests.swordsman.joining_the_keep]>:
                        - flag <player> peter:!
                        - chat "Well, let's keep it short."
                        - wait 1.5s
                        - run new_quest_handler def.type:swordsman def.quest:joining_the_keep
                        - wait 3s
                        - chat "Let me know if you make it."
                        - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Yeah, I figured. Get outta here."
                    - flag <player> peter:!
                    - zap 1
        4:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "I'm still surprised you survived but that is now officially none of my business. Go get your equipment and come back, or don't."
                    - wait 3s
                    - run new_quest_handler def.type:swordsman def.quest:proper_equipment
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "What a surprise. Off with you now!"
                    - flag <player> quests.swordsman:!
                    - flag <player> completed_quests.swordsman:!
                    - zap 1
        5:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Here's the golden ticket. Be warned though, I'm the nicest one of us."
                    - wait 2s
                    - flag <player> permtravelpass:->:wayfairkeep
                    - flag <player> classes.swordsman
                    - flag <player> petra:swordsman
                    - run new_quest_handler def.type:swordsman def.quest:the_keep
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Keep the gear, consider it a souvenir of your failure."
                    - flag <player> quests.swordsman:!
                    - flag <player> completed_quests.swordsman:!
                    - zap 1
        6:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "I had heard speak around camp, obviously you did the right thing. I'll begin investigating immediately, thank you."
                    - wait 2s
                    - run completed_quest_handler def.type:side def.quest:taking_the_edge_off
                    - flag <player> completed_quests.side.taking_the_edge_off.ending:2
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Then what're you wasting my time for? Off you go!"
                    - zap 1