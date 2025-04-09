lukasinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - if <player.flag[professions]> !contains woodsman:
                        - chat "<&f>You lookin' into joinin' the Woodsman's Guild? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 2
                    - else:
                        - chat "Welcome back <player.display_name><&f>! You need.."
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
                    - chat "Great, we'd love to have you. Working through the skills available, you'll gain exclusive access to abilities otherwise unavailable!"
                    - wait 3s
                    - chat "You'll of course have to pay the one-time membership fee of <&c>₮8.65<&f>."
                    - wait 3s
                    - chat "This fee includes full access to any special merchants and areas belonging to our guild!"
                    - wait 3s
                    - chat "What do you say? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat "Oh okay, no problem. See you next time!"
                        - chat "No worries!"
                        - chat "Let me know if you're interested some other time."
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if <player.money> >= 8.65:
                        - money take quantity:8.65
                        - chat "Much appreciated <player.display_name><&f>, welcome to the Woodsman's Guild! You now have access to member-only gear and opportunities. Happy choppin'!"
                        - flag <player> professions.woodsman.level:novice
                        - zap 4
                    - else:
                        - chat "It looks like you can't cover the fee right now, but I'll be here when you can!"
                        - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat "Oh okay, no problem. See you next time!"
                        - chat "No worries!"
                        - chat "Let me know if you're interested some other time."
                    - zap 1
        4:
            chat trigger:
                1:
                    trigger: /skills/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Sure, no problem. Take a look.."
                    - wait 1s
                    - execute as_op silent "npc sel lukas"
                    - execute as_op silent "npc shop"
                    - zap 4
                2:
                    trigger: /gear/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Sounds good! Here's what I got.."
                    - wait 1s
                    - execute as_op silent "npc sel lukasshop"
                    - execute as_op silent "npc shop"
                    - zap 4

