//package controller;
//
//import chatbotDAO.ChatbotDAO;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.*;
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.util.stream.Collectors;
//import org.json.JSONArray;
//import org.json.JSONObject;
//
//@WebServlet(name = "ChatServlet", urlPatterns = {"/ChatServlet"})
//public class ChatServlet extends HttpServlet {
//    private static final String XAI_API_KEY = "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";
//    private static final String API_URL = "https://openrouter.ai/api/v1/chat/completions";
//    private final ChatbotDAO chatbotDAO = new ChatbotDAO();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.sendRedirect("/LigmaBallsOfficial/ligmaShop/chat/chatbox.jsp");
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("text/plain; charset=UTF-8");
//        response.setCharacterEncoding("UTF-8");
//
//        PrintWriter out = response.getWriter();
//        String message = request.getParameter("message");
//
//        if (message == null || message.trim().isEmpty()) {
//            out.print("Vui lòng nhập tin nhắn!");
//            return;
//        }
//        message = message.trim();
//
//        String reply;
//        String productName = extractProductName(message);
//        String size = extractSize(message);
//        String color = extractColor(message);
//        String dbData = "";
//
//        if (message.equalsIgnoreCase("hello") || message.equalsIgnoreCase("chào shop") || 
//            message.equalsIgnoreCase("shop ơi") || message.equalsIgnoreCase("shop") || message.contains("cho mình hỏi")) {
//            reply = "Chào bạn! Rất vui được trò chuyện với bạn. Mình là chatbot của Ligma Shop, sẵn sàng giúp bạn với các câu hỏi về sản phẩm. Bạn khỏe không? Có gì thú vị đang xảy ra không?";
//            out.print(reply);
//            return;
//        } 
//	else if (message.contains("cảm ơn shop") || message.contains("thanks")) {
//            reply = "Không có gì đâu bạn! Ligma Shop luôn sẵn lòng hỗ trợ bạn. Bạn cần giúp gì thêm không?";
//            out.print(reply);
//            return;
//        } 
//	else if (message.contains("người yêu") || message.contains("da den") || message.contains("Travis Scott") || message.contains("FE!N")) {
//            reply = """
//                    [Intro: Travis Scott & Sheck Wes]
//                    Just come outside for the night (Yeah)
//                    Take your time, get your light (Yeah)
//                    Johnny Dang, yeah, yeah
//                    I been out geekin' (Bitch)
//                    
//                    [Chorus: Travis Scott]
//                    FE!N, FE!N, FE!N, FE!N, FE!N (Yeah)
//                    FE!N, FE!N, FE!N, FE!N, FE!N (Yeah)
//                    FE!N, FE!N, FE!N, FE!N, FE!N
//                    FE!N, FE!N (Yeah), FE!N, FE!N, FE!N
//                    
//                    [Verse 1: Travis Scott & Sheck Wes]
//                    The career's more at stake when you in your prime (At stake)
//                    Fuck that paper, baby, my face on the dotted line (Dot, yeah)
//                    I been flyin' out of town for some peace of mind (Yeah, yeah, bitch)
//                    It's like always they just want a piece of mine (Ah)
//                    I been focused on the future, never on right now (Ah)
//                    What I'm sippin' not kombucha, either pink or brown (It's lit)
//                    I'm the one that introduced you to the you right now (Mm, let's go)
//                    Oh my God, that bitch bitin' (That bitch bitin')
//                    Well, alright (Alright), tryna vibe (I'm tryna vibe this)
//                    In the night, come alive
//                    Ain't asleep, ain't a—, ain't a—, ain't-ain't
//                    
//                    [Chorus: Travis Scott]
//                    FE!N, FE!N, FE!N, FE!N, FE!N
//                    FE!N, FE!N, FE!N, FE!N, FE!N
//                    FE!N, FE!N, FE!N, FE!N, FE!N
//                    FE!N, FE!N, FE!N, FE!N
//                    FE!N, FE!N, FE!N, FE!N, FE!N
//                    
//                    [Bridge: Playboi Carti]
//                    Schyeah, woah, what?
//                    What?
//                    (Homixide, Homixide, Homixide, Homixide)
//                    What? (Yeah)
//                    Woah, woah (Yeah, yeah)
//                    (Homixide, Homixide, Homixide, Homixide)
//                    Hit, yeah, hold up (Yeah)
//                    
//                    [Verse 2: Playboi Carti]
//                    Yeah, I just been poppin' my shit and gettin' it live, hold up (Shit)
//                    Yeah, you try to come wrong 'bout this shit, we poppin' your tires, hold up (Shit)
//                    Uh, hundred-round (Woah), feelin' like I'm on ten
//                    Playin' both sides with these hoes (Hold up), shawty, I'm fuckin' your friend (Hold up)
//                    I've been goin' crazy, shawty, I've been in the deep end
//                    She not innocent, uh, she just tryna go
//                    
//                    [Chorus: Travis Scott & Playboi Carti]
//                    FE!N (Talkin' 'bout), FE!N, FE!N (Schyeah), FE!N, FE!N (Schyeah, oh, oh, what? Schyeah)
//                    FE!N, FE!N (Schyeah), FE!N, FE!N, FE!N (Oh, oh)
//                    FE!N, FE!N (Talkin' 'bout), FE!N, FE!N, FE!N, FE!N (Talkin' 'bout, let's go)
//                    
//                    [Verse 3: Playboi Carti & Travis Scott]
//                    I just been icin' my hoes, I just been drippin' my hoes (Drippin' my hoes)
//                    This is a whole 'nother level, shawty (Oh), I got these hoes on they toes (Hoes on they toes)
//                    I put the bitch on the road, she tryna fuck on the O, hold up, hold up
//                    I got this ho with me, she tryna show me somethin', hold up, hold up (Oh)
//                    I got flows for days, these niggas ain't on nothin', hold up, yeah (Oh)
//                    Me and my boy locked in, you know we on one, hold up, uh (Slatt, slatt)
//                    We in the spot goin' crazy until the sun up
//                    You worried about that ho, that ho done chose up (Slatt, bitch-ass)
//                    Uh, pistols all in the kitchen, can't give the zip code up, hold up, yeah, slatt (Wow)
//                    FE!N, FE!N, FE!N (Huh? Huh? Huh? Huh? Yeah)
//                    Why the fuck these niggas actin' like they know us?
//                    00CACTUS, yeah, we towed up (Skrrt, skrrt), uh, yeah
//                    Switch out the bag, these niggas get rolled up, hold up (It's lit), slatt
//                    Everything hit, hold up, everything Homixide, Homixide (Homixide, Homixide, Homixide, Homixide)
//                    [Outro: Travis Scott & Playboi Carti]
//                    FE!N, FE!N, FE!N, FE!N, FE!N, FE!N (Homixide, Homixide, Homixide, Homixide, Homixide, Homixide, Homixide)
//                    """;
//            out.print(reply);
//            return;
//        } 
//	else if (message.contains("Kendrick Lamar") || message.contains("Say Drake") || message.contains("OVHO") || message.contains("A Minor")) {
//            reply = """
//                    Ayy, Mustard on the beat, ho
//                    Deebo any rap nigga, he a free throw
//                    Man down, call an amberlamps, tell him, "Breathe, bro"
//                    Nail a nigga to the cross, he walk around like Teezo
//                    What's up with these jabroni-ass niggas tryna see Compton?
//                    The industry can hate me, fuck 'em all and they mama
//                    How many opps you really got? I mean, it's too many options
//                    I'm finna pass on this body, I'm John Stockton
//                    Beat your ass and hide the Bible if God watchin'
//                    Sometimes you gotta pop out and show niggas
//                    Certified boogeyman, I'm the one that up the score with 'em
//                    Walk him down, whole time, I know he got some ho in him
//                    Pole on him, extort shit, bully Death Row on him
//                    Say, Drake, I hear you like 'em young
//                    You better not ever go to cell block one
//                    To any bitch that talk to him and they in love
//                    Just make sure you hide your lil' sister from him
//                    They tell me Chubbs the only one that get your hand-me-downs
//                    And Party at the party playin' with his nose now
//                    And Baka got a weird case, why is he around?
//                    Certified Lover Boy? Certified pedophiles
//                    Wop, wop, wop, wop, wop, Dot, fuck 'em up
//                    Wop, wop, wop, wop, wop, I'ma do my stuff
//                    Why you trollin' like a bitch? Ain't you tired?
//                    Tryna strike a chord and it's probably A minor
//                    
//                    They not like us, they not like us, they not like us
//                    They not like us, they not like us, they not like us
//                    """;
//            out.print(reply);
//            return;
//        } 
//	else if (message.contains("schyeah") || message.contains("Carti")) {
//            reply = """
//                    SCHYEAH
//                    IT'S CARTI WORLD
//                    """;
//            out.print(reply);
//            return;
//        }
//        if (message.contains("giá") || message.contains("bao nhiêu")) {
//            dbData = chatbotDAO.getPrice(productName);
//        } 
//	else if (message.contains("kích cỡ") || message.contains("size")) {
//            dbData = chatbotDAO.getSizes(productName);
//        } 
//	else if (message.contains("màu") || message.contains("color")) {
//            dbData = chatbotDAO.getColors(productName);
//        } 
//	else if (message.contains("có") && message.contains("không")) {
//            dbData = chatbotDAO.checkAvailabilityWithSizeAndColor(productName, size, color);
//        } 
//	else if (message.contains("giảm") || message.contains("discount")) {
//            dbData = chatbotDAO.getDiscount(productName);
//        } 
//	else if (message.contains("đánh giá") || message.contains("rating")) {
//            dbData = chatbotDAO.getRating(productName);
//        } 
//	else if (message.contains("tất cả sản phẩm")) {
//            dbData = chatbotDAO.getAllProducts();
//        } 
//	else if (message.contains("danh mục") || message.contains("category") || message.contains("loại")) {
//            String categoryName = extractCategoryName(message);
//            dbData = chatbotDAO.getProductsByCategory(categoryName);
//        } 
//	else if (message.contains("áo") && message.contains("nam")) {
//            dbData = chatbotDAO.getProductsByCategory("Áo Nam");
//        } 
//	else if (message.contains("quần") && message.contains("nữ")) {
//            dbData = chatbotDAO.getProductsByCategory("Quần Nữ");
//        } 
//	else if (message.contains("áo") && message.contains("nữ")) {
//            dbData = chatbotDAO.getProductsByCategory("Áo Nữ");
//        } 
//	else if (message.contains("quần") && message.contains("nam")) {
//            dbData = chatbotDAO.getProductsByCategory("Quần Nam");
//        } 
//	else if ((message.contains("áo quần") || message.contains("quần áo")) && message.contains("nam")) {
//            dbData = chatbotDAO.getProductsByCategory("Quần áo Nam");
//        } 
//	else if ((message.contains("áo quần") || message.contains("quần áo")) && message.contains("nữ")) {
//            dbData = chatbotDAO.getProductsByCategory("Quần áo Nữ");
//        } 
//	else if (message.contains("áo khoác")) {
//            dbData = chatbotDAO.getProductsByCategory("Áo khoác");
//        } 
//	else if (message.contains("đầm")) {
//            dbData = chatbotDAO.getProductsByCategory("Đầm");
//        } 
//	else if (message.contains("đồ thể thao")) {
//            dbData = chatbotDAO.getProductsByCategory("Đồ thể thao");
//        } 
//	else if (message.contains("thời trang mùa đông") || message.contains("đông") || message.contains("mùa đông") || message.contains("lạnh")) {
//            dbData = chatbotDAO.getProductsByCategory("Thời trang mùa đông");
//        } 
//	else if (message.contains("thời trang mùa hè") || message.contains("mùa hè") || message.contains("hè") || message.contains("nóng")) {
//            dbData = chatbotDAO.getProductsByCategory("Thời trang mùa hè");
//        } 
//        else {
//            dbData = "";
//        }
//
//        if (!dbData.isEmpty()) {
//            reply = callGrokWithDB(message, dbData);
//        } 
//        else {
//            reply = "Mình chưa hiểu câu hỏi của bạn lắm, bạn có thể hỏi về sản phẩm không?";
//        }
//
//        out.print(reply);
//    }
//
//    private String callGrokWithDB(String message, String dbData) {
//        try {
//            URL url = new URL(API_URL);
//            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//            conn.setRequestMethod("POST");
//            conn.setRequestProperty("Content-Type", "application/json");
//            conn.setRequestProperty("Authorization", "Bearer " + XAI_API_KEY);
//            conn.setDoOutput(true);
//
//            String systemContent = "Bạn là chatbot hỗ trợ mua sắm của Ligma Shop. Chỉ trả lời dựa trên dữ liệu từ database được cung cấp dưới đây. Nếu dữ liệu cho biết không tìm thấy sản phẩm, chỉ trả lại thông điệp đó và không gợi ý thêm bất kỳ sản phẩm nào khác. Không tự ý trả lời các câu hỏi ngoài phạm vi sản phẩm, tài khoản, giao hàng, hoặc hỗ trợ khách hàng. Giữ định dạng danh sách sản phẩm với dấu gạch ngang (-) và xuống dòng cho mỗi mục:\n" + escapeJson(dbData);
//            String jsonInput = "{\"model\": \"deepseek/deepseek-chat:free\", \"messages\": [" +
//                    "{\"role\": \"system\", \"content\": \"" + escapeJson(systemContent) + "\"}," +
//                    "{\"role\": \"user\", \"content\": \"" + escapeJson(message) + "\"}" +
//                    "]}";
//
//            System.out.println("jsonInput gửi đi: " + jsonInput);
//
//            try (OutputStream os = conn.getOutputStream()) {
//                os.write(jsonInput.getBytes("UTF-8"));
//                os.flush();
//            }
//
//            int responseCode = conn.getResponseCode();
//            System.out.println("Mã phản hồi: " + responseCode);
//            if (responseCode == HttpURLConnection.HTTP_OK) {
//                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//                String response = br.lines().collect(Collectors.joining());
//                conn.disconnect();
//
//                JSONObject json = new JSONObject(response);
//                JSONArray choices = json.getJSONArray("choices");
//                if (choices.length() > 0) {
//                    JSONObject choice = choices.getJSONObject(0);
//                    JSONObject messageObj = choice.getJSONObject("message");
//                    return messageObj.getString("content");
//                }
//                return "Không nhận được phản hồi từ API.";
//            } else {
//                return "Lỗi API: Mã phản hồi " + responseCode;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "Lỗi: " + e.getMessage();
//        }
//    }
//
//    private String escapeJson(String input) {
//        if (input == null) return "";
//        return input.replace("\\", "\\\\")
//                    .replace("\"", "\\\"")
//                    .replace("\n", "\\n")
//                    .replace("\r", "\\r")
//                    .replace("\t", "\\t");
//    }
//
//    // Extract methods remain unchanged
//    private String extractProductName(String message) {
//        String[] keywords = {"giá", "bao nhiêu", "kích cỡ", "size", "màu", "color", "có", "không",
//            "giảm", "discount", "đánh giá", "rating", "thế nào", "những nào", "gì",
//            "sản phẩm", "những", "\\?", "nào", "và", "là", "danh mục", "category",
//            "trong", "loại", "bán", "như thế nào", "muốn", "mua"};
//        String productName = message;
//
//        for (String keyword : keywords) {
//            productName = productName.replaceAll(keyword, "").trim();
//        }
//
//        String size = extractSize(message);
//        String color = extractColor(message);
//        if (size != null) {
//            productName = productName.replaceAll("(?i)" + size, "").trim();
//        }
//        if (color != null) {
//            productName = productName.replaceAll("(?i)" + color, "").trim();
//        }
//
//        return productName;
//    }
//
//    private String extractSize(String message) {
//        String[] sizeKeywords = {"size", "kích cỡ", "kich co"};
//        String[] sizes = {"xxl", "xl", "l", "XXL", "XL", "L"};
//        for (String keyword : sizeKeywords) {
//            if (message.contains(keyword)) {
//                for (String size : sizes) {
//                    if (message.contains(size)) {
//                        return size.toUpperCase();
//                    }
//                }
//            }
//        }
//        for (String size : sizes) {
//            if (message.contains(size)) {
//                return size.toUpperCase();
//            }
//        }
//        return null;
//    }
//
//    private String extractColor(String message) {
//        String[] colorKeywords = {"màu", "mau", "color"};
//        String[] colors = {"đen", "trắng", "xanh", "den", "trang", "blue", "Đen", "Trắng", "Blue"};
//        for (String keyword : colorKeywords) {
//            if (message.contains(keyword)) {
//                for (String color : colors) {
//                    if (message.contains(color)) {
//                        return switch (color.toLowerCase()) {
//                            case "den" -> "đen";
//                            case "trang" -> "trắng";
//                            case "blue" -> "xanh";
//                            default -> color;
//                        };
//                    }
//                }
//            }
//        }
//        for (String color : colors) {
//            if (message.contains(color)) {
//                return switch (color.toLowerCase()) {
//                    case "den" -> "đen";
//                    case "trang" -> "trắng";
//                    case "blue" -> "xanh";
//                    default -> color;
//                };
//            }
//        }
//        return null;
//    }
//
//    private String extractCategoryName(String message) {
//        String[] keywords = {"danh mục", "category", "trong", "có", "gì", "nào", "\\?", "của", "các", "loại", "mà", "shop", "bán"};
//        String categoryName = message;
//        for (String keyword : keywords) {
//            categoryName = categoryName.replaceAll(keyword, "").trim();
//        }
//        return categoryName;
//    }
//}