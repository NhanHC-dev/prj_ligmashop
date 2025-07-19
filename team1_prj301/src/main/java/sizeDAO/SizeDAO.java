package sizeDAO;

import dao.DBConnection;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.util.List;
import model.Sizes;

public class SizeDAO implements ISizeDAO {

      private EntityManager em;

      public SizeDAO() {
            em = DBConnection.getEntityManager();
      }

      @Override
      public List<Sizes> getAllSizes() {
            return em.createNamedQuery("Sizes.findAll", Sizes.class)
                    .getResultList();
      }

      @Override
      public Sizes getSizeById(int sizeID) {
            return em.find(Sizes.class, sizeID);
      }

      @Override
      public void addSize(Sizes size) {
            EntityTransaction transaction = em.getTransaction();
            try {
                  transaction.begin();
                  em.persist(size);
                  transaction.commit();
            } catch (Exception e) {
                  if (transaction.isActive()) {
                        transaction.rollback();
                  }
                  throw new RuntimeException("Failed to add size: " + e.getMessage(), e);
            }
      }

      @Override
      public void updateSize(Sizes size) {
            EntityTransaction transaction = em.getTransaction();
            try {
                  transaction.begin();
                  em.merge(size);
                  transaction.commit();
            } catch (Exception e) {
                  if (transaction.isActive()) {
                        transaction.rollback();
                  }
                  throw new RuntimeException("Failed to update size: " + e.getMessage(), e);
            }
      }

      @Override
      public void deleteSize(int sizeID) {
            EntityTransaction transaction = em.getTransaction();
            try {
                  transaction.begin();
                  Sizes size = em.find(Sizes.class, sizeID);
                  if (size != null) {
                        em.remove(size);
                  }
                  transaction.commit();
            } catch (Exception e) {
                  if (transaction.isActive()) {
                        transaction.rollback();
                  }
                  throw new RuntimeException("Failed to delete size: " + e.getMessage(), e);
            }
      }
}
