/// @description Move

if (x <> obj_player.x) dir = sign(obj_player.x - x);

if (place_meeting(x + 1, y, obj_player) || place_meeting(x -1, y, obj_player))
{
    if (obj_player.attacking == 1)
    {
        if (obj_player.vspd == 0)
        {
            ypos = y;
        }
        else
        {
            ypos = obj_player.y;
        }
        if (obj_player.x > x)
        {
            instance_create( obj_player.x - 5, ypos, obj_hit);
        }
        else if (obj_player.x < x)
        {
            instance_create( obj_player.x - 5, ypos, obj_hit);
        }
        else
        {
            instance_create( obj_player.x, ypos, obj_hit);
        }
        x += -dir * 3; 
    }
}

x += movingspeed * dir;

if (!place_meeting(x, y+1, obj_ground))
{
    y += 1;   
}

///Image
image_xscale = -dir;

