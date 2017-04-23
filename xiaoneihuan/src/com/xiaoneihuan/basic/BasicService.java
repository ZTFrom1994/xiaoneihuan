package com.xiaoneihuan.basic;

import java.io.Serializable;
import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public abstract class BasicService implements BasicServiceInter {
	private  List  list=null; 
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	public int add(Object obj) {
		 return (Integer)this.sessionFactory.getCurrentSession().save(obj);
	}
	
	public List executeQuery(String hql, Object[] parameters) {
		Query query=this.sessionFactory.getCurrentSession().createQuery(hql);
		if(parameters!=null && parameters.length>0){
			for(int i=0;i<parameters.length;i++){
				query.setParameter(i, parameters[i]);
			} 
		}
		return query.list();
	}
	
	public List executeQueryByPage(String hql, Object[] parameters,
			int pageNow, int pageSize) {
		Query query=this.sessionFactory.getCurrentSession().createQuery(hql);
		if(parameters!=null && parameters.length>0){
			for(int i=0;i<parameters.length;i++){
				query.setParameter(i, parameters[i]);
			}
		}
		return query.setFirstResult((pageNow-1)*pageSize).setMaxResults(pageSize).list();
	}
	
	public List executeUpdate(String hql, Object[] parameters) {
		return null;
	}

	public Object findById(Class clazz, Serializable id) {
		return this.sessionFactory.getCurrentSession().get(clazz, id);
	}

	public Object uniqueQuery(String sql, Object[] parameters) {
		Query query=this.sessionFactory.getCurrentSession().createSQLQuery(sql);
		if(parameters!=null && parameters.length>0){
			for(int i=0;i<parameters.length;i++){
				query.setParameter(i, parameters[i]);
			}
		}
		return query.uniqueResult();
	}
	
	public int queryPageCount(String hql, Object[] parameters, int pageSize) {
		hql = "from Goods";
		Query query = this.sessionFactory.getCurrentSession().createQuery(hql);
		return query.list().size()/pageSize+1;
	}
	
	public void delById(Class clazz,Serializable id) {
		Session session=this.sessionFactory.getCurrentSession();
		session.delete(this.findById(clazz, id));
	}
	
	public void update(Object object) {
		this.sessionFactory.getCurrentSession().update(object);
	}

}
