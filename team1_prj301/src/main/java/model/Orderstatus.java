/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

/**
 *
 * @author Asus-FPT
 */
@Entity
@Table(name = "ORDERSTATUS")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Orderstatus.findAll", query = "SELECT o FROM Orderstatus o"),
    @NamedQuery(name = "Orderstatus.findByOrderID", query = "SELECT o FROM Orderstatus o WHERE o.orderID = :orderID"),
    @NamedQuery(name = "Orderstatus.findByStatusName", query = "SELECT o FROM Orderstatus o WHERE o.statusName = :statusName")
})
public class Orderstatus implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "OrderID")
    private Integer orderID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "StatusName")
    private String statusName;
    @JoinColumn(name = "OrderID", referencedColumnName = "OrderID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Orders orders;

    public Orderstatus()
    {
    }

    public Orderstatus(Integer orderID)
    {
        this.orderID = orderID;
    }

    public Orderstatus(Integer orderID, String statusName)
    {
        this.orderID = orderID;
        this.statusName = statusName;
    }

    public Integer getOrderID()
    {
        return orderID;
    }

    public void setOrderID(Integer orderID)
    {
        this.orderID = orderID;
    }

    public String getStatusName()
    {
        return statusName;
    }

    public void setStatusName(String statusName)
    {
        this.statusName = statusName;
    }

    public Orders getOrders()
    {
        return orders;
    }

    public void setOrders(Orders orders)
    {
        this.orders = orders;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (orderID != null ? orderID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderstatus))
        {
            return false;
        }
        Orderstatus other = (Orderstatus) object;
        if ((this.orderID == null && other.orderID != null) || (this.orderID != null && !this.orderID.equals(other.orderID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.Orderstatus[ orderID=" + orderID + " ]";
    }
    
}
