
const sellerId = sessionStorage.getItem('seller_id'); 
const shopName = sessionStorage.getItem('shop_name'); 
let currentOrderId = null;

//ตรวจสอบว่า login หรือยัง
function checkAuth() {
    if (!sellerId) { 
        alert('You must be logged in to access the dashboard.');
        window.location.href = 'index.html'; 
    }
}

// ปรับฟังก์ชันใน main.js ให้เหลือเฉพาะการอัปเดต Navbar
async function displayShopName() { 
    let shopName = sessionStorage.getItem('shop_name');
    const sellerId = sessionStorage.getItem('seller_id');
    const navShopNameElement = document.getElementById('navShopName');
    // --- เพิ่มบรรทัดนี้เพื่อดึง Element ในหน้า Analytics ---
    const shopNameDisplayElement = document.getElementById('shopNameDisplay'); 

    if ((!shopName || shopName === "null") && sellerId) {
        try {
            const response = await fetch(`${BASE_API_URL}seller/get_profile.php?seller_id=${sellerId}`);
            const result = await response.json();
            if (result.success && result.data.shop_name) {
                shopName = result.data.shop_name;
                sessionStorage.setItem('shop_name', shopName);
            }
        } catch (error) {
            console.error('Error:', error);
        }
    }

    const finalName = shopName && shopName !== "null" ? shopName : "ร้านค้าของฉัน";
    
    // อัปเดตใน Navbar (มีทุกหน้า)
    if (navShopNameElement) {
        navShopNameElement.textContent = finalName;
    }

    // อัปเดตในหน้า Analytics หรือหน้า Dashboard (ถ้ามี ID นี้)
    if (shopNameDisplayElement) {
        shopNameDisplayElement.textContent = finalName;
    }
}

function logout() {
    sessionStorage.removeItem('seller_id');
    sessionStorage.removeItem('shop_name');
    window.location.href = 'index.html';
}

// ฟังก์ชันดึงการแจ้งเตือนจาก Server

async function fetchNotifications() {
    if (!sellerId) return;
    try {
        const response = await fetch(`${BASE_API_URL}seller/get_notifications.php?seller_id=${sellerId}`);
        const result = await response.json();

        if (result.success) {
            // แสดง/ซ่อนตัวเลขแจ้งเตือน
            const countBadge = document.getElementById('notiCount');
            if (countBadge) {
                if (result.unread_count > 0) {
                    countBadge.textContent = result.unread_count;
                    countBadge.style.display = 'block';
                } else {
                    countBadge.style.display = 'none';
                }
            }
            // ส่งข้อมูลไปวาดรายการแจ้งเตือน
            displayNotifications(result.data);
        }
    } catch (error) {
        console.error('Fetch Noti Error:', error);
    }
}

// ฟังก์ชันวาดรายการแจ้งเตือน (ใช้ div เพื่อคุมลำดับการคลิก)
function displayNotifications(data) {
    const notiList = document.getElementById('notiList');
    if (!notiList) return;

    if (data && data.length > 0) {
        notiList.innerHTML = data.map(item => {
            // ดักไว้ก่อนว่าถ้าใน DB ไม่มีลิงก์ ให้เด้งไปหน้า Dashboard เป็นค่าเริ่มต้น
            const destination = item.link ? item.link : 'dashboard.html';

            return `
                <div class="noti-item ${item.is_read == 0 ? 'unread' : ''}" 
                     style="cursor:pointer;"
                     onclick="goToNotification(${item.id}, '${destination}')"> 
                    <strong>${item.title}</strong>
                    <p>${item.message}</p>
                    <small>${item.created_at}</small>
                </div>
            `;
        }).join('');
    } else {
        notiList.innerHTML = '<p class="empty-noti">ไม่มีการแจ้งเตือน</p>';
    }
}

// ฟังก์ชันกดแจ้งเตือน (บันทึกว่าอ่านแล้ว -> เปลี่ยนหน้า)
async function goToNotification(notiId, link) {
    try {
        // 1. สั่งให้เลขแจ้งเตือนบนกระดิ่งหายไปทันทีในหน้า UI
        const countBadge = document.getElementById('notiCount');
        if (countBadge) {
            countBadge.style.display = 'none'; // ซ่อนเลข 1 ทันทีที่กด
        }

        // 2. บอก Server ว่าอ่านแล้ว (ส่ง ID ไปบันทึกลง Database)
        // ใช้ await เพื่อให้มั่นใจว่าระบบบันทึกก่อนเปลี่ยนหน้า
        await fetch(`${BASE_API_URL}seller/mark_read.php?id=${notiId}`);
        
        // 3. เปลี่ยนหน้าไปยังลิงก์ที่แนบมา
        window.location.href = link;
    } catch (error) {
        console.error('Error marking as read:', error);
        window.location.href = link;
    }
}

