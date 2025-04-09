discord_command:
    type: command
    name: discord
    description: Use this to get our server discord link!
    usage: /discord
    permission: scriptcommand.discordlink
    script:
    - narrate "<&7>Join us on discord at <&9>https://discord.gg/Nv6gz93Mnk&<&7>!"

currency_command:
    type: command
    name: currency
    description: Use the tab-completion to quickly grab the Talon symbol!
    usage: /currency
    permission: admin.currency
    tab completions:
        1: ₮
    script:
    - narrate "₮ is the Talon currency symbol. Use tab-completions on this command to quickly copy it!"

areas_command:
    type: command
    name: areas
    description: Use this to add/remove/list areas for a specified player!
    usage: /areas <&lt>player<&gt> add/remove/list <&lt>area<&gt>
    permission: admin.areas
    tab completions:
        1: <server.online_players.parse[name]>
        2: add|remove|list
        3: <script[area_data].data_key[areas].keys>
    script:
    - define arg1 <context.args.first.if_null[null]>
    - define player <server.match_offline_player[<[arg1]>]>
    - define action <context.args.get[2].if_null[null]>
    - define area <context.args.get[3].if_null[null]>
    - if <[player]> != null:
        - if <[player].has_played_before>:
            - if <[action]> != null:
                - choose <[action]>:
                    - case add:
                        - if <[area]> != null:
                            - if <[player].flag[unlocked_areas]> !contains <[area]>:
                                - flag <[player]> unlocked_areas:->:<[area]>
                                - narrate "<&e>Area successfully unlocked for <&f><[player].name><&e>!"
                            - else:
                                - narrate "<&c>Player has already unlocked this area!"
                        - else:
                            - narrate "<&c>Invalid area!"
                    - case remove:
                        - if <[area]> != null:
                            - if <[player].flag[unlocked_areas]> contains <[area]>:
                                - flag <[player]> unlocked_areas:<-:<[area]>
                                - narrate "<&e>Area successfully removed from <&f><[player].name><&e>!"
                            - else:
                                - narrate "<&c>Player has not unlocked this area!"
                        - else:
                            - narrate "<&c>Invalid area!"
                    - case list:
                        - if <[player].has_flag[unlocked_areas]> && <[player].flag[unlocked_areas].any>:
                            - narrate "<&e>Areas unlocked by <&f><[player].name>:"
                            - foreach <[player].flag[unlocked_areas]> as:area:
                                - narrate "<&7><[loop_index]>. <&f><script[area_data].data_key[areas.<[area]>.name]>"
                        - else:
                            - narrate "<&c>This player has not unlocked any areas! <&7>This is only common for brand new players. <&c>If that is not the case, report this error immediately to a developer."
                    - case default:
                        - narrate "<&7>Usage: /areas <&lt>player<&gt> add/remove/list <&lt>area<&gt>"
            - else:
                - narrate "<&7>Usage: /areas <&lt>player<&gt> add/remove/list <&lt>area<&gt>"
        - else:
            - narrate "<&c>Player not found!"
    - else:
        - narrate "<&7>Usage: /areas <&lt>player<&gt> add/remove/list <&lt>area<&gt>"