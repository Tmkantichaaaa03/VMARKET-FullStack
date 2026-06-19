\# VMARKET Full Stack



Virtual Marketplace Game



\## Overview



ระบบต้นแบบตลาดขายสินค้าออนไลน์ในรูปแบบเกม

โดยเชื่อมต่อระหว่าง Game Client, Backend API และ Web Application



\## System Architecture



ระบบทำงานร่วมกันระหว่าง:



1\. Game Client (Godot Engine)

&#x20;  - ใช้สำหรับลูกค้าเดินเลือกชมสินค้าในโลกเสมือน



2\. Backend API

&#x20;  - รับส่งข้อมูลระหว่างเกม เว็บไซต์ และฐานข้อมูล

&#x20;  - จัดการผู้ใช้ สินค้า และคำสั่งซื้อ



3\. MySQL Database

&#x20;  - จัดเก็บข้อมูลระบบ



4\. Web Application

&#x20;  - สำหรับ Seller และ Admin



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



<https://github.com/Tmkantichaaaa03/VMARKET-FullStack>



Game Client:



<https://github.com/Tmkantichaaaa03/vmarket\_game>

