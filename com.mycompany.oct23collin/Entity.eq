
/*
 * Entity
 * Created by Eqela Studio 2.0b7.4
 */

public class Entity : SEEntity
{
    SESprite dog;
    SESprite text;
    int w;
    int h;
    int mx;
    int my;
    int p_x;
    int p_y;
    
    public void initialize(SEResourceCache rsc) {
        base.initialize(rsc);
        w = get_scene_width();
        h = get_scene_height();


        rsc.prepare_image("mydog","dog",0.1*w);
        dog = add_sprite_for_image(SEImage.for_resource("mydog"));
    
        dog.move(Math.random(0,w),Math.random(0,h));

        rsc.prepare_font("myfont","trebuchet ms bold color=black", 80);
        text = add_sprite_for_text(" ","myfont");
    }

    public void tick(TimeVal now, double delta) {
        base.tick(now,delta);
        
        mx = dog.get_x();
        my = dog.get_y();

        p_x = MainScene.x;
        p_y = MainScene.y;
        
        dog.move(mx+(p_x-mx)/Math.random(200,600),my+(p_y-my)/Math.random(200,600));

        if((mx/p_x)==1 && (my/p_y)==1){
            text.set_text("GAME OVER!");
            text.move(0.35*w, 0.45*h);
        }
        
    }

    public void cleanup() {
        base.cleanup();
    }
    
}
