package model;

public class BookingList {

    private int id;
    private String serviceName;
    private String customer;
    private String phone;
    private String worker;
    private String date;
    private String time;
    private int price;
    private String status;

    public int getId(){ return id; }
    public void setId(int id){ this.id = id; }

    public String getServiceName(){ return serviceName; }
    public void setServiceName(String serviceName){ this.serviceName = serviceName; }

    public String getCustomer(){ return customer; }
    public void setCustomer(String customer){ this.customer = customer; }

    public String getPhone(){ return phone; }
    public void setPhone(String phone){ this.phone = phone; }

    public String getWorker(){ return worker; }
    public void setWorker(String worker){ this.worker = worker; }

    public String getDate(){ return date; }
    public void setDate(String date){ this.date = date; }

    public String getTime(){ return time; }
    public void setTime(String time){ this.time = time; }

    public int getPrice(){ return price; }
    public void setPrice(int price){ this.price = price; }

    public String getStatus(){ return status; }
    public void setStatus(String status){ this.status = status; }

}