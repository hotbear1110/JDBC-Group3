import java.io.IOException;
import java.util.List;
import java.util.Scanner;

public class LoaderExample {

	public static void main(String[] args) {
		FootagesAndReportersLoader loader = new FootagesAndReportersLoader();
		Scanner sc = new Scanner(System.in);

		System.out.println("Enter host ip");
		SendToDB.host = sc.nextLine();

		System.out.println("Enter port number");
		SendToDB.port = sc.nextLine();

		System.out.println("Enter database name");
		SendToDB.database = sc.nextLine();

		System.out.println("Enter username");
		SendToDB.username = sc.nextLine();

		System.out.println("Enter password");
		SendToDB.password = sc.nextLine();

		try {
			System.out.println("loading from "+args[0]);
			List<FootageAndReporter> footagesAndReporters = loader.loadFootagesAndReporters(args[0]);
			for(FootageAndReporter footageAndReporter : footagesAndReporters) {
				System.out.print("\tFootage: " + footageAndReporter.getFootage());
				System.out.println("\tReporter: " + footageAndReporter.getReporter());
				SendToDB.send(footageAndReporter);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}


