# THIS SECTION USES scroll1 TEXTURES
# CUSTOM MODEL DATA IDs:
# attack_skill_book = 14001
# defense_skill_book = 14002
# utility_skill_book = 14003
# attack_skill_scroll1 = 14011
# defense_skill_scroll1 = 14012
# utility_skill_scroll1 = 14013
# attack_skill_scroll2 = 14021
# defense_skill_scroll2 = 14022
# utility_skill_scroll2 = 14023

scholar_skill_gui_glacius:
    type: item
    material: stick
    display name: <&c>Glacius
    lore:
        - <&7><&o>Cast to hurl an
        - <&7><&o>ice shard.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14011

scholar_skill_gui_emberus:
    type: item
    material: stick
    display name: <&c>Emberus
    lore:
        - <&7><&o>Cast to afflict a
        - <&7><&o>curse of burning.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14011

scholar_skill_gui_maltempo:
    type: item
    material: stick
    display name: <&6>Maltempo
    lore:
        - <&7><&o>Cast into the sky to
        - <&7><&o>invoke a series of storms.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14013

scholar_skill_gui_beltempo:
    type: item
    material: stick
    display name: <&6>Beltempo
    lore:
        - <&7><&o>Cast into the sky to
        - <&7><&o>call clear skies.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14013

scholar_skill_gui_noctio_hostis:
    type: item
    material: stick
    display name: <&c>Noctio Hostis
    lore:
        - <&7><&o>Cast to invoke a wicked
        - <&7><&o>curse upon your opponents.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14011
scholar_skill_gui_renovatio:
    type: item
    material: stick
    display name: <&b>Renovatio
    lore:
        - <&7><&o>Cast to provide a
        - <&7><&o>helping hand.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14012

scholar_skill_gui_defendere_aliatis:
    type: item
    material: stick
    display name: <&b>Defendere Aliatis
    lore:
        - <&7><&o>Cast to create a
        - <&7><&o>shielding dome.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14012

scholar_skill_gui_solanine:
    type: item
    material: stick
    display name: <&c>Solanine
    lore:
        - <&7><&o>Cast to curse a vomiting skill or
        - <&7><&o>a nauseating cloud, weaking the afflicted.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14011

scholar_skill_gui_nullus:
    type: item
    material: stick
    display name: <&b>Nullus
    lore:
        - <&7><&o>Cast to temeporarily disarm your
        - <&7><&o>magically-armed opponent!
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14012

scholar_skill_gui_remedia_totaeus:
    type: item
    material: stick
    display name: <&b>Remedia Totaeus
    lore:
        - <&7><&o>Cast to provide relief and cleanse
        - <&7><&o>negative afflictions.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14012

scholar_skill_gui_locum_invertus:
    type: item
    material: stick
    display name: <&6>Locum Invertus
    lore:
        - <&7><&o>Cast to trade locations with
        - <&7><&o>another living creature.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14013

scholar_skill_gui_potentia_imperium:
    type: item
    material: stick
    display name: <&c>Potentia Imperium
    lore:
        - <&7><&o>Cast to launch a controlled
        - <&7><&o>explosive, activated by casting a second time.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14011

scholar_skill_gui_levitio:
    type: item
    material: stick
    display name: <&6>Levitio
    lore:
        - <&7><&o>Cast to send a friend or foe
        - <&7><&o>gently floating into the air.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14013

scholar_skill_gui_petrificus_totaeus:
    type: item
    material: stick
    display name: <&6>Petrificus Totaeus
    lore:
        - <&7><&o>Cast to lock your opponent in place,
        - <&7><&o>leaving them entirely paralyzed for a brief period.
        - <empty>
        - <&7>Level: <&9><player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>
        - <&7>Cooldown: <&e><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[cooldown.<player.flag[classes.scholar.skills.<script.name.after[scholar_skill_gui_]>]>]>s
        - <&7>Type: <&color[<script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[color]>]><script[scholar_skill_data].data_key[<script.name.after[scholar_skill_gui_]>].deep_get[type_long]>
    mechanisms:
        hides: ALL
        custom_model_data: 14013