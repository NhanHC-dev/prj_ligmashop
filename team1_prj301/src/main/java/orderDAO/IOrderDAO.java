/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package orderDAO;

import jakarta.persistence.NoResultException;

/**
 *
 * @author ADMIN
 */
public interface IOrderDAO {
    
    public int countUser() throws NoResultException;

}
