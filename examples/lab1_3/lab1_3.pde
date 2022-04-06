color yellowwish = color(250,200,0);

int i;
int j;

void setup()
{
   size(500,500);
   noStroke();
   i = 0;
   j = -500;
   
}

void draw()
{
 background(255);
 fill(yellowwish);
 rect(i,150,50,50);
 if(i++ >= 500)
 {
   i = 0;
 }
 rect(j,150,50,50);
 if(j++ >= 0)
 {
   j = -500;
 }
}
