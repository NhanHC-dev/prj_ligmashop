


 document.addEventListener("DOMContentLoaded", function () {
    const productItems = document.querySelectorAll(".home-product-item");

    productItems.forEach((item) => {
        item.addEventListener("click", function (event) {
            event.preventDefault();

            // Ẩn tất cả các nút trước khi hiển thị nút của sản phẩm mới
            document.querySelectorAll(".home-product-item__buttons").forEach(button => {
                button.classList.remove("show");
            });

            // Hiện nút của sản phẩm được click
            const buttons = this.querySelector(".home-product-item__buttons");
            if (buttons) {
                buttons.classList.add("show");
            }
        });
    });

    // Khi bấm ra ngoài sản phẩm thì ẩn tất cả các nút
    document.addEventListener("click", function (event) {
        if (!event.target.closest(".home-product-item")) {
            document.querySelectorAll(".home-product-item__buttons").forEach(button => {
                button.classList.remove("show");
            });
        }
    });
});
