class Platform extends Entity
{
  //using the entity class to create the platform for the game
  Platform(float x, float y, PImage img)
  {
    super(x, y, img, "Platform");
    super.CreateBody(BodyType.STATIC);
  }
}