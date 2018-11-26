/* @pjs preload="../Data/US_Map.svg,Executions(2018 - 1976).csv"; */

String csv = "../Data/Executions(2018 - 1976).csv";
String svg = "../Data/US_Map.svg";
String svg_present = "../Output/present.svg";
String svg_cumulative = "../Output/cumulative.svg";

Parcer parcer;
int year1 = 1976;
int year2 = 1976;
boolean looping = true;
PShape s;
int count = 0;

boolean test;
void setup()
{
    parcer = new Parcer();
    size(1060, 480);
    test = true;
}

void draw()
{ 
    if(test)
    {
        s = loadShape(svg);
        shape(s, 260, 100, 500, 300);
    }
    //if(looping)
    //{
    //    background(30, 30, 30);
    //    parcer.update(year1, year2);
    //    parcer.write(svg_present, false);
    //    parcer.write(svg_cumulative, true);
        
    //    s = loadShape(svg_present);
    //    smooth();
    //    shape(s, 0, 100, 500, 300);
    //    s = loadShape(svg_cumulative);
    //    shape(s, 500, 100, 500, 300);
        
    //    // Texts
    //    fill(210, 20, 20);
        
    //    // Present Year Executions
    //    textSize(40);
    //    text(parcer.total_present, 240, 250);
        
    //    // Cumulative Executions
    //    textSize(40);
    //    text(parcer.total_cumulative, 740, 250); 
        
    //    // Present Date
    //    textSize(40);
    //    text(year2, 480, 50); 
        
    //    // Present Death Label
    //    textSize(20);
    //    text("Most Annual Executions", 50, 430);
        
    //    // Cumulative Death Label
    //    textSize(20);
    //    text("Cumulative Executions / Population", 550, 430);
        
    //    year2++;
    //    if(year2 > 2018)
    //        year2 = 1976;
        
    //    looping = false;
    //}
    //else
    //{
    //    count++;
    //    if(count >= 25)
    //    {
    //      looping = true;
    //      count = 0;
    //    }
    //}
}