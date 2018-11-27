/* @pjs preload="../Data/1976.png"; */

int year1 = 1976;
int year2 = 1976;
int count = 0;
boolean looping = true;
PImage img;
String fileName;
boolean test;

void setup()
{
    size(1060, 480);
    test = true;
}

void draw()
{ 
    if(test)
    {
        fileName = "../Data/" + str(year1) + ".png";
        img = loadImage(fileName);
        image(img, 0, 0);
        fill(0, 255, 0);
        rect(10, 10, 100, 100);
    }
    else if(looping)
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