window.onload = function() {
    checkAuth();         // ตรวจสอบ Login
    displayShopName();   // แสดงชื่อร้าน
    fetchNotifications(); // โหลดแจ้งเตือน
    
    // ตั้งเวลาโหลดแจ้งเตือนใหม่ทุก 1 นาที
    setInterval(fetchNotifications, 60000);

    // --- ตรวจสอบหน้า Analytics ---
    if (document.getElementById('salesTrendChart')) {
        fetchAnalyticsData();
    }

    // เช็คหน้าจัดการสินค้า
    if (document.querySelector('#productListTable tbody')) {
        loadSellerProducts();
    }
    
    // หน้าโปรไฟล์ร้าน
    if (document.getElementById('shopProfileForm')) {
        loadShopProfile();
        setupShopProfileListener();
    }

    // หน้าออเดอร์
    if (document.getElementById('orderList')) {
        loadSellerOrders();
    }

    // ✅ ส่วนที่เพิ่มให้ใหม่: หน้าจองพื้นที่ร้านค้า
    if (document.getElementById('currentStallBox')) {
        loadCurrentStall(); // โหลดล็อกที่จองไว้
        loadStalls();       // โหลดรายการล็อกทั้งหมด
        
        const typeSelect = document.getElementById("storeType");
        if (typeSelect) {
            typeSelect.addEventListener("change", loadStalls); // เปลี่ยนประเภทแล้วโหลดใหม่
        }
    }
};

/**
 * ฟังก์ชันสำหรับระบบ UI การแจ้งเตือน
 */

// 1. ฟังก์ชันเปิด-ปิด Dropdown แจ้งเตือน
function toggleNoti(event) {
    // กันไม่ให้หน้าเว็บกระโดดหรือทำงานซ้ำซ้อน
    if (event) {
        event.stopPropagation(); 
        event.preventDefault();
    }
    
    const dropdown = document.getElementById('notiDropdown');
    if (!dropdown) return;

    // สลับการแสดงผลระหว่าง block และ none
    if (dropdown.style.display === 'block') {
        dropdown.style.display = 'none';
    } else {
        dropdown.style.display = 'block';
        // เมื่อเปิดแล้ว ให้ดึงข้อมูลล่าสุดทันที
        fetchNotifications();
    }
}

// 2. ปิด Dropdown อัตโนมัติเมื่อคลิกพื้นที่อื่นภายนอก
window.addEventListener('click', function(event) {
    const dropdown = document.getElementById('notiDropdown');
    const notiLink = document.querySelector('.noti-link');
    
    if (dropdown && notiLink) {
        // ถ้าคลิกข้างนอกตัวปุ่มกระดิ่ง และข้างนอกตัวกล่อง Dropdown ให้สั่งปิด
        if (!notiLink.contains(event.target) && !dropdown.contains(event.target)) {
            dropdown.style.display = 'none';
        }
    }
});

// ============== products.html ไว้ดึงและแสดงรายการสินค้า ===============

async function loadSellerProducts() {
    const grid = document.getElementById('productGrid');
    const message = document.getElementById('productMessage');

    if (!grid) return;

    grid.innerHTML = '<p>Loading products...</p>';
    message.textContent = '';

    try {
        const response = await fetch(`${BASE_API_URL}seller/get_seller_products.php?seller_id=${sellerId}`);
        const result = await response.json();

        grid.innerHTML = '';

        if (result.success && result.data.length > 0) {
            result.data.forEach(product => {
                // --- ส่วนที่แก้ไข: กำหนด class และคำแปลภาษาไทย ---
                let statusClass = 'pending';
                let statusThai = ''; 

                if (product.approval_status === 'approved') {
                    statusClass = 'approved';
                    statusThai = '';
                } else if (product.approval_status === 'rejected') {
                    statusClass = 'rejected';
                    statusThai = '';
                }
                // -------------------------------------------

                const imagePath = product.image 
                    ? `assets/images/${product.image}` 
                    : `assets/images/no-image.jpg`;

                // ใน class ของ product-card ต้องใส่ ${statusClass} ไว้เพื่อให้ปุ่ม Filter ทำงานได้
                grid.innerHTML += `
                    <div class="product-card ${statusClass}"
                         onclick="location.href='product_detail.html?id=${product.product_id}'"
                         style="cursor:pointer;">

                        <img src="${imagePath}" alt="${product.name}">

                        <div class="product-card-content">
                            <h4>${product.name}</h4>
                            <div class="product-price">฿${parseFloat(product.price).toLocaleString()}</div>
                            <div class="product-stock">Stock: ${product.stock}</div>

                            <div class="product-status ${statusClass}">
                                ${statusThai} 
                            </div>
                        </div>
                    </div>
                `;
            });

        } else {
            grid.innerHTML = '';
            message.textContent = 'ยังไม่มีสินค้าในร้านของคุณ';
        }

    } catch (error) {
        console.error('Fetch Error:', error);
        grid.innerHTML = '';
        message.textContent = 'เกิดข้อผิดพลาดในการโหลดสินค้า';
    }
}



// ============== add_product.html ================

