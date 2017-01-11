class Player extends Entity
{
  private boolean _keyLeft;
  private boolean _keyRight;
  private boolean _keyJump;
  private PVector _moveSpeed;
  private int     _jumpStrength;
  private boolean _keyLeft2;
  private boolean _keyRight2;
  private boolean _keyJump2;
  private int Score1 = 0;
  private int Score2 = 0;
  
  Player(float x, float y, PImage img)
  {
    super(x, y, img, "Player");
    super.CreateBody(BodyType.DYNAMIC);
    _moveSpeed = new PVector(50,0);
    
    _jumpStrength = 1000;
  }
  
  public void Update1()
  {
    KeyInputs1();
    HandleMovement1();
  }
  
  private void KeyInputs1()
  {
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
  
  private void HandleMovement1()
  {
    Vec2 currentVelocity = super._body.getLinearVelocity();
    
    
    //edit the current velocity based on what we're doing
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
    
    //
    // THIS IS AN AWFUL WAY OF DOING JUMP
    // PLEASE NOTE THIS DOWN AND DO NOT USE IT IN YOUR FINAL CODE!
    // Jump should be based on when you "hit the ground" NOT BY USING
    // VELOCITY!
    //
    
    if (_keyJump == true)
    {
      currentVelocity.y = 10;
      super._body.setLinearVelocity(currentVelocity);
    }
  }
  
  public void score1()
  {
    fill(255);
    rect(15,15,100,35);
    fill(0);
    textSize(32);
    text(Score1,40,45);
    
    Vec2 pos = box2d.getBodyPixelCoord(super._body);

    if(pos.y > height-230)
    {
      Score1 = 1;
      isActive = false;
      r = 0;
      g = 0;
      b = 0;
    }
    
    keyReleased();

    if(isActive == true)
    {
      r = 50;
      g = 128;
      b = 255;
      pos.y = 0;
      pos.x = width/2-30;
    }
  }
  
  private void keyReleased()
  {
    if(key == 'r')
    {
      isActive = true;
            
      float a = super._body.getAngle();
      Body b = super._body;
     
      BodyDef bd = new BodyDef();
      
      Vec2 newPos = bd.position.set(box2d.coordPixelsToWorld(width/2-30,0));
      b.setTransform(newPos,-a);
    }
  }
    
  public void Update2()
  {
    KeyInputs2();
    HandleMovement2();
  }

  private void KeyInputs2()
  {
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
  
  private void HandleMovement2()
  {
    //
    //For more info on Moving bodies: http://www.iforce2d.net/b2dtut/forces
    //

    Vec2 currentVelocity = super._body.getLinearVelocity();


    //edit the current velocity based on what we're doing
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

    //
    // THIS IS AN AWFUL WAY OF DOING JUMP
    // PLEASE NOTE THIS DOWN AND DO NOT USE IT IN YOUR FINAL CODE!
    // Jump should be based on when you "hit the ground" NOT BY USING
    // VELOCITY!
    //

    if (_keyJump2 == true)
    {
      currentVelocity.y = 10;
      super._body.setLinearVelocity(currentVelocity);
    }
  }
  
  public void score2()
  {
    fill(255);
    rect(width-115,15,100,35);
    fill(0);
    textSize(32);
    text(Score2,width-100,45);
    
    Vec2 pos = box2d.getBodyPixelCoord(super._body);

    if(pos.y > height-230)
    {
      Score2 = 1;
      isActive = false;
      
      colorMode(RGB);
      r = 255;
      g = 255;
      b = 255;
    }
    
    keyReleased2();
    
    if(isActive == true)
    {
      colorMode(HSB);
      r = 50;
      g = 128;
      b = 255;
      pos.y = 0;
      pos.x = width/2+30;
    }
  } 
  
  private void keyReleased2()
  {
    if(key == 'r')
    {
      isActive = true;
      
      float a = super._body.getAngle();
      Body b = super._body;
     
      BodyDef bd = new BodyDef();
      
      Vec2 newPos = bd.position.set(box2d.coordPixelsToWorld(width/2+30,0));
      b.setTransform(newPos,-a);
    }
  }
}