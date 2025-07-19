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
@Table(name = "Voucher")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Voucher.findAll", query = "SELECT v FROM Voucher v"),
    @NamedQuery(name = "Voucher.findByVoucherID", query = "SELECT v FROM Voucher v WHERE v.voucherID = :voucherID"),
    @NamedQuery(name = "Voucher.findByVoucherDay", query = "SELECT v FROM Voucher v WHERE v.voucherDay = :voucherDay"),
    @NamedQuery(name = "Voucher.findByDiscountValue", query = "SELECT v FROM Voucher v WHERE v.discountValue = :discountValue")
})
public class Voucher implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "VoucherID")
    private Integer voucherID;
    @Column(name = "VoucherDay")
    @Temporal(TemporalType.DATE)
    private Date voucherDay;
    @Column(name = "DiscountValue")
    private Integer discountValue;

    public Voucher()
    {
    }

    public Voucher(Integer voucherID)
    {
        this.voucherID = voucherID;
    }

    public Integer getVoucherID()
    {
        return voucherID;
    }

    public void setVoucherID(Integer voucherID)
    {
        this.voucherID = voucherID;
    }

    public Date getVoucherDay()
    {
        return voucherDay;
    }

    public void setVoucherDay(Date voucherDay)
    {
        this.voucherDay = voucherDay;
    }

    public Integer getDiscountValue()
    {
        return discountValue;
    }

    public void setDiscountValue(Integer discountValue)
    {
        this.discountValue = discountValue;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (voucherID != null ? voucherID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Voucher))
        {
            return false;
        }
        Voucher other = (Voucher) object;
        if ((this.voucherID == null && other.voucherID != null) || (this.voucherID != null && !this.voucherID.equals(other.voucherID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.resources.Voucher[ voucherID=" + voucherID + " ]";
    }
    
}