// ตั้งค่า Listener เมื่อ Form ถูกส่ง
// ใน main.js
function setupAddProductListener() {
    const form = document.getElementById("addProductForm");

    form.addEventListener("submit", async function (e) {
        e.preventDefault();

        const currentSellerId = sessionStorage.getItem('seller_id'); 

        if (!currentSellerId) {
            // ... (Error message) ...
            return;
        }

        const messageBox = document.getElementById("addProductMessage");
        messageBox.textContent = 'Uploading files and submitting product...';
        messageBox.style.color = 'orange';

        // 1. สร้าง FormData เพื่อจัดการการส่งไฟล์
        const formData = new FormData();
        formData.append("seller_id", currentSellerId); // ส่ง seller_id เป็น form field

        // 2. ข้อมูลสินค้าทั่วไป
        formData.append("product_name", document.getElementById("productName").value);
        formData.append("description", document.getElementById("productDescription").value);
        formData.append("price", document.getElementById("productPrice").value);
        formData.append("stock", document.getElementById("productStock").value);

        // 3. จัดการไฟล์รูปปก (Cover Image)
        const coverFile = document.getElementById("coverImage").files[0];
        if (coverFile) {
            formData.append("cover_image", coverFile);
        } else {
            messageBox.textContent = "Error: Cover Image is required.";
            messageBox.style.color = "red";
            return;
        }

        // 4. จัดการไฟล์รูปลายละเอียด (Detail Images - รองรับหลายไฟล์)
        const detailFiles = document.getElementById("detailImages").files;
        if (detailFiles.length > 0) {
            for (let i = 0; i < detailFiles.length; i++) {
                formData.append("detail_images[]", detailFiles[i]); // ใช้ array [] ใน key
            }
        }

        // 6. ยิง Request POST (FormData ไม่ต้องใส่ Content-Type: application/json)
        try {
            const response = await fetch(`${BASE_API_URL}products/add_product.php`, {
                method: "POST",
                body: formData // ส่ง FormData โดยตรง
            });

            const result = await response.json();

            // ... (Logic การแสดงผลสำเร็จ/ไม่สำเร็จเดิม) ...
if (result.success) {

    Swal.fire({
        toast: true,
        position: 'top-end',
        html: `
            <div style="display:flex; align-items:center; gap:10px;">
                <img src="assets/images/check.png" style="width:20px; height:20px;">
                <span style="font-size:14px;">
                    บันทึกสินค้าเรียบร้อยแล้ว
                </span>
            </div>
        `,
        showConfirmButton: false,
        timer: 1800,
        timerProgressBar: true,
        background: '#ffffff',
        color: '#3e342d',
        customClass: { popup: 'vm-toast' }
    }).then(() => {
        window.location.href = "dashboard.html";
    });

} else {

    Swal.fire({
        toast: true,
        position: 'top-end',
        html: `
            <div style="display:flex; align-items:center; gap:10px;">
                <img src="assets/images/cancel.png" style="width:20px; height:20px;">
                <span style="font-size:14px;">
                    ไม่สามารถบันทึกสินค้าได้
                </span>
            </div>
        `,
        showConfirmButton: false,
        timer: 2000,
        background: '#ffffff'
    });

}


        } catch (error) {
            console.error('Submission Error:', error);
            messageBox.textContent = 'Network or server error occurred during file upload.';
            messageBox.style.color = 'red';
        }
    });
}

document.addEventListener("DOMContentLoaded", function () {
    if (document.getElementById("addProductForm")) {
        setupAddProductListener();
    }
});

// ================ product_detail.html ไว้แสดงรายละเอียดสินค้า =================
// ฟังก์ชันสลับโหมด
function toggleEditMode(isEdit) {
    document.getElementById('viewMode').style.display = isEdit ? 'none' : 'block';
    document.getElementById('editProductForm').style.display = isEdit ? 'block' : 'none';
    document.getElementById('editBtn').style.display = isEdit ? 'none' : 'inline-block';
    document.getElementById('cancelBtn').style.display = isEdit ? 'inline-block' : 'none';
}

// โหลดรายละเอียดสินค้าและใส่ข้อมูลลงในช่อง Input
async function loadProductDetail() {
    const urlParams = new URLSearchParams(window.location.search);
    const productId = urlParams.get('id');
    if (!productId) return;

    try {
        const response = await fetch(`${BASE_API_URL}products/get_products.php?product_id=${productId}`);
        const result = await response.json();

        if (result.success && result.data.length > 0) {
            const product = result.data[0];

            // อัปเดตข้อมูล View Mode
            document.getElementById('displayProductId').textContent = product.product_id;
            document.getElementById('viewName').textContent = product.name;
            document.getElementById('viewPrice').textContent = parseFloat(product.price).toLocaleString();
            document.getElementById('viewStock').textContent = product.stock;
            document.getElementById('viewDescription').textContent = product.description || 'ไม่มีรายละเอียดสินค้า';
            
            // ใส่ข้อมูลเดิมลงในโหมดแก้ไข (Input Value)
            document.getElementById('editName').value = product.name;
            document.getElementById('editPrice').value = product.price;
            document.getElementById('editStock').value = product.stock;
            document.getElementById('editDescription').value = product.description || '';

            // รูปภาพ
            document.getElementById('productImage').src = product.image ? `assets/images/${product.image}` : `assets/images/no-image.jpg`;
const statusBadge = document.getElementById('detailApprovalStatus');

let statusThai = 'รอการตรวจสอบ'; // ค่าเริ่มต้นสำหรับ pending
if (product.approval_status === 'approved') {
    statusThai = 'วางจำหน่ายแล้ว';
} else if (product.approval_status === 'rejected') {
    statusThai = 'ถูกปฏิเสธ';
}

statusBadge.textContent = statusThai; // แสดงข้อความภาษาไทย
statusBadge.className = 'status-badge status-' + product.approval_status; // ใช้ class สีเดิมตาม CSS

            loadAdditionalImages(productId);
        }
    } catch (error) { console.error('Error:', error); }
}

