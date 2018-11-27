int year1 = 1976;
int year2 = 1976;
int count = 0;
boolean looping = true;
PImage img;
String fileName;

void setup()
{
    size(1060, 480);
}

void draw()
{ 
    if(looping)
    {   
        fileName = "../Data/" + str(year2) + ".png";
        img = loadImage(fileName);
        image(img, 0, 0);
        
        year2++;
        if(year2 > 2018)
            year2 = 1976;
        
        looping = false;
    }
    else
    {
        count++;
        if(count >= 25)
        {
          looping = true;
          count = 0;
        }
    }
}