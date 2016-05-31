/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apt.facade;

import com.apt.entity.Batch;
import com.apt.entity.Student;
import com.apt.entity.Student;
import com.apt.finder.StudentFinder;
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
 * @author Miku
 */
public class StudentFacade {
    private BatchFacade batchFacade = new BatchFacade();
    private MyUtils myUtils = new MyUtils();
    public List<Student> getAll() {
        List<Student> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            lst = session.createCriteria(Student.class).list();

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

    public void create(Student Student) {

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            session.save(Student);

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

    public List<Student> findStudent(String name) {
        List<Student> lst = new ArrayList<>();
        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            lst = (List<Student>) session.createCriteria(Student.class).add(Restrictions.like("studentName", name));

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
        return lst;
    }

    public boolean deleteStudent(int StudentID) {
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Student Student = (Student) session.get(Student.class, StudentID);
            session.delete(Student);

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

    public boolean updateStudent(Student student) {
        Session session = null;
        Transaction trans = null;
        try {
            int studentID = student.getStudentId();
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Student student1 = (Student) session.get(Student.class, studentID);
            student1.setBatch(student.getBatch());
            student1.setPassword(student.getPassword());
            student1.setStudentName(student.getStudentName());

            session.update(student1);

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

    public Student findStudent(int StudentID) {
        Session session = null;
        Transaction trans = null;
        Student Student = new Student();
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Student = (Student) session.get(Student.class, StudentID);

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
        return Student;
    }

    public List<Student> findStudent(Batch batch) {
        List<Student> lst = new ArrayList<>();
        Session session = null;
        Transaction trans = null;
        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            lst = (List<Student>) session.createCriteria(Student.class).add(Restrictions.eq("batch", batch));

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

    public List<Student> getStudentList(StudentFinder finder, int page, int recordPerPage) {
        List<Student> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Student.class);
            
            crit.add(Restrictions.sqlRestriction("1=1"));
            if (finder.getStudentId() != null) {
                crit.add(Restrictions.and(Restrictions.eq("studentId", finder.getStudentId())));
            }
            if (finder.getStudentName() != null) {
                crit.add(Restrictions.and(Restrictions.ilike("studentName", "%" + finder.getStudentName() + "%")));
            }
            if (finder.getBatch() != null) {
                crit.createAlias("batch", "a");
                Integer i=myUtils.tryParseInt(finder.getBatch());
                Criterion rest = Restrictions.or(Restrictions.eq("a.batchId", i), Restrictions.eq("a.batchName", finder.getBatch()));
                crit.add(Restrictions.and(rest));
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

    public int getNumberStudent(StudentFinder finder) {
        List<Student> lst = new ArrayList<>();

        Session session = null;
        Transaction trans = null;

        try {
            session = HibernateUtil.getSessionFactory().getCurrentSession();
            trans = session.beginTransaction();

            Criteria crit = session.createCriteria(Student.class);
            
            crit.add(Restrictions.sqlRestriction("1=1"));
            if (finder.getStudentId() != null) {
                crit.add(Restrictions.and(Restrictions.eq("studentId", finder.getStudentId())));
            }
            if (finder.getStudentName() != null) {
                crit.add(Restrictions.and(Restrictions.ilike("studentName", "%" + finder.getStudentName() + "%")));
            }
            if (finder.getBatch() != null) {
                crit.createAlias("batch", "a");
                Integer i=myUtils.tryParseInt(finder.getBatch());
                Criterion rest = Restrictions.or(Restrictions.eq("a.batchId", i), Restrictions.ilike("a.batchName", "%"+finder.getBatch()+"%"));
                crit.add(Restrictions.and(rest));
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
