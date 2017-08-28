/// @description Move
key_left = -keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_up);
key_down = keyboard_check(vk_down);
key_attack = keyboard_check_pressed(vk_space);
key_attack_release = keyboard_check_released(vk_space);


dir = key_left + key_right;
hspd = move_speed * dir;
if (key_attack && (attacking != 1))
{
    attacking = 1;
    image_index = 0;
    alarm[0] = 10;
}

if (alarm[0] > 0 && vspd == 0) hspd = 0;

if (vspd < 10) vspd += grav;


x += hspd;


if (place_meeting(x, y+1, obj_ground))
{
    vspd = key_jump * -jump_speed;
    if (key_jump == 1) jumping = 1;
}

if (place_meeting(x, y+vspd, obj_ground))
{
    while(!place_meeting(x, y+1, obj_ground))
    {
        y += sign(vspd);
    }
    vspd = 0;
    jumping = 0;
}
y += vspd;



///Images
if (jumping <> 0 && attacking == 0)
{
    if (vspd < 0)
    {
        sprite_index = spr_player_jump;
        if (image_index == image_number -1) image_speed = 0;
    }
    else
    {
        sprite_index = spr_player_falling;
    }
}
else if (attacking == 1)
{
    if (jumping <> 0)
    {
        if (vspd < 0)
        {
            sprite_index = spr_player_jumpKick;
        }
        else
        {
            sprite_index = spr_player_fallingKick;
        }
    }
    else
    {
        sprite_index = spr_player_attack;
    }
}
else
{
    image_speed = 0.5;
    if (dir == 0)
    {
        sprite_index = spr_yello_nin_idle;
    }
    else
    {
        image_xscale = dir;
        sprite_index = spr_player_running;
    }
}

///Scroll background
if ( hspd <> 0)
{
    __background_set( e__BG.HSpeed, 0, -1 * dir * 3 );
    __background_set( e__BG.HSpeed, 1, -1 * dir * 4 );
}
else
{
    __background_set( e__BG.HSpeed, 0, 0 );
    __background_set( e__BG.HSpeed, 1, 0 );
}


