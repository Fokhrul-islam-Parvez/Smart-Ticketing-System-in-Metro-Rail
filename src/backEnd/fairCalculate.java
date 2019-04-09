package backEnd;

public class fairCalculate {

	int stations[]=new int[16];
	int fair[]=new int[15];	
	public void setFair(double  distance[], int perKiloCost)
	{
		for(int i=0;i<fair.length;i++)
			this.fair[i]=(int) Math.ceil(perKiloCost*distance[i]);
	}
	public void setStations()
	{
		for(int i=0;i<stations.length;i++)
			stations[i]=i;
	}
	
	public int totalCostCalculate(int source, int destination)
	{
		int totalCost=0;
		if(source < destination)
		{
			for(int i=source;i<destination;i++)
			   totalCost=totalCost+fair[i];
			return totalCost;
		}
		
		else if(source > destination)
		{
			for(int i=source-1;i>=destination;i--)
				totalCost=totalCost+fair[i];
			return totalCost;
		}
		else
			return totalCost;
	
	}
	public double totalDistanceCalculate(int source, int destination,double distance[])
	{
		double totalDistance=0.0;
		if(source < destination)
		{
			for(int i=source;i<destination;i++)
				totalDistance=totalDistance+distance[i];
			return totalDistance;
		}
		
		else if(source > destination)
		{
			for(int i=source-1;i>=destination;i--)
				totalDistance=totalDistance+distance[i];
			return totalDistance;
		}
		
		else
		return totalDistance;
		
	}
	
	
}
