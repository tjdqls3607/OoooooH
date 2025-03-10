package ch13;

// 제품인데 다양한 제품을 표현 하고자 한다. (종류, 모델명)
public class Product<K,M> {
    private K kind;
    private M model;

    public K getKind() {
        return kind;
    }
    public void setKind(K kind) {
        this.kind = kind;
    }
    public M getModel() {
        return model;
    }
    public void setModel(M model) {
        this.model = model;
    }
}
