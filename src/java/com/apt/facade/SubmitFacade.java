/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.facade;

import com.apt.entity.Assignment;
import com.apt.entity.Student;
import com.apt.entity.Submit;
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
public class SubmitFacade {

    public List<Submit> getAll() {
        List<Submit> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            lst = session.createCriteria(Submit.class).list();

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

    public void create(Submit submit) {

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            session.save(submit);

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

    public Submit findSubmitByName(String name) {
        Submit submit = new Submit();
        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            submit = (Submit) session.createCriteria(Submit.class).add(Restrictions.eq("submitName", name)).uniqueResult();

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
        return submit;
    }

    public boolean deleteSubmit(int submitID) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Submit submit = (Submit) session.get(Submit.class, submitID);
            session.delete(submit);

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

    public Submit findSubmit(int submitID) {
        Session session = null;
        Transaction trans = null;
        Submit submit = new Submit();
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            submit = (Submit) session.get(Submit.class, submitID);

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
        return submit;
    }
    
    public Submit findSubmit(Assignment assignment,Student student){
        Session session = null;
        Transaction trans = null;
        Submit submit = new Submit();
        
        try {

            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Submit.class);
            crit.add(Restrictions.eq("assignment", assignment));
            crit.add(Restrictions.eq("student", student));
            submit= (Submit) crit.uniqueResult();

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
        return submit;
    }
    
    public List<Submit> getSubmits(Assignment assignment){
        List<Submit> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            lst = session.createCriteria(Submit.class).add(Restrictions.eq("assignment", assignment)).list();

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
}
