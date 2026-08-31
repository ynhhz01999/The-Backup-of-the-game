// Move
moveder = 0;
movespeed = 2;
xspeed = 0;
yspeed = 0;
face = 1;             
char_scale = 0.28125; 

// Grav and jump
grav = 0.275;
tervel = 4;
jspeed = -5.125;               
jhold_speed = jspeed * 1.5;     

// Player Sprites
idlespr = ARTI_Idle;
walkspr = ARTI_Walk;
rollspr = ARTI_Roll;
jumpspr = ARTI_Jump;	

// Mechanic Delay & Cooldown
jump_cooldown = 5;      
max_cooldown = 12;      
was_in_air = false;    

// Roll State
is_rolling = false;
roll_dir = 1;         