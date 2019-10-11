import java.util.stream.IntStream;

public class tree{

	public static void magicalTree(Integer levels){
		if(levels>0){
			IntStream.range(1, levels+1 ).forEach(level->{
				IntStream.range(1, levels-level+1).forEach(v->{
					System.out.print(" ");
				});
				IntStream.range(0, 2*(level-1)+1).forEach(v->{
					System.out.print("*");
				});
				System.out.println("");
			});
		}
	}

	public static void main(String[]args){
		Integer levels;
		if(args.length!=1){
			System.out.println("You must provide one integer argument");
			System.exit(-1);
		}
		
		try{
			magicalTree(Integer.parseInt(args[0]));

		}
		catch(NumberFormatException e){
			System.out.println("Error parsing the argument, exiting");
			System.exit(-1);
		}	
	}
}
