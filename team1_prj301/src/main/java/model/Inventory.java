/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotNull;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Asus-FPT
 */
@Entity
@Table(name = "INVENTORY")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Inventory.findAll", query = "SELECT i FROM Inventory i"),
    @NamedQuery(name = "Inventory.findByInventoryID", query = "SELECT i FROM Inventory i WHERE i.inventoryID = :inventoryID"),
    @NamedQuery(name = "Inventory.findByStock", query = "SELECT i FROM Inventory i WHERE i.stock = :stock"),
    @NamedQuery(name = "Inventory.findByLastUpdated", query = "SELECT i FROM Inventory i WHERE i.lastUpdated = :lastUpdated")
})
public class Inventory implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "InventoryID")
    private Integer inventoryID;
    @Column(name = "Stock")
    private Integer stock;
    @Basic(optional = false)
    @NotNull
    @Column(name = "LastUpdated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastUpdated;
    @JoinColumn(name = "ProductSizeColorID", referencedColumnName = "ProductSizeColorID")
    @ManyToOne
    private Productsizecolor productSizeColorID;

    public Inventory()
    {
    }

    public Inventory(Integer inventoryID)
    {
        this.inventoryID = inventoryID;
    }

    public Inventory(Integer inventoryID, Date lastUpdated)
    {
        this.inventoryID = inventoryID;
        this.lastUpdated = lastUpdated;
    }

    public Integer getInventoryID()
    {
        return inventoryID;
    }

    public void setInventoryID(Integer inventoryID)
    {
        this.inventoryID = inventoryID;
    }

    public Integer getStock()
    {
        return stock;
    }

    public void setStock(Integer stock)
    {
        this.stock = stock;
    }

    public Date getLastUpdated()
    {
        return lastUpdated;
    }

    public void setLastUpdated(Date lastUpdated)
    {
        this.lastUpdated = lastUpdated;
    }

    public Productsizecolor getProductSizeColorID()
    {
        return productSizeColorID;
    }

    public void setProductSizeColorID(Productsizecolor productSizeColorID)
    {
        this.productSizeColorID = productSizeColorID;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (inventoryID != null ? inventoryID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Inventory))
        {
            return false;
        }
        Inventory other = (Inventory) object;
        if ((this.inventoryID == null && other.inventoryID != null) || (this.inventoryID != null && !this.inventoryID.equals(other.inventoryID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.Inventory[ inventoryID=" + inventoryID + " ]";
    }
    
}
