package com.sda.javagda34.webappdemo.database;

import com.sda.javagda34.webappdemo.model.Student;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class EntityDao<T> {
    public void saveOrUpdate(T entity){
        Transaction transaction;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();

            session.saveOrUpdate(entity);

            transaction.commit();
        }catch (HibernateException he){
            he.printStackTrace();
        }
    }

    public List<T> findAll(Class<T> tClass){
        List<T> list = new ArrayList<>();
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            // Narzędzie do kreowania zapytania, do tworzenia query i budowania klauzuli 'where'
            CriteriaBuilder cb = session.getCriteriaBuilder();

            // Obiekt reprezentujący zapytanie o <typ generyczny>
            CriteriaQuery<T> criteriaQuery = cb.createQuery(tClass);

            // reprezentuje tabelę 'Student' i tworzymy tą instancję żeby powiedzieć
            // "do jakiej tabeli chcemy wykonać zapytanie"
            Root<T> rootTable = criteriaQuery.from(tClass);

            // wykonanie select'a z tabeli
            criteriaQuery.select(rootTable);

            // wywołujemy zapytanie, wyniki zbieramy do listy
            list.addAll(session.createQuery(criteriaQuery).list());
        }catch (HibernateException he){
            he.printStackTrace();
        }
        return list;
    }

    public void delete(T entity){
        Transaction transaction;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();

            session.delete(entity);

            transaction.commit();
        }catch (HibernateException he){
            he.printStackTrace();
        }
    }

    public Optional<T> findById(Long id, Class<T> tClass){
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            // Narzędzie do kreowania zapytania, do tworzenia query i budowania klauzuli 'where'
            CriteriaBuilder cb = session.getCriteriaBuilder();

            // Obiekt reprezentujący zapytanie o <typ generyczny>
            CriteriaQuery<T> criteriaQuery = cb.createQuery(tClass);

            // reprezentuje tabelę 'Student' i tworzymy tą instancję żeby powiedzieć
            // "do jakiej tabeli chcemy wykonać zapytanie"
            Root<T> rootTable = criteriaQuery.from(tClass);

            // wykonanie select'a z tabeli
            criteriaQuery
                    .select(rootTable)
                    .where(
                            cb.equal(
                                    rootTable.get("id"),
                                    id
                            )
                    );

            // wywołujemy zapytanie, wyniki zbieramy do listy
            T entity = session.createQuery(criteriaQuery).getSingleResult();
            return Optional.ofNullable(entity);
        }catch (HibernateException he) {
            he.printStackTrace();
        }
        return Optional.empty();
    }
}
