import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

int r;
int g;
int b;

Box2DProcessing box2d;

void setup()
{
  fullScreen(P3D);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -100);
  box2d.setContinuousPhysics(true);
  

}

void draw()
{
  background(r, g, b);
  
  box2d.step();
}