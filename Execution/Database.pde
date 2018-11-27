class Database
{
    String states[] = new String[51];
    int total_executions[] = new int[51];
    int population[] = new int[51];
    double total_percent_executions[] = new double[51];
    int years[][] = new int[51][43];
    private int state_count = 51;
    String db[][] = new String[51][47];
    
    Table table; 
    
    // Constructor; Loads in state data 
    Database()
    {
        // Parse CSV file
        String[] lines = loadStrings(csv);
        String data = "";
        int count = 0;
        
        for (int i = 1; i < lines.length; i++) 
        {
            for(int j = 0; j < lines[i].length(); j++)
            {
                if(lines[i].charAt(j) != ',')
                {
                    data += lines[i].charAt(j);
                }
                else
                {
                    db[i-1][count] = data;
                    data = "";
                    count++;
                }
            }
            db[i-1][count] = data;
            data = "";
            count = 0;
        }
        
        // Parse Loaded Data
        
        // States
        for(int i = 0; i < state_count; i++)
        {
            states[i] = db[i][0];
        }
        // Total Executions
        for(int i = 0; i < state_count; i++)
        {
            total_executions[i] = Integer.parseInt(db[i][1]);
        }
        //// State Population
        //for(int i = 0; i < state_count; i++)
        //{
        //    population[i] = Integer.parseInt(db[i][2]);
        //}
        //// Percent of Population
        //for(int i = 0; i < state_count; i++)
        //{
        //    total_percent_executions[i] = Double.parseDouble(db[i][3]);
        //}
        //// Year Data
        //for(int i = 0; i < state_count; i++)
        //{
        //    for(int j = 0; j < 43; j++)
        //    {
        //        years[i][j] = Integer.parseInt(db[i][46-j]);
        //    }
        //}
    }
    
    public int cumulativeStateExecuted(int year1, int year2)
    {
        int total = 0;
        for(int i = 0; i < state_count; i++)
        {
            for(int j = year1-1976; j <= year2-1976; j++)
            {
                if(years[i][j] > 0)
                {
                    total += years[i][j];
                }
            }
        }
        return total;
    }
    
    
    
    public int stateExecuted(String state, int year)
    {
        for(int i = 0; i < state_count; i++)
        {
            if(states[i].equals(state))
            {
                return years[i][year-1976];
            }
        }
        return -1; // Error
    }
    
    public int maxStateExecuted(int year)
    {
        int max = 0;
        for(int i = 0; i < state_count; i++)
        {
            if(years[i][year-1976] > max)
            {
                max = years[i][year-1976];
            }
        }
        return max;
    }
    
    // year1 is earlier date
    // year2 is later date
    public float cumulativePercentStateExecuted(String state, int year1, int year2)
    {
        float percentTotal = 0;
        for(int i = 0; i < state_count; i++)
        {
            if(states[i].equals(state))
            {
                for(int j = year1-1976; j <= year2-1976; j++)
                {
                    if(years[i][j] > 0)
                        percentTotal += years[i][j];
                }
                percentTotal = percentTotal / (float) population[i];
            }
        }
        return percentTotal;
    }
}