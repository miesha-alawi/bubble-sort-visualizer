import java.util.Collections;

//sorting visualizer
ArrayList<Bar> bars = new ArrayList<Bar>();
//gets the exact amount of bars that will fill the screen
int arraylength = 640/20;
int x = -20;
int y = 0;
boolean process = false;
int time = 0;

void setup() {
  size(640, 360);
  noStroke();
  
  int green = (int) Math.floor(Math.random() * 255);
  int blue = (int) Math.floor(Math.random() * 255);
  int red = (int) Math.floor(Math.random() * 255);
  
  for(int i = 0; i < arraylength; i++)
  {
    x += 20;
    y += 10;
    green +=5;
    blue += 5;
    red += 5;
    Bar bar = new Bar(x,y,green,red,blue,i);
    fill(red, green, blue);
    rect(x,y,bar.barwidth,360);
    bars.add(bar);
    
  }
  
}

void draw() {
  background(155);
  for(Bar b : bars)
 {
   fill(b.red, b.green, b.blue);
   rect(b.barX,b.barY,b.barwidth,360);
   
 }
 if(mousePressed)
 {
   
   MessUp();
 }
}

void keyPressed()
{
 BubbleSort();
}

void MessUp()
{
  if(!process)
  {
    process = true;
    for(Bar b : bars)
   {
   
   int randomId = (int)Math.floor(Math.random()* arraylength);
   for(Bar t : bars)
   {
     if(t.id == randomId)
     {
       int temp;
       temp = b.barX;
       b.barX = t.barX;
       t.barX = temp;
       Collections.swap(bars, bars.indexOf(t), bars.indexOf(b));
        
     
     }
     
   }
 
 }
  }
process = false;
  
}

void BubbleSort()
{
  for(int i = arraylength; i > 0; i--)
   {
     for(int j = 0; j < i - 1; j++)
     {
       
       if(bars.get(j).id > bars.get(j+1).id)
       {
        int x = bars.get(j).barX;
        bars.get(j).barX = bars.get(j+1).barX;
        bars.get(j+1).barX = x;
        Collections.swap(bars, bars.indexOf(bars.get(j)),bars.indexOf(bars.get(j + 1)));
        
       }
     }
     
   }
  
}
