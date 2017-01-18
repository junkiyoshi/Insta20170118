import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

ArrayList<Particle> particles;
Attractor attractor;

VerletPhysics2D physics;

PImage img;

void setup()
{
  size(512, 512);
  frameRate(30);
  background(255);
  
  img = loadImage("Lenna.png");
  image(img, 0, 0);
  loadPixels();
   
  physics = new VerletPhysics2D();
  physics.setDrag(0.1);

  particles = new ArrayList<Particle>();
  for(int i = 0; i < 2048; i += 1)
  {
    particles.add(new Particle(new Vec2D(random(width), random(height))));
  }
  
  attractor = new Attractor(new Vec2D(width/ 2, height / 2));
  
}

void draw()
{
  img = loadImage("Lenna.png");
  image(img, 0, 0);
  loadPixels();
  
  if(frameCount != 1)
  {
    background(255);
  }
  
  physics.update();

  attractor.compute();
  attractor.disiplay();
  
  for(Particle p : particles)
  {
    p.display();
  }
  
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
}