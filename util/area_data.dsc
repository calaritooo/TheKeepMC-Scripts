area_data:
    type: data
    # AREAS AS DEFINED BY ACCESSIBLE TO PLAYERS ----------------------------------------------
    areas:
        wild_realm_spawn:
            name: Main Post
            crimes:
                murder:
                    enabled: false
                    fine: 0
                theft:
                    enabled: false
                    fine: 0
        camp_cinder:
            name: Camp Cinder
            regions:
                - cindersandpit
            nation: vendaven
            province: region_of_the_demure
            crimes:
                murder:
                    enabled: true
                    fine: 17.25
                theft:
                    enabled: true
                    fine: 12.75
        shaleight_township:
            name: Shaleight Township
            regions:
                - shaleight
            nation: vendaven
            province: region_of_the_demure
            crimes:
                murder:
                    enabled: true
                    fine: 26.65
                theft:
                    enabled: true
                    fine: 18.40
        fort_wakers:
            name: Fort Wakers
            regions:
                - fortwakers
            nation: vendaven
            province: caer_vellan_capital_region
            crimes:
                murder:
                    enabled: true
                    fine: 21.90
                theft:
                    enabled: true
                    fine: 15.30
        caer_vellan:
            name: Caer Vellan
            regions:
                - caer_vellan
            nation: vendaven
            province: caer_vellan_capital_region
            crimes:
                murder:
                    enabled: true
                    fine: 43.15
                theft:
                    enabled: true
                    fine: 24.85
        wayfair_keep:
            name: Wayfair Keep
            regions:
                - wayfairkeep
            nation: null
            province: null
            crimes:
                murder:
                    enabled: false
                    fine: 0
                theft:
                    enabled: false
                    fine: 0
        castle_eldridge:
            name: Castle Eldridge
            regions:
                - castleeldridge
            nation: null
            province: null
            crimes:
                murder:
                    enabled: false
                    fine: 0
                theft:
                    enabled: false
                    fine: 0
        nahun:
            name: Nahun
            regions:
                - nahun
                - palaceofnahun
            nation: al-qamar
            province: nahun_province
            crimes:
                murder:
                    enabled: true
                    fine: 22.35
                theft:
                    enabled: true
                    fine: 12.30
        dugres:
            name: Dugrès
            regions:
                - dugres
                - palaceofdugres
            nation: al-qamar
            province: dugres_province
            crimes:
                murder:
                    enabled: true
                    fine: 34.65
                theft:
                    enabled: true
                    fine: 19.40

    # PROVINCE GROUP TYPE OF AREAS ----------------------------------------------
    provinces:
        region_of_the_demure:
            name: Region of the Demure
            nation: vendaven
            areas:
                - camp_cinder
                - shaleight_township
        caer-vellan_capital_region:
            name: Caer Vellan Capital Region
            nation: vendaven
            areas:
                - fort_wakers
                - port_vendaven
        dugres_province:
            name: Dugrès Province
            nation: al-qamar
            areas:
                - dugres
        nahun_province:
            name: Nahun Province
            nation: al-qamar
            areas:
                - nahun

    # NATION GROUP TYPE OF AREAS ----------------------------------------------
    nations:
        vendaven:
            name: Republic of Vendaven
            provinces:
                - region_of_the_demure
                - caer_vellan_capital_region
        al-qamar:
            name: Kingdom of Al-Qamar
            provinces:
                - dugres_province
                - nahun_province