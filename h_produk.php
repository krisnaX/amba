<?php
include "koneksi.php";

$id = $_GET['id'];

// 1. Ambil nama file gambar dari database sebelum datanya dihapus
$get    = mysqli_query($conn, "SELECT gambar FROM products WHERE id='$id'");
$data   = mysqli_fetch_array($get);
$gambar = $data['gambar'];

// 2. Hapus file gambar secara fisik dari folder jika file tersebut ada
if ($gambar != "" && file_exists("produk_img/" . $gambar)) {
    unlink("produk_img/" . $gambar);
}

// 3. Hapus data produk dari database
$hapus = mysqli_query($conn, "DELETE FROM products WHERE id='$id'");

// 4. Berikan notifikasi hasil proses
if ($hapus) {
    echo "<script>alert('Data berhasil dihapus!')</script>";
    header("refresh:0; produk.php");
} else {
    echo "<script>alert('Data gagal dihapus!')</script>";
    header("refresh:0; produk.php");
}
?>