// โหลดรูปภาพประกอบ
async function loadAdditionalImages(productId) {
    const gallery = document.getElementById('imageGallery');
    const mainImage = document.getElementById('productImage');
    if (!gallery || !mainImage) return;

    gallery.innerHTML = '';

    try {
        const response = await fetch(`${BASE_API_URL}products/get_product_images.php?product_id=${productId}`);
        const result = await response.json();

        if (result.success && result.data.length > 0) {

            result.data.forEach(img => {
                const imgElement = document.createElement('img');
                imgElement.src = `assets/images/${img.image_url}`;
                imgElement.classList.add('thumbnail');

                imgElement.onclick = () => {

                    // เก็บรูปหลักปัจจุบันไว้
                    const currentMainSrc = mainImage.src;

                    // เปลี่ยนรูปหลักเป็นรูปที่กด
                    mainImage.src = imgElement.src;

                    // เอารูปหลักเดิมมาใส่แทนรูปเล็กที่กด
                    imgElement.src = currentMainSrc;
                };

                gallery.appendChild(imgElement);
            });

        } else {
            console.log("No additional images found.");
        }

    } catch (error) {
        console.error("Error loading images:", error);
    }
}


// จัดการการบันทึก
document.getElementById('editProductForm')?.addEventListener('submit', async (e) => {
    e.preventDefault();
    const productId = document.getElementById('displayProductId').textContent;

    const formData = new FormData();
    formData.append('product_id', productId);
    formData.append('name', document.getElementById('editName').value);
    formData.append('price', document.getElementById('editPrice').value);
    formData.append('stock', document.getElementById('editStock').value);
    formData.append('description', document.getElementById('editDescription').value);

    try {
        // ตรวจสอบ BASE_API_URL ให้มั่นใจว่าชี้ไปที่โฟลเดอร์ api/products/
        const response = await fetch(`${BASE_API_URL}products/update_product.php`, {
            method: 'POST',
            body: formData
        });
        const result = await response.json();

if (result.success) {

    Swal.fire({
        toast: true,
        position: 'top-end',
        html: `
            <div style="display:flex; align-items:center; gap:10px;">
                <img src="assets/images/check.png"
                     style="width:20px; height:20px;">
                <span style="font-size:14px;">
                    บันทึกข้อมูลเรียบร้อยแล้ว
                </span>
            </div>
        `,
        showConfirmButton: false,
        timer: 1500,
        timerProgressBar: true,
        background: '#ffffff',
        color: '#3e342d',
        customClass: {
            popup: 'vm-toast'
        }
    }).then(() => {
        toggleEditMode(false);
        loadProductDetail();
    });
        } else {
            Swal.fire('ล้มเหลว', result.message, 'error');
        }
    } catch (error) {
        Swal.fire('Error', 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้ ตรวจสอบ Path ของไฟล์ update_product.php', 'error');
    }
});
// ============== shop_profile.html ไว้ดึงและแก้ไขข้อมูลร้านค้า ===============

// ฟังก์ชันโหลดข้อมูลโปรไฟล์มาแสดง
async function loadShopProfile() {
    if (!sellerId) return;
    try {
        const response = await fetch(`${BASE_API_URL}seller/get_profile.php?seller_id=${sellerId}`);
        const result = await response.json();

        if (result.success) {
            const data = result.data;
            const profileImg = document.getElementById('profilePreview');
            
            // ใส่ข้อมูลลงในช่อง Input
            if(document.getElementById('shopName')) document.getElementById('shopName').value = data.shop_name || '';
            if(document.getElementById('shopPhone')) document.getElementById('shopPhone').value = data.phone_number || '';
            if(document.getElementById('shopAddress')) document.getElementById('shopAddress').value = data.address || '';
            if(document.getElementById('shopCity')) document.getElementById('shopCity').value = data.city || '';
            if(document.getElementById('shopPostalCode')) document.getElementById('shopPostalCode').value = data.postal_code || '';
            if(document.getElementById('shopDescription')) document.getElementById('shopDescription').value = data.description || '';
            if(document.getElementById('shopType')) document.getElementById('shopType').value = data.shop_type || 'อาหาร';

            // --- จุดแก้ไข: แก้ Path รูปภาพกลับเป็นแบบที่พี่เคยใช้แล้วขึ้นปกติ ---
            if (data.profile_image && profileImg) {
                profileImg.src = `../../assets/images/shops/${data.profile_image}`;
                profileImg.style.cursor = 'default';
            }
        }
    } catch (error) { 
        console.error('Load Profile Error:', error); 
    }
}
// ฟังก์ชันตั้งค่าการส่งข้อมูล (บันทึกข้อมูล)
function setupShopProfileListener() {
    const form = document.getElementById('shopProfileForm');
    if (!form) return;

    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        const messageBox = document.getElementById('profileMessage');
        if(messageBox) messageBox.textContent = 'กำลังบันทึกข้อมูล...';

        // ปลดล็อกชั่วคราวเพื่อให้ดึงค่าจากช่องที่ถูก disabled อยู่ได้
const inputs = form.querySelectorAll('input, textarea, select');
    inputs.forEach(input => input.disabled = false);

    const formData = new FormData();
    formData.append('seller_id', sellerId);
    formData.append('shop_name', document.getElementById('shopName').value);
    formData.append('phone_number', document.getElementById('shopPhone').value);
    formData.append('address', document.getElementById('shopAddress').value);
    formData.append('city', document.getElementById('shopCity').value);
    formData.append('postal_code', document.getElementById('shopPostalCode').value);
    formData.append('description', document.getElementById('shopDescription').value);
formData.append('shop_type', document.getElementById('shopType').value); // ✅ เพิ่มบรรทัดนี้ด้วย
        
const imageInput = document.getElementById('shopImage');
    if (imageInput && imageInput.files[0]) {
        formData.append('profile_image', imageInput.files[0]);
    }

        try {
            const response = await fetch(`${BASE_API_URL}seller/update_profile.php`, {
                method: 'POST',
                body: formData 
            });
            const result = await response.json();

            if (result.success) {
                alert('บันทึกข้อมูลเรียบร้อย!');
                sessionStorage.setItem('shop_name', document.getElementById('shopName').value);
                location.reload(); 
            } else {
                alert('ล้มเหลว: ' + result.message);
                // ถ้าพลาด ให้ล็อกช่องกลับเหมือนเดิม
                inputs.forEach(input => { if(input.id !== 'shopImage') input.disabled = true; });
            }
        } catch (error) {
            console.error('Update Error:', error);
            alert('เกิดข้อผิดพลาดในการเชื่อมต่อเซิร์ฟเวอร์');
            inputs.forEach(input => { if(input.id !== 'shopImage') input.disabled = true; });
        }
    });
}

