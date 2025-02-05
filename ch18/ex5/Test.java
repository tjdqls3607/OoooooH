package ch18.ex5;

import java.io.*;

public class Test {
    public static void main(String[] args) throws IOException, ClassNotFoundException {
        MyClass mc =  new MyClass();
        mc.n = 10;
        mc.str = "Hello";
        mc.ssn = "0000-1111";
        // 직렬화
//        ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("MyClass.dat"));
//        oos.writeObject(mc);

        //역직렬화
        ObjectInputStream ois = new ObjectInputStream(new FileInputStream("MyClass.dat"));
        mc = (MyClass) ois.readObject();

        System.out.println(mc.n);
        System.out.println(mc.str);
        System.out.println(mc.ssn);

        System.out.println(mc.n2);
    }
}
