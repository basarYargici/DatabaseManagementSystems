/**
 * Created by İbrahim Başar YARGICI at 10.12.2021
 */

import java.sql.*;

public class DatabaseConnector {
    private static final String serverAddress = "localhost:5432";
    private static final String DBname = "Homework_12122021";
    private static final String clientName = "postgres";
    private static final String connectionUrl = "jdbc:postgresql://localhost:5432/Homework_12122021";
    private static Connection connection;

    public DatabaseConnector() {
    }

    public void connect() throws Exception {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException var4) {
            throw new ClassNotFoundException("Where is your PostgreSQL JDBC Driver? Include in your library path!");
        }

        try {
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Homework_12122021", "postgres", "");
        } catch (SQLException var2) {
            throw new SQLException(var2.getMessage());
        } catch (Exception var3) {
            throw new Exception(var3.getMessage());
        }
    }

    public Statement createStatement() throws SQLException {
        try {
            return connection.createStatement();
        } catch (SQLException var2) {
            throw new SQLException("Creating Statement Failed! Check output console");
        }
    }

    public void getOutput(ResultSet rs) throws Exception {
        System.out.printf("%-10s %-20s %-20s %-20s %-20s \n", "ID", "NAME", "GENDER", "STATUS", "FIELD");

        for (int i = 0; i < 85; ++i) {
            System.out.print("-");
        }

        System.out.println();

        while (rs.next()) {
            System.out.printf("%-10s %-20s %-20s %-20s %-20s \n",
                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("gender"),
                    rs.getString("status"),
                    rs.getString("field"));
        }

    }

    public void getAll(Statement statement) throws Exception {
        String query = "SELECT * FROM artist";

        try {
            ResultSet rs = statement.executeQuery(query);
            System.out.println("All Artists:");
            this.getOutput(rs);
        } catch (SQLException var4) {
            throw new SQLException(var4.getMessage());
        }
    }

    public void add(Statement statement, int id, String name, char gender, int status, String field) throws Exception {
        String query = String.format("INSERT INTO artist VALUES (%d,'%s','%c',%d,'%s')", id, name, gender, status, field);

        try {
            statement.executeUpdate(query);
            System.out.println("Artist with id: " + id + " successfully added");
        } catch (SQLException var9) {
            throw new SQLException(var9.getMessage());
        }
    }

    public void update(Statement statement, int id, String name, char gender, int status, String field) throws Exception {
        String query = String.format("UPDATE artist SET name = '%s', gender = '%c', status = %d, field = '%s'  WHERE id = %d",
                name,
                gender,
                status,
                field,
                id);

        try {
            statement.executeUpdate(query);
            System.out.println("Artist with id: " + id + " successfully added");
        } catch (SQLException var9) {
            throw new SQLException(var9.getMessage());
        }
    }

    public void deleteById(Statement statement, int id) throws Exception {
        String query = String.format("DELETE FROM artist WHERE id = %d", id);

        try {
            statement.executeUpdate(query);
            System.out.println("Artist with id: " + id + " successfully deleted");
        } catch (SQLException var5) {
            throw new SQLException(var5.getMessage());
        }
    }

    public void delete(Statement statement) throws Exception {
        String query = "DELETE FROM artist";

        try {
            statement.executeUpdate(query);
            System.out.println("All Artist records successfully deleted");
        } catch (SQLException var4) {
            throw new SQLException(var4.getMessage());
        }
    }
}