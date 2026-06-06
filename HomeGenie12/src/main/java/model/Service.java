package model;

public class Service {

    private int id;
    private String serviceName;
    private String description;
    private int price;

    // Default Constructor
    public Service() {}

    // Parameterized Constructor
    public Service(int id, String serviceName, String description, int price) {
        this.id = id;
        this.serviceName = serviceName;
        this.description = description;
        this.price = price;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}