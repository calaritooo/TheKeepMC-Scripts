jacobinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - if <player.flag[professions]> !contains miner:
                        - chat "<&f>Hey, the Miner's Guild is lookin'. You want in or not? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 2
                    - else:
                        - chat "Whatcha need, <player.display_name><&f>?"
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
                    - chat "Sure. It's one of the many professional guilds, but the only actually 'hard-working' one, if you ask me."
                    - wait 3s
                    - chat "If ya need some straightening up, somebody to raise you 'cause your parents didn't, we'll get it done."
                    - wait 3s
                    - chat "Often, passer-byers think we just dig but we're a brotherhood. A sisterhood too, if that's your thing."
                    - wait 3s
                    - chat "Paying a fee of <&c>₮11.40<&f>, you'll have access to over 7 centuries of a history known for its strength and determination."
                    - wait 3s
                    - chat "Want in or not? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat "Whatever."
                        - chat "You'll be back."
                        - chat "It's not like I'm going anywhere."
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if <player.money> >= 11.40:
                        - money take quantity:11.40
                        - chat "Well, <player.display_name><&f>, welcome to the Miner's Guild. You can talk to me about skills and gear anytime."
                        - flag <player> professions.miner.level:novice
                        - zap 1
                    - else:
                        - chat "What do you think this is? You ain't know what's in your pockets? Come back when you can afford it."
                        - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat Whatever.
                        - chat "You'll be back."
                        - chat "It's not like I'm going anywhere."
                    - zap 1
        4:
            chat trigger:
                1:
                    trigger: /skills/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Make it quick.."
                    - wait 1s
                    - execute as_op silent "npc sel jacob"
                    - execute as_op silent "npc shop"
                    - zap 4
                2:
                    trigger: /gear/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "This's what I got.."
                    - wait 1s
                    - execute as_op silent "npc sel jacobshop"
                    - execute as_op silent "npc shop"
                    - zap 4