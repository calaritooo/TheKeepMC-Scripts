skill_command:
    type: command
    name: skill
    description: Use this to give/remove/set skills for a specified player in the given path!
    usage: /skill <&lt>player<&gt> <&lt>path<&gt> give/remove/set/list/clear <&lt>skill<&gt> <&lt>level<&gt>
    permission: admin.skill
    tab completions:
        1: <server.online_players.parse[name]>
        2: <script[path_data].data_key[paths]>
        3: give|remove|set|list|clear
        4: <script[<context.args.get[2]>_skill_data].list_keys.include[all].exclude[type]>
        5: 1|2|3|admin
    script:
    - define arg1 <context.args.first.if_null[null]>
    - define player <server.match_offline_player[<[arg1]>]>
    - define path <context.args.get[2].if_null[null]>
    - define action <context.args.get[3].if_null[null]>
    - define skill <context.args.get[4].if_null[null]>
    - define level <context.args.get[5].if_null[null]>
    - if <[player]> != null:
        - if <[player].has_played_before>:
            - if <[path]> != null && <[path]> in <script[path_data].data_key[paths]>:
                - define path_data <script[<[path]>_path_data]>
                - define flag <[path_data].data_key[path_type_plural]>.<[path]>
                - define skill_data <script[<[path]>_skill_data]>
                - define skill_name <[path_data].data_key[skill_name]>
                - if <[player].has_flag[<[flag]>]>:
                    - if <[action]> != null:
                        - choose <[action]>:
                            - case give:
                                - if <[skill_data].list_keys.contains[<[skill]>]> && <[skill]> != all:
                                    - give player:<[player]> <[path]>_skill_book_<[skill]> quantity:1
                                    - narrate "<&e><[skill_name].to_titlecase> book successfully given to player."
                                - else if <[skill]> == all:
                                    - foreach <[skill_data].list_keys> as:skill_name:
                                        - give player:<[player]> <[path]>_skill_book_<[skill_name]>
                                    - narrate "<&e>All <[skill_name]> books successfully given to player."
                                - else:
                                    - narrate "<&c>Invalid <[skill_name]>!"
                            - case remove:
                                - if <[skill_data].list_keys.contains[<[skill]>]>:
                                    - if <[player].has_flag[<[flag]>.skills.<[skill]>]>:
                                        - flag <[player]> <[flag]>.skills.<[skill]>:!
                                        - if <player.has_flag[<[path]>.qb_skills]>:
                                            - repeat 8 as:qbslot:
                                                - if <[player].flag[<[path]>.qb_skills.<[qbslot]>]> == <[skill]>:
                                                    - flag <[player]> <[path]>.qb_skills.<[qbslot]>:!
                                        - narrate "<&e><[skill_name].to_titlecase> successfully removed from player."
                                    - else:
                                        - narrate "<&c>Player does not have that <[skill_name]>!"
                                - else:
                                    - narrate "<&c>Invalid <[skill_name]>!"
                            - case set:
                                - if <[skill]> != all && <[skill_data].list_keys.contains[<[skill]>]>:
                                    - if <[level]> != null && ( ( <[level]> > 0  && <[level]> < 4 ) || <[level]> == admin ):
                                        - flag <[player]> <[flag]>.skills.<[skill]>:<[level]>
                                        - narrate "<&e><[skill_name].to_titlecase> successfully set for player."
                                    - else:
                                        - narrate "<&c>Invalid level!"
                                - else if <[skill]> == all:
                                    - if <[level]> != null && ( ( <[level]> > 0  && <[level]> < 4 ) || <[level]> == admin ):
                                        - foreach <[skill_data].list_keys> as:skill:
                                            - flag <[player]> <[flag]>.skills.<[skill]>:<[level]>
                                        - narrate "<&e><[skill_name].to_titlecase>s successfully set for player."
                                    - else:
                                        - narrate "<&c>Invalid level!"
                                - else:
                                    - narrate "<&c>Invalid <[skill_name]>!"
                            - case clear:
                                - flag <[player]> <[flag]>.skills:!
                                - if <player.has_flag[<[path]>.qb_skills]>:
                                    - repeat 8 as:qbslot:
                                        - flag <[player]> <[path]>.qb_skills.<[qbslot]>:!
                                - narrate "<&e>All <[skill_name]>s successfully removed from player."
                            - case list:
                                - if <[player].flag[<[flag]>.skills].is_empty>:
                                    - narrate "<&c>Player does not know any <[skill_name]>s in this path!"
                                - else:
                                    - narrate "<&7>Player's currently learned <[skill_name]>s:"
                                    - foreach <[player].flag[<[flag]>.skills]> key:skill as:level:
                                        - narrate "<&7><[loop_index]>. <&9><[skill_data].data_key[<[skill]>.name]><&7>: <&d><[level]>"
                            - case default:
                                - narrate "<&7>Usage: /skill <&lt>player<&gt> <&lt>path<&gt> give/remove/set/list/clear <&lt>skill<&gt> <&lt>level<&gt>"
                    - else:
                        - narrate "<&7>Usage: /skill <&lt>player<&gt> <&lt>path<&gt> give/remove/set/list/clear <&lt>skill<&gt> <&lt>level<&gt>"
                - else:
                    - narrate "<&c>Player does not have this path!"
            - else:
                - narrate "<&c>The specified path does not exist!"
        - else:
            - narrate "<&c>Player not found!"
    - else:
        - narrate "<&7>Usage: /skill <&lt>player<&gt> <&lt>path<&gt> give/remove/set/list/clear <&lt>skill<&gt> <&lt>level<&gt>"
