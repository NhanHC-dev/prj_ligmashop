
package sizeDAO;

import java.util.List;
import model.Sizes;

public interface ISizeDAO {

    List<Sizes> getAllSizes();

    Sizes getSizeById(int sizeID);

    void addSize(Sizes size);

    void updateSize(Sizes size);

    void deleteSize(int sizeID);
}
