swordsman_skill_passives_script:
    type: world
    debug: false
    events:
        on player damages entity with:*_sword flagged:classes.swordsman.skills.passives chance:50:
        - actionbar targets:<player> "<&a>Skill "passives" test successful!"

swordsman_skill_immediate_test_script:
    type: task
    debug: false
    script:
    - define swordsman <player>
    - actionbar targets:<[swordsman]> "<&a>Skill test successful!"

swordsman_upon_hit_handler:
    type: world
    debug: false
    events:
        on player damages entity with:*_sword flagged:active_skill|classes.swordsman:
        - define skill <player.flag[active_skill]>
        - choose <[skill]>:
            - case activation_test:
                - actionbar targets:<player> "<&a>Skill test successful!"
                - flag <player> active_skill:!