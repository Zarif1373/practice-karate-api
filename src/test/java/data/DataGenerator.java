package data;

public class DataGenerator {

    public static String getEmail(){
        // Zarif_Karimi_2432@tekschool.us
        String email = "Zarif_Karimi_";
        int random = (int) (Math.random() * 892100);
        return email + random + "@tekschool.us";
    }

    public static String getFirstName(){
        char[] alphabet = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
                'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
        String name = "";
        for (int i = 0; i < 5; i++){
            int index = (int) (Math.random() * alphabet.length);
            name += alphabet[index];
        }
        return name;
    }
}
