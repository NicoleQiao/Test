/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package heps.db.magnet.jpa;

import heps.db.magnet.entity.DesignOtherTable;
import heps.db.magnet.entity.MagnetDesignParameterTable;
import heps.db.magnet.entity.MagnetDesignRequirementTable;
import heps.db.magnet.entity.MagnetDesignTable;
import static heps.db.magnet.entity.MagnetDesignTable_.magnetDesignRequirementTable;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

/**
 *
 * @author qiaoys
 */
public class DesignAPI {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("heps-db-magnetPU");
    EntityManager em = emf.createEntityManager();
    EntityTransaction et=em.getTransaction();           

    public void insertDesign(ArrayList designall) throws UnsupportedEncodingException {
        et.begin(); 

        MagnetDesignTable magnetdesign = new MagnetDesignTable();
        
        magnetdesign.setType(designall.get(0).toString());
        magnetdesign.setFamily(Integer.parseInt(designall.get(1).toString()));
        magnetdesign.setDesignName(designall.get(0).toString()+"-"+Integer.parseInt(designall.get(1).toString()));
        em.persist(magnetdesign);
        et.commit();
        
        MagnetDesignRequirementTable magnetrequire=new MagnetDesignRequirementTable();
        magnetrequire.setDesignId(magnetdesign.getDesignId());
        magnetrequire.setLength(Integer.parseInt(designall.get(2).toString()));
        magnetrequire.setAperture(Double.parseDouble(designall.get(3).toString()));
        em.persist(magnetrequire);
 
        
        et.commit();
        em.close();        
        System.out.println("ok");
    }
    
}
