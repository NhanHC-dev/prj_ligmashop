package model;

public class OrderDayData {
    private int orderDay;
    private long orderCount;

    public OrderDayData() {}

    public OrderDayData(Integer orderDay, Long orderCount) {
        this.orderDay = orderDay;
        this.orderCount = orderCount;
    }

    public int getOrderDay() {
        return orderDay;
    }

    public void setOrderDay(int orderDay) {
        this.orderDay = orderDay;
    }

    public long getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(long orderCount) {
        this.orderCount = orderCount;
    }
}