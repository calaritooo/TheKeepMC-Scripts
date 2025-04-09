skill_book_handler:
    type: world
    debug: false
    events:
        on player right clicks block with:*_skill_book_*:
        - define path <context.item.script.name.before[_skill_book_]>
        - define skill <context.item.script.name.after[<[path]>_skill_book_]>
        - define path_data <script[<[path]>_path_data]>
        - if !<player.has_flag[<[path_data].data_key[path_type_plural]>.<[path]>]>:
            - actionbar targets:<player> "<&6>You can't seem to make sense of what's written..."
            - stop
        - if !<player.has_flag[<[path_data].data_key[path_type_plural]>.<[path]>.skills.<[skill]>]>:
            - flag <player> <[path_data].data_key[path_type_plural]>.<[path]>.skills.<[skill]>:1
            - take iteminhand
            - playsound <player> sound:<[path_data].data_key[learn_skill_sound]>
            - toast targets:<player> icon:<[path_data].data_key[learn_skill_icon]> "<&color[#<[path_data].data_key[color]>]>You have learned <script[<[path]>_skill_data].data_key[<[skill]>.name]>!"
            - if <[path_data].data_key[learn_skill_sound2].exists>:
                - wait 0.3s
                - playsound <player> sound:<[path_data].data_key[learn_skill_sound2]>
            - stop
        - else:
            - actionbar targets:<player> "<&c>You have already learned this <[path_data].data_key[skill_name]>!"

skill_scroll_handler:
    type: world
    debug: false
    events:
        on player right clicks block with:*_skill_scroll_*:
        - define path <context.item.script.name.before[_skill_scroll_]>
        - define skill <context.item.script.name.after[<[path]>_skill_scroll_]>
        - if <[skill]> == maltempo || <[skill]> == beltempo:
            - if <player.location.pitch> >= -30:
                - actionbar "<&c>You must face the sky to cast this!"
                - stop
        - take iteminhand quantity:1
        - run <[path]>_skill_<[skill]>_script