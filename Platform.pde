class Platform extends Entity
{
  
  Platform(float x, float y, PImage img)
  {
    super(x, y, img, "Platform");
    super.CreateBody(BodyType.STATIC);
  }
}