import java.sql.Statement;
import java.util.Optional;
import java.util.Scanner;

/**
 * Created by İbrahim Başar YARGICI at 10.12.2021
 */
public class JDBCMain {
    private static final Scanner sc = new Scanner(System.in);

    public static void main(String[] args) throws Exception {
        DatabaseConnector db = new DatabaseConnector();
        Statement statement = getStatement(db);
        int req = -1;

        try {
            while (req != 0) {
                printInfo();
                try {
                    req = Integer.parseInt(sc.nextLine());
                    if (req != 0) {
                        Artist artist = null;
                        if (req != 5) {
                            artist = getData(req);
                        }
                        doReq(req, Optional.ofNullable(artist), db, statement);
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Invalid Input");
                    System.out.println("*".repeat(100) + "\n\n");
                }
                System.out.println("\n\n" + "*".repeat(100) + "\n\n");
            }
        } catch (Exception e) {
            throw new Exception(e.getLocalizedMessage());
        }
    }

    private static Artist getData(int req) {
        int id = -1;
        String name = "";
        char gender = ' ';
        int status = -1;
        String field = "";
        if (req != 1) {
            System.out.print("Id: ");
            id = sc.nextInt();
            sc.nextLine();
            if (req != 4) {
                System.out.print("Name: ");
                name = sc.nextLine();
                System.out.print("Gender: ");
                gender = sc.next().charAt(0);
                System.out.print("Status: ");
                status = sc.nextInt();
                sc.nextLine();
                System.out.print("Field: ");
                field = sc.nextLine();
            }
        }
        return new Artist(id, name, gender, status, field);
    }

    private static void doReq(int req, Optional<Artist> artist, DatabaseConnector db, Statement statement) {

        try {
            switch (req) {
                case 1 -> getAll(db, statement);
                case 2 -> add(db, statement, artist.get());
                case 3 -> update(db, statement, artist.get());
                case 4 -> deleteById(db, statement, artist.get().getId());
                case 5 -> deleteAll(db, statement);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private static void printInfo() {
        System.out.println("""
                What you want to do:
                1: Get All
                2: Add new
                3: Update
                4: Delete By Id
                5: Delete All
                0: Quit""");
    }

    private static void update(DatabaseConnector db, Statement statement, Artist artist) throws Exception {
        db.update(statement, artist);
    }

    private static void add(DatabaseConnector db, Statement statement, Artist artist) throws Exception {
        db.add(statement, artist);
    }

    private static void deleteById(DatabaseConnector db, Statement statement, int id) throws Exception {
        db.deleteById(statement, id);
    }

    private static void deleteAll(DatabaseConnector db, Statement statement) throws Exception {
        db.delete(statement);
    }

    private static void getAll(DatabaseConnector db, Statement statement) throws Exception {
        db.getAll(statement);
    }

    private static Statement getStatement(DatabaseConnector db) throws Exception {
        db.connect();
        return db.createStatement();
    }
}
