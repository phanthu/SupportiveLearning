/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.facade;

import com.apt.entity.Admin;
import com.apt.entity.Subject;
import com.apt.finder.SubjectFinder;
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
public class SubjectFacade {

    public List<Subject> getAll() {
        List<Subject> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            lst = session.createCriteria(Subject.class).list();

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

    public List<Subject> getSubjectList(SubjectFinder finder, int page, int recordPerPage) {
        List<Subject> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Subject.class);
            crit.add(Restrictions.sqlRestriction("1=1"));
            if (finder.getSubjectId() != null) {
                crit.add(Restrictions.and(Restrictions.eq("subjectId", finder.getSubjectId())));
            }
            if (finder.getSubjectName() != null) {
                crit.add(Restrictions.and(Restrictions.ilike("subjectName", "%" + finder.getSubjectName() + "%")));
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

    public int getNumberSubject(SubjectFinder finder) {
        List<Subject> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Subject.class);
            crit.add(Restrictions.sqlRestriction("1=1"));
            if (finder.getSubjectId() != null) {
                crit.add(Restrictions.and(Restrictions.eq("subjectId", finder.getSubjectId())));
            }
            if (finder.getSubjectName() != null) {
                crit.add(Restrictions.and(Restrictions.ilike("subjectName", "%" + finder.getSubjectName() + "%")));
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

    public void create(Subject subject) {

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            session.save(subject);

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

    public Subject findSubjectByName(String name) {
        Subject subject = new Subject();
        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            subject = (Subject) session.createCriteria(Subject.class).add(Restrictions.eq("subjectName", name)).uniqueResult();

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
        return subject;
    }

    public boolean deleteSubject(int subjectID) {
        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Subject subject = (Subject) session.get(Subject.class, subjectID);
            session.delete(subject);

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

    public void updateSubject(int subjectID, String name) {
        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Subject subject = (Subject) session.get(Subject.class, subjectID);
            subject.setSubjectName(name);
            session.update(subject);

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

    public Subject findSubject(int subjectID) {
        Session session = null;
        Transaction trans = null;
        Subject subject = new Subject();
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            subject = (Subject) session.get(Subject.class, subjectID);

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
        return subject;
    }

    public void updateSubject(Subject subject) {
        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            session.update(subject);

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
