//Full Screan
if keyboard_check_pressed(vk_f8)
{
	window_set_fullscreen( !window_get_fullscreen() );
}


mask_index = idlespr;

// Input
rightkey = keyboard_check(ord("D")) or keyboard_check(vk_right);
leftkey = keyboard_check(ord("A")) or keyboard_check(vk_left);
jumpkey = keyboard_check_pressed(vk_space);
jumpkey_release = keyboard_check_released(vk_space);


rollkey = keyboard_check_pressed(vk_control);

moveder = rightkey - leftkey;


// ROLLING (STATE & TIMER)
if (rollkey && place_meeting(x, y+1, skills) && !is_rolling && jump_cooldown <= 0) {
    is_rolling = true;
    sprite_index = rollspr; 
    image_index = 0;      
    roll_dir = (moveder != 0) ? moveder : face; 
}


if (is_rolling) {
    xspeed = roll_dir * (movespeed * 1.5);
    
   
    if (image_index >= image_number - 1) {
        is_rolling = false;
    }
} else {
    xspeed = moveder * movespeed;
    if (moveder != 0) { 
        face = moveder; 
    }
}


// LANDING COOLDOWN


if (jump_cooldown > 0) {
    jump_cooldown--;
}


if (place_meeting(x, y+1, skills)) {
    if (was_in_air == true) {
        jump_cooldown = max_cooldown; 
        was_in_air = false;           
    }
} else {
    was_in_air = true; 
}


// X Collision
var _subPixel = .5;
if place_meeting(x + xspeed, y, skills) {
	var _pixelCheck = _subPixel * sign(xspeed);
	while !place_meeting(x + _pixelCheck, y, skills) {
		x += _pixelCheck;
	}
	xspeed = 0;
}
x += xspeed;

// Gravity
yspeed += grav;
if (yspeed > tervel) { yspeed = tervel; }


// JUMP & JUMPHOLD OPTIMIZATION



if (jumpkey && place_meeting(x, y+1, skills) && jump_cooldown <= 0 && !is_rolling) {
    yspeed = jhold_speed; 
}


if (jumpkey_release) {

    
    if (yspeed < jspeed) {

        yspeed = jspeed; 
        
    } else if (yspeed < 0) {

        yspeed *= 0.4;
    }
}

// Y Collision
if place_meeting(x, y + yspeed, skills) {
	var _pixelCheck = _subPixel * sign(yspeed);
	while !place_meeting(x, y + _pixelCheck, skills) {
		y += _pixelCheck;
	}
	yspeed = 0;
}
y += yspeed;


// ANIMASI
if (is_rolling) { 
    sprite_index = rollspr; 
    image_speed = 1; 
} else if (!place_meeting(x, y+1, skills)) {
    
    if (sprite_index != jumpspr) {
        sprite_index = jumpspr;
        image_index = 0; 
    }
    
    
    if (image_index >= image_number - 1) {
        image_index = image_number - 1; 
        image_speed = 0;                
    } else {
        image_speed = 1; 
    }
} else {
    image_speed = 1; 
    
    
    if (jump_cooldown > 0) {
        sprite_index = idlespr;
    } else if (xspeed != 0) {
        sprite_index = walkspr;
    } else {
        sprite_index = idlespr;
    }
}