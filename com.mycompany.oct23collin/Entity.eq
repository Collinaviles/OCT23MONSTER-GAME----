
/*
 * Entity
 * Created by Eqela Studio 2.0b7.4
 */

public class Entity : SEEntity
{
	SESprite dog;
	int w;
	int h;
	int mx;
	int my;
	int p_x;
	int py;
	
	public void initialize(SEResourceCache rsc)

	{
		base.initialize(rsc);
		w = get_scene_width();
		h = get_scene_height();
		p_x = MainScene.x;
		py = MainScene.y;

		
		rsc.prepare_image("mydog","dog",0.1*w);
		dog = add_sprite_for_image(SEImage.for_resource("mydog"));
		mx = dog.get_x();
		my = dog.get_y();
		dog.move(Math.random(0,w), Math.random(0,h));
	}

	public void tick(TimeVal now, double delta)
	{
		var mx = dog.get_x();
		var my = dog.get_y();
		var px = MainScene.x;
		var py = MainScene.y;
		base.tick(now, delta);
		dog.move(mx +(px-mx)/Math.random(50,300), my + (py-my)/Math.random(50,300));
	}

	public void cleanup()
	{
		base.cleanup();
	}
	
}
