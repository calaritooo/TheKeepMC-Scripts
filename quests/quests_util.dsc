quest_data:
    type: data
    types:
        main: <script[main_quest_data].data_key[quests].keys>
        side: <script[side_quest_data].data_key[quests].keys>
        archer: <script[archer_quest_data].data_key[quests].keys>
        swordsman: <script[swordsman_quest_data].data_key[quests].keys>
        axeguard: <script[axeguard_quest_data].data_key[quests].keys>
        shroud: <script[shroud_quest_data].data_key[quests].keys>
        scholar: <script[scholar_quest_data].data_key[quests].keys>

general_quest_data:
    type: data
    quests:
        null: null

quests_command:
    type: command
    name: quests
    description: Use this to add/remove/complete|list quests for a specified player!
    usage: /quests <&lt>player<&gt> add/remove/complete/list <&lt>type<&gt> <&lt>quest<&gt>
    permission: admin.quests
    tab completions:
        1: <server.online_players.parse[name]>
        2: add|remove|complete|list
        3: <script[quest_data].data_key[types].keys>
        4: <script[<context.args.get[3]>_quest_data].data_key[quests].keys>
    script:
    - define arg1 <context.args.first.if_null[null]>
    - define player <server.match_offline_player[<[arg1]>]>
    - define action <context.args.get[2].if_null[null]>
    - define type <context.args.get[3].if_null[null]>
    - define quest <context.args.get[4].if_null[null]>
    - if <[player]> != null:
        - if <[player].has_played_before>:
            - if <[action]> != null:
                - choose <[action]>:
                    - case add:
                        - if <[type]> != null && <[type]> in <script[quest_data].data_key[types].keys>:
                            - if <[quest]> != null && <[quest]> in <script[<[type]>_quest_data].data_key[quests]>:
                                - if <[quest]> !in <[player].flag[completed_quests.<[type]>]>:
                                    - if <[quest]> !in <[player].flag[quests.<[type]>]>:
                                        - run new_quest_handler def.type:<[type]> def.quest:<[quest]>
                                        - narrate "<&e>Quest successfully added for this player! <&6>The player has been prompted for this quest and is aware."
                                    - else:
                                        - narrate "<&c>Player already has this quest!"
                                - else:
                                    - narrate "<&c>Player has already completed this quest!"
                            - else:
                                - narrate "<&c>Invalid quest!"
                        - else:
                            - narrate "<&c>Invalid quest type!"
                    - case remove:
                        - if <[type]> != null && <[type]> in <script[quest_data].data_key[types].keys>:
                            - if <[quest]> != null && <[quest]> in <script[<[type]>_quest_data].data_key[quests]>:
                                - if <[quest]> in <[player].flag[completed_quests.<[type]>]>:
                                    - flag <[player]> completed_quests.<[type]>.<[quest]>:!
                                    - if <[player].flag[completed_quests.<[type]>].is_empty>:
                                        - flag <[player]> completed_quests.<[type]>:!
                                    - narrate "<&e>Quest successfully removed for this player! <&6>Ensure this was done intentionally as it had already been completed by the player and errors may arise from its absence."
                                - else if <[quest]> in <[player].flag[quests.<[type]>]>:
                                    - flag <[player]> quests.<[type]>.<[quest]>:!
                                    - if <[player].flag[quests.<[type]>].is_empty>:
                                        - flag <[player]> quests.<[type]>:!
                                    - narrate "<&e>Quest successfully removed for this player!"
                                - else:
                                    - narrate "<&c>Player does not have this quest!"
                            - else:
                                - narrate "<&c>Invalid quest!"
                        - else:
                            - narrate "<&c>Invalid quest type!"
                    - case complete:
                        - if <[type]> != null && <[type]> in <script[quest_data].data_key[types].keys>:
                            - if <[quest]> != null && <[quest]> in <script[<[type]>_quest_data].data_key[quests]>:
                                - if <[quest]> !in <[player].flag[completed_quests.<[type]>]>:
                                    - if <[quest]> !in <[player].flag[quests.<[type]>]>:
                                        - flag <[player]> completed_quests.<[type]>.<[quest]>
                                        - narrate "<&e>Quest successfully completed for this player!"
                                    - else:
                                        - flag <[player]> quests.<[type]>.<[quest]>:!
                                        - flag <[player]> completed_quests.<[type]>.<[quest]>
                                        - narrate "<&e>Quest successfully completed for this player!"
                                - else:
                                    - narrate "<&c>Player has already completed this quest!"
                            - else:
                                - narrate "<&c>Invalid quest!"
                        - else:
                            - narrate "<&c>Invalid quest type!"
                    - case list:
                        - if <[type]> != null && <[type]> in <script[quest_data].data_key[types].keys>:
                            - if <[player].has_flag[quests.<[type]>]>:
                                - if !<[player].flag[quests.<[type]>].is_empty>:
                                    - narrate "<&6>Player's active quests of type: <&f><[type].to_titlecase><&7> -<&gt>"
                                    - foreach <[player].flag[quests.<[type]>]> key:quest:
                                        - narrate "<&7><[loop_index]>. <script[<[type]>_quest_data].data_key[quests.<[quest]>.name]>"
                            - if <[player].has_flag[completed_quests.<[type]>]>:
                                - if !<[player].flag[completed_quests.<[type]>].is_empty>:
                                    - narrate "<&6>Player's completed quests of type: <&f><[type].to_titlecase><&7> -<&gt>"
                                    - foreach <[player].flag[completed_quests.<[type]>]> key:quest:
                                        - narrate "<&7><[loop_index]>. <script[<[type]>_quest_data].data_key[quests.<[quest]>.name]>"
                            - if ( !<[player].has_flag[quests.<[type]>]> || <[player].flag[quests.<[type]>].is_empty> ) && ( !<[player].has_flag[completed_quests.<[type]>]> || <[player].flag[completed_quests.<[type]>].is_empty> ):
                                - narrate "<&c>Player does not currently have any quests of this type!"
                                - stop
                        - else:
                            - if <[player].has_flag[quests]>:
                                - if !<[player].flag[quests].is_empty>:
                                    - narrate "<&6>Player's active quests by type -<&gt>"
                                    - foreach <[player].flag[quests]> key:type as:quest:
                                        - narrate " <&f><[type].to_titlecase>:"
                                        - foreach <[player].flag[quests.<[type]>]> key:quest:
                                            - narrate " <&7><[loop_index]>. <script[<[type]>_quest_data].data_key[quests.<[quest]>.name]>"
                            - if <[player].has_flag[completed_quests]>:
                                - if !<[player].flag[completed_quests].is_empty>:
                                    - narrate "<&6>Player's completed quests by type -<&gt>"
                                    - foreach <[player].flag[completed_quests]> key:type as:quest:
                                        - narrate " <&f><[type].to_titlecase>:"
                                        - foreach <[player].flag[completed_quests.<[type]>]> key:quest:
                                            - narrate " <&7><[loop_index]>. <script[<[type]>_quest_data].data_key[quests.<[quest]>.name]>"
                            - if ( !<[player].has_flag[quests]> || <[player].flag[quests].is_empty> ) && ( !<[player].has_flag[completed_quests]> || <[player].flag[completed_quests].is_empty> ):
                                - narrate "<&c>Player has no active or completed quests!"
                                - stop
                    - case default:
                        - narrate "<&7>Usage: /quests <&lt>player<&gt> add/remove/complete/list <&lt>type<&gt> <&lt>quest<&gt>"
            - else:
                - narrate "<&7>Usage: /quests <&lt>player<&gt> add/remove/complete/list <&lt>type<&gt> <&lt>quest<&gt>"
        - else:
            - narrate "<&c>Player not found!"
    - else:
        - narrate "<&7>Usage: /quests <&lt>player<&gt> add/remove/complete/list <&lt>type<&gt> <&lt>quest<&gt>"

