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
import jakarta.persistence.Lob;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.Collection;

/**
 *
 * @author Asus-FPT
 */
@Entity
@Table(name = "PaymentMethods")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "PaymentMethods.findAll", query = "SELECT p FROM PaymentMethods p"),
    @NamedQuery(name = "PaymentMethods.findByPaymentMethodID", query = "SELECT p FROM PaymentMethods p WHERE p.paymentMethodID = :paymentMethodID"),
    @NamedQuery(name = "PaymentMethods.findByMethodName", query = "SELECT p FROM PaymentMethods p WHERE p.methodName = :methodName"),
    @NamedQuery(name = "PaymentMethods.findByIsActive", query = "SELECT p FROM PaymentMethods p WHERE p.isActive = :isActive")
})
public class PaymentMethods implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PaymentMethodID")
    private Integer paymentMethodID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "MethodName")
    private String methodName;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "Description")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Column(name = "IsActive")
    private boolean isActive;
    @OneToMany(mappedBy = "paymentMethodID")
    private Collection<Orders> ordersCollection;

    public PaymentMethods()
    {
    }

    public PaymentMethods(Integer paymentMethodID)
    {
        this.paymentMethodID = paymentMethodID;
    }

    public PaymentMethods(Integer paymentMethodID, String methodName, boolean isActive)
    {
        this.paymentMethodID = paymentMethodID;
        this.methodName = methodName;
        this.isActive = isActive;
    }

    public Integer getPaymentMethodID()
    {
        return paymentMethodID;
    }

    public void setPaymentMethodID(Integer paymentMethodID)
    {
        this.paymentMethodID = paymentMethodID;
    }

    public String getMethodName()
    {
        return methodName;
    }

    public void setMethodName(String methodName)
    {
        this.methodName = methodName;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public boolean getIsActive()
    {
        return isActive;
    }

    public void setIsActive(boolean isActive)
    {
        this.isActive = isActive;
    }

    @XmlTransient
    public Collection<Orders> getOrdersCollection()
    {
        return ordersCollection;
    }

    public void setOrdersCollection(Collection<Orders> ordersCollection)
    {
        this.ordersCollection = ordersCollection;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (paymentMethodID != null ? paymentMethodID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PaymentMethods))
        {
            return false;
        }
        PaymentMethods other = (PaymentMethods) object;
        if ((this.paymentMethodID == null && other.paymentMethodID != null) || (this.paymentMethodID != null && !this.paymentMethodID.equals(other.paymentMethodID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.PaymentMethods[ paymentMethodID=" + paymentMethodID + " ]";
    }
    
}
