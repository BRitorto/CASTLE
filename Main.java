import java.util.Scanner; public class Main { public static void main(String[] args) {Scanner scan = new Scanner(System.in);
System.out.println("Hola");
System.out.println("1 es igual a 2?");
if((new Integer(1).equals(new Integer(2)))&&(new Integer(1).equals(new Integer(2)))){
System.out.println("Son iguales");
}
else{
System.out.println("Son distintos");
}
Integer rta=new Integer(10)%new Integer(5);
System.out.println(rta);
Integer a=new Integer(1);
String bian="Bian es la mejor";
do{
System.out.println("1");
a=a+new Integer(1);
System.out.println(bian);
}
while(a<new Integer(3));
String lectura="";
lectura= scan.nextLine();
scan.close();
}}
