color yellowwish = color(250,200,0);

int i;

void setup()
{
   size(500,500);
   noStroke();
   i = 0;
   
}

void draw()
{
 background(255);
 fill(yellowwish);
 rect(i,150,50,50);
 if(i++ >= 449)
 {
   i = 0;
 }
}
