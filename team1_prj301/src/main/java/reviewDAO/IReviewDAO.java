package reviewDAO;
import java.util.List;
import model.Reviews;

public interface IReviewDAO {

      void addReview(Reviews review);

      void updateReview(Reviews review);

      void deleteReview(int reviewID);

      Reviews getReviewById(int reviewID);

      List<Reviews> getAllReviews();

      List<Reviews> getReviewsByProductId(int productId);
}
