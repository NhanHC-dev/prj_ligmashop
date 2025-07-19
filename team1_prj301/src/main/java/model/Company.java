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
@Table(name = "COMPANY")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Company.findAll", query = "SELECT c FROM Company c"),
    @NamedQuery(name = "Company.findByCompanyID", query = "SELECT c FROM Company c WHERE c.companyID = :companyID"),
    @NamedQuery(name = "Company.findByCompanyName", query = "SELECT c FROM Company c WHERE c.companyName = :companyName"),
    @NamedQuery(name = "Company.findByAddress", query = "SELECT c FROM Company c WHERE c.address = :address"),
    @NamedQuery(name = "Company.findByContactNumber", query = "SELECT c FROM Company c WHERE c.contactNumber = :contactNumber"),
    @NamedQuery(name = "Company.findByEmail", query = "SELECT c FROM Company c WHERE c.email = :email")
})
public class Company implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CompanyID")
    private Integer companyID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "CompanyName")
    private String companyName;
    @Size(max = 100)
    @Column(name = "Address")
    private String address;
    @Size(max = 15)
    @Column(name = "ContactNumber")
    private String contactNumber;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 255)
    @Column(name = "Email")
    private String email;
    @OneToMany(mappedBy = "companyID")
    private Collection<Products> productsCollection;

    public Company()
    {
    }

    public Company(Integer companyID)
    {
        this.companyID = companyID;
    }

    public Company(Integer companyID, String companyName)
    {
        this.companyID = companyID;
        this.companyName = companyName;
    }

    public Integer getCompanyID()
    {
        return companyID;
    }

    public void setCompanyID(Integer companyID)
    {
        this.companyID = companyID;
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

    public String getContactNumber()
    {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber)
    {
        this.contactNumber = contactNumber;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    @XmlTransient
    public Collection<Products> getProductsCollection()
    {
        return productsCollection;
    }

    public void setProductsCollection(Collection<Products> productsCollection)
    {
        this.productsCollection = productsCollection;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (companyID != null ? companyID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Company))
        {
            return false;
        }
        Company other = (Company) object;
        if ((this.companyID == null && other.companyID != null) || (this.companyID != null && !this.companyID.equals(other.companyID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.Company[ companyID=" + companyID + " ]";
    }
    
}
