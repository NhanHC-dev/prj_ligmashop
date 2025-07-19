/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".home-product-item").forEach(function (item) {
        item.addEventListener("click", function (event) {
            event.preventDefault();

            let confirmDelete = confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?");
            if (confirmDelete) {
                let productName = this.querySelector(".home-product-item__name").innerText; // Lấy tên sản phẩm
                let productId = this.getAttribute("data-id"); // Giả sử có thuộc tính data-id chứa ID sản phẩm
                
                // Gửi request DELETE đến Servlet
                fetch(`/delete-product?id=${productId}`, {
                    method: "DELETE"
                })
                .then(response => response.json()) // Chờ phản hồi từ server
                .then(data => {
                    if (data.success) {
                        this.remove(); // Xóa trên giao diện nếu xóa thành công trên server
                        alert("Xóa sản phẩm thành công!");
                    } else {
                        alert("Xóa thất bại: " + data.message);
                    }
                })
                .catch(error => {
                    console.error("Lỗi khi xóa sản phẩm:", error);
                    alert("Có lỗi xảy ra khi xóa sản phẩm!");
                });
            }
        });
    });
});

