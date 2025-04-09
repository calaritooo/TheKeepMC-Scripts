shroud_skill_gui_immediate_test:
    type: item
    material: enchanted_book
    display name: <&color[#A41EB3]>Immediate Test
    lore:
        - <&7><&o>Use this skill to test
        - <&7><&o>immediate skills.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.shroud.skills.<script.name.after[shroud_skill_gui_]>]>
        - <&7>Cooldown: <&c><script[shroud_skill_data].data_key[<script.name.after[shroud_skill_gui_]>].deep_get[cooldown.<player.flag[classes.shroud.skills.<script.name.after[shroud_skill_gui_]>]>]>s
        - <&7>Type: <&b><script[shroud_skill_data].data_key[<script.name.after[shroud_skill_gui_]>].deep_get[type]>
    mechanisms:
        hides: ALL

shroud_skill_gui_activation_test:
    type: item
    material: enchanted_book
    display name: <&color[#A41EB3]>Activation Test
    lore:
        - <&7><&o>Use this skill to test
        - <&7><&o>activation skills.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.shroud.skills.<script.name.after[shroud_skill_gui_]>]>
        - <&7>Cooldown: <&c><script[shroud_skill_data].data_key[<script.name.after[shroud_skill_gui_]>].deep_get[cooldown.<player.flag[classes.shroud.skills.<script.name.after[shroud_skill_gui_]>]>]>s
        - <&7>Type: <&b><script[shroud_skill_data].data_key[<script.name.after[shroud_skill_gui_]>].deep_get[type]>
    mechanisms:
        hides: ALL