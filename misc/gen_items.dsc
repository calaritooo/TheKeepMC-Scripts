#ALL ITEMS SHOULD HAVE A UNIQUE FOUR-DIGIT CUSTOM MODEL DATA ID BEGINNING WITH ONE (1).
#NEXT CUSTOM MODEL DATA NUMBER -> 1071
#

aloe:
    type: item
    material: stick
    display name: <&color[#81B40C]>Aloe
    lore:
        - <&7><&o>A succulent characteristic of warmer regions.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1001

aloe_extract:
    type: item
    material: potion
    mechanisms:
        color: green
        hides: all
        custom_model_data: 1002
    display name: <&color[#81B40C]>Aloe Extract
    lore:
        - <&7><&o>A simple extract made from aloe.
    allow in material recipes: false
    recipes:
        1:
            type: brewing
            input: glass_bottle
            ingredient: aloe

angels_tear:
    type: item
    material: stick
    display name: <&color[#C1FBFF]>Angel's Tear
    lore:
        - <&7><&o>A drop of pure despair.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1003


burnt_parchment:
    type: item
    material: stick
    display name: <&color[#604E48]>Burnt Parchment
    lore:
        - <&7><&o>Just ashes at this point.
    allow in material recipes: false
    recipes:
        1:
            type: campfire
            cook_time: 5s
            input: paper
            output_quantity: 1
    mechanisms:
        custom_model_data: 1004

belladonna:
    type: item
    material: stick
    display name: <&color[#6E5983]>Belladonna
    lore:
        - <&7><&o>A helpful herb, only in small amounts.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1005

betabel:
    type: item
    material: stick
    display name: <&color[#73173A]>Betabel
    lore:
        - <&7><&o>A staple in some cultures...
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1006

cavern_mucus:
    type: item
    material: stick
    display name: <&color[#A7AF52]>Cavern Mucus
    lore:
        - <&7><&o>You touched that? Ew.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1007

divine_blood:
    type: item
    material: potion
    mechanisms:
        color: <&b>
        hides: ALL
        custom_model_data: 1008
    display name: <&color[#F488FF]>Divine Blood
    lore:
        - <&7><&o>Probably holier than thou.
    allow in material recipes: false

dryroot:
    type: item
    material: stick
    mechanisms:
        custom_model_data: 1009
    display name: <&color[#AB8771]>Dryroot
    lore:
        - <&7><&o>Once a vibrant green...
    allow in material recipes: false

elysias_allure:
    type: item
    material: stick
    display name: <&c>Elysia's Allure
    lore:
        - <&7><&o>The only flower that wants to be picked.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1010

emerichs_greed:
    type: item
    material: stick
    display name: <&a>Emerich's Greed
    lore:
        - <&7><&o>At what cost?
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1011

emperors_goblet:
    type: item
    material: stick
    display name: <&e>Emperor's Goblet
    lore:
        - <&7><&o>Said to be extinct.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1012

extract_of_flame:
    type: item
    material: honey_bottle
    display name: <&color[#C35D36]>Extract of Flame
    lore:
        - <&7><&o>An elemental extract.
    allow in material recipes: false
    recipes:
        1:
            type: brewing
            input: potion[potion_effects=[type=THICK]]
            ingredient: phoenix_tail
    mechanisms:
        custom_model_data: 1013

fairy_wing:
    type: item
    material: stick
    display name: <&color[#FFAEFD]>Fairy Wing
    lore:
        - <&7><&o>Clipped from the pure.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1014

gargoyle_dust:
    type: item
    material: stick
    display name: <&color[#878787]>Gargoyle Dust
    lore:
        - <&7><&o>An immoral vandalism.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1015

gold_dust:
    type: item
    material: stick
    display name: <&color[#D5A842]>Gold Dust
    lore:
        - <&7><&o>So bright, so brilliant.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1016

human_blood:
    type: item
    material: potion
    mechanisms:
        hides: all
        color: <&color[#6a0101]>
        custom_model_data: 1069
    display name: <&4>Human Blood
    lore:
        - <&7><&o>Much sweeter than the alternatives...
    allow in material recipes: false

human_blood_tagged:
    type: item
    material: potion
    mechanisms:
        hides: all
        color: <&color[#6a0101]>
        custom_model_data: 1017
    display name: <&4>Tagged Human Blood
    lore:
        - <&7><&o>Carefully extracted for the
        - <&7><&o>right reasons surely...
    allow in material recipes: false

witchs_bone_marrow:
    type: item
    material: stick
    display name: <&color[#6A5C4F]>Witch's Bone Marrow
    lore:
        - <&7><&o>You hear a faint whisper holding it...
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1018

hags_liver:
    type: item
    material: stick
    display name: <&color[#6E2819]>Hag's Liver
    lore:
        - <&7><&o>Spirits, brews, potions, what's your vice?
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1019

herbal_paste:
    type: item
    material: stick
    display name: <&color[#72982A]>Herbal Paste
    lore:
        - <&7><&o>Traditionally made in a mortar and pestle.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1020
    recipes:
        1:
            type: shapeless
            input: belladonna|wolfsbane|wormwood|mystdew

highland_snow:
    type: item
    material: stick
    display name: <&color[#C8D6E0]>Highland Snow
    lore:
        - <&7><&o>Snow from.. well, ya know.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1021

holy_water:
    type: item
    material: lingering_potion
    mechanisms:
        hides: ALL
        color: <&color[#007AD1]>
        custom_model_data: 1022
    display name: <&color[#007AD1]>Holy Water
    lore:
        - <&7><&o>Blessed to cleanse.
    allow in material recipes: false

impure_blood:
    type: item
    material: potion
    mechanisms:
        hides: ALL
        color: <&color[#A82F2F]>
        custom_model_data: 1023
    display name: <&color[#A82F2F]>Impure Blood
    lore:
        - <&7><&o>Raw and contaminated.
    allow in material recipes: false

infernal_blood:
    type: item
    material: potion
    mechanisms:
        hides: ALL
        color: purple
        custom_model_data: 1024
    display name: <&color[#850030]>Infernal Blood
    lore:
        - <&7><&o>It burns to the touch.
    allow in material recipes: false

iron_dust:
    type: item
    material: stick
    display name: <&7>Iron Dust
    lore:
        - <&7><&o>Slightly magnetic.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1025

juniper_berries:
    type: item
    material: stick
    display name: <&color[#365575]>Juniper Berries
    lore:
        - <&7><&o>Ralof once wondered...
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1026

lovers_longing:
    type: item
    material: stick
    display name: <&color[#A1B6C2]>Lover's Longing
    lore:
        - <&7><&o>A somber beauty.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1027

mystdew:
    type: item
    material: stick
    display name: <&3>Mystdew
    lore:
        - <&7><&o>Collected in the fog.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1028

phoenix_tail:
    type: item
    material: stick
    display name: <&color[#C35D36]>Phoenix Tail
    lore:
        - <&7><&o>It'll grow back...
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1029

poison_ivy:
    type: item
    material: stick
    display name: <&color[#167200]>Poison Ivy
    lore:
        - <&7><&o>Well this sucks...
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1030

purified_blood:
    type: item
    material: potion
    mechanisms:
        hides: all
        color: red
        custom_model_data: 1031
    display name: <&c>Purified Blood
    lore:
        - <&7><&o>Treated for better use.
    recipes:
        1:
            type: brewing
            input: impure_blood
            ingredient: betabel
    allow in material recipes: false

reinforced_bottle:
    type: item
    material: stick
    display name: <&f>Reinforced Bottle
    lore:
        - <&7><&o>Hardened for the more complicated mixtures.
    allow in material recipes: false
    mechanisms:
        hides: enchants
        custom_model_data: 1032
    enchantments:
    - unbreaking:1

rosemary:
    type: item
    material: stick
    display name: <&color[#8AAF81]>Rosemary
    lore:
        - <&7><&o>Yummy with garlic.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1033

ruby_dust:
    type: item
    material: stick
    display name: <&4>Ruby Dust
    lore:
        - <&7><&o>Often confused with glitter.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1034

salt:
    type: item
    material: sugar
    display name: <&f>Salt
    lore:
        - <&7><&o>A little goes a long way.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1035
    recipes:
        1:
            type: furnace
            input: bottle_of_salt_water
            cook_time: 15s

sands_of_time:
    type: item
    material: stick
    display name: <&color[#D3B853]>Sands of Time
    lore:
        - <&7><&o>Ancestral ingredient native to Dugrès.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1036

sea_strand:
    type: item
    material: stick
    display name: <&color[#2BCE84]>Sea Strand
    lore:
        - <&7><&o>Found only at lower depths.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1037

seed_of_sin:
    type: item
    material: stick
    display name: <&color[#6F2A2A]>Seed of Sin
    lore:
        - <&7><&o>Inherently Rotten.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1038

soulberries:
    type: item
    material: stick
    display name: <&color[#9FBFC2]>Soulberries
    lore:
        - <&7><&o>Native to the Demure.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1039

spark_of_creation:
    type: item
    material: stick
    display name: <&color[#9840E7]>Spark of Creation
    lore:
        - <&7><&o>A power unknown to man.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1040

spirit_scale:
    type: item
    material: stick
    display name: <&color[#6D77CB]>Spirit Scale
    lore:
        - <&7><&o>Light to hold, cold to touch.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1041

spriggan_myrtus:
    type: item
    material: stick
    display name: <&a>Spriggan Myrtus
    lore:
        - <&7><&o>It's said, 'meer', not 'mer'.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1042

sweet_grass:
    type: item
    material: stick
    display name: <&2>Sweet Grass
    lore:
        - <&7><&o>Not actually that sweet.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1043

urushiol:
    type: item
    material: potion
    recipes:
        1:
            type: brewing
            input: glass_bottle
            ingredient: poison_ivy
    mechanisms:
        color: gray
        hides: ALL
        custom_model_data: 1044
    display name: <&7>Urushiol
    lore:
        - <&7><&o>An allergen extracted from poison ivy.
    allow in material recipes: false

watchers_eye:
    type: item
    material: stick
    display name: <&5>Watcher's Eye
    lore:
        - <&7><&o>Intimidating and unsettling, handle with care.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1045

water_artichoke:
    type: item
    material: stick
    display name: <&3>Water Artichoke
    lore:
        - <&7><&o>Tastes bitter.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1046

wolfsbane:
    type: item
    material: stick
    display name: <&e>Wolfsbane
    lore:
        - <&7><&o>Smells funny.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1047

wormwood:
    type: item
    material: stick
    display name: <&2>Wormwood
    lore:
        - <&7><&o>A common medicinal herb.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1048

witchs_bone:
    type: item
    material: stick
    display name: <&color[#D0C6E1]>Witch's Bone
    lore:
        - <&7><&o>How did you get this?
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1049

mandrake_root:
    type: item
    material: stick
    display name: <&5>Mandrake Root
    lore:
        - <&7><&o>Noisy lil' buggers they are.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1050

chamomile:
    type: item
    material: stick
    display name: <&color[#9BA1CC]>Chamomile
    lore:
        - <&7><&o>The scent overwhelms you
        - <&7><&o>with a sense of drowsiness.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1051

bottle_of_salt_water:
    type: item
    material: potion
    display name: <&color[#87C3E8]>Bottle of Salt Water
    lore:
        - <&7><&o>Maybe a good boil will do.
    allow in material recipes: false
    mechanisms:
        hides: ALL
        color: <&color[#87C3E8]>
        custom_model_data: 1052

cinnamon:
    type: item
    material: stick
    display name: <&color[#8E4329]>Cinnamon
    lore:
        - <&7><&o>It's just stripped bark, you know?
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1053

coconut:
    type: item
    material: stick
    display name: <&color[#614124]>Coconut
    lore:
        - <&7><&o>These have many uses!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1054

coffee_beans:
    type: item
    material: stick
    display name: <&color[#82572F]>Coffee Beans
    lore:
        - <&7><&o>Typically used to make Coffee.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1055

eye_of_newt:
    type: item
    material: stick
    display name: <&color[#2CBD88]>Eye of Newt
    lore:
        - <&7><&o>Told ya you'd put someone's eye out!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1056

frog_saliva:
    type: item
    material: stick
    display name: <&2>Frog Saliva
    lore:
        - <&7><&o>Goopy & weird.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1057

frothed_milk:
    type: item
    material: powder_snow_bucket
    display name: <&f>Frothed Milk
    lore:
        - <&7><&o>Usually made for lattes.
    allow in material recipes: false
    recipes:
        1:
            type: smoker
            input: milk_bucket
    mechanisms:
        custom_model_data: 1058

lucky_rabbits_foot:
    type: item
    material: rabbit_foot
    display name: <&color[#C1AA03]>Lucky Rabbit's Foot
    lore:
        - <&7><&o>Feelin' lucky, punk?
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1059

owls_feather:
    type: item
    material: stick
    display name: <&color[#ADADAD]>Owl's Feather
    lore:
        - <&7><&o>Did it bring some letters?
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1060

tongue_of_dog:
    type: item
    material: stick
    display name: <&color[#B07E8B]>Tongue of Dog
    lore:
        - <&7><&o>Poor woofer.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1061

wool_of_bat:
    type: item
    material: stick
    display name: <&color[#785E4F]>Wool of Bat
    lore:
        - <&7><&o>You, too, can be a Bat-Person.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1062

cocoapowder:
    type: item
    material: stick
    display name: <&color[#82572F]>Cocoa Powder
    lore:
        - <&7><&o>Yummier baked into something.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1063

muffinmixveggie:
    type: item
    material: stick
    display name: <&color[#D5BFB1]>Veggie Muffin Mix
    lore:
        - <&7><&o>Just needs to bake.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1064

muffinmixchocolate:
    type: item
    material: stick
    display name: <&color[#D5BFB1]>Chocolate Muffin Mix
    lore:
        - <&7><&o>Just needs to bake.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1065

muffinmixsweetberry:
    type: item
    material: stick
    display name: <&color[#D5BFB1]>Sweet Berry Muffin Mix
    lore:
        - <&7><&o>Just needs to bake.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1066

condensedcobblestone:
    type: item
    material: stick
    display name: <&7>Condensed Cobblestone
    lore:
        - <&7><&o>Heavier than it looks.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1067

condenseddirt:
    type: item
    material: stick
    display name: <&color[#82572F]>Condensed Dirt
    lore:
        - <&7><&o>Heavier than it looks.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1068

jar_of_fireflies:
    type: item
    material: stick
    display name: <&e>Jar of Fireflies
    lore:
        - <&7><&o>Particularly luminous...
    allow in material recipes: false
    mechanisms:
        custom_model_data: 1070

#THESE ARE THE WORLD SCRIPT INTERACTIONS FOR ONE OR MORE OF THE ABOVE INGREDIENTS. IF TOOLS ARE REQUIRED, GO TO customtools.dsc.

grindstone_recipes:
    type: world
    events:
        after player right clicks grindstone with:iron_ingot:
        - if <player.is_sneaking> = true:
            - inventory close
            - take slot:hand quantity:1
            - playsound <player.location> sound:block.grindstone.use
            - give slot:hand item:iron_dust quantity:1
        - else:
            - stop
        after player right clicks grindstone with:gold_ingot:
        - if <player.is_sneaking> = true:
            - inventory close
            - take slot:hand quantity:1
            - playsound <player.location> sound:block.grindstone.use
            - give slot:hand item:gold_dust quantity:1
        - else:
            - stop
        after player right clicks grindstone with:witchs_bone:
        - if <player.is_sneaking> = true:
            - inventory close
            - take slot:hand quantity:1
            - playsound <player.location> sound:block.grindstone.use
            - give slot:hand item:witchs_bone_marrow quantity:1
        - else:
            - stop
        after player right clicks grindstone with:bone:
        - if <player.is_sneaking> = true:
            - inventory close
            - take slot:hand quantity:1
            - playsound <player.location> sound:block.grindstone.use
            - give slot:hand item:bone_needle quantity:1
        - else:
            - stop

emerichs_greed_merchant_death:
    type: world
    debug: false
    events:
        on wandering_trader death chance:4:
        - drop emerichs_greed location:<context.entity.location> quantity:1

grass_drops:
    type: world
    debug: false
    events:
        after player breaks short_grass chance:2:
        - drop chamomile location:<player.cursor_on> quantity:1
        after player breaks short_grass chance:1:
        - drop rosemary location:<player.cursor_on> quantity:1
        after player breaks tall_grass chance:4:
        - drop sweet_grass location:<player.cursor_on> quantity:1

sea_strand_harvest:
    type: world
    debug: false
    events:
        after player breaks kelp chance:1:
        - drop sea_strand location:<player.cursor_on> quantity:1

#water_bottle_return_upon_boiling:
#    type: world
#    debug: false
#    events:
#        after furnace cooks bottle_of_salt_water:
#         - drop potion[components_patch=[map=<potion_contents=[map=<potion:string=water>]>] location:<context.location> quantity:1

aloe_harvest:
    type: world
    debug: false
    events:
        after player breaks cactus chance:1:
        - drop aloe location:<player.cursor_on> quantity:1

highland_snow_harvest:
    type: world
    events:
        after player breaks snow_block with:*_shovel chance:2:
        - if <player.location.biome.name> in <script[biomelists].data_key[biomes.snowy]>:
            - drop highland_snow location:<player.cursor_on> quantity:1

witch_drops:
    type: world
    events:
        on player kills witch chance:10:
        - drop witchs_bone location:<context.entity.location> quantity:1
        on player kills witch chance:5:
        - drop hags_liver location:<context.entity.location> quantity:1

cinnamon_harvest:
    type: world
    events:
        after player right clicks *_log with:*_axe chance:0.5:
        - drop cinnamon location:<context.location> quantity:1

wool_of_bat_drop:
    type: world
    events:
        on player kills bat chance:10:
        - drop wool_of_bat location:<context.entity.location> quantity:1

tongue_of_dog_drop:
    type: world
    events:
        on player kills wolf chance:2:
        - drop tongue_of_dog location:<context.entity.location> quantity:1

consumption_and_use_prevention:
    type: world
    events:
        on player consumes aloe_extract:
        - determine cancelled
        on player consumes extract_of_flame:
        - determine cancelled
        on player consumes eye_of_newt:
        - determine cancelled
        on player consumes urushiol:
        - determine cancelled
        on player consumes bottle_of_salt_water:
        - determine cancelled
        on player right clicks block with:frothed_milk:
        - determine cancelled