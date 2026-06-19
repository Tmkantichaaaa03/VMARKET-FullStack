const API_BASE = "/vmarket/api/seller/";

document.addEventListener("DOMContentLoaded", () => {
    if (typeof checkAuth === "function") {
        checkAuth();
    }
    loadCurrentStall();
    loadStalls();

    const typeSelect = document.getElementById("storeType");
    if (typeSelect) {
        typeSelect.addEventListener("change", loadStalls);
    }
});

/* ===============================
   โหลดพื้นที่ที่ผู้ขายกำลังใช้ (อัปเดตใหม่)
================================= */
async function loadCurrentStall() {
    try {
        // ดึงข้อมูลโดยใช้ Session จาก Server (ไม่ต้องส่ง seller_id ไปทาง URL)
        const res = await fetch(API_BASE + "get_current_stall.php", {
            credentials: "include" 
        });
        const data = await res.json();

        const box = document.getElementById("currentStallBox");
        if (!box) return;

        box.innerHTML = ""; // ล้างค่าเดิมก่อน

        if (data.success && data.stall) {
            box.innerHTML = `
                <div class="current-stall-card" style="padding:15px; background:#fff3cd; border:1px solid #ffeeba; border-radius:8px; margin-bottom:20px;">
                    <h3 style="margin-top:0;">📍 พื้นที่ที่กำลังใช้งาน</h3>
                    <p>หมายเลขพื้นที่: <b>${data.stall.stall_number}</b></p>
                    <p>โซน: <b>${data.stall.zone}</b></p>
                    <button onclick="cancelStall()" style="background:#c62828; color:white; border:none; padding:8px 15px; border-radius:6px; cursor:pointer;">
                        ยกเลิกการใช้พื้นที่
                    </button>
                </div>
            `;
            // ซ่อนส่วนเลือกประเภทกิจการถ้าจองไปแล้ว
            const selectionArea = document.querySelector(".store-type-box");
            if (selectionArea) selectionArea.style.display = "none";
        }
    } catch (err) {
        console.error("โหลดข้อมูลพื้นที่ปัจจุบันล้มเหลว", err);
    }
}

/* ===============================
   โหลดพื้นที่ทั้งหมด
================================= */
async function loadStalls() {

    const selectedType = document.getElementById("storeType")?.value;
    const topRow = document.getElementById("topRow");
    const bottomRow = document.getElementById("bottomRow");

    if (!selectedType) {
        if (topRow) topRow.innerHTML = "";
        if (bottomRow) bottomRow.innerHTML = "";
        return;
    }

    try {

        const res = await fetch(API_BASE + "get_stalls.php");
        const stalls = await res.json();

        if (!Array.isArray(stalls)) return;

        topRow.innerHTML = "";
        bottomRow.innerHTML = "";

        stalls.forEach(stall => {

            // กรองตามประเภท
            if (!stall.allowed_type || stall.allowed_type !== selectedType)
                return;

            const card = document.createElement("div");
            card.className = "stall-card";

            const isBooked = stall.status === "booked";

            card.innerHTML = `
                <h4>พื้นที่ร้านค้า หมายเลข ${stall.stall_number}</h4>
                <p>สถานะ: ${isBooked ? "มีผู้ใช้สิทธิ์แล้ว" : "พร้อมให้เลือกใช้"}</p>
                <button ${isBooked ? "disabled" : ""} 
                    onclick="selectStall(${stall.stall_id})">
                    ${isBooked ? "ไม่สามารถดำเนินการได้" : "เลือกใช้พื้นที่"}
                </button>
            `;

            if (isBooked) {
                card.classList.add("booked");
            }

            if (stall.zone === "top") {
                topRow.appendChild(card);
            } else {
                bottomRow.appendChild(card);
            }

        });

    } catch (err) {
        console.error("โหลดพื้นที่ล้มเหลว", err);
    }
}


/* ===============================
   เลือกใช้พื้นที่
================================= */
async function selectStall(stallId) {

    const selectedType = document.getElementById("storeType")?.value;

    if (!selectedType) {
        Swal.fire("กรุณาเลือกประเภทกิจการก่อน");
        return;
    }

    const confirm = await Swal.fire({
        title: "ยืนยันการเลือกใช้พื้นที่?",
        icon: "question",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ยกเลิก"
    });

    if (!confirm.isConfirmed) return;

    try {

        const res = await fetch(API_BASE + "book_stall.php", {
            method: "POST",
            credentials: "include",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                stall_id: stallId,
                store_type: selectedType
            })
        });

        const data = await res.json();

        if (data.success) {
            Swal.fire("สำเร็จ", data.message, "success")
                .then(() => location.reload());
        } else {
            Swal.fire("ไม่สำเร็จ", data.message, "error");
        }

    } catch (err) {
        Swal.fire("ผิดพลาด", "เกิดข้อผิดพลาดในการเชื่อมต่อ", "error");
    }
}


/* ===============================
   ยกเลิกการใช้พื้นที่
================================= */
async function cancelStall() {

    const confirm = await Swal.fire({
        title: "ต้องการยกเลิกการใช้พื้นที่?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "ยืนยัน",
        cancelButtonText: "ไม่"
    });

    if (!confirm.isConfirmed) return;

    try {

        const res = await fetch(API_BASE + "cancel_stall.php", {
            method: "POST",
            credentials: "include"
        });

        const data = await res.json();

        if (data.success) {
            Swal.fire("ยกเลิกสำเร็จ", data.message, "success")
                .then(() => location.reload());
        } else {
            Swal.fire("ไม่สำเร็จ", data.message, "error");
        }

    } catch (err) {
        Swal.fire("ผิดพลาด", "เกิดข้อผิดพลาด", "error");
    }
}
