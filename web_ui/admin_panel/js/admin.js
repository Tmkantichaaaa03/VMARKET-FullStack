const BASE_API_URL = 'http://localhost/vmarket/api/';
const ADMIN_USERNAME = 'admin';
const ADMIN_PASSWORD = 'password';

// DOM Elements
const loginForm = document.getElementById('loginForm'); 
const loginMessage = document.getElementById('loginMessage'); 
const pendingTableBody = document.querySelector('#pendingTable tbody'); 
const dashboardMessage = document.getElementById('dashboardMessage'); 


// ============== ฟังก์ชันควบคุมการเข้าถึง (Access Control & Redirect) =================


// ฟังก์ชันสำหรับหน้า Login (เพื่อรองรับการเรียกจาก HTML onclick หรือ inline script)
function adminLogin(event) {
    if (event) event.preventDefault();
    
    const username = document.getElementById('loginUsername').value;
    const password = document.getElementById('loginPassword').value;
    const loginMessage = document.getElementById('loginMessage');

    if (username === ADMIN_USERNAME && password === ADMIN_PASSWORD) {
        sessionStorage.setItem('admin_auth', 'true');
        window.location.href = 'admin_home.html';
    } else {
        if (loginMessage) {
            loginMessage.textContent = 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง';
            loginMessage.style.color = 'red';
        }
    }
}
// ตรวจสอบสิทธิ์ (ใช้ใน admin_home.html และ admin_product_detail.html)
function checkAuthAdmin() {
    if (sessionStorage.getItem('admin_auth') !== 'true') {
        alert('You must be logged in to access the dashboard.');
        window.location.href = 'index.html'; // Redirect ไปหน้า Login (index.html)
    }
}

// ตรวจสอบ Login (ใช้ใน index.html - หน้า Login)
function checkLoginAdmin() {
    if (sessionStorage.getItem('admin_auth') === 'true') {
        window.location.href = 'admin_home.html'; // ถ้าล็อกอินแล้วไปหน้า Dashboard
    }
}

// จัดการ Logout
function logout() {
    sessionStorage.removeItem('admin_auth'); 
    window.location.href = 'index.html'; // Redirect ไปหน้า Login (index.html)
}


// ================== Login Logic ====================

if (loginForm) {
    loginForm.addEventListener('submit', (e) => {
        e.preventDefault(); 
        loginMessage.textContent = '';

        const username = document.getElementById('loginUsername').value;
        const password = document.getElementById('loginPassword').value;

        if (username === ADMIN_USERNAME && password === ADMIN_PASSWORD) {
            loginMessage.textContent = 'Login Successful';
            loginMessage.style.color = 'green';

            sessionStorage.setItem('admin_auth', 'true');

            window.location.href = 'admin_home.html'; 
            
        } else {
            loginMessage.textContent = 'Invalid Credentials' ;
            loginMessage.style.color = 'red';
        }
    });
}

// ==================== admin_home.html (ปรับปรุงใหม่) ==========================

async function loadPendingProducts() {
    
    const pendingTableBody = document.querySelector('#pendingTable tbody'); 
    const dashboardMessage = document.getElementById('dashboardMessage');

    pendingTableBody.innerHTML = '<tr><td colspan="6">กำลังโหลดข้อมูลสินค้า...</td></tr>';
    dashboardMessage.textContent = '';

    try {
        const response = await fetch(`${BASE_API_URL}admin/get_pending_products.php`, {
            method: 'GET'
        });

        const result = await response.json();

        pendingTableBody.innerHTML = ''; 

        if (result.success && result.data && result.data.length > 0) {
            document.getElementById('pendingCount').textContent = result.data.length;
            // แก้ไขเฉพาะในฟังก์ชัน loadPendingProducts() ส่วนที่ loop ข้อมูล
result.data.forEach(product => {
    const row = pendingTableBody.insertRow();

    // 1. ดึงข้อมูล (ตรวจสอบชื่อ Field จาก Database/API ของคุณ)
    const productName = product.name || product.product_name || '-';
    
    // ดึงชื่อผู้ขาย: ลองเช็คว่า API ส่งมาในชื่อ seller_name, shop_name หรือ username
    const sellerId = product.seller_name || product.shop_name || product.seller_id || product.username || '-';
    
    const price = product.price != null ? parseFloat(product.price).toLocaleString(undefined, {minimumFractionDigits: 2}) : '-';
    const description = product.description ? product.description.substring(0, 50) + '...' : '-';

    // 2. เติมข้อมูลลงในตาราง (ต้องมี 6 cell ตามลำดับหัวตาราง)
    row.insertCell().textContent = product.product_id || '-'; // คอลัมน์ ID
    row.insertCell().textContent = productName;               // คอลัมน์ ชื่อสินค้า
    row.insertCell().textContent = sellerId;                  // คอลัมน์ ชื่อผู้ขาย (แก้บรรทัดนี้)
    row.insertCell().innerHTML = `<strong>${price}</strong>`;  // คอลัมน์ ราคา
    row.insertCell().textContent = description;               // คอลัมน์ รายละเอียด
    
    // คอลัมน์ การจัดการ
    const actionCell = row.insertCell();
    actionCell.innerHTML = `
        <a href="admin_product_detail.html?id=${product.product_id}" class="approve-link">
            ตรวจสอบข้อมูล
        </a>
    `;
});
        } else {
            dashboardMessage.textContent = 'ไม่มีรายการสินค้าที่รอการอนุมัติในขณะนี้';
            document.getElementById('pendingCount').textContent = 0;
            pendingTableBody.innerHTML = '<tr><td colspan="6">ไม่มีข้อมูล</td></tr>';
        }

    } catch (error) {
        dashboardMessage.textContent = 'เกิดข้อผิดพลาดในการเชื่อมต่อ API กรุณาตรวจสอบสถานะเซิร์ฟเวอร์';
        console.error('Fetch Error:', error);
    }
}


