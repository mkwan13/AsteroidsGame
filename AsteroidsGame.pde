//your variable declarations here
SpaceShip Ship;
ArrayList <Asteroids> aster = new ArrayList <Asteroids>();
ArrayList <Bullet> bull = new ArrayList <Bullet>();

public void setup() 
{
  size(600, 600);
  Ship = new SpaceShip();

  for (int i = 0; i < 15; i++)
  {
    aster.add(new Asteroids());
  }

  for (int j = 0; j < aster.size(); j++)
  {
    aster.get(j).show();
    aster.get(j).move();
    if(dist(aster.get(j).getX(), aster.get(j).getY(), Ship.getX(), Ship.getY())<25)
      aster.remove(j);

      for (int b = 0; b < bull.size(); b++)
      {
        if(dist(aster.get(j).getX(),aster.get(j).getY(), bull.get(b).getX(), bull.get(b).getY())<25)
            aster.remove(j);
      }
  for (int b =0; b <bull.size(); b++)
  {
    bull.get(b).show();
    bull.get(b).move();
  }
}
}

public void draw() 
{
  background(0);
  Ship.move();
  Ship.show();

  for (int i = 0; i < aster.size(); i++)
  {
    aster.get(i).move();
    aster.get(i).show();
  }

}

  public void keyPressed()
  {
    if (key == 'h')
    {
      Ship.setX((int)(Math.random()*600));
      Ship.setY((int)(Math.random()*600));
    }
    if (keyCode == UP)
    {
      Ship.accelerate(0.3);
    }
    else if (keyCode == LEFT)
    {
      Ship.rotate(-15);
    }
    else if (keyCode == RIGHT)
    {
      Ship.rotate(15);
    }
    else if (keyCode == DOWN)
    {
      Ship.accelerate(-0.3);
    }
  }

class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -6;
    yCorners[0] = -6;
    xCorners[1] = 12;
    yCorners[1] = 0;
    xCorners[2] = -6;
    yCorners[2] = 6;
    yCorners[3] = 0;
    yCorners[3] = 0;

    myColor = color(158);
    myCenterX = 300;
    myCenterY = 300;
    setDirectionX(0);
    setDirectionY(0);
    myPointDirection = 0;
  }


  public void setX(int x){myCenterX=x;}  
  public int getX(){return (int)myCenterX;}  
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX=x;}    
  public double getDirectionX(){return (int)myDirectionX;}   
  public void setDirectionY(double y){myDirectionY=y;}  
  public double getDirectionY(){return (int)myDirectionY;} 
  public void setPointDirection(int degrees){myPointDirection=degrees;}  
  public double getPointDirection(){return myPointDirection;}

}

class Asteroids extends Floater
{
  private int rotSpeed;

  public Asteroids()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;

    myColor = color(100);
    myCenterX = Math.random()*600;
    myCenterY = Math.random()*600;
    setDirectionX((int)(Math.random()*3)-1);
    setDirectionY((int)(Math.random()*3)-1);
    myPointDirection = ((int)Math.random()*360);
    rotSpeed = ((int)(Math.random()*10)-5);

  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}

  public void move()
  {
    rotate((int)rotSpeed);
    super.move();
  }
}

class Bullet extends Floater  

{   
    public Bullet(SpaceShip Ship){

      //initialize spaceship variables
      myColor = color(250);
      myCenterX = Ship.getX();;
      myCenterY = Ship.getY();;
      myPointDirection=Ship.getPointDirection();
      double dRadians =myPointDirection*(Math.PI/180);
      setDirectionX(5 * Math.cos(dRadians) + myDirectionX);
      setDirectionY(5 * Math.sin(dRadians) + myDirectionY);

      
    }
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
     public double getPointDirection(){return myPointDirection;}
    // //new bullet move function
    public void show()
    {
       fill(255,255,255);
       ellipse((float)myCenterX,(float)myCenterY,20,20);
    }
    public void move()
    {
        myCenterX+=myDirectionX;
        myCenterY+=myDirectionY;
    }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

