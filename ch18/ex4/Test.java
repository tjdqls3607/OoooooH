package ch18.ex4;

import java.io.*;

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
//            try ( FileWriter fw = new FileWriter(file); ) {
//                fw.write("안녕하세요!");
//            }catch (IOException e) {
//                e.printStackTrace();
//            }
        }

        //file read (char 기반)
//        {
//            File file = new File("C:/Temp/myFile.txt");
//
//            //try-resource
//            try (FileReader fw = new FileReader(file);) {
//                //char 1개씩 처리
//                int ch;
//                StringBuilder sb = new StringBuilder();
//
//                while ((ch = fw.read()) != -1) {
//                    sb.append((char) ch);   //정수를 문자로 형변환
//                }
//                System.out.println(sb);
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
        }   //C:\Temp
        // file copy (binaty 기반 image)
        {
            String dir = "C:" + File.separator + "Temp";
            String srcFilename = "kkamb.jpg";
            String tgtFilename = "copy_kkamb.jpg";
            File src = new File(dir, srcFilename); //폴더, 파일명
            File tgt = new File(dir, tgtFilename);

            try (
                    FileInputStream fis = new FileInputStream(src);
                    FileOutputStream fos = new FileOutputStream(tgt);
                    ) {

                int read;

                while ((read = fis.read()) != -1) {
                    fos.write(read);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
