axeguard_path_data:
    type: data
    name: Axeguard
    path_type: class
    path_type_plural: classes
    learn_skill_sound: block.trial_spawner.detect_player
    learn_skill_sound2: entity.horse.armor
    learn_skill_icon: saddle
    color: 38AD48
    skill_name: skill

axeguard_skill_data:
    type: data
    passives:
        type: passive
    immediate_test:
        type: Immediate
        cooldown:
            1: 18
            2: 16
            3: 14
            admin: 0
    activation_test:
        type: Activation
        cooldown:
            1: 23
            2: 21
            3: 19
            admin: 0
        time_to_use:
            1: 30
            2: 45
            3: 60
            admin: 60