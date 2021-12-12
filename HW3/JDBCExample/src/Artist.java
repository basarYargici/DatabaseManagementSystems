import java.util.Objects;

/**
 * Created by İbrahim Başar YARGICI at 12.12.2021
 */
public class Artist {
    private int id;
    private String name;
    private char gender;
    private int status;
    private String field;

    public Artist(int id, String name, char gender, int status, String field) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.status = status;
        this.field = field;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Artist artist = (Artist) o;
        return id == artist.id && gender == artist.gender && status == artist.status && Objects.equals(name,
                artist.name) && Objects.equals(field, artist.field);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, gender, status, field);
    }
}