objective_completion_handler:
    type: task
    debug: false
    definitions: type|quest|obj
    script:
    - define quest_data <script[<[type]>_quest_data].data_key[quests.<[quest]>]>
    - toast targets:<player> icon:guster_banner_pattern "<&6>Quest: <[quest_data].deep_get[name]> <&7>Objective #<[obj]> complete!"
    - if <[quest_data].deep_get[objectives.<[obj]>.required]> == 0:
        - flag <player> quests.<[type]>.<[quest]>.objectives.<[obj]>:completed

new_quest_handler:
    type: task
    debug: false
    definitions: type|quest
    script:
    - wait 2s
    - define quest_data <script[<[type]>_quest_data].data_key[quests.<[quest]>]>
    - title "title:<&6>Quest: <[quest_data].deep_get[name]>" subtitle:<&7><[quest_data].deep_get[description]>
    - flag <player> quests.<[type]>.<[quest]>.return_npc:<[quest_data].deep_get[return_npc]>
    - wait 2.5s
    - narrate "<&f>-<&gt> <&6>Quest: <[quest_data].deep_get[name]> <&f><&lt>-"
    - foreach <[quest_data].deep_get[objectives]> key:obj:
        - if <[quest_data].deep_get[objectives.<[obj]>.required]> > 0:
            - flag <player> quests.<[type]>.<[quest]>.objectives.<[obj]>:0
            - narrate "<&f><[loop_index]>. <&7><[quest_data].deep_get[objectives.<[obj]>.description]> <&f>(<player.flag[quests.<[type]>.<[quest]>.objectives.<[obj]>]>/<[quest_data].deep_get[objectives.<[obj]>.required]>)"
        - else:
            - narrate "<&f><[loop_index]>. <&7><[quest_data].deep_get[objectives.<[obj]>.description]>"

