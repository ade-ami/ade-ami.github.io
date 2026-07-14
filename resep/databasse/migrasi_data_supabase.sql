-- ==============================================================================
-- SCRIPT MIGRASI DATABASE: DARI MYSQL (LAMA) KE SUPABASE POSTGRESQL (BARU)
-- ==============================================================================

-- 1. Hapus tabel jika sudah ada agar tidak terjadi duplikasi/error
DROP TABLE IF EXISTS resep_bahans CASCADE;
DROP TABLE IF EXISTS reseps CASCADE;
DROP TABLE IF EXISTS konversis CASCADE;
DROP TABLE IF EXISTS bahans CASCADE;
DROP TABLE IF EXISTS ukurans CASCADE;

-- 2. Buat tabel dan masukkan data Satuan/Ukuran (ukurans)
CREATE TABLE ukurans (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    simbol VARCHAR(10) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO ukurans (id, nama, simbol, created_at, updated_at) VALUES
(1, 'Kilogram', 'kg', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(2, 'Gram', 'gr', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(3, 'Miligram', 'mg', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(4, 'Liter', 'L', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(5, 'Mililiter', 'ml', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(6, 'Butir', 'btr', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(7, 'Siung', 'sng', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(8, 'Sendok Makan', 'sdm', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(9, 'Sendok Teh', 'sdt', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(10, 'Pcs', 'pcs', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(11, 'Ikat', 'ikat', '2026-07-02 21:12:01', '2026-07-02 21:12:01'),
(12, 'Buah', 'bh', '2026-07-13 00:50:10', '2026-07-13 00:50:10'),
(13, 'Batang', 'Btg', '2026-07-13 21:51:34', '2026-07-13 21:51:34'),
(14, 'Lembar', 'lbr', '2026-07-13 21:54:47', '2026-07-13 21:54:47');


-- 3. Buat tabel dan masukkan data Bahan Baku (bahans)
CREATE TABLE bahans (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    ukuran_id INT NOT NULL REFERENCES ukurans(id) ON DELETE RESTRICT,
    jumlah_dasar NUMERIC(8,2) NOT NULL DEFAULT 1.00,
    harga_beli NUMERIC(12,2) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO bahans (id, nama, ukuran_id, jumlah_dasar, harga_beli, created_at, updated_at) VALUES
(1, 'Beras Putih Premium', 4, 1.00, 13000.00, '2026-07-02 01:57:57', '2026-07-02 04:09:52'),
(2, 'Telur Ayam Negeri', 6, 16.00, 25000.00, '2026-07-02 01:57:57', '2026-07-13 00:47:17'),
(3, 'Bawang Merah', 2, 1000.00, 55000.00, '2026-07-02 01:57:57', '2026-07-13 01:02:51'),
(4, 'Bawang Putih', 2, 1000.00, 40000.00, '2026-07-02 01:57:57', '2026-07-13 18:48:15'),
(5, 'Minyak Goreng', 5, 1000.00, 18000.00, '2026-07-02 01:57:57', '2026-07-02 21:29:51'),
(7, 'Tepung Tapioka', 2, 1000.00, 12000.00, '2026-07-02 06:55:37', '2026-07-02 21:30:15'),
(8, 'Kangkung', 11, 1.00, 2000.00, '2026-07-02 21:14:38', '2026-07-13 01:00:13'),
(9, 'Masako Ayam', 10, 1.00, 500.00, '2026-07-02 21:15:08', '2026-07-02 21:15:08'),
(10, 'Masako Sapi', 10, 1.00, 500.00, '2026-07-02 21:15:24', '2026-07-02 21:15:24'),
(11, 'Royco Ayam', 10, 1.00, 500.00, '2026-07-02 21:15:54', '2026-07-02 21:15:54'),
(12, 'Masako Sapi', 10, 1.00, 500.00, '2026-07-02 21:16:26', '2026-07-02 21:16:26'),
(13, 'Garam', 2, 250.00, 5000.00, '2026-07-02 21:18:44', '2026-07-02 21:18:44'),
(14, 'Gula Putih', 2, 1000.00, 17500.00, '2026-07-02 21:20:03', '2026-07-02 21:29:33'),
(15, 'Terigu Kunci Mas', 2, 1000.00, 20000.00, '2026-07-13 00:46:48', '2026-07-13 00:53:11'),
(16, 'Santan Kara kecil', 10, 1.00, 3500.00, '2026-07-13 00:48:33', '2026-07-13 00:48:33'),
(17, 'SKM Saschet', 10, 1.00, 2000.00, '2026-07-13 00:49:08', '2026-07-13 00:49:08'),
(18, 'Jeruk Nipis', 12, 1.00, 500.00, '2026-07-13 00:50:29', '2026-07-13 00:50:29'),
(19, 'Indomie Goreng', 10, 1.00, 3000.00, '2026-07-13 03:45:38', '2026-07-13 03:45:38'),
(20, 'Daun Cesym', 2, 500.00, 3000.00, '2026-07-13 03:46:33', '2026-07-13 03:46:33'),
(21, 'Tahu', 10, 1.00, 1000.00, '2026-07-13 03:47:32', '2026-07-13 03:47:32'),
(22, 'Cabai Rawit Merah', 2, 1000.00, 150000.00, '2026-07-13 03:51:51', '2026-07-13 03:51:51'),
(23, 'Tempe', 2, 350.00, 7000.00, '2026-07-13 18:44:27', '2026-07-13 18:59:34'),
(24, 'Sajiku Tepung Bumbu Golden Crispy', 2, 75.00, 3000.00, '2026-07-13 19:17:20', '2026-07-13 19:17:20'),
(25, 'Maizenaku', 2, 100.00, 5000.00, '2026-07-13 19:18:17', '2026-07-13 19:18:17'),
(26, 'Baking Soda', 2, 81.00, 7000.00, '2026-07-13 19:19:12', '2026-07-13 19:19:12'),
(27, 'Sereh', 13, 4.00, 1000.00, '2026-07-13 21:53:14', '2026-07-13 21:55:44'),
(28, 'Daun Salam', 14, 10.00, 1000.00, '2026-07-13 21:55:33', '2026-07-13 21:55:33'),
(29, 'Lengkuas', 2, 100.00, 2500.00, '2026-07-13 21:58:22', '2026-07-13 21:58:22'),
(30, 'Kecap Bango', 10, 12.00, 14000.00, '2026-07-13 22:00:46', '2026-07-13 22:00:46'),
(31, 'Asam Jawa', 2, 1000.00, 45000.00, '2026-07-13 22:03:07', '2026-07-13 22:03:07'),
(32, 'Gula Merah', 2, 1000.00, 24000.00, '2026-07-13 22:05:05', '2026-07-13 22:13:43'),
(33, 'Kemiri', 2, 1000.00, 74000.00, '2026-07-13 22:07:38', '2026-07-13 22:07:38'),
(34, 'Ketumbar', 2, 1000.00, 49500.00, '2026-07-13 22:10:50', '2026-07-13 22:10:50');


-- 4. Buat tabel dan masukkan data Aturan Konversi (konversis)
CREATE TABLE konversis (
    id SERIAL PRIMARY KEY,
    dari_ukuran_id INT NOT NULL REFERENCES ukurans(id) ON DELETE CASCADE,
    ke_ukuran_id INT NOT NULL REFERENCES ukurans(id) ON DELETE CASCADE,
    pengali NUMERIC(10,6) NOT NULL,
    kategori VARCHAR(255) NOT NULL DEFAULT 'massa',
    catatan TEXT,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO konversis (id, dari_ukuran_id, ke_ukuran_id, pengali, kategori, catatan, created_at, updated_at) VALUES
(1, 1, 2, 1000.000000, 'massa', '1 Kg = 1000 Gram', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(2, 2, 3, 1000.000000, 'massa', '1 Gram = 1000 Miligram', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(3, 4, 5, 1000.000000, 'volume', '1 Liter = 1000 Mililiter', '2026-07-02 01:57:57', '2026-07-02 01:57:57'),
(4, 9, 2, 5.000000, 'massa', '1 sdt = 5gram', '2026-07-02 20:55:24', '2026-07-02 20:56:19'),
(5, 9, 1, 0.005000, 'massa', '1 sdt = 0,005kg', '2026-07-02 20:57:40', '2026-07-02 20:58:04'),
(6, 1, 10, 16.000000, 'lainnya', '1 kg = 16pcs', '2026-07-02 20:59:39', '2026-07-02 20:59:39'),
(7, 2, 3, 1000.000000, 'massa', '1 gram = 1000 miligram', '2026-07-02 21:07:18', '2026-07-02 21:07:18'),
(8, 8, 2, 10.000000, 'massa', '1 sdm = 10gram', '2026-07-02 21:08:28', '2026-07-02 21:08:28'),
(9, 11, 2, 250.000000, 'massa', '1 Ikat = 250 gr', '2026-07-02 21:13:52', '2026-07-02 21:13:52');


-- 5. Buat tabel dan masukkan data Master Resep (reseps)
CREATE TABLE reseps (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    porsi_dasar NUMERIC NOT NULL DEFAULT 10,
    cara_masak TEXT,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO reseps (id, nama, porsi_dasar, cara_masak, created_at, updated_at) VALUES
(1, 'Nasi Goreng Spesial', 8, NULL, '2026-07-02 01:57:57', '2026-07-02 06:21:44'),
(2, 'Cilok Kenyal', 100, NULL, '2026-07-02 01:57:57', '2026-07-13 01:35:11'),
(4, 'Sayur Kangkung', 1, NULL, '2026-07-02 21:20:26', '2026-07-02 21:20:26'),
(6, 'OGURA CAKE', 1, NULL, '2026-07-13 00:50:46', '2026-07-13 00:50:46'),
(7, 'Tempe Goreng Crispy', 1, NULL, '2026-07-13 01:04:41', '2026-07-13 18:51:10'),
(8, 'Mie Nyemek', 1, E'Cara Masak :\nMasak Air 300ml tunggu hingga mendidih, setelah sudah mendidih masukan indomie goreng lalu masukan tahu yg di iris dadu, dan masukan telur ayam negri an cabai rawit\nsetelah mie sekira nya sudah mengenyal angkat  lalu saring setelah itu tuangkan ke dalam piring dan bumbuin dan aduk hingga merata,\nsemalat menikmati mie nyemek pedas ala chef dheonz', '2026-07-13 03:47:43', '2026-07-13 21:04:08'),
(9, 'Tahu Tempe Bacem', 10, E'1. Haluskan bahan bumbu kemudian tumis hingga wangi.\n2. Masukkan daun salam, serai geprek dan lengkuas geprek aduk merata.\n3. Masukkan gula merah, kecap dan penyedap rasa, aduk kembali, kemudian masukkan air kelapa, aduk kembali, koreksi rasa.\n4. Tuang air asam jawa, aduk lagi, masukkan tahu dan tempe, aduk agar bumbu merata, biarkan selama kurang lebih 15 menit hingga air menyusup dan bumbu meresap\n5. Setelah bumbu meresap, matikan kompor, bisa langsung disantap atau digoreng hingga kecoklatan.\n6. Setelah digoreng bacem tahu tempe siap dinikmati.', '2026-07-13 21:49:46', '2026-07-13 21:58:45');


-- 6. Buat tabel pivot dan masukkan Komposisi Bahan Resep (resep_bahans)
CREATE TABLE resep_bahans (
    id SERIAL PRIMARY KEY,
    resep_id INT NOT NULL REFERENCES reseps(id) ON DELETE CASCADE,
    bahan_id INT NOT NULL REFERENCES bahans(id) ON DELETE CASCADE,
    jumlah_dibutuhkan NUMERIC(8,2) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO resep_bahans (id, resep_id, bahan_id, jumlah_dibutuhkan, created_at, updated_at) VALUES
(1, 1, 1, 1.00, NULL, NULL),
(2, 1, 2, 8.00, NULL, NULL),
(3, 1, 3, 0.10, NULL, NULL),
(4, 1, 4, 0.05, NULL, NULL),
(6, 2, 4, 0.05, NULL, NULL),
(7, 2, 7, 1000.00, NULL, NULL),
(8, 4, 8, 1.00, NULL, NULL),
(9, 4, 14, 10.00, NULL, NULL),
(10, 4, 13, 5.00, NULL, NULL),
(11, 4, 9, 0.50, NULL, NULL),
(12, 4, 5, 10.00, NULL, NULL),
(13, 4, 3, 1.00, NULL, NULL),
(14, 2, 12, 2.00, NULL, NULL),
(15, 6, 2, 5.00, NULL, NULL),
(16, 6, 17, 2.00, NULL, NULL),
(17, 6, 16, 1.00, NULL, NULL),
(19, 6, 15, 70.00, NULL, NULL),
(20, 6, 13, 2.50, NULL, NULL),
(21, 6, 5, 60.00, NULL, NULL),
(22, 6, 14, 75.00, NULL, NULL),
(23, 6, 18, 1.00, NULL, NULL),
(24, 8, 21, 1.00, NULL, NULL),
(25, 8, 19, 1.00, NULL, NULL),
(26, 8, 2, 1.00, NULL, NULL),
(27, 8, 22, 15.00, NULL, NULL),
(28, 7, 23, 3.50, NULL, NULL),
(29, 7, 13, 0.50, NULL, NULL),
(32, 7, 9, 0.25, NULL, NULL),
(33, 7, 15, 2.00, NULL, NULL),
(34, 7, 25, 0.01, NULL, NULL),
(35, 7, 24, 0.30, NULL, NULL),
(36, 7, 26, 0.01, NULL, NULL),
(37, 9, 23, 350.00, NULL, NULL),
(38, 9, 27, 2.00, NULL, NULL),
(39, 9, 28, 2.00, NULL, NULL),
(40, 9, 30, 1.00, NULL, NULL),
(41, 9, 29, 10.00, NULL, NULL),
(42, 9, 31, 10.00, NULL, NULL),
(43, 9, 32, 100.00, NULL, NULL),
(44, 9, 11, 0.50, NULL, NULL),
(45, 9, 33, 20.00, NULL, NULL),
(46, 9, 3, 30.00, NULL, NULL),
(47, 9, 4, 25.00, NULL, NULL),
(48, 9, 34, 10.00, NULL, NULL),
(49, 9, 13, 10.00, NULL, NULL);


-- ==============================================================================
-- 7. RE-SYNC SEQUENCE IDs (SANGAT PENTING!)
-- Ini akan memberitahu Supabase agar penambahan data baru di web/aplikasi
-- tidak mengalami error duplicate id karena berbenturan dengan data lama.
-- ==============================================================================
SELECT setval('ukurans_id_seq', (SELECT MAX(id) FROM ukurans));
SELECT setval('bahans_id_seq', (SELECT MAX(id) FROM bahans));
SELECT setval('konversis_id_seq', (SELECT MAX(id) FROM konversis));
SELECT setval('reseps_id_seq', (SELECT MAX(id) FROM reseps));
SELECT setval('resep_bahans_id_seq', (SELECT MAX(id) FROM resep_bahans));