// เรียกใช้งานทันที
setupShopProfileListener();


// ================== orders.js ==================

document.addEventListener("DOMContentLoaded", () => {
    loadSellerOrders();
});

async function loadSellerOrders() {
    const orderList = document.getElementById('orderList');
    if (!orderList) return;

    try {
        const response = await fetch(
            `${BASE_API_URL}seller/get_seller_orders.php?seller_id=${sellerId}`
        );
        const result = await response.json();

        if (result.success && result.data.length > 0) {
            // --- เริ่มต้นส่วนที่แก้ไข: คำนวณลำดับเก่าไปใหม่ ---
            const totalOrders = result.data.length; // นับจำนวนออเดอร์ทั้งหมดที่มี

            orderList.innerHTML = result.data.map((order, index) => {
                
                /**
                 * คำนวณลำดับย้อนกลับ: (จำนวนทั้งหมด - index ปัจจุบัน)
                 * เพื่อให้รายการแรกสุดใน Array (ซึ่งใหม่สุด) ได้เลขลำดับที่สูงที่สุด
                 * และรายการท้ายสุดใน Array (ซึ่งเก่าสุด) ได้เลข 1 เสมอ
                 */
                const displayIndex = totalOrders - index; 

                // 1. จัดการเรื่องสีและข้อความสถานะ
                let statusText = order.status || "รอการยืนยัน";
                let statusClass = "status-pending";
                const statusValue = statusText.trim();

                if (statusValue.includes("รอ")) {
                    statusClass = "status-pending";
                } else if (statusValue.includes("กำลัง")) {
                    statusClass = "status-shipping";
                } else if (statusValue.includes("สำเร็จ")) {
                    statusClass = "status-completed";
                } else if (statusValue.includes("ยกเลิก")) {
                    statusClass = "status-cancelled";
                }

                // 2. สร้างแถวตาราง (ใช้ displayIndex แทน index + 1)
                return `
                <tr class="order-row" 
                    onclick="viewDetails(${order.order_id}, ${displayIndex})" 
                    style="cursor:pointer;">

                    <td style="font-weight:bold;">${displayIndex}</td> 
                    <td>${new Date(order.created_at).toLocaleString('th-TH')}</td>
                    <td>${order.total_items_count || 0} รายการ</td>
                    <td>${parseFloat(order.total_amount).toLocaleString()} บาท</td>

                    <td>
                        <span class="status-badge ${statusClass}">
                            ${statusText}
                        </span>
                    </td>

                    <td>
                        ${order.payment_status === 'paid' 
                            ? '<span class="pay-paid">ชำระแล้ว</span>' 
                            : '<span class="pay-cod">ปลายทาง</span>'}
                    </td>

                    <td class="arrow-cell">
                        <img src="assets/images/next.png" class="arrow-icon" style="width:20px;">
                    </td>
                </tr>
                `;
            }).join(''); // จบการ map และรวมเป็น string เดียว

        } else {
            orderList.innerHTML = `<tr><td colspan="7" style="text-align:center;">ไม่พบรายการคำสั่งซื้อ</td></tr>`;
        }

    } catch (error) {
        console.error("โหลดออเดอร์ผิดพลาด:", error);
    }
}

function closeDetailPanel() {

    document.getElementById("orderDetailPanel")
        .classList.remove("open");

    document.querySelector(".order-layout")
        .classList.remove("shift");
}


