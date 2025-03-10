package ch15;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

//항상 모든 경우에 순차적으로 데이터를 추가할 때 ArrayList 와 LinkedList 의 처리가 동일
public class Test2 {
    public static void main(String[] args) {
        // LinkedList vs ArrayList
        List<String> arrayList = new ArrayList<>();
        List<String> linkedList = new LinkedList<>();
        // Test ArrayList vs LinkedList
        long startTime;
        long endTime;

        //맨 앞에 계속 추가
//      ArrayList는 인덱스 조정작업 발생
        startTime = System.nanoTime();
        for (int i = 0; i < 300000; i++) {
            arrayList.add(0, String.valueOf(i));
        }
        endTime = System.nanoTime();
        System.out.println(endTime - startTime);

        // LinkedList (빠르다)
        startTime = System.nanoTime();
        for (int i = 0; i < 300000; i++) {
            linkedList.add(0, String.valueOf(i));
        }
        endTime = System.nanoTime();
        System.out.println(endTime - startTime);

        startTime = System.nanoTime();
        for (int i = 0; i < 500000; i++) {
            arrayList.add(String.valueOf(i));
        }
        endTime = System.nanoTime();
        System.out.println(endTime - startTime);

        // LinkedList
        startTime = System.nanoTime();
        for (int i = 0; i < 500000; i++) {
            linkedList.add(String.valueOf(i));
        }
        endTime = System.nanoTime();
        System.out.println(endTime - startTime);
    }
}
