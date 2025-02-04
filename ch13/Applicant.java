package ch13;

public class Applicant<T> {
    public T kind;

    public Applicant(T t) {
        this.kind = t;
    }
}
