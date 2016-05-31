/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.facade;

import com.apt.entity.Assignment;
import com.apt.entity.Batch;
import com.apt.entity.Assignment;
import com.apt.entity.Subject;
import com.apt.finder.AssignmentFinder;
import com.apt.utils.HibernateUtil;
import com.apt.utils.MyUtils;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author 50802
 */
public class AssignmentFacade {
    
    MyUtils myUtils = new MyUtils();
    public List<Assignment> getAll() {
        List<Assignment> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            lst = session.createCriteria(Assignment.class).list();

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

    public void create(Assignment assignment) {

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            session.save(assignment);

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

    public Assignment findAssignmentByName(String name) {
        Assignment assignment = new Assignment();
        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            assignment = (Assignment) session.createCriteria(Assignment.class).add(Restrictions.eq("assignmentName", name)).uniqueResult();

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
        return assignment;
    }

    public boolean deleteAssignment(int assignmentID) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Assignment assignment = (Assignment) session.get(Assignment.class, assignmentID);
            session.delete(assignment);

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

    public boolean updateAssignment(int assignmentID, Byte status) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Assignment assignment = (Assignment) session.get(Assignment.class, assignmentID);
            assignment.setStatus(status);
            session.update(assignment);

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

    public Assignment findAssignment(int assignmentID) {
        Session session = null;
        Transaction trans = null;
        Assignment assignment = new Assignment();
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            assignment = (Assignment) session.get(Assignment.class, assignmentID);

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
        return assignment;
    }

    public List<Assignment> findAssignment(Batch batch, Subject subject) {
        List<Assignment> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Assignment.class);
            crit.add(Restrictions.eq("batch", batch));
            crit.add(Restrictions.eq("subject", subject));
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
    
    public List<Assignment> findAssignment(Batch batch, Subject subject,Byte status) {
        List<Assignment> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Assignment.class);
            crit.add(Restrictions.eq("batch", batch));
            crit.add(Restrictions.eq("subject", subject));
            crit.add(Restrictions.eq("status", status));
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
    
    public List<Assignment> findAssignment(Batch batch){
        List<Assignment> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Assignment.class);
            crit.add(Restrictions.eq("batch", batch));
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
    
    public List<Assignment> findAssignment(Batch batch,Byte status){
        List<Assignment> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Assignment.class);
            crit.add(Restrictions.eq("batch", batch));
            crit.add(Restrictions.eq("status", status));
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
    
    public List<Assignment> getAssignmentList(AssignmentFinder finder, int page, int recordPerPage) {
        List<Assignment> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Assignment.class);
            
            crit.add(Restrictions.sqlRestriction("1=1"));
            if (finder.getAssignmentId() != null) {
                crit.add(Restrictions.and(Restrictions.eq("assignmentId", finder.getAssignmentId())));
            }
            if (finder.getAssignmentName() != null) {
                crit.add(Restrictions.and(Restrictions.ilike("assignmentName", "%" + finder.getAssignmentName() + "%")));
            }
            if (finder.getBatch() != null) {
                crit.add(Restrictions.and(Restrictions.eq("batch", finder.getBatch())));
            }
            if(finder.getSubject()!=null){
                crit.add(Restrictions.and(Restrictions.eq("subject", finder.getSubject())));
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

    public int getNumberAssignment(AssignmentFinder finder) {
        List<Assignment> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Assignment.class);
            
            crit.add(Restrictions.sqlRestriction("1=1"));
            if (finder.getAssignmentId() != null) {
                crit.add(Restrictions.and(Restrictions.eq("assignmentId", finder.getAssignmentId())));
            }
            if (finder.getAssignmentName() != null) {
                crit.add(Restrictions.and(Restrictions.ilike("assignmentName", "%" + finder.getAssignmentName() + "%")));
            }
            if (finder.getBatch() != null) {
                crit.add(Restrictions.and(Restrictions.eq("batch", finder.getBatch())));
            }
            if(finder.getSubject()!=null){
                crit.add(Restrictions.and(Restrictions.eq("subject", finder.getSubject())));
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
}
