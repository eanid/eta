-- Create database
CREATE DATABASE IF NOT EXISTS CBT
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE CBT;

CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'student', 'teacher') NOT NULL DEFAULT 'student',
    full_name VARCHAR(100),
    phone VARCHAR(20),
    last_login TIMESTAMP NULL,
    NIK VARCHAR(100) NULL,
    NISN VARCHAR(100) NULL,
    kelas_id INT NULL,

) ENGINE=InnoDB;

CREATE TABLE kelas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_kelas VARCHAR(100) NOT NULL,
    deskripsi TEXT

) ENGINE=InnoDB;

CREATE TABLE ujian (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama_ujian VARCHAR(255) NOT NULL,
    deskripsi TEXT,
    tanggal_ujian DATE NOT NULL,
    waktu_mulai TIME NOT NULL DEFAULT '08:00:00',
    durasi INT NOT NULL COMMENT 'Duration in minutes',
    jumlah_soal INT DEFAULT 0,
    status ENUM('draft', 'active', 'inactive', 'completed') DEFAULT 'draft',
    passing_score DECIMAL(5,2) NOT NULL DEFAULT 60.00,
    shuffle_questions BOOLEAN DEFAULT FALSE,
    created_by INT NOT NULL,
    kelas VARCHAR NOT NULL,

    FOREIGN KEY (created_by) REFERENCES user(user_id) ON DELETE CASCADE,
    INDEX idx_tanggal (tanggal_ujian),
    INDEX idx_status (status),
    INDEX idx_created_by (created_by)
) ENGINE=InnoDB;

CREATE TABLE soal (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ujian_id INT NOT NULL,
    nomor_soal INT NOT NULL,
    pertanyaan TEXT NOT NULL,
    pilihan_a VARCHAR(500) NOT NULL,
    pilihan_b VARCHAR(500) NOT NULL,
    pilihan_c VARCHAR(500) NOT NULL,
    pilihan_d VARCHAR(500) NOT NULL,
    pilihan_e VARCHAR(500) NOT NULL,
    jawaban_benar ENUM('A', 'B', 'C', 'D', 'E') NOT NULL,
    bobot DECIMAL(5,2) DEFAULT 1.00,
    kategori VARCHAR(100),
    gambar_url VARCHAR(500),

    FOREIGN KEY (ujian_id) REFERENCES ujian(ujian_id) ON DELETE CASCADE,
    UNIQUE KEY unique_ujian_nomor (ujian_id, nomor_soal),
    INDEX idx_ujian_id (ujian_id),
    INDEX idx_kategori (kategori)
) ENGINE=InnoDB;

CREATE TABLE jawaban_user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hasil_id INT NOT NULL,
    soal_id INT NOT NULL,
    jawaban_dipilih ENUM('A', 'B', 'C', 'D', 'E') NULL,
    is_correct BOOLEAN DEFAULT FALSE,
    waktu_jawab TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (hasil_id) REFERENCES hasil_ujian(hasil_id) ON DELETE CASCADE,
    FOREIGN KEY (soal_id) REFERENCES soal(soal_id) ON DELETE CASCADE,
    UNIQUE KEY unique_hasil_soal (hasil_id, soal_id),
    INDEX idx_hasil_id (hasil_id),
    INDEX idx_soal_id (soal_id),
    INDEX idx_is_correct (is_correct)
) ENGINE=InnoDB;

CREATE TABLE hasil_ujian (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ujian_id INT NOT NULL,
    user_id INT NOT NULL,
    nilai_total DECIMAL(5,2) NOT NULL DEFAULT 0.00,
    jumlah_benar INT DEFAULT 0,
    jumlah_salah INT DEFAULT 0,
    jumlah_kosong INT DEFAULT 0,
    waktu_mulai TIMESTAMP NOT NULL,
    waktu_selesai TIMESTAMP NULL,
    durasi_pengerjaan INT COMMENT 'Actual duration in minutes',
    status ENUM('in_progress', 'completed', 'timeout', 'cancelled') DEFAULT 'in_progress',
    tanggal DATE NOT NULL,
    is_passed BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (ujian_id) REFERENCES ujian(ujian_id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_ujian_attempt (user_id, ujian_id, attempt_number),
    INDEX idx_user_id (user_id),
    INDEX idx_ujian_id (ujian_id),
    INDEX idx_tanggal (tanggal),
    INDEX idx_status (status),
    INDEX idx_is_passed (is_passed)
) ENGINE=InnoDB;