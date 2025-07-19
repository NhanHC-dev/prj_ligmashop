<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Chatbot LigmaBallsOfficial</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/chat.css"> 
    <script src="${pageContext.request.contextPath}/resource/js/chatbox.js" defer></script>
</head>
<body>
    <h1>LigmaBallsOfficial - Cửa hàng áo quần</h1>
    
    <div id="chat-toggle">💬</div>
<div id="chatbox" class="minimized">
    <div id="messages">
        <div class="message bot-message">Chào bạn! Hỏi mình về sản phẩm nhé!</div>
    </div>
    <div id="input-container">
        <input id="input" type="text" placeholder="Nhập câu hỏi..." onkeydown="if(event.key === 'Enter') sendMessage()">
        <button id="sendButton" onclick="sendMessage()">Gửi</button>
    </div>
</div>

</body>
</html>
