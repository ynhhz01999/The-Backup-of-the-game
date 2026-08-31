//Full Screan
if keyboard_check_pressed(vk_f8)
{
	window_set_fullscreen( !window_get_fullscreen() );
}



// Movement
rightkey = keyboard_check(ord("D")) == true or keyboard_check(vk_right);
leftkey = keyboard_check(ord("A")) == true or keyboard_check(vk_left);
jumpkey = keyboard_check_pressed(vk_space);

moveder = rightkey - leftkey;

xspeed = moveder * movespeed

var _subPixel = .5;
if place_meeting(x + xspeed, y, skills)
{
	var _pixelCheck = _subPixel * sign(xspeed);
	while !place_meeting(x + _pixelCheck, y, skills)
	{
		x += _pixelCheck;
	}
	
	xspeed = 0;
}

x+= xspeed;

// Animation Movement
if moveder !=0 {face = moveder;};
if abs(xspeed) > 0 {sprite_index = walkspr; };
if xspeed == 0 { sprite_index = idlespr; };
// Hit
mask_index = idlespr;




// Grav

yspeed += grav;

if jumpkey && place_meeting(x, y+1, skills)
{
	yspeed = jspeed;
}

_subPixel = .5;
if place_meeting(x,y+yspeed, skills)
{
	var _pixelCheck = _subPixel *sign(yspeed);
	
	while !place_meeting(x,y + _pixelCheck, skills)
	{
		y+= _pixelCheck;
	}
	
	yspeed = 0;
}


y+= yspeed;

// Jump high
//none