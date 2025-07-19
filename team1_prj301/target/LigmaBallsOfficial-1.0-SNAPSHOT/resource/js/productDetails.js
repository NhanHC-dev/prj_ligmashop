//thay đổi hình ảnh
function changeImage(element) {
    let mainImage = document.getElementById('mainImage');
    mainImage.src = element.src;
    mainImage.style.width = "400px"; // Đảm bảo kích thước không thay đổi
    mainImage.style.height = "300px";
}
document.addEventListener("DOMContentLoaded", function () {
    // Xử lý thay đổi ảnh
    const thumbnails = document.querySelectorAll(".thumbnail");
    const mainImage = document.getElementById("mainImage");

    if (thumbnails.length > 0 && mainImage) {
        thumbnails.forEach((thumbnail) => {
            thumbnail.addEventListener("click", function () {
                mainImage.src = this.src;
            });
        });
    }

    // Xử lý tăng/giảm số lượng
//                const quantityBox = document.querySelector(".quantity-box");
//                if (quantityBox) {
//                    const decreaseBtn = quantityBox.querySelector(".decrease");
//                    const increaseBtn = quantityBox.querySelector(".increase");
//                    const quantityInput = quantityBox.querySelector("input");
//
//                    function updateQuantity(change) {
//                        let value = parseInt(quantityInput.value) || 1;
//                        quantityInput.value = Math.max(1, value + change);
//                    }
//
//                    decreaseBtn.addEventListener("click", function () {
//                        updateQuantity(-1);
//                    });
//
//                    increaseBtn.addEventListener("click", function () {
//                        updateQuantity(1);
//                    });
//                }
    const displayQuantity = document.getElementById('displayQuantity');
    const increaseButton = document.querySelector('.increase');
    const decreaseButton = document.querySelector('.decrease');
    const selectedQuantity = document.getElementById('selectedQuantity');
    const selectedPrice = document.getElementById('selectedPrice');
    const selectedDiscountedPrice = document.getElementById('selectedDiscountedPrice');
    const selectedSize = document.getElementById('selectedSize');
    const selectedProductSizeColorID = document.getElementById('selectedProductSizeColorID');
    const displayPrice = document.getElementById('displayPrice');
//    const displayOriginalPrice = document.getElementById('displayOriginalPrice');

    // Lấy discount từ JSP và đảm bảo là số
    let discount = parseFloat('<fmt:formatNumber value="${product.discount}" type="number" groupingUsed="false" />');
    if (isNaN(discount)) {
        discount = 0; // Đặt mặc định là 0 nếu không phải số
    }

    // Lấy giá gốc ban đầu của sản phẩm (product.price) từ phần tử ẩn
    const rawPrice = document.getElementById('formattedPrice').textContent;
    console.log("Raw price from JSP: " + rawPrice); // Log giá trị thô để kiểm tra
    let basePrice = parseFloat(rawPrice);
    if (isNaN(basePrice)) {
        basePrice = 0; // Đặt mặc định là 0 nếu không phải số
        console.log("Warning: product.price is not a valid number. Defaulting to 0.");
        // Ẩn các nút chọn kích thước và hiển thị thông báo lỗi
        document.querySelector('.size-selector').style.display = 'none';
        document.querySelector('.quantity-box').style.display = 'none';
        document.querySelector('.button-container').style.display = 'none';
        return; // Dừng thực thi JavaScript nếu giá không hợp lệ
    }

    // Khởi tạo giá trị ban đầu
    if (displayQuantity && selectedQuantity) {
        displayQuantity.value = selectedQuantity.value || 1;
    }
    if (selectedProductSizeColorID) {
        console.log("Initial productSizeColorID: " + selectedProductSizeColorID.value);
    }
    if (displayPrice && selectedDiscountedPrice) {
        displayPrice.textContent = parseFloat(selectedDiscountedPrice.value) || 0;
    }
//    const originalPriceElement = document.querySelector('.original-price');
//    if (originalPriceElement) {
//        originalPriceElement.style.display = 'inline-block'; // Đảm bảo hiển thị
//    }

    // Cập nhật giá, kích thước và productSizeColorID khi chọn kích thước
    document.querySelectorAll('.size-option').forEach(button => {
        button.addEventListener('click', function () {
            document.querySelectorAll('.size-option').forEach(btn => btn.classList.remove('selected'));
            this.classList.add('selected');

            // Lấy kích thước được chọn
            const selectedSizeValue = this.getAttribute('data-size');

            // Tính giá gốc dựa trên kích thước
            let price = basePrice; // Giá gốc ban đầu (product.price)
            if (selectedSizeValue === 'XL') {
                price += 50000; // Cộng thêm 50,000 cho XL
            } else if (selectedSizeValue === 'XXL') {
                price += 100000; // Cộng thêm 100,000 cho XXL
            }

            // Tính giá sau giảm giá
            const discountedPrice = price - (price * discount / 100);

            // Cập nhật giá hiển thị với định dạng
            const priceElement = document.querySelector('.price');
            const originalPriceElement = document.querySelector('.original-price');
            console.log("Original price element:", originalPriceElement); // Log để kiểm tra
            priceElement.innerHTML = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(discountedPrice) +
                    `<span id="displayPrice" style="display: none;">${discountedPrice}</span>`;

//            if (originalPriceElement) {
//                originalPriceElement.innerHTML = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(price) +
//                        `<span id="displayOriginalPrice" style="display: none;">${price}</span>`;
//                originalPriceElement.style.display = 'inline-block'; // Đảm bảo hiển thị
//            }

            selectedPrice.value = price;
            selectedDiscountedPrice.value = discountedPrice;
            selectedSize.value = this.getAttribute('data-size');
            const productSizeColorID = this.getAttribute('data-product-size-color-id');
            selectedProductSizeColorID.value = productSizeColorID;
            console.log("Selected productSizeColorID: " + productSizeColorID);
            console.log("Selected price: " + price);
            console.log("Selected discounted price: " + discountedPrice);
        });
    });

    // Cập nhật số lượng khi nhấn nút tăng
    if (increaseButton) {
        increaseButton.addEventListener('click', function (event) {
            event.preventDefault();
            let value = parseInt(displayQuantity.value) || 1;
            value += 1;
            displayQuantity.value = value;
            selectedQuantity.value = value;
            console.log("Quantity increased to: " + value);
        });
    }

    // Cập nhật số lượng khi nhấn nút giảm
    if (decreaseButton) {
        decreaseButton.addEventListener('click', function (event) {
            event.preventDefault();
            let value = parseInt(displayQuantity.value) || 1;
            if (value > 1) {
                value -= 1;
                displayQuantity.value = value;
                selectedQuantity.value = value;
                console.log("Quantity decreased to: " + value);
            }
        });
    }
});


