archer_path_data:
    type: data
    name: Archer
    path_type: class
    path_type_plural: classes
    learn_skill_sound: entity.arrow.shoot
    learn_skill_sound2: entity.arrow.hit
    learn_skill_icon: bow
    color: E48015
    skill_name: skill

archer_skill_data:
    type: data
    passives:
        type: Passive
    predators_mark:
        type: Immediate
        cooldown:
            1: 18
            2: 16
            3: 14
            admin: 0
    smoke_bomb:
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
    heated_tip:
        type: Activation
        cooldown:
            1: 25
            2: 22
            3: 20
            admin: 0
        time_to_use:
            1: 30
            2: 45
            3: 60
            admin: 60