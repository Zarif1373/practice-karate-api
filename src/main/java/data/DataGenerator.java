package data;

public class DataGenerator {

    public static String getEmail() {
        // zz_kk@gmail.com
        String email = "zz_kk_";
        int random = (int) (Math.random() * 9876987);
        return email + random + "@gmail.com";
    }

    public static String getFirstName(){
        char[] alphabet = {'A', 'B', 'C', 'D', 'E', 'F'};
        String name ="";
        for (int i = 0; i <5; i++) {
            int index = (int) (Math.random() * alphabet.length);
            name += alphabet[index];
        }
        return name;
    }
}
