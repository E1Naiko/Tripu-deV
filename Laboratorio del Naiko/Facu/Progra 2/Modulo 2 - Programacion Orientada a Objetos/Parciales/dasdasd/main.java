import java.util.Scanner;
public class main {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        hijoXD hijo = new hijoXD(in.nextInt(), in.nextInt());
        System.out.println(hijo.toString());
        in.close();
    }
}