window.updateOrderStatus = async function(status) {

    if (!currentOrderId) return;

    const cleanStatus = (status || "").toLowerCase().trim();

    /* =========================
       เตือนก่อน "ยกเลิก"
    ========================== */
    if (cleanStatus === "cancelled") {

        const confirmCancel = await Swal.fire({
            title: "ยืนยันการยกเลิกคำสั่งซื้อ",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "ยืนยัน",
            cancelButtonText: "ปิด",
            confirmButtonColor: "#d33",
            cancelButtonColor: "#b0a79f",
            reverseButtons: true
        });

        if (!confirmCancel.isConfirmed) return;
    }

    /* =========================
       เตือนก่อน "จัดส่งสำเร็จ"
    ========================== */
    if (cleanStatus === "completed") {

        const confirmShip = await Swal.fire({
            title: "ยืนยันว่าจัดส่งสินค้าเรียบร้อยแล้ว",
            text: "เมื่อยืนยันแล้วจะไม่สามารถย้อนกลับได้",
            icon: "success",
            showCancelButton: true,
            confirmButtonText: "ยืนยัน",
            cancelButtonText: "ปิด",
            confirmButtonColor: "#4CAF50",
            cancelButtonColor: "#b0a79f",
            reverseButtons: true
        });

        if (!confirmShip.isConfirmed) return;
    }

    /* =========================
       ตรงนี้คือจุดที่ต้องวาง try
    ========================== */
    try {

        const response = await fetch(
            `${BASE_API_URL}orders/update_order_status.php`,
            {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    order_id: currentOrderId,
                    status: cleanStatus
                })
            }
        );

        const result = await response.json();

if (result.success) {

    // ปิด toast เก่าทันที (กันค้าง)
    Swal.close();

    // ใช้ SweetAlert2 mixin สำหรับ toast
    const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 1800,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer);
            toast.addEventListener('mouseleave', Swal.resumeTimer);
        }
    });

    Toast.fire({
        icon: "success",
        title: "อัปเดตสถานะเรียบร้อยแล้ว"
    });

    loadSellerOrders();

}
 else {

            Swal.fire({
                toast: true,
                position: "top-end",
                icon: "error",
                title: result.message,
                showConfirmButton: false,
                timer: 2000
            });

        }

    } catch (err) {

        Swal.fire({
            toast: true,
            position: "top-end",
            icon: "error",
            title: "ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้",
            showConfirmButton: false,
            timer: 2000
        });

    }
};




// ================ analytics.html (Sales Analytics) ================

async function fetchAnalyticsData() {
    const sId = sessionStorage.getItem('seller_id');
    // --- เพิ่มบรรทัดนี้ ---
    const range = document.getElementById('timeRange') ? document.getElementById('timeRange').value : '7days';
    // -------------------
    
    if (!sId) return;

    const chartLoading = document.getElementById('chartLoading');
    if (chartLoading) chartLoading.style.display = 'block';

    try {
        // --- แก้ไขบรรทัด fetch โดยเติม &range=${range} ต่อท้าย ---
        const response = await fetch(`${BASE_API_URL}seller/get_sales_stats.php?seller_id=${sId}&range=${range}`);
        const result = await response.json();

        if (result.status === 'success') {
            // --- เพิ่มส่วนนี้เพื่อเปลี่ยนหัวข้อตามที่เลือก ---
            const titles = { 'today': 'วันนี้', '7days': '7 วันล่าสุด', '30days': '30 วันล่าสุด', '1year': '1 ปีที่ผ่านมา' };
            if(document.getElementById('chartTitle')) {
                document.getElementById('chartTitle').innerText = `สถิติยอดขาย (${titles[range]})`;
            }
            // ---------------------------------------
            updateAnalyticsUI(result);
        } else {
            clearAnalyticsUI();
        }
    } catch (error) {
        console.error('Fetch Analytics Error:', error);
    } finally {
        if (chartLoading) chartLoading.style.display = 'none';
    }
}

