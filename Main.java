import java.util.Scanner; public class Main { public static void main(String[] args) {Scanner scan = new Scanner(System.in);
Integer a=new Integer(12);
Integer b=new Integer(2);
Integer rta=a;
Integer inc=a;
Integer i=new Integer(1);
do{
Integer j=new Integer(1);
do{
rta=rta+inc;
j=j+new Integer(1);
}
while(j<a);
inc=rta;
i=i+new Integer(1);
}
while(i<b);
System.out.println(rta);
scan.close();
}}
