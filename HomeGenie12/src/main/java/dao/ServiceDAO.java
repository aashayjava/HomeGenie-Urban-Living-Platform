package dao;

import java.util.List;
import model.Service;

public interface ServiceDAO {

    // Get all services
    public List<Service> getAllServices();

    // Add new service
    public boolean addService(Service s);

    // Update service
    public boolean updateService(Service s);

    // Delete service
    public boolean deleteService(int id);

    // Get single service by id
    public Service getServiceById(int id);

}