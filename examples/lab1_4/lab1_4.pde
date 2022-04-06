color yellowwish = color(250,200,0);
color bluewish = color(0,255,255);

int i;
int j;

void setup()
{
   size(500,500);
   noStroke();
   i = 0;
   j = 449;
}

void draw()
{
 background(255);
 fill(yellowwish);
 rect(i,100,50,50);
 rect(i-500,100,50,50);
 if(i++ >= 499) 
 i = 0;
 fill(bluewish);
 rect(j,300,50,50);
 rect(j+500,300,50,50);
 if(j-- <= -49) 
 j = 449;
}
