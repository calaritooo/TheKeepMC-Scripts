class_command:
    type: command
    name: class
    description: Use this to add/remove/list classes for a specified player!
    usage: /class <&lt>player<&gt> add/remove/list <&lt>class<&gt>
    permission: admin.class
    tab completions:
        1: <server.online_players.parse[name]>
        2: add|remove|list
        3: <script[class_list].data_key[classes]>
    script:
    - define arg1 <context.args.first.if_null[null]>
    - define player <server.match_offline_player[<[arg1]>]>
    - define action <context.args.get[2].if_null[null]>
    - define class <context.args.get[3].if_null[null]>
    - if <[player]> != null:
        - if <[player].has_played_before>:
            - if <[action]> != null:
                - choose <[action]>:
                    - case remove:
                        - if <script[class_list].data_key[classes].contains[<[class]>]>:
                            - if <[player].has_flag[classes.<[class]>]>:
                                - flag <[player]> classes.<[class]>:!
                                - if <[player].flag[classes].is_empty>:
                                    - flag <[player]> classes:!
                                - if <[class]> == scholar:
                                    - flag <[player]> qb_spells:!
                                    - if <[player].has_flag[scholar_wand_active]>:
                                        - playsound sound:item.book.page_turn <[player].location>
                                        - flag <[player]> active_spell:!
                                        - flag <[player]> scholar_wand_active:!
                                        - repeat 8 as:new_slot:
                                            - inventory set d:<[player].inventory> slot:<[new_slot]> o:air
                                        - define wand_slot <[player].flag[scholar_wand_slot_#]>
                                        - define wand_data <[player].flag[scholar_wand_data_f]>
                                        - inventory set d:<[player].inventory> slot:<[player].flag[scholar_wand_slot_#]> o:<[player].flag[scholar_wand_data_f]>
                                        - define hotbar_contents <[player].flag[hotbar_contents]>
                                        - repeat <[hotbar_contents].size> as:slot:
                                            - define item <[hotbar_contents].get[<[slot]>]>
                                            - if <[item]> != air:
                                                - inventory set slot:<[slot]> o:<[item]>
                                        - flag <[player]> scholar_wand_data_f:!
                                        - flag <[player]> scholar_wand_slot_#:!
                                        - flag <[player]> hotbar_contents:!
                                        - flag <[player]> entire_inv:!
                                - if <[class]> in <script[class_list].data_key[classes].exclude[scholar]>:
                                    - flag <[player]> <[class]>_qb_skills:!
                                    - repeat 36 as:new_slot:
                                        - inventory set d:<[player].inventory> slot:<[new_slot]> o:air
                                    - define entire_inv <[player].flag[entire_inv]>
                                    - foreach <[player].flag[entire_inv]> as:item:
                                        - define item <[entire_inv].get[<[loop_index]>]>
                                        - if <[item]> != air:
                                            - inventory set slot:<[loop_index]> o:<[item]>
                                        - if <[loop_index]> == 9:
                                            - define <[class]>_weapon_slot <[player].flag[<[class]>_weapon_slot_#]>
                                            - define <[class]>_weapon_data <[player].flag[<[class]>_weapon_data_f]>
                                            - inventory set d:<[player].inventory> slot:<[player].flag[<[class]>_weapon_slot_#]> o:<[player].flag[<[class]>_weapon_data_f]>
                                    - flag <[player]> <[class]>_weapon_data_f:!
                                    - flag <[player]> <[class]>_weapon_slot_#:!
                                    - flag <[player]> hotbar_contents:!
                                    - flag <[player]> entire_inv:!
                                    - flag <[player]> <[class]>_weapon_active:!
                                - flag <[player]> cooldowns:!
                                - narrate "<&e>Class successfully removed from player."
                            - else:
                                - narrate "<&c>Player does not have that class!"
                        - else:
                            - narrate "<&c>Invalid class!"
                    - case add:
                        - if <script[class_list].data_key[classes].contains[<[class]>]>:
                            - if !<[player].has_flag[classes.<[class]>]>:
                                - if <[class]> == scholar:
                                    - flag <[player]> classes.<[class]>
                                - else:
                                    - flag <[player]> classes.<[class]>.skills.passives:1
                                - narrate "<&e>Class successfully added to player."
                            - else:
                                - narrate "<&c>Player already has that class!"
                        - else:
                            - narrate "<&c>Invalid class!"
                    - case list:
                        - if <[player].flag[classes].is_empty> || !<[player].has_flag[classes]>:
                            - narrate "<&c>Player does not have any classes!"
                        - else:
                            - narrate "<&e>Player's current classes:"
                            - foreach <[player].flag[classes]> key:class as:skills:
                                - narrate "<&7><[loop_index]>. <&9><[class].to_titlecase><&7>"
                                - if <[class]> == scholar:
                                    - if <player.has_flag[classes.<[class]>.skills]> && <player.flag[classes.<[class]>.skills].any>:
                                        - narrate "<&7> -<&gt> Learned spells: <[player].flag[classes.<[class]>.skills].size>"
                                    - else:
                                        - narrate "<&7> -<&gt> Learned spells: 0"
                                - else:
                                    - if <player.has_flag[classes.<[class]>.skills]> && <player.flag[classes.<[class]>.skills].any>:
                                        - narrate "<&7> -<&gt> Learned skills: <[player].flag[classes.<[class]>.skills].size>"
                                    - else:
                                        - narrate "<&7> -<&gt> Learned skills: 0"
                    - case default:
                        - narrate "<&7>Usage: /class <&lt>player<&gt> add/remove/list <&lt>class<&gt>"
            - else:
                - narrate "<&7>Usage: /class <&lt>player<&gt> add/remove/list <&lt>class<&gt>"
        - else:
            - narrate "<&c>Player not found!"
    - else:
        - narrate "<&7>Usage: /class <&lt>player<&gt> add/remove/list <&lt>class<&gt>"

class_list:
    type: data
    classes:
        - archer
        - scholar
        - axeguard
        - swordsman
        - shroud