unfinished_quest_handler:
    type: task
    debug: false
    definitions: type|quest
    script:
    - define quest_data <script[<[type]>_quest_data].data_key[quests.<[quest]>]>
    - narrate "<&f>-<&gt> <&6>Quest: <[quest_data].deep_get[name]> <&f><&lt>-"
    - foreach <[quest_data].deep_get[objectives]> key:obj:
        - if <[quest_data].deep_get[objectives.<[obj]>.required]> > 0:
            - if <player.flag[quests.<[type]>.<[quest]>.objectives.<[obj]>]> >= <[quest_data].deep_get[objectives.<[obj]>.required]>:
                - narrate "<&f><[loop_index]>. <&7><strikethrough><[quest_data].deep_get[objectives.<[obj]>.description]><&r> <&f>(<player.flag[quests.<[type]>.<[quest]>.objectives.<[obj]>]>/<[quest_data].deep_get[objectives.<[obj]>.required]>)"
            - else:
                - narrate "<&f><[loop_index]>. <&7><[quest_data].deep_get[objectives.<[obj]>.description]> <&f>(<player.flag[quests.<[type]>.<[quest]>.objectives.<[obj]>]>/<[quest_data].deep_get[objectives.<[obj]>.required]>)"
        - else:
            - narrate "<&f><[loop_index]>. <&7><[quest_data].deep_get[objectives.<[obj]>.description]>"

completed_quest_handler:
    type: task
    debug: false
    definitions: type|quest
    script:
    - wait 2.5s
    - define quest_data <script[<[type]>_quest_data].data_key[quests.<[quest]>]>
    - title "title:<&6>Quest: <[quest_data].deep_get[name]>" "subtitle:<&7>Successfully completed!"
    - wait 1s
    - if <[quest_data].deep_get[money_reward]> > 0:
        - define money <[quest_data].deep_get[money_reward]>
        - money give quantity:<[money]>
        - narrate "<&7>You have received <&a>₮<[money]>"
    - flag <player> quests.<[type]>.<[quest]>:!
    - if <player.flag[quests.<[type]>].is_empty>:
        - flag <player> quests.<[type]>:!
    - flag <player> completed_quests.<[type]>.<[quest]>

quest_satchel_inventory:
    type: inventory
    inventory: chest
    title: <&9><&l>Quest Satchel
    size: 9
    gui: true
    procedural items:
    - if <player.has_flag[other_quest_satchel]>:
        - define quest_items <player.flag[other_quest_satchel]>
    - else:
        - define quest_items <player.flag[quest_satchel]>
    - determine <[quest_items]>
    slots:
    - [] [] [] [] [] [] [] [] []

