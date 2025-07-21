CREATE TABLE user (
    id_user INT(10) PRIMARY KEY,
    username VARCHAR(10),
    email VARCHAR(20),
    password VARCHAR(10),
    role ENUM('admin', 'student', 'teacher') NOT NULL DEFAULT 'student',
    full_name VARCHAR(30),
    phone VARCHAR(20),
    NIK VARCHAR(20),
    NISN VARCHAR(20),
    id_kelas INT(10),
)

CREATE TABLE kelas (
    id_kelas INT(10) PRIMARY KEY,
    nama_kelas VARCHAR(20),
    deskripsi TEXT

)

CREATE TABLE ujian (
    id_ujian INT(10) PRIMARY KEY,
    nama_ujian VARCHAR(20),
    deskripsi TEXT(20),
    tanggal_ujian DATE,
    waktu_mulai TIME,
    durasi INT(3),
    jumlah_soal INT(3),
    status ENUM('draft', 'active', 'inactive', 'completed') DEFAULT 'draft',
    passing_score INT(3),
    shuffle_questions BOOLEAN,
    id_user INT(10), --guru pembuat ujian--
    id_kelas VARCHAR(30), -- array of kelas.id_kelas --
)

CREATE TABLE soal (
    id_soal INT(10) PRIMARY KEY,
    id_ujian INT(10),
    nomor_soal INT(3),
    pertanyaan TEXT,
    pilihan_a TEXT,
    pilihan_b TEXT,
    pilihan_c TEXT,
    pilihan_d TEXT,
    pilihan_e TEXT,
    jawaban_benar ENUM('A', 'B', 'C', 'D', 'E'),
    bobot INT(3), -- default 1-
    gambar_url TEXT,
)

CREATE TABLE jawaban_user (
    id_jawaban_user INT(10) PRIMARY KEY,
    id_soal INT(10),
    id_user INT(10),
    jawaban_dipilih ENUM('A', 'B', 'C', 'D', 'E'),
    is_correct BOOLEAN,
    bobot INT(3),
    waktu_jawab TIME,
)

CREATE TABLE hasil_ujian (
    id_hasil_ujian INT(10) PRIMARY KEY,
    id_ujian INT(10),
    id_user INT(10),
    nilai_total INT(3),
    jumlah_benar INT(3),
    jumlah_salah INT(3),
    jumlah_kosong INT(3),
    waktu_mulai TIME,
    waktu_selesai TIME,
    durasi_pengerjaan INT(3),
    status ENUM('in_progress', 'completed', 'timeout', 'cancelled') DEFAULT 'in_progress',
    tanggal DATE,
    is_passed BOOLEAN,
)

-- flow Login
-- flow Admin Mengelola data guru, siswa dan kelas
-- flow Guru Mengelola soal Ujian
-- flow Guru Menjadwalkan Ujian
-- flow Siswa Mengerjakan ujian
-- flow Admin dan Guru Memonitoring Ujian
-- flow Admin, Guru dan Murid Melihat hasil ujian
-- flow Logout