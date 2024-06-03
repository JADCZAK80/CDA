
import java.io.Console;

    public class Hello
    {
        /* un programme qui affiche "Bonjour" à l’écran */
        public static void main(String[] args)
        {
            int n ;
            System.out.println("entrez un entier" ) ;
            n = Console.lireI() ;
            System.out.println(n) ;
            byte nOctet ;
            System.out.println("entrez un byte" ) ;
            nOctet = Console.lireB() ;
            System.out.println(nOctet) ;
            System.out.println("c’est fini. Tapez <ret>" ) ;
            Console.lireC() ;
        }
    } // fin de la classe Hello