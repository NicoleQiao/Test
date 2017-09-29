/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package heps.db.magnet.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author qiaoys
 */
@Entity
@Table(name = "rcs_data_table")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RcsDataTable.findAll", query = "SELECT r FROM RcsDataTable r")
    , @NamedQuery(name = "RcsDataTable.findByDataId", query = "SELECT r FROM RcsDataTable r WHERE r.dataId = :dataId")
    , @NamedQuery(name = "RcsDataTable.findByPhi", query = "SELECT r FROM RcsDataTable r WHERE r.phi = :phi")
    , @NamedQuery(name = "RcsDataTable.findByAngle", query = "SELECT r FROM RcsDataTable r WHERE r.angle = :angle")
    , @NamedQuery(name = "RcsDataTable.findByB2", query = "SELECT r FROM RcsDataTable r WHERE r.b2 = :b2")
    , @NamedQuery(name = "RcsDataTable.findByBn", query = "SELECT r FROM RcsDataTable r WHERE r.bn = :bn")
    , @NamedQuery(name = "RcsDataTable.findByAn", query = "SELECT r FROM RcsDataTable r WHERE r.an = :an")})
public class RcsDataTable implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "data_id")
    private Integer dataId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "phi")
    private Double phi;
    @Column(name = "angle")
    private Double angle;
    @Column(name = "b2")
    private Double b2;
    @Column(name = "bn")
    private Double bn;
    @Column(name = "an")
    private Double an;
    @JoinColumn(name = "run_id", referencedColumnName = "rot_coil_run_id")
    @ManyToOne
    private RotCoilSystemTable runId;

    public RcsDataTable() {
    }

    public RcsDataTable(Integer dataId) {
        this.dataId = dataId;
    }

    public Integer getDataId() {
        return dataId;
    }

    public void setDataId(Integer dataId) {
        this.dataId = dataId;
    }

    public Double getPhi() {
        return phi;
    }

    public void setPhi(Double phi) {
        this.phi = phi;
    }

    public Double getAngle() {
        return angle;
    }

    public void setAngle(Double angle) {
        this.angle = angle;
    }

    public Double getB2() {
        return b2;
    }

    public void setB2(Double b2) {
        this.b2 = b2;
    }

    public Double getBn() {
        return bn;
    }

    public void setBn(Double bn) {
        this.bn = bn;
    }

    public Double getAn() {
        return an;
    }

    public void setAn(Double an) {
        this.an = an;
    }

    public RotCoilSystemTable getRunId() {
        return runId;
    }

    public void setRunId(RotCoilSystemTable runId) {
        this.runId = runId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (dataId != null ? dataId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof RcsDataTable)) {
            return false;
        }
        RcsDataTable other = (RcsDataTable) object;
        if ((this.dataId == null && other.dataId != null) || (this.dataId != null && !this.dataId.equals(other.dataId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "heps.db.magnet.entity.RcsDataTable[ dataId=" + dataId + " ]";
    }
    
}
