package ch15;

import java.util.HashSet;
import java.util.Set;

public class Test3 {
    public static void main(String[] args) {
        // Set
        Set<String> set = new HashSet<String>();
        set.add("JAVA");
        set.add("Hello");
        set.add("JAVA");
        set.add("World");
        set.add("World");

        for (String str : set) {
            System.out.println(str);
        }

        //Board
        // equals(), hashCode() 를 재정의 하지 않으면?
        Set<Board> boardSet = new HashSet<>();
        boardSet.add(new Board("제목1", "내용1", "작성자1"));
        boardSet.add(new Board("제목2", "내용2", "작성자2"));
        boardSet.add(new Board("제목2", "내용2", "작성자2"));
        boardSet.add(new Board("제목4", "내용4", "작성자4"));
        boardSet.add(new Board("제목1", "내용1", "작성자1"));

        for (Board board : boardSet) {
            System.out.println(board);
        }
    }
}
