/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.facade;

import com.apt.entity.Batch;
import com.apt.entity.Batch;
import com.apt.entity.Batch;
import com.apt.finder.BatchFinder;
import com.apt.utils.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author 50802
 */
public class BatchFacade {

    public List<Batch> getAll() {
        List<Batch> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            lst = session.createCriteria(Batch.class).list();

            trans.commit();

        } catch (Exception e) {
            e.printStackTrace();
            if (trans != null) {
                trans.rollback();
            }
        } finally {
            if (session != null && session.isConnected()) {
                session.close();
            }
        }

        return lst;
    }

    public void create(Batch batch) {

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            session.save(batch);

            trans.commit();

        } catch (Exception e) {
            e.printStackTrace();
            if (trans != null) {
                trans.rollback();
            }
        } finally {
            if (session != null && session.isConnected()) {
                session.close();
            }
        }
    }

    public Batch findBatch(String name) {
        Batch batch = new Batch();
        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();
            
            batch = (Batch) session.createCriteria(Batch.class).add(Restrictions.eq("batchName", name)).uniqueResult();

            trans.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
            if (trans != null) {
                trans.rollback();
            }
            return null;
        } finally {
            if (session != null && session.isConnected()) {
                session.close();
            }
        }
        return batch;
    }

    public boolean deleteBatch(int batchID) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();
            
            Batch batch = (Batch) session.get(Batch.class, batchID);
            session.delete(batch);
            
            trans.commit();

        } catch (Exception e) {
            e.printStackTrace();
            if (trans != null) {
                trans.rollback();
            }
            return false;
        } finally {
            if (session != null && session.isConnected()) {
                session.close();
            }
        }
        return true;
    }

    
    public Batch findBatch(int batchID){
        Session session = null;
        Transaction trans = null;
        Batch batch = new Batch();
        try{
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();
            
            batch=(Batch)session.get(Batch.class, batchID);
            
            trans.commit();
            
        }catch (Exception e) {
            e.printStackTrace();
            if (trans != null) {
                trans.rollback();
            }
        } finally {
            if (session != null && session.isConnected()) {
                session.close();
            }
        }
        return batch;
    }
    
        public List<Batch> getBatchList(BatchFinder finder, int page, int recordPerPage) {
        List<Batch> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Batch.class);
            crit.add(Restrictions.sqlRestriction("1=1"));
            if (finder.getBatchId() != null) {
                crit.add(Restrictions.and(Restrictions.eq("batchId", finder.getBatchId())));
            }
            if (finder.getBatchName() != null) {
                crit.add(Restrictions.and(Restrictions.ilike("batchName", "%" + finder.getBatchName() + "%")));
            }
            crit.setFirstResult((page - 1) * recordPerPage);
            crit.setMaxResults(recordPerPage);
            lst = crit.list();
            trans.commit();

        } catch (Exception e) {
            e.printStackTrace();
            if (trans != null) {
                trans.rollback();
            }
        } finally {
            if (session != null && session.isConnected()) {
                session.close();
            }
        }

        return lst;
    }

    public int getNumberBatch(BatchFinder finder) {
        List<Batch> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Batch.class);
            crit.add(Restrictions.sqlRestriction("1=1"));
            if (finder.getBatchId() != null) {
                crit.add(Restrictions.and(Restrictions.eq("batchId", finder.getBatchId())));
            }
            if (finder.getBatchName() != null) {
                crit.add(Restrictions.and(Restrictions.ilike("batchName", "%" + finder.getBatchName() + "%")));
            }
            lst = crit.list();
            trans.commit();

        } catch (Exception e) {
            e.printStackTrace();
            if (trans != null) {
                trans.rollback();
            }
        } finally {
            if (session != null && session.isConnected()) {
                session.close();
            }
        }

        return lst.size();
    }
    
    public void updateBatch(Batch batch) {
        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            session.update(batch);

            trans.commit();

        } catch (Exception e) {
            e.printStackTrace();
            if (trans != null) {
                trans.rollback();
            }
        } finally {
            if (session != null && session.isConnected()) {
                session.close();
            }
        }
    }
}
