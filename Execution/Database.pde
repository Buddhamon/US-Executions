class Database
{
    String states[] = new String[51];
    int total_executions[] = new int[51];
    int population[] = new int[51];
    double total_percent_executions[] = new double[51];
    int years[][] = new int[51][43];
    private int state_count = 51;
    
    Table table; 
    
    // Constructor; Loads in state data 
    Database()
    {
        table = loadTable(csv, "header");
        //int count = 0;
        //for (TableRow row : table.rows()) 
        //{
        //    states[count] = row.getString("State");
        //    total_executions[count] = row.getInt("TotalExecutions");
        //    population[count] = row.getInt("StatePopulation");
        //    //total_percent_executions[count] = row.getFloat("%Population");
            
        //    years[count][0] = row.getInt("1976");
        //    years[count][1] = row.getInt("1977");
        //    years[count][2] = row.getInt("1978");
        //    years[count][3] = row.getInt("1979");
        //    years[count][4] = row.getInt("1980");
        //    years[count][5] = row.getInt("1981");
        //    years[count][6] = row.getInt("1982");
        //    years[count][7] = row.getInt("1983");
        //    years[count][8] = row.getInt("1984");
        //    years[count][9] = row.getInt("1985");
        //    years[count][10] = row.getInt("1986");
        //    years[count][11] = row.getInt("1987");
        //    years[count][12] = row.getInt("1988");
        //    years[count][13] = row.getInt("1989");
        //    years[count][14] = row.getInt("1990");
        //    years[count][15] = row.getInt("1991");
        //    years[count][16] = row.getInt("1992");
        //    years[count][17] = row.getInt("1993");
        //    years[count][18] = row.getInt("1994");
        //    years[count][19] = row.getInt("1995");
        //    years[count][20] = row.getInt("1996");
        //    years[count][21] = row.getInt("1997");
        //    years[count][22] = row.getInt("1998");
        //    years[count][23] = row.getInt("1999");
        //    years[count][24] = row.getInt("2000");
        //    years[count][25] = row.getInt("2001");
        //    years[count][26] = row.getInt("2002");
        //    years[count][27] = row.getInt("2003");
        //    years[count][28] = row.getInt("2004");
        //    years[count][29] = row.getInt("2005");
        //    years[count][30] = row.getInt("2006");
        //    years[count][31] = row.getInt("2007");
        //    years[count][32] = row.getInt("2008");
        //    years[count][33] = row.getInt("2009");
        //    years[count][34] = row.getInt("2010");
        //    years[count][35] = row.getInt("2011");
        //    years[count][36] = row.getInt("2012");
        //    years[count][37] = row.getInt("2013");
        //    years[count][38] = row.getInt("2014");
        //    years[count][39] = row.getInt("2015");
        //    years[count][40] = row.getInt("2016");
        //    years[count][41] = row.getInt("2017");
        //    years[count][42] = row.getInt("2018");
        //    count++;
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