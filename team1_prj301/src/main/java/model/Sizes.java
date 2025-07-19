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
@Table(name = "SIZES")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Sizes.findAll", query = "SELECT s FROM Sizes s"),
    @NamedQuery(name = "Sizes.findBySizeID", query = "SELECT s FROM Sizes s WHERE s.sizeID = :sizeID"),
    @NamedQuery(name = "Sizes.findBySizeName", query = "SELECT s FROM Sizes s WHERE s.sizeName = :sizeName"),
    @NamedQuery(name = "Sizes.findByDescription", query = "SELECT s FROM Sizes s WHERE s.description = :description")
})
public class Sizes implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "SizeID")
    private Integer sizeID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "SizeName")
    private String sizeName;
    @Size(max = 100)
    @Column(name = "Description")
    private String description;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sizeID")
    private Collection<Productsizecolor> productsizecolorCollection;

    public Sizes()
    {
    }

    public Sizes(Integer sizeID)
    {
        this.sizeID = sizeID;
    }

    public Sizes(Integer sizeID, String sizeName)
    {
        this.sizeID = sizeID;
        this.sizeName = sizeName;
    }

    public Integer getSizeID()
    {
        return sizeID;
    }

    public void setSizeID(Integer sizeID)
    {
        this.sizeID = sizeID;
    }

    public String getSizeName()
    {
        return sizeName;
    }

    public void setSizeName(String sizeName)
    {
        this.sizeName = sizeName;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    @XmlTransient
    public Collection<Productsizecolor> getProductsizecolorCollection()
    {
        return productsizecolorCollection;
    }

    public void setProductsizecolorCollection(Collection<Productsizecolor> productsizecolorCollection)
    {
        this.productsizecolorCollection = productsizecolorCollection;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (sizeID != null ? sizeID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sizes))
        {
            return false;
        }
        Sizes other = (Sizes) object;
        if ((this.sizeID == null && other.sizeID != null) || (this.sizeID != null && !this.sizeID.equals(other.sizeID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.Sizes[ sizeID=" + sizeID + " ]";
    }
    
}
