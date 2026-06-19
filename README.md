\# VMARKET Full Stack



Virtual Marketplace Game



\## Overview



ระบบต้นแบบตลาดขายสินค้าออนไลน์ในรูปแบบเกม

โดยเชื่อมต่อระหว่าง Game Client, Backend API และ Web Application



\## System Architecture



```text

Godot Game Client

&#x20;       |

&#x20;       | REST API

&#x20;       |

&#x20;  Backend API

&#x20;       |

&#x20;       |

&#x20;MySQL Database

&#x20;       |

&#x20;       |

Web Application

&#x20;(Seller/Admin)

```

\## Components



\### Game Client

\- Developed with Godot Engine

\- ใช้สำหรับลูกค้าเดินเลือกชมสินค้าในโลกเสมือน



\### Backend API

\- จัดการข้อมูลผู้ใช้

\- จัดการสินค้า

\- จัดการคำสั่งซื้อ

\- เชื่อมต่อฐานข้อมูล



\### Web Application



Seller:

\- เพิ่มสินค้า

\- จัดการคำสั่งซื้อ



Admin:

\- ตรวจสอบและอนุมัติสินค้า

\- จัดการระบบ



\## Features



Customer:

\- Register / Login

\- Browse products

\- Add to cart

\- Purchase products



Seller:

\- Manage products

\- View orders



Admin:

\- Approve products

\- Manage system



\## Technology



\- PHP

\- MySQL

\- HTML

\- CSS

\- JavaScript

\- Godot Engine



\## Database



Import: virtual\_marketplace.sql



Database Name: virtual\_marketplace



\## Documentation



Report:

docs/Report/Gamified\_Online\_Marketplace\_Report.pdf



Paper:

docs/Paper/Gamified\_Online\_Marketplace\_Paper.pdf



Poster:

docs/Poster/Gamified\_Online\_Marketplace\_Poster.pdf



\## GitHub



Web/API:

https://github.com/Tmkantichaaaa03/VMARKET-FullStack



Game Client:

https://github.com/Tmkantichaaaa03/vmarket\_game


