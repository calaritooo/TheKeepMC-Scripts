archer_skill_gui_predators_mark:
    type: item
    material: enchanted_book
    display name: <&6>Predator's Mark
    lore:
        - <&7><&o>Scan your surroundings for the nearest
        - <&7><&o>potential target to you.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.archer.skills.<script.name.after[archer_skill_gui_]>]>
        - <&7>Cooldown: <&c><script[archer_skill_data].data_key[<script.name.after[archer_skill_gui_]>].deep_get[cooldown.<player.flag[classes.archer.skills.<script.name.after[archer_skill_gui_]>]>]>s
        - <&7>Type: <&b><script[archer_skill_data].data_key[<script.name.after[archer_skill_gui_]>].deep_get[type]>
    mechanisms:
        hides: ALL

archer_skill_gui_smoke_bomb:
    type: item
    material: enchanted_book
    display name: <&6>Smoke Bomb
    lore:
        - <&7><&o>Create an illuding flash of
        - <&7><&o>light, giving yourself a stealthy exit.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.archer.skills.<script.name.after[archer_skill_gui_]>]>
        - <&7>Cooldown: <&c><script[archer_skill_data].data_key[<script.name.after[archer_skill_gui_]>].deep_get[cooldown.<player.flag[classes.archer.skills.<script.name.after[archer_skill_gui_]>]>]>s
        - <&7>Type: <&b><script[archer_skill_data].data_key[<script.name.after[archer_skill_gui_]>].deep_get[type]>
    mechanisms:
        hides: ALL

archer_skill_gui_heated_tip:
    type: item
    material: enchanted_book
    display name: <&6>Heated Tip
    lore:
        - <&7><&o>Upon landing, the arrow fired suddenly
        - <&7><&o>combusts, leaving nothing behind.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.archer.skills.<script.name.after[archer_skill_gui_]>]>
        - <&7>Cooldown: <&c><script[archer_skill_data].data_key[<script.name.after[archer_skill_gui_]>].deep_get[cooldown.<player.flag[classes.archer.skills.<script.name.after[archer_skill_gui_]>]>]>s
        - <&7>Type: <&b><script[archer_skill_data].data_key[<script.name.after[archer_skill_gui_]>].deep_get[type]>
    mechanisms:
        hides: ALL