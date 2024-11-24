# Innersight-Challenge
 Tugas challenge untuk application ke Innersight

Skena Utama dalam tugas ini menampilkan 3 pilihan:
- Challenge 1: Uji Deck
- Challenge 2: Uji Toko
- Challenge 3: Uji Discard

Challenge 1: Uji Deck
------------------------
Data Deck dan Card disimpan dalam file JSON yang dimuat sejak game dijalankan.

Saat tombol "Tampilkan Deck" ditekan akan menampilkan deck yang diambil secara acak dari data deck. Saat "Tutup Deck" ditekan Deck akan disembunyikan.

Challenge 2: Uji Toko
------------------------
Menampilkan Deck pembelian (atas) dan Deck penjualan (bawah)

Membeli Card dari Deck pembelian akan menambahkan Card ke depan (sisi paling kiri) dari Deck penjualan. Koin (di pojok kiri atas) akan berkurang.
Menjual Deck dari Deck penjualan akan menghapus Card dari deck dan menambahkan Koin.

Challenge 3: Uji Discard
------------------------
Menampilkan Deck dalam kondisi khusus yang jika salah satu Card-nya di klik akan menampilkan jendela konfirmasi Discard. Jika dikonfirmasi, Card akan ditandai dan dipindah ke belakang (sisi paling kanan) dari Deck. Jika Card yang berada dalam status Discard ditekan, maka akan muncul konfirmasi untuk mencabut status Discard. Jika dikonfirmasi maka tanda akan dihilangkan, tapi posisi tidak berubah.