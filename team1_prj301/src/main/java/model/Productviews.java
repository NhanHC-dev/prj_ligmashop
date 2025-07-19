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
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Asus-FPT
 */
@Entity
@Table(name = "PRODUCTVIEWS")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Productviews.findAll", query = "SELECT p FROM Productviews p"),
    @NamedQuery(name = "Productviews.findByViewID", query = "SELECT p FROM Productviews p WHERE p.viewID = :viewID"),
    @NamedQuery(name = "Productviews.findByViewDate", query = "SELECT p FROM Productviews p WHERE p.viewDate = :viewDate")
})
public class Productviews implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ViewID")
    private Integer viewID;
    @Column(name = "ViewDate")
    @Temporal(TemporalType.DATE)
    private Date viewDate;
    @JoinColumn(name = "ProductID", referencedColumnName = "ProductID")
    @ManyToOne
    private Products productID;
    @JoinColumn(name = "UserID", referencedColumnName = "UserID")
    @ManyToOne
    private Users userID;

    public Productviews()
    {
    }

    public Productviews(Integer viewID)
    {
        this.viewID = viewID;
    }

    public Integer getViewID()
    {
        return viewID;
    }

    public void setViewID(Integer viewID)
    {
        this.viewID = viewID;
    }

    public Date getViewDate()
    {
        return viewDate;
    }

    public void setViewDate(Date viewDate)
    {
        this.viewDate = viewDate;
    }

    public Products getProductID()
    {
        return productID;
    }

    public void setProductID(Products productID)
    {
        this.productID = productID;
    }

    public Users getUserID()
    {
        return userID;
    }

    public void setUserID(Users userID)
    {
        this.userID = userID;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (viewID != null ? viewID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Productviews))
        {
            return false;
        }
        Productviews other = (Productviews) object;
        if ((this.viewID == null && other.viewID != null) || (this.viewID != null && !this.viewID.equals(other.viewID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.Productviews[ viewID=" + viewID + " ]";
    }
    
}
