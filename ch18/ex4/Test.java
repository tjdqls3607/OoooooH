package ch18.ex4;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Test {

    public static void main(String[] args) throws IOException {
        // File 객체 생성
//        {
//        // Folder
//        File dir = new File("C:/Temp/images");
//        System.out.println(dir.exists());
//        if (!dir.exists()) {
//            dir.mkdir();
//        }
//
//        // File
//        File file = new File("C:/Temp/myFile.txt");
//        System.out.println(file.exists());
//        if (file.exists()) {
//            file.createNewFile();
//        }
//    }

    // File writer (char 기반)
        {
            File file = new File("C:/Temp/myFile.txt");
//            try {
//                FileWriter fw = new FileWriter(file);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }

            // try - resource
            try ( FileWriter fw = new FileWriter(file); ) {
                fw.write("안녕하세요!");
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
