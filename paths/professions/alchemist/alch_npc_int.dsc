liainteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - if <player.has_flag[quests.side.taking_the_edge_off]>:
                        - chat "You need some Belladonna? Let me guess, for that useless drumhead in the lookout. <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 4
                    - else if <player.flag[professions]> !contains alchemist:
                        - chat "<&f>The first step to autonomy in the world of alchemy starts here. You want in? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 2
                    - else:
                        - chat "Welcome back, <player.display_name><&f>! Here's what I got.."
                        - wait 1s
                        - execute as_op silent "npc sel lia"
                        - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"
        2:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Alchemy is the sometimes scientific, sometimes unexplainable art of crafting things otherwise impossible."
                    - wait 3s
                    - chat "The Electorate of the Crown made law that all alchemists must join the guild after.. an incident.. years ago."
                    - wait 3s
                    - chat "Our guild doesn't offer skills or that stuff, we believe it's a form of theft by the other guilds."
                    - wait 3s
                    - chat "Paying the dues of <&c>₮7.30<&f> upon joining grants you access to every apothecary and alchemist in the Realm, it'll also provide for your license."
                    - wait 3s
                    - chat "You'll need to purchase the recipes if you don't already know what you're doing but most ingredients you'll find on your own!"
                    - wait 3s
                    - chat "What do you say? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat "Well let me know!"
                        - chat "No problem!"
                        - chat "You know where to find me."
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if <player.money> >= 7.30:
                        - money take quantity:7.30
                        - chat "Fantastic, <player.display_name><&f>, you're all set!"
                        - wait 2s
                        - chat "Come back and see me for recipes and if you can't find any ingredients, apothecaries and other alchemists can help you."
                        - flag <player> professions.alchemist.level:novice
                        - zap 1
                    - else:
                        - chat "Looks like you can't pay the dues at the moment, no problem. I'll be here for when you can!"
                        - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - random:
                        - chat "Well let me know!"
                        - chat "No problem!"
                        - chat "You know where to find me."
                    - zap 1
        4:
            chat trigger:
                1:
                    trigger: /y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "In that case, no. In any case, you'd need to be a registered Alchemist to purchase that ingredient from me."
                    - wait 2.5s
                    - chat "Seeing as I don't have time at the moment, head off and report him to Lieutenant Greene for me, he pays for reports like this."
                    - wait 3s
                    - chat "Now come back when YOU need something, I'll be happy to help."
                    - zap 1
                2:
                    trigger: /n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Ah, well anyway you'll need to be an Alchemist for that ingredient. Come back if you'd like to register."
                    - zap 1