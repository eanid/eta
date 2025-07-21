user

+id INT
+username VARCHAR
+email VARCHAR
+password VARCHAR
+role ENUM('admin', 'student', 'teacher')
+full_name VARCHAR
+phone VARCHAR
+last_login TIMESTAMP
+NIK VARCHAR
+NISN VARCHAR
+kelas_id INT

+register ()
+login ()
+insert_data ()
+update_data ()


kelas

+id INT
+nama_kelas VARCHAR
+deskripsi TEXT

+insert_data ()
+update_data ()

ujian

+id INT
+nama_ujian VARCHAR
+deskripsi TEXT
+tanggal_ujian DATE
+waktu_mulai TIME
+durasi INT
+jumlah_soal INT
+status ENUM('draft', 'active', 'inactive', 'completed')
+passing_score DECIMAL
+shuffle_questions BOOLEAN
+created_by INT
+kelas VARCHAR

+insert_data ()
+update_data ()

soal

+id INT
+ujian_id INT
+nomor_soal INT
+pertanyaan TEXT
+pilihan_a VARCHAR
+pilihan_b VARCHAR
+pilihan_c VARCHAR
+pilihan_d VARCHAR
+pilihan_e VARCHAR
+jawaban_benar ENUM('A' 'B', 'C', 'D', 'E')
+bobot DECIMAL
+kategori VARCHAR
+gambar_url VARCHAR

+insert_data ()
+update_data ()


jawaban_user

+id INT
+hasil_id INT
+soal_id INT
+jawaban_dipilih ENUM('A', 'B', 'C', 'D', 'E')
+is_correct BOOLEAN
+waktu_jawab TIMESTAMP

+insert_data ()
+update_data ()


hasil_ujian

+id INT
+ujian_id INT
+user_id INT
+nilai_total DECIMAL
+jumlah_benar INT
+jumlah_salah INT
+jumlah_kosong INT
+waktu_mulai TIMESTAMP
+waktu_selesai TIMESTAMP
+durasi_pengerjaan INT
+status ENUM('in_progress', 'completed', 'timeout', 'cancelled')
+tanggal DATE
+is_passed BOOLEAN

+insert_data ()