function updateAnalyticsUI(data) {
    // 1. อัปเดตตัวเลขสรุป
    const todaySalesEl = document.getElementById('todaySales');
    const totalOrdersEl = document.getElementById('totalOrders');
    
    if (todaySalesEl) {
        todaySalesEl.innerText = `฿${parseFloat(data.today_revenue).toLocaleString(undefined, {minimumFractionDigits: 2})}`;
    }
    if (totalOrdersEl) {
        totalOrdersEl.innerText = data.total_orders.toLocaleString();
    }

    // 2. จัดการวาดกราฟเส้น (Trend Chart)
    const ctx = document.getElementById('salesTrendChart');
    if (ctx) {
        // ป้องกันกราฟซ้อนกันเมื่อมีการโหลดใหม่
        if (window.mySalesChart instanceof Chart) {
            window.mySalesChart.destroy();
        }

        // --- เริ่มส่วนการแปลงภาษาไทย ---
        const thaiDays = ['อา.', 'จ.', 'อ.', 'พ.', 'พฤ.', 'ศ.', 'ส.'];
        const thaiMonths = ['ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.'];

        const formattedLabels = data.chart_labels.map(labelStr => {
            // กรณีรายวัน (เช่น 2026-04-23)
            if (labelStr.includes('-') && labelStr.split('-').length === 3) {
                const d = new Date(labelStr);
                return `${thaiDays[d.getDay()]} ${d.getDate()}/${d.getMonth() + 1}`;
            }
            
            // กรณีรายปี/เดือน (เช่น Apr 2026)
            const monthMatch = labelStr.match(/([a-zA-Z]+)\s(\d{4})/);
            if (monthMatch) {
                const engMonth = monthMatch[1]; // เช่น Apr
                const year = monthMatch[2];     // เช่น 2026
                const d = new Date(`${engMonth} 1, ${year}`);
                if (!isNaN(d)) {
                    return `${thaiMonths[d.getMonth()]} ${year}`; // เม.ย. 2026
                }
            }

            // กรณีอื่นๆ (เช่น รายชั่วโมง 09:00)
            return labelStr;
        });
        // --- จบส่วนการแปลงภาษาไทย ---

        window.mySalesChart = new Chart(ctx.getContext('2d'), {
            type: 'line',
            data: {
                labels: formattedLabels, 
                datasets: [{
                    label: 'ยอดขาย',
                    data: data.chart_data,
                    borderColor: '#4e73df',
                    backgroundColor: 'rgba(78, 115, 223, 0.05)',
                    fill: true,
                    tension: 0.3,
                    pointRadius: 3,
                    pointHitRadius: 10,
                    borderWidth: 2
                }]
            },
            options: {
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            drawBorder: false, // ลบเส้นขอบแกน
                            color: 'rgba(62, 52, 45, 0.05)' // สีเส้น Grid จางๆ ตามธีมน้ำตาล
                        },
                        ticks: {
                            font: { family: "'Prompt', sans-serif" }, // ใช้ฟอนต์เดียวกับเว็บ
                            callback: function(value) { return '฿' + value.toLocaleString(); }
                        }
                    },
                    x: {
                        grid: {
                            display: false // ปิดเส้น Grid แนวตั้งเพื่อให้กราฟดูโปร่งขึ้น
                        },
                        ticks: {
                            font: { family: "'Prompt', sans-serif" }
                        }
                    }
                }
            }
        });
    }

    // 3. แสดงรายการสินค้าขายดี 5 อันดับแรก
    const productList = document.getElementById('topProductsList');
    if (productList) {
        if (data.top_products && data.top_products.length > 0) {
            productList.innerHTML = data.top_products.map((p, index) => `
                <div class="d-flex align-items-center mb-3 p-2 border-bottom">
                    <div class="me-3 d-flex align-items-center justify-content-center fw-bold" 
                         style="width: 30px; height: 30px; background: #3e342d; color: white; border-radius: 50%; font-size: 12px; flex-shrink: 0;">
                        ${index + 1}
                    </div>
                    <div class="flex-grow-1">
                        <div class="small fw-bold text-dark">${p.name}</div>
                        <div class="text-muted" style="font-size: 0.7rem;">ขายไปแล้ว ${p.total_sold} ชิ้น</div>
                    </div>
                    <div class="text-end">
                        <div class="fw-bold text-primary" style="font-size: 0.9rem;">฿${parseFloat(p.revenue).toLocaleString()}</div>
                    </div>
                </div>
            `).join('');
        } else {
            productList.innerHTML = '<p class="text-center text-muted py-3">ไม่มีข้อมูลการขายในขณะนี้</p>';
        }
    }
}


 // ฟังก์ชันล้าง UI กรณีไม่มีข้อมูล
function clearAnalyticsUI() {
    if (document.getElementById('todaySales')) document.getElementById('todaySales').innerText = '฿0.00';
    if (document.getElementById('totalOrders')) document.getElementById('totalOrders').innerText = '0';
    if (document.getElementById('topProductsList')) document.getElementById('topProductsList').innerHTML = '<p class="text-center text-muted py-3">ไม่มีข้อมูล</p>';
}

async function deleteProduct(productId) {

    if (!productId) return;

    try {

        const response = await fetch(`${BASE_API_URL}products/delete_product.php`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ product_id: productId })
        });

        const result = await response.json();

        if (result.success) {

            Swal.fire({
                toast: true,
                position: 'top-end',
                html: `
                    <div style="display:flex; align-items:center; gap:10px;">
                        <img src="assets/images/check.png"
                             style="width:20px; height:20px;">
                        <span style="font-size:14px;">
                            ลบสินค้าเรียบร้อยแล้ว
                        </span>
                    </div>
                `,
                showConfirmButton: false,
                timer: 1500,
                timerProgressBar: true,
                background: '#ffffff',
                color: '#3e342d',
                customClass: {
                    popup: 'vm-toast'
                }
            }).then(() => {
                window.location.href = "dashboard.html";
            });

        } else {

            Swal.fire({
                toast: true,
                position: 'top-end',
                html: `
                    <div style="display:flex; align-items:center; gap:10px;">
                        <img src="assets/images/cancel.png"
                             style="width:20px; height:20px;">
                        <span style="font-size:14px;">
                            ลบสินค้าไม่สำเร็จ
                        </span>
                    </div>
                `,
                showConfirmButton: false,
                timer: 1500,
                background: '#ffffff',
                color: '#3e342d'
            });

        }

    } catch (error) {
        console.error(error);
    }
}

