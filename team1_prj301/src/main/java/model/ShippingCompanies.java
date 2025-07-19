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
@Table(name = "ShippingCompanies")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "ShippingCompanies.findAll", query = "SELECT s FROM ShippingCompanies s"),
    @NamedQuery(name = "ShippingCompanies.findByShippingCompanyID", query = "SELECT s FROM ShippingCompanies s WHERE s.shippingCompanyID = :shippingCompanyID"),
    @NamedQuery(name = "ShippingCompanies.findByCompanyName", query = "SELECT s FROM ShippingCompanies s WHERE s.companyName = :companyName"),
    @NamedQuery(name = "ShippingCompanies.findByAddress", query = "SELECT s FROM ShippingCompanies s WHERE s.address = :address")
})
public class ShippingCompanies implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ShippingCompanyID")
    private Integer shippingCompanyID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "CompanyName")
    private String companyName;
    @Size(max = 100)
    @Column(name = "Address")
    private String address;
    @OneToMany(mappedBy = "shippingCompanyID")
    private Collection<Shipping> shippingCollection;

    public ShippingCompanies()
    {
    }

    public ShippingCompanies(Integer shippingCompanyID)
    {
        this.shippingCompanyID = shippingCompanyID;
    }

    public ShippingCompanies(Integer shippingCompanyID, String companyName)
    {
        this.shippingCompanyID = shippingCompanyID;
        this.companyName = companyName;
    }

    public Integer getShippingCompanyID()
    {
        return shippingCompanyID;
    }

    public void setShippingCompanyID(Integer shippingCompanyID)
    {
        this.shippingCompanyID = shippingCompanyID;
    }

    public String getCompanyName()
    {
        return companyName;
    }

    public void setCompanyName(String companyName)
    {
        this.companyName = companyName;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
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
        hash += (shippingCompanyID != null ? shippingCompanyID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ShippingCompanies))
        {
            return false;
        }
        ShippingCompanies other = (ShippingCompanies) object;
        if ((this.shippingCompanyID == null && other.shippingCompanyID != null) || (this.shippingCompanyID != null && !this.shippingCompanyID.equals(other.shippingCompanyID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.ShippingCompanies[ shippingCompanyID=" + shippingCompanyID + " ]";
    }
    
}
