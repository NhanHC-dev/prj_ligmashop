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
import jakarta.persistence.Table;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;

@Entity
@Table(name = "PRODUCTSIZECOLOR")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Productsizecolor.findAll", query = "SELECT p FROM Productsizecolor p"),
    @NamedQuery(name = "Productsizecolor.findByProductSizeColorID", query = "SELECT p FROM Productsizecolor p WHERE p.productSizeColorID = :productSizeColorID"),
    @NamedQuery(name = "Productsizecolor.findByPrice", query = "SELECT p FROM Productsizecolor p WHERE p.price = :price")
})
public class Productsizecolor implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ProductSizeColorID")
    private Integer productSizeColorID;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Price")
    private BigDecimal price;
    @JoinColumn(name = "ColorID", referencedColumnName = "ColorID")
    @ManyToOne(optional = false)
    private Colors colorID;
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductID")
    @ManyToOne(optional = false)
    private Products productID;
    @JoinColumn(name = "SizeID", referencedColumnName = "SizeID")
    @ManyToOne(optional = false)
    private Sizes sizeID;
    @OneToMany(mappedBy = "productSizeColorID")
    private Collection<Inventory> inventoryCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productSizeColorID")
    private Collection<Cartitems> cartitemsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productSizeColorID")
    private Collection<Orderdetails> orderdetailsCollection;

    public Productsizecolor()
    {
    }

    public Productsizecolor(Integer productSizeColorID)
    {
        this.productSizeColorID = productSizeColorID;
    }

    public Integer getProductSizeColorID()
    {
        return productSizeColorID;
    }

    public void setProductSizeColorID(Integer productSizeColorID)
    {
        this.productSizeColorID = productSizeColorID;
    }

    public BigDecimal getPrice()
    {
        return price;
    }

    public void setPrice(BigDecimal price)
    {
        this.price = price;
    }

    public Colors getColorID()
    {
        return colorID;
    }

    public void setColorID(Colors colorID)
    {
        this.colorID = colorID;
    }

    public Products getProductID()
    {
        return productID;
    }

    public void setProductID(Products productID)
    {
        this.productID = productID;
    }

    public Sizes getSizeID()
    {
        return sizeID;
    }

    public void setSizeID(Sizes sizeID)
    {
        this.sizeID = sizeID;
    }

    @XmlTransient
    public Collection<Inventory> getInventoryCollection()
    {
        return inventoryCollection;
    }

    public void setInventoryCollection(Collection<Inventory> inventoryCollection)
    {
        this.inventoryCollection = inventoryCollection;
    }

    @XmlTransient
    public Collection<Cartitems> getCartitemsCollection()
    {
        return cartitemsCollection;
    }

    public void setCartitemsCollection(Collection<Cartitems> cartitemsCollection)
    {
        this.cartitemsCollection = cartitemsCollection;
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

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (productSizeColorID != null ? productSizeColorID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Productsizecolor))
        {
            return false;
        }
        Productsizecolor other = (Productsizecolor) object;
        if ((this.productSizeColorID == null && other.productSizeColorID != null) || (this.productSizeColorID != null && !this.productSizeColorID.equals(other.productSizeColorID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.Productsizecolor[ productSizeColorID=" + productSizeColorID + " ]";
    }
    
}
