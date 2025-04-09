spb_a_cat:
    type: item
    material: golden_sword
    display name: <&c>Attack Spells
    lore:
        - <&7><&o>Spells in this category are defined carefully
        - <&7><&o>in comparison with defense spells, as that
        - <&7><&o>should be their only true purpose.
    mechanisms:
        hides: ALL

spb_a_1:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_a_2:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_a_3:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_a_4:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_a_5:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_a_6:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_a_7:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_a_8:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_a_9:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_a_10:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_a_11:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_a_12:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_cat:
    type: item
    material: golden_chestplate
    display name: <&b>Defense Spells
    lore:
        - <&7><&o>Spells in this category are often recognized as
        - <&7><&o>the beginning of it all. As among the first, they were
        - <&7><&o>created for the protection of the caster and their allies.
    mechanisms:
        hides: ALL

spb_d_1:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_2:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_3:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_4:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_5:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_6:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_7:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_8:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_9:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_10:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_11:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_d_12:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_cat:
    type: item
    material: spectral_arrow
    display name: <&6>Utility Spells
    lore:
        - <&7><&o>Spells in this category are often left undesired by
        - <&7><&o>the average spellcaster, but no being, living or dead,
        - <&7><&o>can resist the consequences of their raw power.
    mechanisms:
        hides: ALL

spb_u_1:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_2:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_3:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_4:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_5:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_6:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_7:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_8:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_9:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_10:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_11:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_u_12:
    type: procedure
    script:
    - define cat <script.name.after[spb_].before_last[_]>
    - if <player.has_flag[cat_spells.<[cat]>]>:
        - define spell <player.flag[cat_spells.<[cat]>].get[<script.name.after_last[_]>].if_null[null]>
        - if <[spell]> == null:
            - determine air
        - else:
            - determine <item[scholar_skill_gui_<[spell]>]>
    - else:
        - determine air

spb_qb_1:
    type: procedure
    script:
    - if <player.has_flag[classes.scholar.qb_skills]> && <player.flag[classes.scholar.qb_skills].contains[1]>:
        - determine <item[scholar_skill_gui_<player.flag[classes.scholar.qb_skills].get[1]>]>
    - else:
        - determine empty_wand_slot

spb_qb_2:
    type: procedure
    script:
    - if <player.has_flag[classes.scholar.qb_skills]> && <player.flag[classes.scholar.qb_skills].contains[2]>:
        - determine <item[scholar_skill_gui_<player.flag[classes.scholar.qb_skills].get[2]>]>
    - else:
        - determine empty_wand_slot

spb_qb_3:
    type: procedure
    script:
    - if <player.has_flag[classes.scholar.qb_skills]> && <player.flag[classes.scholar.qb_skills].contains[3]>:
        - determine <item[scholar_skill_gui_<player.flag[classes.scholar.qb_skills].get[3]>]>
    - else:
        - determine empty_wand_slot

spb_qb_4:
    type: procedure
    script:
    - if <player.has_flag[classes.scholar.qb_skills]> && <player.flag[classes.scholar.qb_skills].contains[4]>:
        - determine <item[scholar_skill_gui_<player.flag[classes.scholar.qb_skills].get[4]>]>
    - else:
        - determine empty_wand_slot

spb_qb_5:
    type: procedure
    script:
    - if <player.has_flag[classes.scholar.qb_skills]> && <player.flag[classes.scholar.qb_skills].contains[5]>:
        - determine <item[scholar_skill_gui_<player.flag[classes.scholar.qb_skills].get[5]>]>
    - else:
        - determine empty_wand_slot

spb_qb_6:
    type: procedure
    script:
    - if <player.has_flag[classes.scholar.qb_skills]> && <player.flag[classes.scholar.qb_skills].contains[6]>:
        - determine <item[scholar_skill_gui_<player.flag[classes.scholar.qb_skills].get[6]>]>
    - else:
        - determine empty_wand_slot

spb_qb_7:
    type: procedure
    script:
    - if <player.has_flag[classes.scholar.qb_skills]> && <player.flag[classes.scholar.qb_skills].contains[7]>:
        - determine <item[scholar_skill_gui_<player.flag[classes.scholar.qb_skills].get[7]>]>
    - else:
        - determine empty_wand_slot

spb_qb_8:
    type: procedure
    script:
    - if <player.has_flag[classes.scholar.qb_skills]> && <player.flag[classes.scholar.qb_skills].contains[8]>:
        - determine <item[scholar_skill_gui_<player.flag[classes.scholar.qb_skills].get[8]>]>
    - else:
        - determine empty_wand_slot

close_button:
    type: item
    material: barrier
    display name: <&c>Close
    mechanisms:
        hides: ALL

close_button_handler:
    type: world
    events:
        on player clicks close_button in inventory:
        - inventory close

empty_wand_slot:
    type: item
    material: nether_star
    display name: <&color[#637AEE]>Empty Slot
    lore:
        - <&7><&o>No spell is assigned to this slot.
    mechanisms:
        hides: ALL