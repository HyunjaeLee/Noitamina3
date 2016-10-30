import com.hyunjae.noitamina.Anigod;

public class Main {
    public static void main(String[] args) {
        Anigod.now().forEach((k, v) -> {
            System.out.println(k);
            v.forEach(System.out::println);
        });
    }
}
