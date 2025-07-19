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
@Table(name = "COLORS")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Colors.findAll", query = "SELECT c FROM Colors c"),
    @NamedQuery(name = "Colors.findByColorID", query = "SELECT c FROM Colors c WHERE c.colorID = :colorID"),
    @NamedQuery(name = "Colors.findByColorName", query = "SELECT c FROM Colors c WHERE c.colorName = :colorName"),
    @NamedQuery(name = "Colors.findByDescription", query = "SELECT c FROM Colors c WHERE c.description = :description")
})
public class Colors implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ColorID")
    private Integer colorID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ColorName")
    private String colorName;
    @Size(max = 50)
    @Column(name = "Description")
    private String description;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "colorID")
    private Collection<Productsizecolor> productsizecolorCollection;

    public Colors()
    {
    }

    public Colors(Integer colorID)
    {
        this.colorID = colorID;
    }

    public Colors(Integer colorID, String colorName)
    {
        this.colorID = colorID;
        this.colorName = colorName;
    }

    public Integer getColorID()
    {
        return colorID;
    }

    public void setColorID(Integer colorID)
    {
        this.colorID = colorID;
    }

    public String getColorName()
    {
        return colorName;
    }

    public void setColorName(String colorName)
    {
        this.colorName = colorName;
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
        hash += (colorID != null ? colorID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Colors))
        {
            return false;
        }
        Colors other = (Colors) object;
        if ((this.colorID == null && other.colorID != null) || (this.colorID != null && !this.colorID.equals(other.colorID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.Colors[ colorID=" + colorID + " ]";
    }
    
}