//điều hướng ở phần gợi y            
document.addEventListener("DOMContentLoaded", () => {
    let container = document.querySelector(".suggested-products");
    let btnLeft = document.querySelector(".scroll-btn.left");
    let btnRight = document.querySelector(".scroll-btn.right");

    function updateScrollButtons() {
        if (container.scrollLeft <= 0) {
            btnLeft.style.display = "none";
        } else {
            btnLeft.style.display = "block";
        }
        if (container.scrollLeft + container.clientWidth >= container.scrollWidth) {
            btnRight.style.display = "none";
        } else {
            btnRight.style.display = "block";
        }
    }

    btnLeft.addEventListener("click", () => {
        container.scrollBy({left: -250, behavior: "smooth"});
        setTimeout(updateScrollButtons, 300);
    });

    btnRight.addEventListener("click", () => {
        container.scrollBy({left: 250, behavior: "smooth"});
        setTimeout(updateScrollButtons, 300);
    });

    updateScrollButtons();
});

function validateForm(form) {
    const quantity = form.querySelector('input[name="quantity"]').value;
    if (!quantity || quantity.trim() === "" || isNaN(quantity) || parseInt(quantity) < 1) {
        alert("Vui lòng nhập số lượng hợp lệ (tối thiểu 1)!");
        return false;
    }
    return true;
}

//xử lí chọn size
document.addEventListener("DOMContentLoaded", function () {
    const sizeOptions = document.querySelectorAll(".size-option");
    const priceDisplay = document.querySelector(".price span");
    const originalPriceDisplay = document.querySelector(".original-price");

    sizeOptions.forEach(option => {
        option.addEventListener("click", function () {
            // Xóa class 'selected' khỏi tất cả các nút
            sizeOptions.forEach(btn => btn.classList.remove("selected"));

            // Thêm class 'selected' vào nút được chọn
            this.classList.add("selected");

            // Cập nhật giá theo size
            let newPrice = parseFloat(this.getAttribute("data-price"));
            let originalPrice = newPrice * 1.344; // Giá gốc tăng theo tỷ lệ 1.344

            priceDisplay.textContent = `$${newPrice.toFixed(2)}`;
            originalPriceDisplay.textContent = `$${originalPrice.toFixed(2)}`;
        });
    });
});



//hien thi toan bo anh khi nhap chuot
document.addEventListener("DOMContentLoaded", () => {
    const productImage = document.querySelector(".product-image img");
    const overlay = document.querySelector(".image-overlay");
    const fullImage = document.querySelector(".full-image");
    const closeBtn = document.querySelector(".close-btn");

    // Khi nhấp vào ảnh
    productImage.addEventListener("click", () => {
        fullImage.src = productImage.src; // Gán nguồn ảnh đầy đủ
        overlay.style.display = "flex"; // Hiển thị overlay
    });

    // Khi nhấp vào nút đóng hoặc overlay
    closeBtn.addEventListener("click", () => {
        overlay.style.display = "none"; // Ẩn overlay
    });

    overlay.addEventListener("click", (e) => {
        if (e.target === overlay) { // Chỉ ẩn khi nhấp ngoài ảnh
            overlay.style.display = "none";
        }
    });
});
