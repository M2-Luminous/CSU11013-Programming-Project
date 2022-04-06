color yellowwish = color(250,200,0);
color greenwish = color(0,255,0);
color bluewish = color(0,0,255);

int i;
int j;
int k;

void setup()
{
   size(500,500);
   noStroke();
   i = 225;
   j = 250;
   k = 275;
}

void draw()
{
 background(255);
 fill(yellowwish);
 rect(i,225,50,50);
 if(i-- < 0)
 {
   i = 225;
 }

 fill(bluewish);
 rect(275,k,50,50);
 if(k++ > 500)
 {
   k = 275;
 }
 
 fill(greenwish);
 rect(j,250,50,50);
 if(j++ > 475)
 {
   j = 250;
 }
}
