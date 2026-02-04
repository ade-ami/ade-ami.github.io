# 💌 Ami & Ade Digital Wedding Invitation

Sebuah proyek undangan pernikahan digital berbasis web yang modern, responsif, dan interaktif. Proyek ini dikembangkan menggunakan teknologi web standar dan dihosting melalui **GitHub Pages**.

## ✨ Fitur Utama

Proyek ini telah dilengkapi dengan berbagai fitur interaktif untuk meningkatkan pengalaman tamu undangan:

* **🎯 Smart Invitation Generator**: Fitur kustomisasi nama tamu secara otomatis melalui URL, memudahkan pengiriman undangan personal via WhatsApp tanpa perlu banyak file HTML.
* **🎵 Background Music**: Fitur pemutaran musik otomatis (*autoplay*) dengan kontrol *play/pause* untuk membangun suasana romantis saat membuka undangan.
* **📸 Interactive Gallery**: Galeri foto yang responsif dengan fitur *lightbox/zoom* untuk melihat momen bahagia mempelai dengan lebih jelas.
* **✍️ Real-time Guestbook**: Buku tamu terintegrasi yang memungkinkan tamu memberikan ucapan dan doa secara langsung (menggunakan integrasi Google Sheets/Real-time Database).
* **📅 Save the Date**: Integrasi kalender untuk memudahkan tamu menyimpan jadwal acara di perangkat mereka.

## 🚀 Teknologi yang Digunakan

* **Frontend**: HTML5, CSS3 (Custom Animations), JavaScript (ES6)
* **Hosting**: GitHub Pages
* **Database**: Superbase (untuk Guestbook Real-time)
* **Library**: Animate.css, AOS (Animate on Scroll), SweetAlert2

## 🛠️ Cara Penggunaan Generator Nama (WhatsApp)

Untuk mengirimkan undangan secara personal, gunakan format URL berikut:

`https://username.github.io/nama-repo/?to=Nama+Tamu`

Contoh: 
`https://username.github.io/ami-ade-wedding/?to=Susi+dan+Keluarga`

Nama yang dimasukkan pada parameter `to` akan otomatis muncul di halaman sampul undangan.

## 📸 Tampilan
*(Tambahkan screenshot undangan kamu di sini untuk menarik perhatian)*
![Preview Undangan](https://ade-ami.github.io/)

## 🏗️ Struktur Folder
```text
├── assets/
│   ├── css/       # Styling & Animasi
│   ├── js/        # Logika Music, Gallery, & Generator
│   ├── img/       # Foto Galeri & Aset Visual
│   └── music/     # File Audio (.mp3)
├── index.html     # Struktur Utama
└── README.md      # Dokumentasi
