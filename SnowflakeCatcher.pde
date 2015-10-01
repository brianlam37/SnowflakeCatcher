int siz =8;
int bgSiz=500;
snowFlake snowFlakes[]= new snowFlake[200];
void setup()
{
  //your code here
  fill(0,0,0);
  size(bgSiz,bgSiz);
  rect(-100, -100, 1000, 1000);
  
    for(int i=0;i<snowFlakes.length;i++){
        
          snowFlakes[i] = new snowFlake((int)(Math.random()*bgSiz),(int)(Math.random()*-bgSiz));

}
}
void draw()
{
      for(int i=0;i<snowFlakes.length;i++){
            snowFlakes[i].erase();
            snowFlakes[i].lookDown();
            snowFlakes[i].move();
            snowFlakes[i].wrap();
            snowFlakes[i].show();
    }

}
void mouseDragged()
{
  //your code here
        if(mouseButton==LEFT){
            fill(255, 0, 255);
            ellipse(mouseX,mouseY,10,10);
        }
        if(mouseButton==RIGHT){
            fill(0, 0, 0);
            ellipse(mouseX,mouseY,10,10);
        }
}

class snowFlake
{
  //class member variable declarations
  int snowX;
  int snowY;
  boolean isMoving;
  snowFlake(int x,int y)
  {
    snowX=x;
    snowY=y;
    isMoving=true;
    snowX=(int)(Math.random()*bgSiz);
    snowY=(int)(Math.random()*-bgSiz);
  }
  void show()
  {
    noStroke();
    fill(255, 255, 255);
    ellipse(snowX,snowY,siz-2,siz-2);
  }
  void lookDown()
  {
    if(snowY<bgSiz&&snowY>0&&get(snowX,snowY+siz/2)!=color(0,0,0)){
        isMoving=false;
    }
    else{
        isMoving=true;
    }
  }
  void erase()
  {
    fill(0,0,0);
    ellipse(snowX,snowY,siz,siz);
  }
  void move()
  {
    if(isMoving==true){
        snowY++;
    }
  }
  void wrap()
  {
    if(snowY>=bgSiz-siz+2){
      snowY=0;
      snowX=(int)(Math.random()*bgSiz);
    }  
  }
}
