/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.facade;

import com.apt.entity.Admin;
import com.apt.finder.AdminFinder;
import com.apt.utils.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author 50802
 */
public class AdminFacade {

    public List<Admin> getAll() {
        List<Admin> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            lst = session.createCriteria(Admin.class).list();

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

    public void create(Admin admin) {

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            session.save(admin);

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

    public Admin findAdminByName(String name) {
        Admin admin = new Admin();
        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            admin = (Admin) session.createCriteria(Admin.class).add(Restrictions.eq("adminName", name)).uniqueResult();

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
        return admin;
    }

    public void deleteAdmin(int adminID) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Admin admin = (Admin) session.get(Admin.class, adminID);
            session.delete(admin);

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

    public void updateAdmin(int adminID, Byte status) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Admin admin = (Admin) session.get(Admin.class, adminID);
            admin.setStatus(status);
            session.update(admin);

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

    public Admin findAdmin(int adminID) {
        Session session = null;
        Transaction trans = null;
        Admin admin = new Admin();
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            admin = (Admin) session.get(Admin.class, adminID);

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
        return admin;
    }

    public List<Admin> getAdminList(int page, int pagesize) {
        List<Admin> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Admin.class);
            crit.setMaxResults(pagesize);
            crit.setFirstResult((page - 1) * pagesize);
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

    public int getNumberAdmin() {
        List<Admin> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            lst = session.createCriteria(Admin.class).list();

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

    public void updateAdmin(Admin admin) {
        Session session = null;
        Transaction trans = null;

        try {

            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            session.update(admin);
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

    public List<Admin> getAdminList(AdminFinder finder) {
        List<Admin> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Admin.class);
            crit.add(Restrictions.sqlRestriction("1=1"));
            if (finder.getAdminID() != null) {
                crit.add(Restrictions.eq("adminID", finder.getAdminID()));
            }
            if (finder.getAdminName() != null) {
                crit.add(Restrictions.ilike("adminName", finder.getAdminName(), MatchMode.ANYWHERE));
            }
            if (finder.getStatus() != null) {
                crit.add(Restrictions.eq("status", finder.getStatus()));
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

        return lst;
    }

    public List<Admin> getAdminList(AdminFinder finder, int page, int recordPerPage) {
        List<Admin> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Admin.class);
            crit.add(Restrictions.sqlRestriction("1=1"));
            if (finder.getAdminID() != null) {
                crit.add(Restrictions.and(Restrictions.eq("adminID", finder.getAdminID())));
            }
            if (finder.getAdminName() != null) {
                crit.add(Restrictions.and(Restrictions.ilike("adminName","%" + finder.getAdminName() + "%")));
            }
            if (finder.getStatus() != null) {
                crit.add(Restrictions.and(Restrictions.eq("status", finder.getStatus())));
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

    public int getNumberAdmin(AdminFinder finder) {
        List<Admin> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Admin.class);
            crit.add(Restrictions.sqlRestriction("1=1"));
            if (finder.getAdminID() != null) {
                crit.add(Restrictions.and(Restrictions.eq("adminID", finder.getAdminID())));
            }
            if (finder.getAdminName() != null) {
                crit.add(Restrictions.and(Restrictions.ilike("adminName","%" + finder.getAdminName() + "%")));
            }
            if (finder.getStatus() != null) {
                crit.add(Restrictions.and(Restrictions.eq("status", finder.getStatus())));
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
