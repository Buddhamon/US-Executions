/* 
    @pjs preload = "../Data/1976.png, ../Data/1977.png, ../Data/1978.png, ../Data/1979.png,
                    ../Data/1980.png, ../Data/1981.png, ../Data/1982.png, ../Data/1983.png,
                    ../Data/1981.png, ../Data/1982.png, ../Data/1983.png, ../Data/1984.png,
                    ../Data/1985.png, ../Data/1986.png, ../Data/1987.png, ../Data/1988.png,
                    ../Data/1989.png, ../Data/1990.png, ../Data/1991.png, ../Data/1992.png,
                    ../Data/1993.png, ../Data/1994.png, ../Data/1995.png, ../Data/1996.png,
                    ../Data/1997.png, ../Data/1998.png, ../Data/1999.png, ../Data/2000.png,
                    ../Data/2001.png, ../Data/2002.png, ../Data/2003.png, ../Data/2004.png,
                    ../Data/2005.png, ../Data/2006.png, ../Data/2007.png, ../Data/2008.png,
                    ../Data/2009.png, ../Data/2010.png, ../Data/2011.png, ../Data/2012.png,
                    ../Data/2013.png, ../Data/2014.png, ../Data/2015.png, ../Data/2016.png,
                    ../Data/2017.png, ../Data/2018.png"; 
*/

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
    test = false;
}

void draw()
{ 
    if(test)
    {
        fileName = "../Data/" + str(year1+1) + ".png";
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