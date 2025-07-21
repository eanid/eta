user

+id_user : Int
+username : String
+email : String
+password : String
+role : String
+full_name : String
+phone : String
+NIK : String
+NISN : String
+id_kelas : Int

+login() : void
+logout() : void
+tambahUser() : void
+lihatUser() : void
+editUser() : void
+hapusUser() : void

kelas

+id_kelas : Int
+nama_kelas : String
+deskripsi : String

+tambahKelas() : void
+lihatKelas() : void
+editKelas() : void
+hapusKelas() : void

ujain

+id_ujian : Int
+nama_ujian : String
+deskripsi : String
+tanggal_ujian : Date
+waktu_mulai : Time
+durasi : Int
+jumlah_soal : Int
+status : String
+passing_score : Int
+shuffle_questions : Boolean
+id_user : Int
+id_kelas : Int

+tambahUjian() : void
+lihatUjian() : void
+editUjian() : void
+hapusUjian() : void

soal

+id_hasil_ujian : Int
+id_ujian : Int
+nomor_soal : Int
+pertanyaan : String
+pilihan_a : String
+pilihan_b : String
+pilihan_c : String
+pilihan_d : String
+pilihan_e : String
+jawaban_benar : String
+bobot : Int
+gambar_url : String

+tambahSoal() : void
+lihatSoal() : void
+editSoal() : void
+hapusSoal() : void

jawaban_user

+id_jawaban_user : Int
+id_ujian : Int
+id_user : Int
+jawaban_dipilih : String
+is_correct : Boolean
+waktu_jawab : Time


+tambahJawaban() : void
+lihatJawaban() : void
+editJawaban() : void

hasil_ujian

+id_hasil_ujian : Int
+id_ujian : Int
+id_user : Int
+nilai_total : Int
+jumlah_benar : Int
+jumlah_salah : Int
+jumlah_kosong : Int
+waktu_mulai : Time
+waktu_selesai : Time
+durasi_pengerjaan : Int
+status : String
+tanggal : Date
+is_passed : Boolean

+lihatHasilUjian() : void