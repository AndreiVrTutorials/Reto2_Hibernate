package com.gf.sede.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.gf.sede.entities.Registros;

public class RegistrosDAO {

    public void guardarRegistro(Registros registro) {
        Session session = new org.hibernate.cfg.Configuration().configure().buildSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(registro);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public Registros buscarPorNumeroRegistro(String numeroRegistro) {
        Session session = new org.hibernate.cfg.Configuration().configure().buildSessionFactory().openSession();
        Registros registro = null;
        try {
            registro = session.get(Registros.class, numeroRegistro);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return registro;
    }
}