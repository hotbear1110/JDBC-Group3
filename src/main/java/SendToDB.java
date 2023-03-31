import java.sql.*;

public class SendToDB {
    public static void send(FootageAndReporter footageAndReporter) {
        String host = "localhost";
        String port = "3307";
        String database = "tv3db";
        String cp = "utf8";

        String username = "root";
        String password = "mads3241";

        String url = "jdbc:mysql://" + host + ":" + port + "/" + database + "?characterEncoding=" + cp;

        String[] Footage = footageAndReporter.getFootage().toString().split(";");
        String[] Journalist = footageAndReporter.getReporter().toString().split(";");

        String Title = Footage[0];
        int Date = Integer.parseInt(Footage[1]);
        int Duration = Integer.parseInt(Footage[2]);
        int CPR = Integer.parseInt(Journalist[0]);

        String First_name = Journalist[1];
        String Last_Name = Journalist[2];
        String Street_Name = Journalist[3];

        String Civic_Number = Journalist[4];
        String Zip_Code = Journalist[5];
        String City = Journalist[6];
        String Country = "Denmark";

        try {
            Connection connection = DriverManager.getConnection(url, username, password);

            Statement statement = connection.createStatement();
            statement.executeUpdate("INSERT IGNORE INTO Address " +
                    "(Street_Name, Civic_Number, City, Zip_Code, Country) " +
                    "VALUES " +
                    "('" + Street_Name + "', '" + Civic_Number + "', '" + City + "', '" + Zip_Code + "', '" + Country + "');");

            statement.executeUpdate("INSERT IGNORE INTO Journalist " +
                    "(CPR, First_Name, Last_Name, Address) " +
                    "VALUES " +
                    "('" + CPR + "', '" + First_name + "', '" + Last_Name + "', '" + Civic_Number + "');");

            statement.executeUpdate("INSERT IGNORE INTO Footage " +
                    "(Title, Date, Duration, Journalist) " +
                    "VALUES " +
                    "('" + Title + "', '" + Date + "', '" + Duration + "', '" + CPR + "');");

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}