// ================ booking.html (Space Booking) ================

async function loadCurrentStall() {
    // ใช้ sellerId ที่ประกาศไว้ด้านบนสุดของไฟล์คุณ
    if (!sellerId) return;

    try {
        // ส่ง seller_id ไปแบบ GET เหมือนหน้า analytics และ notifications
        const res = await fetch(`${BASE_API_URL}seller/get_current_stall.php?seller_id=${sellerId}`);
        const data = await res.json();
        const box = document.getElementById("currentStallBox");
        const selectionArea = document.getElementById("selectionArea");

        if (data.success && data.stall) {
            box.innerHTML = `
                <div style="margin:20px 0;padding:20px;background:#fff3e0;border:2px solid #fb8c00;border-radius:10px;">
                    <h3 style="margin-top:0; color:#e65100;">📍 พื้นที่ที่คุณกำลังใช้งาน</h3>
                    <p>หมายเลขพื้นที่: <b>${data.stall.stall_number}</b></p>
                    <p>โซน: <b>${data.stall.zone === 'top' ? 'แถวบน' : 'แถวล่าง'}</b></p>
                    <button onclick="cancelStall()" 
                        style="margin-top:10px;padding:10px 20px;background:#c62828;color:white;border:none;border-radius:6px;cursor:pointer;font-weight:bold;">
                        ยกเลิกการใช้พื้นที่
                    </button>
                </div>
            `;
            if (selectionArea) selectionArea.style.display = "none";
        } else {
            if (selectionArea) selectionArea.style.display = "block";
        }
    } catch (err) {
        console.error("Error loading current stall:", err);
    }
}

async function loadStalls() {
    const selectedType = document.getElementById("storeType")?.value;
    const topRow = document.getElementById("topRow");
    const bottomRow = document.getElementById("bottomRow");

    if (!selectedType) {
        if (topRow) topRow.innerHTML = "<p>กรุณาเลือกประเภทกิจการ</p>";
        return;
    }

    try {
        const res = await fetch(`${BASE_API_URL}http://localhost/vmarket/api/seller/get_stalls.php`);
        const stalls = await res.json();

        topRow.innerHTML = "";
        bottomRow.innerHTML = "";

        stalls.forEach(stall => {
            if (stall.allowed_type !== selectedType) return;

            const isBooked = stall.status === "booked";
            const card = document.createElement("div");
            card.className = `stall-card ${isBooked ? "booked" : ""}`;
            card.innerHTML = `
                <h4>หมายเลข ${stall.stall_number}</h4>
                <p>สถานะ: ${isBooked ? "🔴 ไม่ว่าง" : "🟢 ว่าง"}</p>
                <button ${isBooked ? "disabled" : ""} 
                    onclick="selectStall(${stall.stall_id})">
                    ${isBooked ? "ไม่สามารถเลือกได้" : "เลือกใช้พื้นที่นี้"}
                </button>
            `;
            (stall.zone === "top" ? topRow : bottomRow).appendChild(card);
        });
    } catch (err) {
        console.error("โหลดพื้นที่ล้มเหลว:", err);
    }
}

async function selectStall(stallId) {
    const selectedType = document.getElementById("storeType")?.value;
    if (!sellerId) return;

    const confirm = await Swal.fire({
        title: "ยืนยันการเลือกใช้พื้นที่?",
        icon: "question",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก"
    });

    if (!confirm.isConfirmed) return;

    try {
        const res = await fetch(`${BASE_API_URL}http://localhost/vmarket/api/seller/book_stall.php`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                seller_id: sellerId, // ส่ง ID ไปใน Body
                stall_id: stallId,
                store_type: selectedType
            })
        });
        const data = await res.json();
        if (data.success) location.reload();
        else Swal.fire("ไม่สำเร็จ", data.message, "error");
    } catch (err) {
        Swal.fire("ผิดพลาด", "เกิดข้อผิดพลาดในการเชื่อมต่อ", "error");
    }
}

async function cancelStall() {
    if (!sellerId) return;

    const confirm = await Swal.fire({
        title: "ยืนยันการยกเลิก?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#c62828",
        confirmButtonText: "ใช่, ยกเลิกพื้นที่"
    });

    if (!confirm.isConfirmed) return;

    try {
        // ส่ง ID ไปลบใน Server ผ่าน GET หรือ POST (ตัวอย่างใช้ POST เพื่อความปลอดภัย)
        const res = await fetch(`${BASE_API_URL}http://localhost/vmarket/api/seller/cancel_stall.php`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ seller_id: sellerId })
        });
        const data = await res.json();
        if (data.success) location.reload();
    } catch (err) {
        console.error("Cancel Error:", err);
    }
}

function filterStatus(status, btn) {
    // 1. เปลี่ยนสีปุ่มที่ถูกกด
    document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');

    // 2. สั่งกรองการแสดงผล Card สินค้า
    const cards = document.querySelectorAll('.product-card');
    cards.forEach(card => {
        if (status === 'all') {
            card.style.display = 'block';
        } else {
            // เช็คว่าในการ์ดมี class สถานะตรงกับที่กดไหม
            if (card.classList.contains(status)) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        }
    });
}