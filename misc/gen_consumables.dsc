#ALL ITEMS SHOULD HAVE A UNIQUE FOUR-DIGIT CUSTOM MODEL DATA ID BEGINNING WITH TWO (2).
#LATEST CUSTOM MODEL DATA NUMBER -> 2004
#

orange:
    type: item
    material: cookie
    display name: <&6>Orange
    lore:
        - <&7><&o>Sweet and refreshing!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2001

orange_harvest:
    type: world
    debug: false
    events:
        on oak_leaves decay chance:0.50:
        - drop orange location:<context.location> quantity:1
        on dark_oak_leaves decay chance:0.50:
        - drop orange location:<context.location> quantity:1
        on acacia_leaves decay chance:0.50:
        - drop orange location:<context.location> quantity:1
        on jungle_leaves decay chance:0.50:
        - drop orange location:<context.location> quantity:1
        on player breaks oak_leaves chance:0.50:
        - drop orange location:<context.location> quantity:1
        on player breaks dark_oak_leaves chance:0.50:
        - drop orange location:<context.location> quantity:1
        on player breaks acacia_leaves chance:0.50:
        - drop orange location:<context.location> quantity:1
        on player breaks jungle_leaves chance:0.50:
        - drop orange location:<context.location> quantity:1

saltyrottenflesh:
    type: item
    material: rotten_flesh
    display name: <&color[#76311B]>Salty Rotten Flesh
    lore:
        - <&7><&o>Time for a smoke!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2002

jerky:
    type: item
    material: cookie
    display name: <&color[#76311B]>Jerky
    lore:
        - <&7><&o>A good ration for travel.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2003

burgerfish:
    type: item
    material: cookie
    display name: <&color[#A57734]>Fish Burger
    lore:
        - <&7><&o>Burgers are always great!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2004

burgerham:
    type: item
    material: cookie
    display name: <&color[#A57734]>Hamburger
    lore:
        - <&7><&o>Burgers are always great!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2005

burgermutton:
    type: item
    material: cookie
    display name: <&color[#A57734]>Lamburger
    lore:
        - <&7><&o>Burgers are always great!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2006

smores:
    type: item
    material: cookie
    display name: <&color[#B58868]>Smores
    lore:
        - <&7><&o>A great campfire snack!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2007

burgerveggie:
    type: item
    material: cookie
    display name: <&color[#A57734]>Veggie Sandwich
    lore:
        - <&7><&o>Sandwiches can be pretty tasty!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2008

burgerrabbit:
    type: item
    material: cookie
    display name: <&color[#A57734]>Bunny Burger
    lore:
        - <&7><&o>Burgers are always great!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2009

muffinveggie:
    type: item
    material: cookie
    display name: <&color[#B58868]>Veggie Muffin
    lore:
        - <&7><&o>A light snack.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2010

muffinchocolate:
    type: item
    material: cookie
    display name: <&color[#B58868]>Chocolate Muffin
    lore:
        - <&7><&o>A light snack.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2011

hotdog:
    type: item
    material: cookie
    display name: <&color[#A57734]>Hotdog
    lore:
        - <&7><&o>Great when grilled!
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2012

muffinsweetberry:
    type: item
    material: cookie
    display name: <&color[#B58868]>Sweet Berry Muffin
    lore:
        - <&7><&o>A light snack.
    allow in material recipes: false
    mechanisms:
        custom_model_data: 2013

custom_food_world_script:
    type: world
    debug: false
    events:
# GIVES 6.5 MEAT STICKS vvvv #
        on player consumes burgerfish|burgerham|burgermutton|burgerrabbit|hotdog:
        - determine cancelled passively
        - feed <player> amount:13 saturation:15
        - take iteminhand quantity:1
# GIVES 4.5 MEAT STICKS vvvv #
        on player consumes burgerveggie:
        - determine cancelled passively
        - feed <player> amount:9 saturation:9
        - take iteminhand quantity:1
# GIVES 2 MEAT STICKS vvvv #
        on player consumes muffinsweetberry|muffinchocolate|muffinveggie|jerky:
        - determine cancelled passively
        - feed <player> amount:4 saturation:2
        - take iteminhand quantity:1
# GIVES 1.5 MEAT STICKS vvvv #
        on player consumes orange:
        - determine cancelled passively
        - feed <player> amount:3 saturation:1.2
        - take iteminhand quantity:1