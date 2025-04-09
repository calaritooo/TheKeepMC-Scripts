profession_command:
    type: command
    name: profession
    description: Use this to add/remove/list professions for a specified player!
    usage: /profession <&lt>player<&gt> add/remove/list <&lt>profession<&gt>
    permission: admin.spell
    tab completions:
        1: <server.online_players.parse[name]>
        2: add|remove|list
        3: <script[profession_list].data_key[professions]>
    script:
    - define arg1 <context.args.first.if_null[null]>
    - define player <server.match_offline_player[<[arg1]>]>
    - define action <context.args.get[2].if_null[null]>
    - define profession <context.args.get[3].if_null[null]>
    - if <[player]> != null:
        - if <[player].has_played_before>:
            - if <[action]> != null:
                - choose <[action]>:
                    - case remove:
                        - if <script[profession_list].data_key[professions].contains[<[profession]>]>:
                            - if <[player].has_flag[professions.<[profession]>]>:
                                - flag <[player]> professions.<[profession]>:!
                                - if <[player].flag[professions].is_empty>:
                                    - flag <[player]> professions:!
                                - narrate "<&e>Profession successfully removed from player."
                            - else:
                                - narrate "<&c>Player does not have that profession!"
                        - else:
                            - narrate "<&c>Invalid profession!"
                    - case add:
                        - if <script[profession_list].data_key[professions].contains[<[profession]>]>:
                            - flag <[player]> professions.<[profession]>.level:novice
                            - narrate "<&e>Profession successfully added to player."
                        - else:
                                - narrate "<&c>Invalid profession!"
                    - case list:
                        - if <[player].flag[professions].is_empty> || !<[player].has_flag[professions]>:
                            - narrate "<&c>Player does not have any professions!"
                        - else:
                            - narrate "<&e>Player's current professions:"
                            - foreach <[player].flag[professions]> key:profession:
                                - narrate "<&7><[loop_index]>. <&f><[profession].to_titlecase><&7>"
                                - if <[player].has_flag[professions.<[profession]>.skills]> && <player.flag[professions.<[profession]>.skills].any>:
                                    - narrate "<&7> -<&gt> Learned skills: <[player].flag[professions.<[profession]>.skills].size>"
                                - else:
                                    - narrate "<&7> -<&gt> Learned skills: 0"
                    - case default:
                        - narrate "<&7>Usage: /profession <&lt>player<&gt> add/remove/list <&lt>profession<&gt>"
            - else:
                - narrate "<&7>Usage: /profession <&lt>player<&gt> add/remove/list <&lt>profession<&gt>"
        - else:
            - narrate "<&c>Player not found!"
    - else:
        - narrate "<&7>Usage: /profession <&lt>player<&gt> add/remove/list <&lt>profession<&gt>"

profession_list:
    type: data
    professions:
        - agriculturalist
        - alchemist
        - fisherman
        - miner
        - woodsman