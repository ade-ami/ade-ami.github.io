# 💌 Ami & Ade Digital Wedding Invitation

[![Live Demo](https://img.shields.io/badge/demo-live-brightgreen)](https://ade-ami.github.io/)
[![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/username/nama-repo/blob/master/LICENSE)

Sebuah proyek undangan pernikahan digital yang elegan, responsif, dan interaktif. Dibuat khusus untuk momen bahagia **Ami & Ade**, undangan ini dirancang untuk memberikan pengalaman terbaik bagi para tamu undangan menggunakan GitHub Pages.

---

## ✨ Fitur Utama

Proyek ini dilengkapi dengan berbagai fitur modern:

* **🎯 Smart WhatsApp Generator**: Kirim undangan personal tanpa ribet. Nama tamu akan muncul otomatis di halaman depan berdasarkan parameter URL.
* **🎵 Background Music**: Fitur pemutaran musik otomatis (*autoplay*) untuk memperkuat suasana romantis.
* **📸 Interactive Gallery**: Galeri foto yang bersih dengan fitur *zoom* dan *lightbox*.
* **✍️ Real-time Guestbook**: Buku tamu interaktif menggunakan database (Supabase) agar tamu bisa mengirim doa secara langsung.
* **📅 Save the Date**: Fitur pengingat kalender agar tamu tidak melewatkan hari bahagia ini.

---

## 📸 Preview Tampilan

Berikut adalah cuplikan tampilan undangan:

<p align="center">
  <img src="img/ss.png" alt="Preview Undangan Ami Ade" width="400">
</p>

---

## 🚀 Cara Penggunaan Generator Nama 

<p align="center">
  <img src="img/wa.png" alt="Preview Undangan Ami Ade" width="400">
</p>

Untuk memasukkan nama tamu yang akan diundang agar muncul secara otomatis di halaman sampul, silakan gunakan link generator berikut:


[https://ade-ami.github.io/generator.html](https://ade-ami.github.io/generator.html)

---

## 🛠️ Konfigurasi Supabase (Database Guestbook)
Untuk mengaktifkan fitur buku tamu, silakan salin dan tempel perintah berikut ke dalam SQL Editor di Dashboard Supabase Anda:

1. Membuat Tabel Guestbook
Gunakan kode ini untuk membuat tabel dengan kolom yang sesuai dengan fungsi entry di JavaScript:

<div _ngcontent-ng-c3186109008="" class="code-block ng-tns-c3186109008-296 ng-animate-disabled ng-trigger ng-trigger-codeBlockRevealAnimation" jslog="223238;track:impression,attention;BardVeMetadataKey:[[&quot;r_fa4001de816eec58&quot;,&quot;c_649b4c73a47bc21c&quot;,null,&quot;rc_e318524f2ef909d9&quot;,null,null,&quot;id&quot;,null,1,null,null,1,0]]" style="display: block;" data-hveid="0" decode-data-ved="1" data-ved="0CAAQhtANahgKEwi4xJXb3r6SAxUAAAAAHQAAAAAQ5wg"><div _ngcontent-ng-c3186109008="" class="code-block-decoration header-formatted gds-title-s ng-tns-c3186109008-296 ng-star-inserted" style=""><span _ngcontent-ng-c3186109008="" class="ng-tns-c3186109008-296">SQL</span><div _ngcontent-ng-c3186109008="" class="buttons ng-tns-c3186109008-296 ng-star-inserted"><button _ngcontent-ng-c3186109008="" aria-label="Salin kode" mat-icon-button="" mattooltip="Salin kode" class="mdc-icon-button mat-mdc-icon-button mat-mdc-button-base mat-mdc-tooltip-trigger copy-button ng-tns-c3186109008-296 mat-unthemed ng-star-inserted" mat-ripple-loader-class-name="mat-mdc-button-ripple" mat-ripple-loader-centered="" jslog="179062;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_fa4001de816eec58&quot;,&quot;c_649b4c73a47bc21c&quot;,null,&quot;rc_e318524f2ef909d9&quot;,null,null,&quot;id&quot;,null,1,null,null,1,0]];mutable:true"><span class="mat-mdc-button-persistent-ripple mdc-icon-button__ripple"></span><mat-icon _ngcontent-ng-c3186109008="" role="img" fonticon="content_copy" class="mat-icon notranslate gds-icon-s google-symbols mat-ligature-font mat-icon-no-color" aria-hidden="true" data-mat-icon-type="font" data-mat-icon-name="content_copy"></mat-icon><span class="mat-focus-indicator"></span><span class="mat-mdc-button-touch-target"></span><span class="mat-ripple mat-mdc-button-ripple"></span></button><!----><!----></div><!----></div><!----><div _ngcontent-ng-c3186109008="" class="formatted-code-block-internal-container ng-tns-c3186109008-296"><div _ngcontent-ng-c3186109008="" class="animated-opacity ng-tns-c3186109008-296"><pre _ngcontent-ng-c3186109008="" class="ng-tns-c3186109008-296"><code _ngcontent-ng-c3186109008="" role="text" data-test-id="code-content" class="code-container formatted ng-tns-c3186109008-296"><span class="hljs-comment">-- Membuat tabel pesan/buku tamu</span>
<span class="hljs-keyword">CREATE</span> <span class="hljs-keyword">TABLE</span> guestbook (
  id <span class="hljs-type">bigint</span> <span class="hljs-keyword">primary</span> key generated always <span class="hljs-keyword">as</span> <span class="hljs-keyword">identity</span>,
  name text <span class="hljs-keyword">not</span> <span class="hljs-keyword">null</span>,
  message text <span class="hljs-keyword">not</span> <span class="hljs-keyword">null</span>,
  created_at timestamptz <span class="hljs-keyword">default</span> now()
);

<span class="hljs-comment">-- Mengaktifkan akses publik (Insert &amp; Select) </span>
<span class="hljs-comment">-- Pastikan untuk mengatur Policy di bagian Authentication &gt; Policies</span>
</code></pre><!----></div></div></div>

-- Aktifkan Row Level Security (RLS)
alter table guestbook enable row level security;

2. Mengatur Izin Akses (Policies)
Berikan izin agar pengunjung (anonim) bisa membaca dan mengirim ucapan:

<div _ngcontent-ng-c3186109008="" class="code-block ng-tns-c3186109008-326 ng-animate-disabled ng-trigger ng-trigger-codeBlockRevealAnimation" jslog="223238;track:impression,attention;BardVeMetadataKey:[[&quot;r_dd6721f3aa884f8e&quot;,&quot;c_dc44b2989e469fcc&quot;,null,&quot;rc_4eda05437c5cd393&quot;,null,null,&quot;id&quot;,null,1,null,null,1,0]]" style="display: block;" data-hveid="0" decode-data-ved="1" data-ved="0CAAQhtANahgKEwi4xJXb3r6SAxUAAAAAHQAAAAAQjwk"><div _ngcontent-ng-c3186109008="" class="code-block-decoration header-formatted gds-title-s ng-tns-c3186109008-326 ng-star-inserted" style=""><span _ngcontent-ng-c3186109008="" class="ng-tns-c3186109008-326">SQL</span><div _ngcontent-ng-c3186109008="" class="buttons ng-tns-c3186109008-326 ng-star-inserted"><button _ngcontent-ng-c3186109008="" aria-label="Salin kode" mat-icon-button="" mattooltip="Salin kode" class="mdc-icon-button mat-mdc-icon-button mat-mdc-button-base mat-mdc-tooltip-trigger copy-button ng-tns-c3186109008-326 mat-unthemed ng-star-inserted" mat-ripple-loader-class-name="mat-mdc-button-ripple" mat-ripple-loader-centered="" jslog="179062;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_dd6721f3aa884f8e&quot;,&quot;c_dc44b2989e469fcc&quot;,null,&quot;rc_4eda05437c5cd393&quot;,null,null,&quot;id&quot;,null,1,null,null,1,0]];mutable:true"><span class="mat-mdc-button-persistent-ripple mdc-icon-button__ripple"></span><mat-icon _ngcontent-ng-c3186109008="" role="img" fonticon="content_copy" class="mat-icon notranslate gds-icon-s google-symbols mat-ligature-font mat-icon-no-color" aria-hidden="true" data-mat-icon-type="font" data-mat-icon-name="content_copy"></mat-icon><span class="mat-focus-indicator"></span><span class="mat-mdc-button-touch-target"></span><span class="mat-ripple mat-mdc-button-ripple"></span></button><!----><!----></div><!----></div><!----><div _ngcontent-ng-c3186109008="" class="formatted-code-block-internal-container ng-tns-c3186109008-326"><div _ngcontent-ng-c3186109008="" class="animated-opacity ng-tns-c3186109008-326"><pre _ngcontent-ng-c3186109008="" class="ng-tns-c3186109008-326"><code _ngcontent-ng-c3186109008="" role="text" data-test-id="code-content" class="code-container formatted ng-tns-c3186109008-326"><span class="hljs-comment">-- Izinkan semua orang (anonim) untuk melihat ucapan</span>
<span class="hljs-keyword">create</span> policy "Siapa pun bisa melihat ucapan" 
<span class="hljs-keyword">on</span> guestbook <span class="hljs-keyword">for</span> <span class="hljs-keyword">select</span> 
<span class="hljs-keyword">using</span> (<span class="hljs-literal">true</span>);

<span class="hljs-comment">-- Izinkan semua orang (anonim) untuk mengirim ucapan</span>
<span class="hljs-keyword">create</span> policy "Siapa pun bisa mengirim ucapan" 
<span class="hljs-keyword">on</span> guestbook <span class="hljs-keyword">for</span> <span class="hljs-keyword">insert</span> 
<span class="hljs-keyword">with</span> <span class="hljs-keyword">check</span> (<span class="hljs-literal">true</span>);
</code></pre><!----></div></div></div>

-- Izinkan semua orang (anonim) untuk mengirim ucapan
create policy "Siapa pun bisa mengirim ucapan" 
on guestbook for insert 
with check (true);
💡 Tips Integrasi
Ganti Credentials: Masukkan SUPABASE_URL dan SUPABASE_ANON_KEY asli dari menu Project Settings > API ke dalam file JavaScript Anda.

Case Sensitivity: Perhatikan penggunaan tanda kutip dua (contoh: "Nama") pada SQL agar sesuai dengan variabel JavaScript yang menggunakan huruf kapital di depan.

---

## 📂 Struktur Folder
<div _ngcontent-ng-c3186109008="" class="code-block ng-tns-c3186109008-356 ng-animate-disabled ng-trigger ng-trigger-codeBlockRevealAnimation" jslog="223238;track:impression,attention;BardVeMetadataKey:[[&quot;r_0cec7c5953ada691&quot;,&quot;c_649b4c73a47bc21c&quot;,null,&quot;rc_246e8b5d48528c7b&quot;,null,null,&quot;id&quot;,null,1,null,null,1,0]]" style="display: block;" data-hveid="10"><div _ngcontent-ng-c3186109008="" class="code-block-decoration header-formatted gds-title-s ng-tns-c3186109008-356 ng-star-inserted" style=""><span _ngcontent-ng-c3186109008="" class="ng-tns-c3186109008-356">Plaintext</span><div _ngcontent-ng-c3186109008="" class="buttons ng-tns-c3186109008-356 ng-star-inserted"><button _ngcontent-ng-c3186109008="" aria-label="Salin kode" mat-icon-button="" mattooltip="Salin kode" class="mdc-icon-button mat-mdc-icon-button mat-mdc-button-base mat-mdc-tooltip-trigger copy-button ng-tns-c3186109008-356 mat-unthemed ng-star-inserted" mat-ripple-loader-uninitialized="" mat-ripple-loader-class-name="mat-mdc-button-ripple" mat-ripple-loader-centered="" jslog="179062;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_0cec7c5953ada691&quot;,&quot;c_649b4c73a47bc21c&quot;,null,&quot;rc_246e8b5d48528c7b&quot;,null,null,&quot;id&quot;,null,1,null,null,1,0]];mutable:true"><span class="mat-mdc-button-persistent-ripple mdc-icon-button__ripple"></span><mat-icon _ngcontent-ng-c3186109008="" role="img" fonticon="content_copy" class="mat-icon notranslate gds-icon-s google-symbols mat-ligature-font mat-icon-no-color" aria-hidden="true" data-mat-icon-type="font" data-mat-icon-name="content_copy"></mat-icon><span class="mat-focus-indicator"></span><span class="mat-mdc-button-touch-target"></span></button><!----><!----></div><!----></div><!----><div _ngcontent-ng-c3186109008="" class="formatted-code-block-internal-container ng-tns-c3186109008-356"><div _ngcontent-ng-c3186109008="" class="animated-opacity ng-tns-c3186109008-356"><pre _ngcontent-ng-c3186109008="" class="ng-tns-c3186109008-356"><code _ngcontent-ng-c3186109008="" role="text" data-test-id="code-content" class="code-container formatted ng-tns-c3186109008-356">├── index.html          # Halaman utama undangan
├── generator.html      # Halaman generator nama tamu
├── css/                # File styling
├── js/                 # Logika interaksi &amp; integrasi Supabase
├── img/                # Asset gambar &amp; galeri
└── audio/              # Background music (mp3)
</code></pre><!----></div></div></div>

---

## 📜 Lisensi
Proyek ini dilisensikan di bawah MIT License.

Dibuat dengan ❤️ untuk Ami & Ade.
