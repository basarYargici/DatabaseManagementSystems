import java.sql.Statement;

public class JDBCMain {
    public static void main(String[] args) throws Exception {
        DatabaseConnector db = new DatabaseConnector();
        Statement statement = getStatement(db);
        getAll(db, statement);
        deleteAll(db, statement);
        deleteById(db, statement);
        add(db, statement);
        update(db, statement);
        getAll(db, statement);
    }

    private static void update(DatabaseConnector db, Statement statement) throws Exception {
        db.update(statement, 1, "ben", 'c', 1, "Painting");
    }

    private static void add(DatabaseConnector db, Statement statement) throws Exception {
        db.add(statement, 2, "basar", 'e', 1, "Music");
    }

    private static void deleteById(DatabaseConnector db, Statement statement) throws Exception {
        db.deleteById(statement, 1);
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
