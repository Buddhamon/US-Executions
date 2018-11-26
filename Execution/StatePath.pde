class StatePath
{
    public String tag;
    public String inkscape;
    public String id;
    public String data_name;
    public String data_id;
    public String d;
    public String style_present;
    public String style_cumulative;
    
    public String state;
    private float totalPercentExecutions;
    
    // Constructor; Loads in state data 
    StatePath(ArrayList<String> path)
    {
        tag = path.get(0);
        inkscape = path.get(1);
        id = path.get(2);
        data_name = path.get(3);
        data_id = path.get(4);
        d = path.get(5);
        style_present = path.get(6);
        style_cumulative = path.get(6);
        
        state = data_name.substring(16, data_name.length()-1);
        totalPercentExecutions = 0.000028422638;
    }
    
    public void update(float ratio, float cumulativePercentStateExecuted)
    {
        int r = 255;
        int g = 255;
        int b = 255;
        
        if(ratio >= 0)
        {
            r = 255 - (int)(ratio * 175);
            g = 223 - (int)(ratio * 223);
            b = 223 - (int)(ratio * 223);
        }    
        String code_present = hex(r, 2) + hex(g, 2) + hex(b, 2);
        
        r = 255;
        g = 255;
        b = 255;
        
        if(cumulativePercentStateExecuted >= 0)
        {
            ratio = cumulativePercentStateExecuted / totalPercentExecutions;
            r = 255 - (int)(ratio * 175);
            g = 223 - (int)(ratio * 223);
            b = 223 - (int)(ratio * 223);
        }    
        String code_cumulative = hex(r, 2) + hex(g, 2) + hex(b, 2);
        
        new_style(code_present, code_cumulative);
    }
        
    private void new_style(String code_present, String code_cumulative)
    {
        String start = style_present.substring(0, 51);
        String end = style_present.substring(57, 61);
        style_present = start + code_present + end;
        style_cumulative = start + code_cumulative + end;
    }
}


// "FFDFDF" = lowest death;     255,223,223
// "500000" = highest death;    80,0,0
// "FFFFFF" = no death;         255,255,255