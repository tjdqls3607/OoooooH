package ch15;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Test4 {
    public static void main(String[] args) {
        // MAP (key, value)
        //key 의 중복 혀용 X : 이전 value 를 덮어 쓴다.
        Map<String, Integer> map = new HashMap<>();
        map.put("aaa", 50);
        map.put("aaa", 60);
        map.put("aaa", 70);
        map.put("bbb", 50);
        map.put("ccc", 50);
        map.put("ddd", 50);

        System.out.println(map.size());
        System.out.println(map.get("aaa")); // key 로 value를
        System.out.println(map.containsKey("aaa")); // key 를 포함하는 지

        // keyset 을 이용한 순회
        Set<String> keySet = map.keySet();  // 순서 보장이 안됨
        Iterator<String> itr = keySet.iterator();
        while( itr.hasNext() ) {
            String k = itr.next();
            Integer v = map.get(k);
            System.out.println( k + " " + v );
        }

    }
}
