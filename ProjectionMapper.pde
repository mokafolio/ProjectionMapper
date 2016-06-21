ArrayList<PVector> points;
boolean bSaveFrame = false;

void setup()
{
  size(1280, 720);
  smooth(8);
  points = new ArrayList<PVector>();
}

void draw()
{  
  background(0);
  fill(255);
  noStroke();
  beginShape();
  for(int i = 0; i < points.size(); i++) 
  {
    PVector p = points.get(i);
    vertex(p.x, p.y);
  }
  endShape(CLOSE);
  if(bSaveFrame)
  {
    saveFrame("Mask.png");
    bSaveFrame = false;
  }
  fill(255, 0, 0, 255);
  ellipse(mouseX, mouseY, 10, 10);
}

void mouseReleased()
{
  points.add(new PVector((float)mouseX, (float)mouseY));
}

void keyReleased()
{
  if(key == 's')
  {
    bSaveFrame = true;
  }
  
  if(key == 'r')
  {
    points.remove(points.size() - 1);
  }
}