lizzieinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - if !<player.has_flag[completed_quests.side.mouths_to_feed]> && !<player.has_flag[quests.side.mouths_to_feed]>:
                        - chat "I need a hand feeding a few mouths if you got a fishin' rod, can you help a girl out? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 2
                    - else if <player.has_flag[quests.side.mouths_to_feed]>:
                        - if <player.flag[quests.side.mouths_to_feed.objectives.2]> == completed:
                            - chat "Thank god, she knows a guy, it's the only good mead around here. If you ever consider joining the Fisherman's Guild, I'll tell him you've earned a discount."
                            - wait 3s
                            - chat "Now where did I leave that pufferfish poison..."
                            - run take_from_quest_satchel_handler def.item:<server.flag[server_items.goldenmead10]>
                            - run completed_quest_handler def.type:side def.quest:mouths_to_feed
                        - else:
                            - run unfinished_quest_handler def.type:side def.quest:mouths_to_feed
                    - else:
                        - chat "Fresh catch!"
                        - wait 1s
                        - execute as_op silent "npc sel lizzie"
                        - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"
        2:
            chat trigger:
                1:
                    trigger: /y/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "That's great. Listen, I've got order after order and I'm drownin' in 'em, but Laura over in the mess tent in camp needs a shipment of salmon."
                    - wait 3s
                    - chat "If you could catch a few and bring them to her, I'd be truly grateful. What do you think? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "Ah! You just wanted the shop then, here have a look..."
                    - wait 2s
                    - execute as_op silent "npc sel lizzie"
                    - execute as_op silent "npc shop"
        3:
            chat trigger:
                1:
                    trigger: /y/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "Lovely, I've just got too many orders and until it rains fish, you're my best chance. Let me know when you've finished!"
                    - run new_quest_handler def.type:side def.quest:mouths_to_feed
                    - zap *
                2:
                    trigger: /n/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "No worries, I'll handle it. Let me know later if you're around."
                    - zap *


davisinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - chat "Don't take took long."
                    - wait 1s
                    - execute as_op silent "npc sel davis"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

laurainteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - if <player.has_flag[quests.side.mouths_to_feed]> && <player.flag[quests.side.mouths_to_feed.objectives.1]> >= 15 && <player.inventory.contains_item[salmon].quantity[15]>:
                        - take item:salmon quantity:15
                        - chat "Ah, perfect, Lizzie told me you were bringing the salmon. I better put them to roast!"
                        - wait 2s
                        - chat "Tell her I'll pass by tonight for the payment, but in the meantime bring her this for me. Thanks!"
                        - run give_to_quest_satchel_put_before_new_quest_handler def.item:<server.flag[server_items.goldenmead10]>
                        - wait 2s
                        - run objective_completion_handler def.type:side def.quest:mouths_to_feed def.obj:2
                    - else:
                        - chat "What can I get you?"
                        - wait 1s
                        - execute as_op silent "npc sel laura"
                        - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

coryinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - chat "Have a look.."
                    - wait 1s
                    - execute as_op silent "npc sel cory"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

saminteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - chat "Sure.."
                    - wait 1s
                    - execute as_op silent "npc sel sam"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

adamainteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - chat "I'm buying too.."
                    - wait 1s
                    - execute as_op silent "npc sel adama"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

jeremyinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - chat "Here you are, second page if you're sellin'!"
                    - wait 1s
                    - execute as_op silent "npc sel jeremy"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

johnathoninteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - chat "Here's this week's hunt.."
                    - wait 1s
                    - execute as_op silent "npc sel johnathon"
                    - execute as_op silent "npc shop"
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"

rhodesinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - if !<player.has_flag[completed_quests.side.something_hot_to_drink]> && !<player.has_flag[quests.side.something_hot_to_drink]>:
                        - chat "Hey you.. would you mind giving me a hand? I'll pay.. <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 2
                    - else if <player.has_flag[quests.side.something_hot_to_drink]>:
                        - if <player.inventory.contains_item[<server.flag[server_items.chamomiletea10]>]>:
                            - take item:<server.flag[server_items.chamomiletea10]> quantity:1
                            - run completed_quest_handler def.type:side def.quest:something_hot_to_drink
                            - chat "Fresh enough, here's something for your troubles. Hopefully you'll find me in the battlefield soon."
                        - else:
                            - run unfinished_quest_handler def.type:side def.quest:something_hot_to_drink
                    - else:
                        - stop
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"
        2:
            chat trigger:
                1:
                    trigger: /y/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "That's great, so the lieutenant says I can't return to my regular patrols until I've kicked this infection."
                    - wait 3s
                    - chat "I know it may sound ridiculous but the chamomile collected around here works differently... better even."
                    - wait 3s
                    - chat "Would you bring me some Chamomile Tea? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "I'll make do without."
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "Thank god, the crap they've been givin' us here just ain't doin' the trick. Sam's got the stuff you'll need."
                    - zap 1
                    - wait 3s
                    - run new_quest_handler def.type:side def.quest:something_hot_to_drink
                2:
                    trigger: /n/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "I'll make do without."
                    - zap 1

nicholasinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - if !<player.has_flag[completed_quests.side.taking_the_edge_off]> && !<player.has_flag[quests.side.taking_the_edge_off]>:
                        - chat "Listen, being stuck in this tower all day I need something to cure my boredom.. I need you to grab some Belladonna from Lia down there. Sound good? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 2
                    - else if <player.has_flag[quests.side.taking_the_edge_off]>:
                        - if <player.inventory.list_contents> contains <item[belladonna]>:
                            - take item:belladonna quantity:1
                            - chat "Wow, thanks. No need to tell anyone, of course."
                            - run completed_quest_handler def.type:side def.quest:taking_the_edge_off
                            - flag <player> completed_quests.side.taking_the_edge_off.ending:1
                        - else:
                            - run unfinished_quest_handler def.type:side def.quest:taking_the_edge_off
                    - else:
                        - stop
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"
        2:
            chat trigger:
                1:
                    trigger: /y/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "Okay, the only thing is you can't tell nobody. Just pretend you're buyin' it for yourself, I pay generously.."
                    - wait 3s
                    - chat "Lia and I have known each other for a long time, but she's strict. She says no, go to Sam. She'll help us out."
                    - wait 3s
                    - chat "Deal? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "Damn, and here I thought you and I had somethin' goin'."
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "Hell yeah, off you go! <italic>Shh.."
                    - zap 1
                    - wait 3s
                    - run new_quest_handler def.type:side def.quest:taking_the_edge_off
                2:
                    trigger: /n/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "Damn, and here I thought you and I had somethin' goin'."
                    - zap 1

lorathinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.flag[unlocked_areas]> contains camp_cinder:
                    - if !<player.has_flag[completed_quests.side.links_of_valor]> && !<player.has_flag[quests.side.links_of_valor]>:
                        - chat "Hello! I have a favor to ask of you, if you've the time to spare. <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 2
                    - else if <player.has_flag[quests.side.links_of_valor]>:
                        - if <player.inventory.list_contents> contains <item[chainmail_helmet]> && <item[chainmail_chestplate]> && <item[chainmail_leggings]> && <item[chainmail_boots]> && <player.flag[quests.side.links_of_valor.objectives.1]> >= 4:
                            - take item:chainmail_* quantity:4
                            - chat "Thanks a lot! Now I can get back to training in a short bit."
                            - run completed_quest_handler def.type:side def.quest:links_of_valor
                        - else:
                            - run unfinished_quest_handler def.type:side def.quest:links_of_valor
                    - else:
                        - stop
                - else:
                    - narrate "<&c>You aren't ready to chat with this person!"
        2:
            chat trigger:
                1:
                    trigger: /y/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "Great! My armor has become shoddy and isn't as protective as it once was."
                    - wait 3s
                    - chat "I think your aid will be thoroughly helpful for the both of us, I'll obtain new armor and you'll learn how to craft it!"
                    - wait 3s
                    - chat "Are you still willing to give me a hand? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 3
                2:
                    trigger: /n/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "All right, I'll see if I can handle it myself."
                    - zap 1
        3:
            chat trigger:
                1:
                    trigger: /y/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "Thanks! You'll need to find or craft some chains first, then use a workbench to piece them together like any other armor."
                    - zap 1
                    - wait 3s
                    - run new_quest_handler def.type:side def.quest:links_of_valor
                2:
                    trigger: /n/
                    show as normal chat: false
                    hide trigger message: true
                    script:
                    - chat "All right, I'll see if I can handle it myself."
                    - zap 1