class Player extends Entity
{
  //using the entity class as well as the following variables specific to a player
  private boolean _keyLeft;
  private boolean _keyRight;
  private boolean _keyJump;
 
  private PVector _moveSpeed;
  
  private boolean _keyLeft2;
  private boolean _keyRight2;
  private boolean _keyJump2;
  
  private int Score1 = 0;
  private int Score2 = 0;
  
  //using the entity class to create the player
  Player(float x, float y, PImage img)
  {
    super(x, y, img, "Player");
    super.CreateBody(BodyType.DYNAMIC);
    _moveSpeed = new PVector(50,0);  
  }
  
  //having an update function for each individual player
  public void Update1()
  {
    KeyInputs1();
    HandleMovement1();
  }
  
  //which keys are used for that player's movement
  private void KeyInputs1()
  {
    //having the player move in the direction based on the key pressed
    if (keyPressed)
    {
      if (key == 'd')
      {
        _keyRight = true;
      }
      if (key == 'a')
      {
        _keyLeft = true;
      }
      if (key == 'w')
      {
        _keyJump = true;
      }
    }
    else
    {
      _keyLeft  = false;
      _keyRight = false;
      _keyJump  = false;
    }
  }
  
  //the velocity of the player
  private void HandleMovement1()
  {
    Vec2 currentVelocity = super._body.getLinearVelocity();
    
    
    //the velocity in which direction it is moving
    //code to move right, left, and stay still
    if (_keyRight)
    {
      currentVelocity.x = 4 * _moveSpeed.x;
    }
    else if (_keyLeft)
    {
      currentVelocity.x = -4 * _moveSpeed.x;
    }
    else
    {
      currentVelocity.x = 0;
    }
    super._body.setLinearVelocity(currentVelocity);
    
    //code for how to jump
    if (_keyJump == true)
    {
      currentVelocity.y = 10;
      super._body.setLinearVelocity(currentVelocity);
    }
  }
  
  //score for player 1
  public void score1()
  {
    //creating the box which the score will be displayed in
    fill(255);
    rect(15,15,100,35);
    fill(0);
    textSize(32);
    text(Score1,40,45);
    
    Vec2 pos = box2d.getBodyPixelCoord(super._body);
    
    //when the object falls below the platform
    if(pos.y > height-230)
    {
      //score becomes 1
      Score1 = 1;
      isActive = false;
      
      //the background changes the color to black
      r = 0;
      g = 0;
      b = 0;
    }
    
    //resent function
    keyReleased();
    
    //when the game begins
    if(isActive == true)
    {
      //the color is different, around a yellowish color
      r = 50;
      g = 128;
      b = 255;
      
      //starting position of the first player
      pos.y = 0;
      pos.x = width/2-30;
    }
  }
  
  //reset function
  private void keyReleased()
  {
    if(key == 'r')
    {
      //game is beginning again
      isActive = true;
      
      //the player returns to the original position
      float a = super._body.getAngle();
      Body b = super._body;
     
      BodyDef bd = new BodyDef();
      
      Vec2 newPos = bd.position.set(box2d.coordPixelsToWorld(width/2-30,0));
      b.setTransform(newPos,-a);
    }
  }
  
  //second update function for the second player
  public void Update2()
  {
    KeyInputs2();
    HandleMovement2();
  }

  //the keys required to play for this player
  private void KeyInputs2()
  {
    //code for moving right, left, jumping, or not moving
    if (keyPressed)
    {
      if (key == 'l')
      {
        _keyRight2 = true;
      }
      if (key == 'j')
      {
        _keyLeft2 = true;
      }
      if (key == 'i')
      {
        _keyJump2 = true;
      }
    } 
    
    else
    {
      _keyLeft2  = false;
      _keyRight2 = false;
      _keyJump2  = false;
    }
  }
  
  //the velocity of the player
  private void HandleMovement2()
  {
    Vec2 currentVelocity = super._body.getLinearVelocity();

    //code for the velocity moving right, left, and still
    if (_keyRight2)
    {
      currentVelocity.x = 5 * _moveSpeed.x;
    } 
    
    else if (_keyLeft2)
    {
      currentVelocity.x = -5 * _moveSpeed.x;
    } 
    
    else
    {
      currentVelocity.x = 0;
    }
    super._body.setLinearVelocity(currentVelocity);

    //code for having the player jump
    if (_keyJump2 == true)
    {
      currentVelocity.y = 10;
      super._body.setLinearVelocity(currentVelocity);
    }
  }
  
  //score for the second player
  public void score2()
  {
    //creating a text box and text displaced for the score
    fill(255);
    rect(width-115,15,100,35);
    fill(0);
    textSize(32);
    text(Score2,width-100,45);
    
    Vec2 pos = box2d.getBodyPixelCoord(super._body);

    //when the player goes below the platform
    if(pos.y > height-230)
    {
      //the score equals 1
      Score2 = 1;
      isActive = false;
      
      //the background color is changed to white
      colorMode(RGB);
      r = 255;
      g = 255;
      b = 255;
    }
    
    //reset function 
    keyReleased2();

    //when the game begins
    if(isActive == true)
    {
      //the background color is the yellowish color
      colorMode(HSB);
      r = 50;
      g = 128;
      b = 255;
      
      //starting location for the second player
      pos.y = 0;
      pos.x = width/2+30;            
    }
  } 
  
  //replay function reseting the location of this player back to the top
  private void keyReleased2()
  {
    //replay the game
    if(key == 'r')
    {
      //the game is on
      isActive = true;
      
      //removing the player back to the top
      float a = super._body.getAngle();
      Body b = super._body;
     
      BodyDef bd = new BodyDef();
      
      Vec2 newPos = bd.position.set(box2d.coordPixelsToWorld(width/2+30,0));
      b.setTransform(newPos,-a);
    }
  }  
}