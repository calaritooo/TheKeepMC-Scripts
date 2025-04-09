# DO NOT FORGET TO CREATE THE SPELL SCROLL !!!!AND!!!! ADD IT TO THE spell_script_action SCRIPT AT THE BOTTOM!
# THIS SECTION USE scroll2 TEXTURES
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

scholar_skill_scroll_glacius:
    type: item
    material: stick
    display name: <&d>Scroll: Glacius
    lore:
        - <&7><&o>Cast to hurl an
        - <&7><&o>ice shard.
    mechanisms:
        hides: ALL
        custom_model_data: 14021

scholar_skill_scroll_emberus:
    type: item
    material: stick
    display name: <&d>Scroll: Emberus
    lore:
        - <&7><&o>Cast to afflict a
        - <&7><&o>curse of burning.
    mechanisms:
        hides: ALL
        custom_model_data: 14021

scholar_skill_scroll_maltempo:
    type: item
    material: stick
    display name: <&d>Scroll: Maltempo
    lore:
        - <&7><&o>Cast into the sky to
        - <&7><&o>invoke a series of storms.
    mechanisms:
        hides: ALL
        custom_model_data: 14023

scholar_skill_scroll_beltempo:
    type: item
    material: stick
    display name: <&d>Scroll: Beltempo
    lore:
        - <&7><&o>Cast into the sky to
        - <&7><&o>call clear skies.
    mechanisms:
        hides: ALL
        custom_model_data: 14023

scholar_skill_scroll_noctio_hostis:
    type: item
    material: stick
    display name: <&d>Scroll: Noctio Hostis
    lore:
        - <&7><&o>Cast to invoke a wicked
        - <&7><&o>curse upon your opponents.
    mechanisms:
        hides: ALL
        custom_model_data: 14021
scholar_skill_scroll_renovatio:
    type: item
    material: stick
    display name: <&d>Scroll: Renovatio
    lore:
        - <&7><&o>Cast to provide a
        - <&7><&o>helping hand.
    mechanisms:
        hides: ALL
        custom_model_data: 14022

scholar_skill_scroll_defendere_aliatis:
    type: item
    material: stick
    display name: <&d>Scroll: Defendere Aliatis
    lore:
        - <&7><&o>Cast to create a
        - <&7><&o>shielding dome.
    mechanisms:
        hides: ALL
        custom_model_data: 14022

scholar_skill_scroll_solanine:
    type: item
    material: stick
    display name: <&d>Scroll: Solanine
    lore:
        - <&7><&o>Cast to curse a vomiting spell or
        - <&7><&o>a nauseating cloud, weaking the afflicted.
    mechanisms:
        hides: ALL
        custom_model_data: 14021

scholar_skill_scroll_nullus:
    type: item
    material: stick
    display name: <&d>Scroll: Nullus
    lore:
        - <&7><&o>Cast to temeporarily disarm your
        - <&7><&o>magically-armed opponent!
    mechanisms:
        hides: ALL
        custom_model_data: 14022

scholar_skill_scroll_remedia_totaeus:
    type: item
    material: stick
    display name: <&d>Scroll: Remedia Totaeus
    lore:
        - <&7><&o>Cast to provide relief and cleanse
        - <&7><&o>negative afflictions.
    mechanisms:
        hides: ALL
        custom_model_data: 14022

scholar_skill_scroll_locum_invertus:
    type: item
    material: stick
    display name: <&d>Scroll: Locum Invertus
    lore:
        - <&7><&o>Cast to trade locations with
        - <&7><&o>another living creature!
    mechanisms:
        hides: ALL
        custom_model_data: 14023

scholar_skill_scroll_potentia_imperium:
    type: item
    material: stick
    display name: <&d>Scroll: Potentia Imperium
    lore:
        - <&7><&o>Cast to launch a controlled
        - <&7><&o>explosive, activated by casting a second time.
    mechanisms:
        hides: ALL
        custom_model_data: 14021

scholar_skill_scroll_levitio:
    type: item
    material: stick
    display name: <&d>Scroll: Levitio
    lore:
        - <&7><&o>Cast to send a friend or foe
        - <&7><&o>gently floating into the air.
    mechanisms:
        hides: ALL
        custom_model_data: 14023

#scholar_skill_scroll_actions:
#    type: world
#    debug: false
#    events:
#        on player right clicks block with:scholar_skill_scroll_glacius:
#        - take iteminhand quantity:1
#        - run scholar_skill_glacius_script
#        on player right clicks block with:scholar_skill_scroll_maltempo:
#        - if <player.location.pitch> >= -30:
#            - actionbar "<&c>You must face the sky to cast this!"
#            - stop
#        - else:
#            - take iteminhand quantity:1
#            - run scholar_skill_maltempo_script
#        on player right clicks block with:scholar_skill_scroll_beltempo:
#        - if <player.location.pitch> >= -30:
#            - actionbar "<&c>You must face the sky to cast this!"
#            - stop
#        - else:
#            - take iteminhand quantity:1
#            - run scholar_skill_beltempo_script
#        on player right clicks block with:scholar_skill_scroll_emberus:
#        - take iteminhand quantity:1
#        - run scholar_skill_emberus_script
#        on player right clicks block with:scholar_skill_scroll_renovatio:
#        - take iteminhand quantity:1
#        - run scholar_skill_renovatio_script
#        on player right clicks block with:scholar_skill_scroll_defendere_aliatis:
#        - take iteminhand quantity:1
#        - run scholar_skill_defendere_aliatis_script
#        on player right clicks block with:scholar_skill_scroll_solanine:
#        - take iteminhand quantity:1
#        - run scholar_skill_solanine_script
#        on player right clicks block with:scholar_skill_scroll_nullus:
#        - take iteminhand quantity:1
#        - run scholar_skill_nullus_script
#        on player right clicks block with:scholar_skill_scroll_noctio_hostis:
#        - take iteminhand quantity:1
#        - run scholar_skill_noctio_hostis_script
#        on player right clicks block with:scholar_skill_scroll_remedia_totaeus:
#        - take iteminhand quantity:1
#        - run scholar_skill_remedia_totaeus_script
#        on player right clicks block with:scholar_skill_scroll_locum_invertus:
#        - take iteminhand quantity:1
#        - run scholar_skill_locum_invertus_script
#        on player right clicks block with:scholar_skill_scroll_potentia_imperium:
#        - take iteminhand quantity:1
#        - run scholar_skill_potentia_imperium_script
#        on player right clicks block with:scholar_skill_scroll_levitio:
#        - take iteminhand quantity:1
#        - run scholar_skill_levitio_script