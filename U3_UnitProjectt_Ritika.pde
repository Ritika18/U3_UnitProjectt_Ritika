/*
Name of the game: War Time

Description: This game consists of two players, who are fighting to get the other off 
of the platform. The first to do this wins a point. Functions which are allowed for each
player are moving left or right, staying still, or jumping. There is no down function.
For the first player, the keys are a, w, and d. For the second player, the keys are j,
l, and i. Adding on to this, there is a replay function which is used when one of the 
players lose. By clicking r, the game resets and you can play again. 

*/

//importing Box 2D
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

//Color variables
int r;
int g;
int b;

//true or false statement for if the game is running
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
  
  //loading images for my players and platform
  whitePlayer = loadImage("white.png");
  whitePlayer.resize(100,150);
  blackPlayer = loadImage("black.png");
  blackPlayer.resize(100,150);

  icePlatformImg = loadImage("ice_platform.png");
  
  //constructor for the classes
  p1 = new Player(width/2-50, 0, blackPlayer);
  p2 = new Player(width/2+50, 0, whitePlayer);
  
  int w = icePlatformImg.width;
 
  platform1 = new Platform(width/2, height-150, icePlatformImg);
  platform2 = new Platform(width/3, height-150, icePlatformImg);
  platform3 = new Platform(width/3+w+60, height-150, icePlatformImg);
}

void draw()
{
  //so that the background can be changed
  background(r, g, b);
  
  box2d.step();
  
  //giving the players and platform what has been programmed in the classes
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