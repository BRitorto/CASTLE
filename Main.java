import java.util.Scanner; public class Main { public static void main(String[] args) {Scanner scan = new Scanner(System.in);
System.out.println("Hola");
if(new Integer(1).equals(new Integer(2))){
System.out.println("Son iguales");
}
else{
System.out.println("Son distintos");
}
Integer a=new Integer(1);
String bian="Bian es la mejor";
do{
System.out.println("1");
a=a+new Integer(1);
System.out.println(bian);
}
while(a<new Integer(3));
scan.close();
}}
