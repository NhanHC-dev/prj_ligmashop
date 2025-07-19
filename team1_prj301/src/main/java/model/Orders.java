/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotNull;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;

/**
 *
 * @author Asus-FPT
 */
@Entity
@Table(name = "ORDERS")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findByOrderID", query = "SELECT o FROM Orders o WHERE o.orderID = :orderID"),
    @NamedQuery(name = "Orders.findByOrderDate", query = "SELECT o FROM Orders o WHERE o.orderDate = :orderDate"),
    @NamedQuery(name = "Orders.findByTotalAmount", query = "SELECT o FROM Orders o WHERE o.totalAmount = :totalAmount")
})
public class Orders implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "OrderID")
    private Integer orderID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "OrderDate")
    @Temporal(TemporalType.DATE)
    private Date orderDate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "TotalAmount")
    private BigDecimal totalAmount;
    @JoinColumn(name = "PaymentMethodID", referencedColumnName = "PaymentMethodID")
    @ManyToOne
    private PaymentMethods paymentMethodID;
    @JoinColumn(name = "UserID", referencedColumnName = "UserID")
    @ManyToOne(optional = false)
    private Users userID;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "orders")
    private Orderstatus orderstatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderID")
    private Collection<Orderdetails> orderdetailsCollection;
    @OneToMany(mappedBy = "orderID")
    private Collection<Shipping> shippingCollection;

    public Orders()
    {
    }

    public Orders(Integer orderID)
    {
        this.orderID = orderID;
    }

    public Orders(Integer orderID, Date orderDate)
    {
        this.orderID = orderID;
        this.orderDate = orderDate;
    }

    public Integer getOrderID()
    {
        return orderID;
    }

    public void setOrderID(Integer orderID)
    {
        this.orderID = orderID;
    }

    public Date getOrderDate()
    {
        return orderDate;
    }

    public void setOrderDate(Date orderDate)
    {
        this.orderDate = orderDate;
    }

    public BigDecimal getTotalAmount()
    {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount)
    {
        this.totalAmount = totalAmount;
    }

    public PaymentMethods getPaymentMethodID()
    {
        return paymentMethodID;
    }

    public void setPaymentMethodID(PaymentMethods paymentMethodID)
    {
        this.paymentMethodID = paymentMethodID;
    }

    public Users getUserID()
    {
        return userID;
    }

    public void setUserID(Users userID)
    {
        this.userID = userID;
    }

    public Orderstatus getOrderstatus()
    {
        return orderstatus;
    }

    public void setOrderstatus(Orderstatus orderstatus)
    {
        this.orderstatus = orderstatus;
    }

    @XmlTransient
    public Collection<Orderdetails> getOrderdetailsCollection()
    {
        return orderdetailsCollection;
    }

    public void setOrderdetailsCollection(Collection<Orderdetails> orderdetailsCollection)
    {
        this.orderdetailsCollection = orderdetailsCollection;
    }

    @XmlTransient
    public Collection<Shipping> getShippingCollection()
    {
        return shippingCollection;
    }

    public void setShippingCollection(Collection<Shipping> shippingCollection)
    {
        this.shippingCollection = shippingCollection;
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
        if (!(object instanceof Orders))
        {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderID == null && other.orderID != null) || (this.orderID != null && !this.orderID.equals(other.orderID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.Orders[ orderID=" + orderID + " ]";
    }
    
}
