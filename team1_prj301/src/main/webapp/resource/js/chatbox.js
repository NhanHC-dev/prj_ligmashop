    document.addEventListener("DOMContentLoaded", function () {
    let chatbox = document.getElementById("chatbox");
    let chatToggle = document.getElementById("chat-toggle");
    let inputField = document.getElementById("input");
    let messages = document.getElementById("messages");

    // Xử lý thu nhỏ/mở rộng khung chat
    chatToggle.addEventListener("click", function (event) {
        event.stopPropagation();
        chatbox.classList.toggle("minimized");
    });

    chatbox.addEventListener("click", function (event) {
        event.stopPropagation(); // Ngăn sự kiện lan ra ngoài
    });

    document.addEventListener("click", function () {
        chatbox.classList.add("minimized");
    });

    // Hàm gửi tin nhắn
    window.sendMessage = function () {
        let input = inputField.value.trim();
        if (input === "") return;

        // Hiển thị tin nhắn của người dùng
        let userMessage = document.createElement("div");
        userMessage.className = "message user-message";
        userMessage.textContent = input;
        messages.appendChild(userMessage);

        // Gửi tin nhắn tới server
        fetch("/LigmaBallsOfficial/ChatServlet", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8" },
            body: "message=" + encodeURIComponent(input)
        })
        .then(response => response.text())
        .then(data => {
            let botMessage = document.createElement("div");
            botMessage.className = "message bot-message";
            botMessage.textContent = data || "Chatbot chưa có phản hồi!";
            messages.appendChild(botMessage);

            // Cuộn xuống tin nhắn mới nhất
            messages.scrollTop = messages.scrollHeight;
        })
        .catch(error => {
            let errorMessage = document.createElement("div");
            errorMessage.className = "message bot-message";
            errorMessage.textContent = "Lỗi: " + error.message;
            messages.appendChild(errorMessage);
        });

        // Xóa input sau khi gửi
        inputField.value = "";
    };
});
