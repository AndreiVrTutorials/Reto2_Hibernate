package com.gf.sede.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.gf.sede.entities.Entidades;

public class EntidadesDAO {
	public List<Entidades> obtenerTodasEntidades(){
		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		
		Session session = sessionFactory.openSession();
		List<Entidades> lista = null;
		
		try {
			session.beginTransaction();
			
			Query<Entidades> consulta = session.createQuery("from Entidades", Entidades.class);
			lista = consulta.getResultList();
			session.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			if(session.getTransaction() != null) {
				session.getTransaction().rollback();
			}
		}finally {
			sessionFactory.close();
		}
		return lista;
	}
}
