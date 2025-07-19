package reviewDAO;

import dao.DBConnection;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import model.Reviews;

public class ReviewDAO implements IReviewDAO {

      @PersistenceContext
      private EntityManager em;

      public ReviewDAO() {
            em = DBConnection.getEntityManager();
      }

      @Override
      public void addReview(Reviews review) {
            try {
                  em.getTransaction().begin();
                  em.persist(review);
                  em.getTransaction().commit();
            } catch (Exception e) {
                  em.getTransaction().rollback();
                  e.printStackTrace();
            }
      }

      @Override
      public void updateReview(Reviews review) {
            try {
                  em.getTransaction().begin(); // Bắt đầu transaction
                  em.merge(review);
                  em.getTransaction().commit(); // Lưu thay đổi vào DB
            } catch (Exception e) {
                  em.getTransaction().rollback(); // Nếu lỗi, rollback lại
                  e.printStackTrace();
            }
      }

      @Override
      public void deleteReview(int reviewID) {
            try {
                  em.getTransaction().begin(); // Bắt đầu transaction
                  Reviews review = em.find(Reviews.class, reviewID);
                  if (review != null) {
                        em.remove(review);
                  }
                  em.getTransaction().commit(); // Lưu thay đổi vào DB
            } catch (Exception e) {
                  em.getTransaction().rollback(); // Nếu lỗi, rollback lại
                  e.printStackTrace();
            }
      }

      @Override
      public Reviews getReviewById(int reviewID) {
            return em.find(Reviews.class, reviewID);
      }

      @Override
      public List<Reviews> getAllReviews() {
            TypedQuery<Reviews> query = em.createNamedQuery("Reviews.findAll", Reviews.class);
            return query.getResultList();
      }

      @Override
      public List<Reviews> getReviewsByProductId(int productID) {
            List<Reviews> reviews = null;
            try {
                  reviews = em.createQuery("SELECT r FROM Reviews r WHERE r.productID.productID = :productID", Reviews.class)
                          .setParameter("productID", productID)
                          .getResultList();
                  System.out.println("Reviews found: " + reviews.size()); // Debug
            } catch (Exception e) {
                  e.printStackTrace();
            }
            return reviews;
      }
}