// ================= admin_product_detail.html ====================

async function loadAdminProductDetail() {
    const detailContainer = document.getElementById('admin-dashboard-detail');
    const message = document.getElementById('detailMessage');
    const urlParams = new URLSearchParams(window.location.search);
    const productId = urlParams.get('id');

    if (detailContainer) detailContainer.style.display = 'block';

    if (!productId) {
        if (message) message.textContent = 'ไม่พบรหัสสินค้าใน URL';
        return;
    }

    try {
        const response = await fetch(`${BASE_API_URL}products/get_products.php?product_id=${productId}`);
        const result = await response.json();

        if (result.success && result.data && result.data.length > 0) {
            const product = result.data[0]; 

            // เติมข้อมูลพื้นฐาน
            const fields = {
                'productName': product.name,
                'detailProductId': product.product_id,
                'detailSellerId': product.seller_id,
                'detailDescription': product.description,
                'detailPrice': parseFloat(product.price).toLocaleString(undefined, {minimumFractionDigits: 2}),
                'detailStock': product.stock
            };

            for (let id in fields) {
                const el = document.getElementById(id);
                if (el) el.textContent = fields[id] || '-';
            }

            // --- ส่วนที่แก้ไข: ปรับสถานะเป็นภาษาไทย ---
            const statusElement = document.getElementById('detailApprovalStatus');
            if (statusElement) {
                let statusThai = '';
                const currentStatus = product.approval_status.toLowerCase();

                if (currentStatus === 'pending') statusThai = 'รอการตรวจสอบ';
                else if (currentStatus === 'approved') statusThai = 'อนุมัติแล้ว';
                else if (currentStatus === 'rejected') statusThai = 'ปฏิเสธการอนุมัติ';
                else statusThai = currentStatus;

                statusElement.textContent = statusThai;
                statusElement.className = 'status-pill status-' + currentStatus;
            }

            // รูปหน้าปก
            const imgElement = document.getElementById('productImage');
            if (imgElement && product.image) {
                imgElement.src = `../seller_panel/assets/images/${product.image}`; 
                imgElement.style.display = 'block';
            }

            // รูปรายละเอียด
            const detailImageList = document.getElementById('detailImageList'); 
            if (detailImageList) {
                detailImageList.innerHTML = ''; 
                if (product.detail_images && product.detail_images.length > 0) {
                    product.detail_images.forEach(imgName => {
                        const img = document.createElement('img');
                        img.src = `../seller_panel/assets/images/${imgName}`;
                        img.onerror = () => img.style.display = 'none';
                        detailImageList.appendChild(img);
                    });
                }
            }

            // โน้ต
            const notesField = document.getElementById('adminNotes');
            if (notesField) notesField.value = product.admin_notes || '';

            // --- ส่วนที่แก้ไข: ลบข้อความ "โหลดข้อมูลสำเร็จ" ---
            if (message) {
                message.style.display = 'none'; // ซ่อนข้อความไปเลยเมื่อโหลดเสร็จ
            }

        }
    } catch (error) {
        console.error('Error:', error);
        if (message) message.textContent = 'เกิดข้อผิดพลาดในการเชื่อมต่อข้อมูล';
    }
}

// ฟังก์ชันอนุมัติ (ตัดส่วนส่งไฟล์ 3D ออก)
async function handleApproval(productId, status) {
    if (!productId || productId === '-') return;
    
    const adminNotes = document.getElementById('adminNotes')?.value || '';
    if (!confirm(`ยืนยันการ ${status === 'approved' ? 'อนุมัติ' : 'ปฏิเสธ'} สินค้านี้?`)) return;

    const formData = new FormData();
    formData.append("product_id", productId);
    formData.append("status", status);
    formData.append("admin_notes", adminNotes);

    try {
        const response = await fetch(`${BASE_API_URL}admin/approve_product.php`, {
            method: 'POST',
            body: formData
        });
        const result = await response.json();

        if (result.success) {
            alert('ดำเนินการเรียบร้อย');
            window.location.href = 'admin_home.html';
        } else {
            alert('เกิดข้อผิดพลาด: ' + result.message);
        }
    } catch (error) {
        console.error('Error:', error);
        alert('ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้');
    }
}

// ================= การเรียกใช้ฟังก์ชันเริ่มต้น (window.onload) =================

window.onload = function() {
    // Logic สำหรับหน้า Login (index.html)
    if (document.getElementById('loginForm')) { 
        checkLoginAdmin(); 
    }
    
    // Logic สำหรับหน้า Dashboard (admin_home.html)
    if (document.getElementById('admin-dashboard')) {
        checkAuthAdmin(); 
        loadPendingProducts();
    }
    
    // Logic สำหรับหน้า Product Detail (admin_product_detail.html)
    if (document.getElementById('admin-dashboard-detail')) {
        checkAuthAdmin(); 
        loadAdminProductDetail();
    }
};