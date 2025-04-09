server_item_inventory:
    type: inventory
    inventory: chest
    title: <&9><&l>Registered External Items
    size: 54
    gui: true
    procedural items:
    - determine <server.flag[server_items].values>
    slots:
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

server_item_command:
    type: command
    name: serveritem
    description: Use this to modify or view external items registered to the server!
    usage: /serveritem save/delete/view <&lt>hand<&gt> <&lt>name (if saving)<&gt>
    permission: admin.quests
    tab completions:
        1: save|delete|view
        2: hand
    script:
    - define action <context.args.get[1].if_null[null]>
    - define item <context.args.get[2].if_null[null]>
    - define name <context.args.get[3].if_null[null]>
    - if <[action]> != null:
        - choose <[action]>:
            - case save:
                - if <[item]> == hand:
                    - flag server server_items.<[name]>:<player.item_in_hand>
                    - narrate "<&e>Item successfully registered as <&f><[name]><&e>!"
                - else:
                    - narrate "<&c>Invalid item! Please hold the item you would like to register in your hand."
            - case delete:
                - if <[item]> == hand:
                    - define found false
                    - foreach <server.flag[server_items]> key:item_name as:item:
                        - if <[item]> == <player.item_in_hand>:
                            - flag server server_items.<[item_name]>:!
                            - define found true
                            - narrate "<&e>Item successfully unregistered!"
                            - foreach stop
                    - if !<[found]>:
                        - narrate "<&c>Item not found!"
                - else:
                    - narrate "<&c>Invalid item! Please hold the item you would like to unregister in your hand or specify a valid slot."
            - case view:
                - inventory open d:server_item_inventory
            - case default:
                - narrate "<&7>Usage: /serveritem save/delete/view <&lt>hand<&gt> <&lt>name (if saving)<&gt>"
    - else:
        - narrate "<&7>Usage: /serveritem save/delete/view <&lt>hand<&gt> <&lt>name (if saving)<&gt>"

server_item_inventory_actions:
    type: world
    debug: false
    events:
        on player left clicks item in server_item_inventory:
        - narrate "<&e>Item saved as: '<&f><element[<server.flag[server_items].keys.get[<context.slot>]>].on_click[<&lt>server.flag[server_items.<server.flag[server_items].keys.get[<context.slot>]>]<&gt>].type[copy_to_clipboard].on_hover[Click to copy!]><&e>'. Click to copy the tag to clipboard!"
        on player right|middle clicks item in server_item_inventory:
        - give <context.item> quantity:1