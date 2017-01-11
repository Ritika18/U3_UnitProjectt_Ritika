class Entity
{
  //creating a list of variables which I can use in other classes
  private float _x;
  private float _y;
  private PImage _img;
  private String _type;
  private Body _body;

  Entity()
  {
    //creating the entity to use for other classes, assigning them values
    _x = 0;
    _y = 0;
    _img  = null;
    _type = "Unknown Entity";
  }
  
  //constructor
  Entity(float x, float y, PImage img, String type)  
  {
    _x = x;
    _y = y;
    _img  = img;
    _type = type;
  }

  private void CreateBody(BodyType bType)
  {
    //scalar size of the box I created
    int imgH = _img.height;
    int imgW = _img.width;


    //creating the shape
    PolygonShape sd = new PolygonShape();
    //converting it from the normal image to the Box 2D pixels size
    float box2dW = box2d.scalarPixelsToWorld(imgW/2);
    float box2dH = box2d.scalarPixelsToWorld(imgH/2);
    //Drawing the box
    sd.setAsBox(box2dW, box2dH);

    //Fixture, which are used for the size, shape and material properties of the object
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 10; //just density
    fd.friction = 0.5; //spinny
    fd.restitution = 0.8; //bouncy

    //Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = bType;

    //Initial position of the _body (entity)
    bd.position.set(box2d.coordPixelsToWorld(_x, _y));

    _body = box2d.createBody(bd);
    _body.createFixture(fd);
  }

  public void Draw()
  {
    //Position of the body
    PVector pos = box2d.getBodyPixelCoordPVector(_body);
    //Get its angle of rotation from the body
    float a = _body.getAngle();

    //Redraw the image at 0,0 in the correct angle
    imageMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    image(_img, 0, 0);
    popMatrix();
  }

  private void CleanUpDeadObject()
  {
    box2d.destroyBody(_body);
    //This object can now be safely deleted from an ArrayList
  }

  boolean GetActive() { 
    return isActive;
  }
  void    SetActive(boolean state) { 
    isActive = state;
  }

  Vec2    GetPosition() { 
    return box2d.getBodyPixelCoord(_body);
  }
  Vec2    GetWorldCenter() { 
    return _body.getWorldCenter();
  } 
  void    SetPosition(float x, float y) {
  }

  String  GetType() { 
    return _type;
  }
}