stepheninteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains shaleight_township:
                    - if <player.flag[professions]> !contains fisherman:
                        - chat "<&f>Did Lizzie send ya? Wanna hear what the Fisherman's Guild has to offer? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 2
                    - else:
                        - chat "Hey there <player.display_name><&f>! Lookin' for something?"
                        - narrate "<&f>1. <&7><element[Skills].click_chat[skills]>"
                        - narrate "<&f>2. <&7><element[Gear].click_chat[gear]>"
                        - zap 4
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"
        2:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Well, for starters, we are the largest.. and only.. professional guild in Shaleight."
                    - wait 3s
                    - chat "We take great pride in training the best fisherman around since the 4th century."
                    - wait 3s
                    - chat "How it works is, we offer you skills of which the more you earn the higher you climb our ranks."
                    - wait 3s
                    - chat "You will also be able to make use of our guild merchants and areas located throughout the world!"
                    - wait 3s
                    - chat "The only thing we ask of you is a small fee of <&c>₮6.15<&f>. This is, of course, non-binding."
                    - wait 3s
                    - chat "What do you think, my friend? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat "I'll be here when you change your mind."
                        - chat "No worries!"
                        - chat "You know where to find us."
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if <player.money> >= 6.15:
                        - money take quantity:6.15
                        - chat "You're all set, <player.display_name><&f>! Welcome to the Fisherman's Guild! Let me know about obtaining your first skills and gear."
                        - flag <player> professions.fisherman.level:novice
                        - zap 1
                    - else:
                        - chat "Listen, it'd be great to have ya but you're a little light on the change. Come back when you're ready!"
                        - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat "I'll be here when you change your mind."
                        - chat "No worries!"
                        - chat "You know where to find us."
                    - zap 1
        4:
            chat trigger:
                1:
                    trigger: /skills/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Here ya go.."
                    - wait 1s
                    - execute as_op silent "npc sel stephen"
                    - execute as_op silent "npc shop"
                    - zap 4
                2:
                    trigger: /gear/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Have a look.."
                    - wait 1s
                    - execute as_op silent "npc sel stephenshop"
                    - execute as_op silent "npc shop"
                    - zap 4