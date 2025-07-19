/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package userDAO;

import java.util.List;
import model.*;
import java.sql.SQLException;

public interface IUserDAO {
      
    public void insertUser(Users user) throws SQLException;

    public Users selectUser(int id);

    public List<Users> selectAllUsers();

    public void deleteUser(int id) throws SQLException;

    public void updateUser(Users user) throws SQLException;
}
