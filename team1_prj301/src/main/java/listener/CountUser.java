package listener;

import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

public class CountUser implements HttpSessionAttributeListener {
    public static int activeUsers = 0;

    public static int getActiveUsers() {
        return activeUsers;
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        if ("user".equals(event.getName()) || "admin".equals(event.getName())) {
            activeUsers++;
            System.out.println("User logged in. Active users: " + activeUsers);
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
        if ("user".equals(event.getName()) || "admin".equals(event.getName())) {
            if (activeUsers > 0) {
                activeUsers--;
            }
            System.out.println("User logged out. Active users: " + activeUsers);
        }
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent se) {
        
    }
}