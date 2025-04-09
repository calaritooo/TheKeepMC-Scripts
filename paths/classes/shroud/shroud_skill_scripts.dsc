shroud_skill_passives_script:
    type: world
    debug: false
    events:
        on player damages entity with:hand flagged:classes.shroud.skills.passives chance:100:
        - actionbar targets:<player> "<&a>Skill "passives" test successful!"

shroud_skill_immediate_test_script:
    type: task
    debug: false
    script:
    - define shroud <player>
    - actionbar targets:<[shroud]> "<&a>Skill test successful!"

shroud_upon_hit_handler:
    type: world
    debug: false
    events:
        on player damages entity with:hand flagged:active_skill|classes.shroud:
        - define skill <player.flag[active_skill]>
        - choose <[skill]>:
            - case activation_test:
                - actionbar targets:<player> "<&a>Skill test successful!"
                - flag <player> active_skill:!