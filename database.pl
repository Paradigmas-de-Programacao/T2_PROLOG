% enemies

person_id(poison_ivy, 1).

place_id(gotham_city_bank, 1).

weapon_id(freeze_gun, 1).

is_an_enemy(poison_ivy, batman).
is_an_enemy(poison_ivy, joker).
true_name(poison_ivy, pamela_lillian_isley).

is_an_enemy(joker, batman).
is_an_enemy(harley_quinn, batman).
is_an_enemy(black_mask, batman).
is_an_enemy(bane, batman).
is_an_enemy(the_penguin, batman).
is_an_enemy(enigma, batman).
is_an_enemy(killer_croc, batman).
is_an_enemy(deadshot, batman).
is_an_enemy(mad_hatter, batman).
is_an_enemy(firefly, batman).
is_an_enemy(deathstroke, batman).
is_an_enemy(lady_shiva, batman).
is_an_enemy(anarky, batman).
is_an_enemy(falcone, batman).
is_an_enemy(mister_freeze, batman).
is_an_enemy(killer_croc, batman).
is_an_enemy(copperhead, batman).
is_an_enemy(electrocutioner, batman).

% Example

is_afraid_of(firefly).

% the 8 bounty hunters

hunt(killer_croc, batman).
hunt(deathstroke, batman).
hunt(firefly, batman).
hunt(copperhead, batman).
hunt(deadshot, batman).
hunt(electrocutioner, batman).
hunt(lady_shiva, batman).
hunt(bane, batman).

% allies

is_an_ally(alfred, batman).
is_an_ally(james_gordon, batman).
is_an_ally(robin, batman).
is_an_ally(barbara_gordon, batman).
is_an_ally(lucius_fox, batman).
is_an_ally(poison_ivy, harley_quinn).
