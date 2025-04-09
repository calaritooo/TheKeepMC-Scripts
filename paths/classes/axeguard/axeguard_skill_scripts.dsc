axeguard_skill_passives_script:
    type: world
    debug: false
    events:
        on player damages entity with:*_axe flagged:classes.axeguard.skills.passives chance:100:
        - actionbar targets:<player> "<&a>Skill "passives" test successful!"

axeguard_skill_immediate_test_script:
    type: task
    debug: false
    script:
    - define axeguard <player>
    - actionbar targets:<[axeguard]> "<&a>Skill test successful!"

axeguard_upon_hit_handler:
    type: world
    debug: false
    events:
        on player damages entity with:*_axe flagged:active_skill|classes.axeguard:
        - define skill <player.flag[active_skill]>
        - choose <[skill]>:
            - case activation_test:
                - actionbar targets:<player> "<&a>Skill test successful!"
                - flag <player> active_skill:!