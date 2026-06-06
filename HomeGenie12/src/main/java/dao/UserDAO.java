package dao;

import model.User;

public interface UserDAO {

    public User login(User user);
    public int register(User user);

}