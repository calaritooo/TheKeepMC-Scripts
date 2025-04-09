axeguard_skill_gui_immediate_test:
    type: item
    material: enchanted_book
    display name: <&color[#38AD48]>Immediate Test
    lore:
        - <&7><&o>Use this skill to test
        - <&7><&o>immediate skills.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.axeguard.skills.<script.name.after[axeguard_skill_gui_]>]>
        - <&7>Cooldown: <&c><script[axeguard_skill_data].data_key[<script.name.after[axeguard_skill_gui_]>].deep_get[cooldown.<player.flag[classes.axeguard.skills.<script.name.after[axeguard_skill_gui_]>]>]>s
        - <&7>Type: <&b><script[axeguard_skill_data].data_key[<script.name.after[axeguard_skill_gui_]>].deep_get[type]>
    mechanisms:
        hides: ALL

axeguard_skill_gui_activation_test:
    type: item
    material: enchanted_book
    display name: <&color[#38AD48]>Activation Test
    lore:
        - <&7><&o>Use this skill to test
        - <&7><&o>activation skills.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.axeguard.skills.<script.name.after[axeguard_skill_gui_]>]>
        - <&7>Cooldown: <&c><script[axeguard_skill_data].data_key[<script.name.after[axeguard_skill_gui_]>].deep_get[cooldown.<player.flag[classes.axeguard.skills.<script.name.after[axeguard_skill_gui_]>]>]>s
        - <&7>Type: <&b><script[axeguard_skill_data].data_key[<script.name.after[axeguard_skill_gui_]>].deep_get[type]>
    mechanisms:
        hides: ALL