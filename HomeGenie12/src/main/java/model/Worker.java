package model;

public class Worker {

    private int id;
    private String name;
    private String phone;
    private int serviceId;
    private int experience;
    private String status;

    public int getId(){ return id; }
    public void setId(int id){ this.id = id; }

    public String getName(){ return name; }
    public void setName(String name){ this.name = name; }

    public String getPhone(){ return phone; }
    public void setPhone(String phone){ this.phone = phone; }

    public int getServiceId(){ return serviceId; }
    public void setServiceId(int serviceId){ this.serviceId = serviceId; }

    public int getExperience(){ return experience; }
    public void setExperience(int experience){ this.experience = experience; }

    public String getStatus(){ return status; }
    public void setStatus(String status){ this.status = status; }

}