quest_satchel_command:
    type: command
    name: questsatchel
    description: Use this to modify or view a player's quest satchel!
    usage: /questsatchel <&lt>player<&gt> add/remove/open <&lt>argument<&gt>
    permission: admin.quests
    tab completions:
        1: <server.online_players.parse[name]>
        2: add|remove|open
        3: <script[quest_satchel_command_data].data_key[args].get[<context.args.get[2]>]>
    script:
    - define arg1 <context.args.first.if_null[null]>
    - define player <server.match_offline_player[<[arg1]>]>
    - define action <context.args.get[2].if_null[null]>
    - define item <context.args.get[3].if_null[null]>
    - if <[player]> != null:
        - if <[player].has_played_before> && <[player].has_flag[quest_satchel]>:
            - if <[action]> != null:
                - choose <[action]>:
                    - case add:
                        - if <[item]> == hand:
                            - if <[player].flag[quest_satchel].size> < 9 || <player.flag[quest_satchel].is_empty>:
                                - flag <[player]> quest_satchel:->:<player.item_in_hand>
                                - narrate "<&e>Item successfully added to <&f><[player].name>'s <&e>quest satchel!"
                            - else:
                                - narrate "<&c>Player's quest satchel is full!"
                        - else if <[item]> != hand && <[item].exists>:
                            - if <[player].flag[quest_satchel].size> < 9 || <player.flag[quest_satchel].is_empty>:
                                - flag <[player]> quest_satchel:->:<[item]>
                                - narrate "<&e>Item successfully added to <&f><[player].name>'s <&e>quest satchel!"
                            - else:
                                - narrate "<&c>Player's quest satchel is full!"
                        - else:
                            - narrate "<&c>Invalid item!"
                    - case remove:
                        - if <[item]> == hand:
                            - if <[player].flag[quest_satchel]> contains <player.item_in_hand>:
                                - flag <[player]> quest_satchel:<-:<player.item_in_hand>
                                - narrate "<&e>Item successfully removed from <&f><[player].name>'s <&e>quest satchel!"
                            - else:
                                - narrate "<&c>Invalid item!"
                        - else if <[item]> != hand && <[item].exists>:
                            - if <[player].flag[quest_satchel]> contains <[item]>:
                                - flag <[player]> quest_satchel:<-:<[item]>
                                - narrate "<&e>Item successfully removed from <&f><[player].name>'s <&e>quest satchel!"
                            - else:
                                - narrate "<&c>Invalid item!"
                        - else:
                            - narrate "<&c>Invalid item!"
                    - case clear:
                        - flag <[player]> quest_satchel:!
                        - flag <[player]> quest_satchel
                        - narrate "<&f><[player].name>'s <&e>quest satchel successfully cleared!"
                    - case open:
                        - if <player> != <[player]>:
                            - flag <player> other_quest_satchel:<[player].flag[quest_satchel]>
                            - inventory open d:quest_satchel_inventory
                            - flag <player> other_quest_satchel:!
                        - else:
                            - inventory open d:quest_satchel_inventory
                    - case default:
                        - narrate "<&7>Usage: /questsatchel <&lt>player<&gt> add/remove/open <&lt>argument<&gt>"
            - else:
                - narrate "<&7>Usage: /questsatchel <&lt>player<&gt> add/remove/open <&lt>argument<&gt>"
        - else if !<[player].has_flag[quest_satchel]>:
            - run new_quest_satchel_handler def.admin:<player> def.player:<[player]>
        - else:
            - narrate "<&c>Player not found!"
    - else:
        - narrate "<&7>Usage: /questsatchel <&lt>player<&gt> add/remove/open <&lt>argument<&gt>"

quest_satchel_command_data:
    type: data
    args:
        add:
        - hand
        - ITEMTAG
        remove:
        - hand
        - ITEMTAG
        open:
        - null

quest_satchel_inventory_actions:
    type: world
    debug: false
    events:
        on player middle|right clicks item in quest_satchel_inventory:
        - give <context.item> quantity:1

give_to_quest_satchel_PUT_BEFORE_NEW_QUEST_HANDLER:
    type: task
    debug: false
    definitions: item
    script:
    - if <player.flag[quest_satchel].size> < 9 || <player.flag[quest_satchel].is_empty>:
        - flag <player> quest_satchel:->:<[item]>
        - narrate "<&e>You have received '<&f><[item].display><&e>'."
    - else:
        - chat "It looks like you don't have enough space to carry this safely. Come back when you do!"
        - zap *

take_from_quest_satchel_handler:
    type: task
    debug: false
    definitions: item
    script:
    - if <player.flag[quest_satchel]> contains <[item]>:
        - flag <player> quest_satchel:<-:<[item]>

new_quest_satchel_handler:
    type: task
    debug: false
    definitions: admin|player
    script:
    - if <[admin]> != null:
        - narrate targets:<[admin]> "<&c>Player does not have a quest satchel! Creating..."
    - flag <[player]> quest_satchel
    - wait 0.5s
    - narrate targets:<[admin]> "<&e>Quest satchel successfully created for <&f><[player].name><&e>!"