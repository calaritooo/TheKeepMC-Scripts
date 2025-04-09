henriinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - if <player.flag[professions]> !contains agriculturalist:
                        - chat "<&f>We can turn any ol' farmer into an 'agriculturalist'. Interested? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 2
                    - else:
                        - chat "Hey, <player.display_name><&f>! Whatcha lookin' for?"
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
                    - chat "Agriculture has been around for tens of thousands of years, but that don't mean anybody can do it."
                    - wait 3s
                    - chat "Just how lucrative it is as a hobby, I don't even wanna know. But with our guidance, you can make somethin' of yourself."
                    - wait 3s
                    - chat "The soil and what she provides for us needs a trained set of eyes lookin' after her."
                    - wait 3s
                    - chat "There's a small sum due for all new members totalin' out to 'bout <&c>₮7.90<&f>."
                    - wait 3s
                    - chat "With this you'll have access to our gear and trainin' for life! You in? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat "Let me know."
                        - chat "I'll be here my friend."
                        - chat "Sure, don't you worry."
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if <player.money> >= 7.90:
                        - money take quantity:7.90
                        - chat "<player.display_name><&f>, our newest Agriculturalist. I'll be here for any skills and gear."
                        - flag <player> professions.agriculturalist.level:novice
                        - zap 1
                    - else:
                        - chat "Come back with some extra change and I'll be happy to help!"
                        - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat "Let me know."
                        - chat "I'll be here my friend."
                        - chat "Sure, don't you worry."
                    - zap 1
        4:
            chat trigger:
                1:
                    trigger: /skills/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Yes sir.."
                    - wait 1s
                    - execute as_op silent "npc sel henri"
                    - execute as_op silent "npc shop"
                    - zap 4
                2:
                    trigger: /gear/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Okay.."
                    - wait 1s
                    - execute as_op silent "npc sel henrishop"
                    - execute as_op silent "npc shop"
                    - zap 4