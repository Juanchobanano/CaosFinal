// (Horizontal Attack).
var enemy = argument[0];
var yy = argument[1];
if(enemy.x < Player.x) var escala = 1;
else var escala = -1;
image_xscale = escala;

//show_message(object_get_name(enemy));

if(yy < y + 10 and yy > y - 15){

    // (Aside Attack).
    
        // Jump con sprite mirando a la derecha. (Aside attack).
        if(x < Player.x and Player.image_xscale == -1){
            Current_Sprite(asset_get_index("spr_player" + jugador + "_jump_" + humor + "_attack"), 0, 0, retard_value);
          //  show_debug_message("ERROR 1");
            
            //Destroy_Enemy_Android(x + 62 * image_xscale, y - 5, enemy);
        // Climb con sprite mirando a la izquierda. (Aside attack).
        }else if(x > Player.x and Player.image_xscale == 1){
            Current_Sprite(asset_get_index("spr_player" + jugador + "_jump_" + humor + "_attack"), 0, 0, retard_value);
           // show_debug_message("ERROR 2");
           // Destroy_Enemy_Android(x + 62 * image_xscale, y - 5, enemy);
        }
        
    // (Front Attack). 
                  
        // Climb con sprite mirando a la derecha. (Front Attack).
        if(x > Player.x and Player.image_xscale == -1){
            Current_Sprite(asset_get_index("spr_player" + jugador + "_jump_" + humor + "_attack"), 0, 3, retard_value);
            //Destroy_Enemy_Android(x - 56 * image_xscale, y + 6, enemy);
        // Climb con sprite mirando a la izquierda. (Front Attack).
        }else if(x < Player.x and Player.image_xscale == 1){
            Current_Sprite(asset_get_index("spr_player" + jugador + "_jump_" + humor + "_attack"), 0, 3, retard_value);
            //Destroy_Enemy_Android(x - 56 * image_xscale, y + 6, enemy);
        }

// (Vertical Attack).
}else{

    // (Down Attack).   
    if(yy >= y + 10){
        Current_Sprite(asset_get_index("spr_player" + jugador + "_jump_" + humor + "_attack"), 0, 2, retard_value);
       // Destroy_Enemy_Android(x - 40 * image_xscale, y + 52, enemy);
        
    // (Up Attack).
    }else{
        Current_Sprite(asset_get_index("spr_player" + jugador + "_jump_" + humor + "_attack"), 0, 1, retard_value);
       //Destroy_Enemy_Android(x, y - 52, enemy);
    }
}

if(!place_meeting(enemy.x, enemy.y, Soldado_Piso)){


    if(point_in_circle(enemy.x, enemy.y, x, y, 20)){
        if(instance_exists(Helicoptero)){
            destroy_h = instance_nearest(enemy.x, enemy.y, Helicoptero);
            if(destroy_h.sprite_index != spr_helicopter_back){
                Play_Track("attack");
                with destroy_h instance_destroy(); // Get score dentro de cada objeto.
            }
        }
    }else{
        with(enemy) instance_destroy();   
        if(object_get_name(enemy) == "Soldado_Piso"){
            audio_play_sound(sn_eat_power, 1, 0);   
        }else{
            Play_Track("attack");
        }
    }
}

/*
if(point_in_circle(enemy.x, enemy.y, x, y, 20)){
    destroy_h = instance_nearest(enemy.x, enemy.y, Helicoptero);
    if(destroy_h.sprite_index != spr_helicopter_back){
        with destroy_h instance_destroy(); // Get score dentro de cada objeto.
    }
}

