import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

int r;
int g;
int b;
Boolean isActive = true;

Box2DProcessing box2d;

//Objects
Player p1;
Player p2;
Platform platform1;
Platform platform2;
Platform platform3;

//Images
PImage blackPlayer;
PImage whitePlayer;
PImage icePlatformImg;

void setup()
{
  fullScreen(P3D);
  colorMode(HSB);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -100);
  box2d.setContinuousPhysics(true);
  
  blackPlayer = loadImage("a.png");
  blackPlayer.resize(100,150);
  whitePlayer = loadImage("b.png");
  whitePlayer.resize(100,150);

  icePlatformImg = loadImage("ice_platform.png");
  
  p1 = new Player(width/2-50, 0, blackPlayer);
  p2 = new Player(width/2+50, 0, whitePlayer);
  
  int w = icePlatformImg.width;
 
  platform1 = new Platform(width/2, height-150, icePlatformImg);
  platform2 = new Platform(width/3, height-150, icePlatformImg);
  platform3 = new Platform(width/3+w+60, height-150, icePlatformImg);
}

void draw()
{
  background(r, g, b);
  
  box2d.step();
  
  p1.Draw();
  p1.Update1();
  p1.score1();
  
  p2.Draw();
  p2.Update2();
  p2.score2();
  
  platform1.Draw();
  platform2.Draw();
  platform3.Draw();
}