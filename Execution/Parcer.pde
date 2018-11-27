/* @pjs preload="../Data/US_Map.svg"; */

// Reads and Writes US MAP svg file
class Parcer
{
    
    public int total_cumulative = 0;
    public int total_present = 0;
    ArrayList<String> svg_data;
    ArrayList<StatePath> state_paths = new ArrayList<StatePath>();
    public Database db;
    
    BufferedReader reader;
    String line;
    
    //Constructor; Reads in svg file; Stores data in svg_data and state_paths
    Parcer()
    {
        //database_parcer();
        svg_parcer();        
    }
    
    private void database_parcer()
    {
        db = new Database();
    }
    
    private void svg_parcer()
    {   
        ArrayList<String> buffer = new ArrayList<String>();
        String[] lines = loadStrings(svg);
        
        for (int i = 0 ; i < lines.length; i++) {
            if(lines[i].equals("  <path"))
            {
                if(svg_data == null)
                {
                    svg_data = new ArrayList<String>(buffer);
                }
                else
                {
                    state_paths.add(new StatePath(buffer));
                }
                buffer.clear();
            }
            buffer.add(lines[i]);
        }
        buffer.remove(buffer.size()-1);
        state_paths.add(new StatePath(buffer));
    }
    
    // Writes over and updates previous svg
    public void write(String filename, boolean isCumulative)
    {
        PrintWriter output;
        output = createWriter(filename); 
        for(int i = 0; i < svg_data.size(); i++)
        {
            output.println(svg_data.get(i));
        }
        for(int i = 0; i < state_paths.size(); i++)
        {
            output.println(state_paths.get(i).tag);
            output.println(state_paths.get(i).inkscape);
            output.println(state_paths.get(i).id);
            output.println(state_paths.get(i).data_name);
            output.println(state_paths.get(i).data_id);
            output.println(state_paths.get(i).d);
            if(isCumulative)
                output.println(state_paths.get(i).style_cumulative);
            else
                output.println(state_paths.get(i).style_present);
        }
        output.println("</svg>");
        output.flush();
        output.close();
    }
    
    // year1 is earlier date
    // year2 is later date
    public void update(int year1, int year2)
    {
        total_cumulative = db.cumulativeStateExecuted(year1, year2);
        total_present = db.cumulativeStateExecuted(year2, year2);
      
        // return max killed this year
        int maxStateExecuted = db.maxStateExecuted(year2);
        for(int i = 0; i < state_paths.size(); i++)
        {
            String state = state_paths.get(i).state;
            // return state's killed this year
            int stateExecuted = db.stateExecuted(state, year2);
            
            // cumulative dead from state / state population
            float percentExecutions = db.cumulativePercentStateExecuted(state, year1, year2);
            float ratio;
            if(stateExecuted == -1)
            {
                ratio = -1;
                percentExecutions = -1;
            }
            else if(maxStateExecuted == 0)
            {
                ratio = 0;
            }
            else
            {
                ratio = (float) stateExecuted / (float) maxStateExecuted;
            }
            state_paths.get(i).update(ratio, percentExecutions);
        }
    }
}