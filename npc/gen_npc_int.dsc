atlaswagoncointeract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if !<player.has_flag[unlocked_areas]> || <player.flag[unlocked_areas].is_empty>:
                    - flag <player> unlocked_areas:->:wild_realm_spawn
                    - flag <player> unlocked_areas:->:camp_cinder
                    - chat "Just let me know if I can be of service."
                - else if <player.has_flag[permtravelpass]>:
                    - define area <player.flag[permtravelpass].first>
                    - define area_name <script[area_data].data_key[areas.<[area]>.name]>
                    - flag <player> unlocked_areas:-><[area]>
                    - flag <player> wagon_destination:<[area]> expire:2m
                    - chat "Alright, the documents for <[area_name]> are registered, you're good to go. Hop in if you're ready, otherwise come see me later."
                    - if <player.flag[permtravelpass].is_empty>:
                        - flag <player> permtravelpass:!
                - else if <player.has_flag[temptravelpass]>:
                    - if <player.flag[temptravelpass].size> == 1:
                        - define area <player.flag[temptravelpass].first>
                        - define area_name <script[area_data].data_key[areas.<[area]>.name]>
                        - chat "Looks like you have a single-use travel pass to <[area_name]>. Would you like to use it? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                        - zap 5
                    - if <player.flag[temptravelpass].size> > 1:
                        - chat "Looks like you've got a few single-trip tickets. Which would you like to use?"
                        - foreach <player.flag[temptravelpass]> as:area:
                            - define area_name <script[area_data].data_key[areas.<[area]>.name]>
                            - narrate "<&f><[loop_index]>. <&7><element[<[area_name]>].click_chat[<[area]>]>"
                        - zap 4
                - else:
                    - chat "What can I help you with?"
                    - narrate "<&f>1. <&7><element[Travel].click_chat[1]>"
                    - narrate "<&f>2. <&7><element[Documents].click_chat[2]>"
                    - zap 2
        2:
            chat trigger:
                1:
                    trigger: /*/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if <context.message> == 1 || <context.message> == travel:
                        - define current_reg <player.location.regions.first.id>
                        - define current_area_name <script[area_data].data_key[areas.<[current_reg]>.name]>
                        - if <player.flag[unlocked_areas].contains[<[current_reg]>]> && <player.flag[unlocked_areas].size> == 1:
                            - chat "Looks like you don't have any papers. You wanna see about gettin' some? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                            - zap 3
                        - else:
                            - chat "Sure! Where ya headin'?"
                            - define unlocked_areas <player.flag[unlocked_areas]>
                            - foreach <[unlocked_areas].exclude[<[current_reg]>]> as:area:
                                - define area_name <script[area_data].data_key[areas.<[area]>.name]>
                                - narrate "<&f><&gt> <&7><element[<[area_name]>].click_chat[<[area]>]>"
                            - zap 3
                    - else if <context.message> == 2 || <context.message> == documents:
                        - if <player.location.in_region[wild_realm_spawn]>:
                            - chat "Sadly I can't help you with documents at the moment. You'll have to ask one of my colleagues in another town."
                            - zap 1
                        - chat "No worries, have a look at what I got.."
                        - wait 1s
                        - execute as_op silent "npc sel"
                        - execute as_op silent "npc shop"
                        - zap 1
                    - else:
                        - chat "I'm not sure I understand what you mean.."
                        - zap 1
        3:
            chat trigger:
                1:
                    trigger: /*/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if <context.message> == n:
                        - chat "Come back when you need a ride."
                        - zap 1
                    - else if <context.message> == y:
                        - chat "No worries, have a look at what I got.."
                        - wait 1s
                        - execute as_op silent "npc sel"
                        - execute as_op silent "npc shop"
                        - zap 1
                    - else if <context.message> in <player.flag[unlocked_areas]>:
                        - chat "No problem, hop in and we're off!"
                        - flag <player> wagon_destination:<context.message> expire:2m
                        - zap 1
                    - else:
                        - chat "You don't seem to have an area by that name unlocked. Let me know if I can help you out another time!"
                        - zap 1
        4:
            chat trigger:
                1:
                    trigger: /*/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if <context.message> in <script[area_data].data_key[areas].keys>:
                        - flag <player> wagon_destination:<context.message> expire:1h
                        - flag <player> temptravelpass:<-:<context.message>
                        - chat "Alright, this ticket's good for one ride. The wagon is waiting!"
                        - if <player.flag[temptravelpass].is_empty>:
                            - flag <player> temptravelpass:!
                        - zap 1
                    - else:
                        - chat "It doesn't look like you have a ticket to go there. Come back when you've got the right ticket."
                        - zap 1
        5:
            chat trigger:
                1:
                    trigger: /*/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if <context.message> == y:
                        - define area <player.flag[temptravelpass].first>
                        - define area_name <script[area_data].data_key[areas.<[area]>.name]>
                        - flag <player> wagon_destination:<[area]> expire:1h
                        - chat "Alright, the wagon for <[area_name]> awaits! It'll be here for an hour, don't miss it or you'll have to purchase another."
                        - flag <player> temptravelpass:<-:<[area]>
                        - if <player.flag[temptravelpass].is_empty>:
                            - flag <player> temptravelpass:!
                        - zap 1
                    - else:
                        - chat "No worries. What can I help you with?"
                        - narrate "<&f>1. <&7><element[Travel].click_chat[1]>"
                        - narrate "<&f>2. <&7><element[Documents].click_chat[2]>"
                        - zap 2
jeffinteract:
    type: interact
    steps:
        1:
            click trigger:
                script:
                - if <player.has_permission[verified.user]>:
                    - chat "Good day, <player.name>. Come to collect your daily login reward? <&f>(<&7><element[y].click_chat[y]><&f>/<&7><element[n].click_chat[n]><&f>)"
                    - zap 2
                - else:
                    - narrate "<&c>You haven't finished learning about the server yet!"
        2:
            chat trigger:
                1:
                    trigger: /yes|y/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - if <player.has_flag[login_reward_cooldown]>:
                        - chat "<&f>I'm sorry, you can only claim this <&c>once <&f>per day. You must wait <&c><player.flag_expiration[login_reward_cooldown].from_now.formatted>. <&f>Good day to you."
                        - zap 1
                    - else:
                        - chat "No problem, just a moment."
                        - flag <player> login_reward_cooldown expire:1d
                        - wait 1s
                        - playsound <player.location> sound:block.trial_spawner.eject_item volume:3
                        - money give quantity:1
                        - give daily_reward_voucher quantity:1
                        - narrate "You have received <&a>₮1.00<&f> and a <&d>Daily Reward Voucher<&f>!"
                        - wait 1s
                        - chat "There you go, see you tomorrow."
                        - zap 1
                2:
                    trigger: /no|n/
                    hide trigger message: true
                    show as normal chat: false
                    script:
                    - chat "Very well, I'm sure I'll see you around."
                    - zap 1