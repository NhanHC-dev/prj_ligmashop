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
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Asus-FPT
 */
@Entity
@Table(name = "Shipping")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Shipping.findAll", query = "SELECT s FROM Shipping s"),
    @NamedQuery(name = "Shipping.findByShippingID", query = "SELECT s FROM Shipping s WHERE s.shippingID = :shippingID"),
    @NamedQuery(name = "Shipping.findByAddress", query = "SELECT s FROM Shipping s WHERE s.address = :address"),
    @NamedQuery(name = "Shipping.findByShippingMethod", query = "SELECT s FROM Shipping s WHERE s.shippingMethod = :shippingMethod"),
    @NamedQuery(name = "Shipping.findByShippingStatus", query = "SELECT s FROM Shipping s WHERE s.shippingStatus = :shippingStatus"),
    @NamedQuery(name = "Shipping.findByEstimatedDeliveryDate", query = "SELECT s FROM Shipping s WHERE s.estimatedDeliveryDate = :estimatedDeliveryDate"),
    @NamedQuery(name = "Shipping.findByActualDeliveryDate", query = "SELECT s FROM Shipping s WHERE s.actualDeliveryDate = :actualDeliveryDate"),
    @NamedQuery(name = "Shipping.findByTrackingNumber", query = "SELECT s FROM Shipping s WHERE s.trackingNumber = :trackingNumber")
})
public class Shipping implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ShippingID")
    private Integer shippingID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "Address")
    private String address;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "ShippingMethod")
    private String shippingMethod;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ShippingStatus")
    private String shippingStatus;
    @Column(name = "EstimatedDeliveryDate")
    @Temporal(TemporalType.DATE)
    private Date estimatedDeliveryDate;
    @Column(name = "ActualDeliveryDate")
    @Temporal(TemporalType.DATE)
    private Date actualDeliveryDate;
    @Size(max = 255)
    @Column(name = "TrackingNumber")
    private String trackingNumber;
    @JoinColumn(name = "OrderID", referencedColumnName = "OrderID")
    @ManyToOne
    private Orders orderID;
    @JoinColumn(name = "ShippingCompanyID", referencedColumnName = "ShippingCompanyID")
    @ManyToOne
    private ShippingCompanies shippingCompanyID;

    public Shipping()
    {
    }

    public Shipping(Integer shippingID)
    {
        this.shippingID = shippingID;
    }

    public Shipping(Integer shippingID, String address, String shippingMethod, String shippingStatus)
    {
        this.shippingID = shippingID;
        this.address = address;
        this.shippingMethod = shippingMethod;
        this.shippingStatus = shippingStatus;
    }

    public Integer getShippingID()
    {
        return shippingID;
    }

    public void setShippingID(Integer shippingID)
    {
        this.shippingID = shippingID;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getShippingMethod()
    {
        return shippingMethod;
    }

    public void setShippingMethod(String shippingMethod)
    {
        this.shippingMethod = shippingMethod;
    }

    public String getShippingStatus()
    {
        return shippingStatus;
    }

    public void setShippingStatus(String shippingStatus)
    {
        this.shippingStatus = shippingStatus;
    }

    public Date getEstimatedDeliveryDate()
    {
        return estimatedDeliveryDate;
    }

    public void setEstimatedDeliveryDate(Date estimatedDeliveryDate)
    {
        this.estimatedDeliveryDate = estimatedDeliveryDate;
    }

    public Date getActualDeliveryDate()
    {
        return actualDeliveryDate;
    }

    public void setActualDeliveryDate(Date actualDeliveryDate)
    {
        this.actualDeliveryDate = actualDeliveryDate;
    }

    public String getTrackingNumber()
    {
        return trackingNumber;
    }

    public void setTrackingNumber(String trackingNumber)
    {
        this.trackingNumber = trackingNumber;
    }

    public Orders getOrderID()
    {
        return orderID;
    }

    public void setOrderID(Orders orderID)
    {
        this.orderID = orderID;
    }

    public ShippingCompanies getShippingCompanyID()
    {
        return shippingCompanyID;
    }

    public void setShippingCompanyID(ShippingCompanies shippingCompanyID)
    {
        this.shippingCompanyID = shippingCompanyID;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (shippingID != null ? shippingID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Shipping))
        {
            return false;
        }
        Shipping other = (Shipping) object;
        if ((this.shippingID == null && other.shippingID != null) || (this.shippingID != null && !this.shippingID.equals(other.shippingID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.Shipping[ shippingID=" + shippingID + " ]";
    }
    
}
