import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

int r;
int g;
int b;

Box2DProcessing box2d;

//Objects
Player p1;
Player p2;
Platform platform1;
Platform platform2;
Platform platform3;

//Images
PImage bluePlayer;
PImage purplePlayer;
PImage icePlatformImg;

void setup()
{
  fullScreen(P3D);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -100);
  box2d.setContinuousPhysics(true);
  
  bluePlayer = loadImage("a.png");
  bluePlayer.resize(100,150);
  purplePlayer = loadImage("b.png");
  purplePlayer.resize(100,150);

  icePlatformImg = loadImage("ice_platform.png");
  
  p1 = new Player(width/2-50, 0, bluePlayer, true);
  p2 = new Player(width/2+50, 0, purplePlayer, true);
  
  int w = icePlatformImg.width;
 
  platform1 = new Platform(width/2, height-150, icePlatformImg, true);
  platform2 = new Platform(width/3, height-150, icePlatformImg, true);
  platform3 = new Platform(width/3+w+60, height-150, icePlatformImg, true);
}

void draw()
{
  background(r, g, b);
  
  box2d.step();
  
  p1.Update1();
  p2.Update2();
  
  platform1.Draw();
  platform2.Draw();
  platform3.Draw();
}