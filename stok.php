<?php
session_start(); // Wajib untuk mengambil data user_id dari session
include "koneksi.php";

// LOGIKA BACKEND: Proses simpan data stok
if (isset($_POST['submit'])) {
    $product_id = $_POST['product_id'];
    $change_type = $_POST['change_type'];
    $qty = intval($_POST['qty']);
    $note = mysqli_real_escape_string($conn, $_POST['note']);
    $user_id = $_SESSION['user_id'];

    // Ambil stok sekarang
    $q = mysqli_query($conn, "SELECT stock FROM products WHERE id='$product_id'");
    $data = mysqli_fetch_assoc($q);
    $stock_before = $data['stock'];

    // Hitung stok baru
    if ($change_type == "ADD") {
        $stock_after = $stock_before + $qty;
    } else {
        $stock_after = $stock_before - $qty;
        if ($stock_after < 0) {
            echo "<script>alert('Stok tidak cukup!'); window.location='stok.php';</script>";
            exit;
        }
    }

    // Update stok di tabel produk
    mysqli_query($conn, "UPDATE products SET stock='$stock_after' WHERE id='$product_id'");

    // Catat ke riwayat (stock_logs)
    mysqli_query($conn, "INSERT INTO stock_logs 
        (product_id, change_type, qty, stock_before, stock_after, note, created_by)
        VALUES
        ('$product_id', '$change_type', '$qty', '$stock_before', '$stock_after', '$note', '$user_id')
    ");

    header("Location: stok.php?success=1");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Manajemen Stok - inventory25550023</title>

  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">

  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

  <?php if (isset($_GET['success'])): ?>
      <script>
          alert('Stok berhasil diperbarui!');
      </script>
  <?php endif; ?>

  <header id="header" class="header fixed-top d-flex align-items-center">
    <div class="d-flex align-items-center justify-content-between">
      <a href="index.php" class="logo d-flex align-items-center">
        <img src="assets/img/log0.png" alt="">
        <span class="d-none d-lg-block">inventory25550023</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div>

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">
        <li class="nav-item dropdown pe-3">
          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
          </a>
        </li>
      </ul>
    </nav>
  </header>

  <aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
      <li class="nav-item">
        <a class="nav-link collapsed" href="index.php"><i class="bi bi-grid"></i><span>Dashboard</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="kategori_produk.php"><i class="bi bi-tags"></i><span>Kategori Produk</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="produk.php"><i class="bi bi-box"></i><span>Data Produk</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="laporan.php"><i class="bi bi-file-text"></i><span>Laporan</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="users.php"><i class="bi bi-people"></i><span>Manajemen User</span></a>
      </li>
    </ul>
  </aside>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Manajemen Stok</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
          <li class="breadcrumb-item">Data Produk</li>
          <li class="breadcrumb-item active">Manajemen Stok</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">

        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Form Manajemen Stok</h5>
              <form method="POST">
                <div class="mb-3">
                  <label class="form-label">Pilih Produk</label>
                  <select name="product_id" class="form-select" required>
                    <option selected disabled>-- Pilih Produk --</option>
                    <?php
                    $produk = mysqli_query($conn, "SELECT * FROM products");
                    while ($p = mysqli_fetch_assoc($produk)) {
                        echo "<option value='{$p['id']}'>{$p['product_name']} (Stok: {$p['stock']})</option>";
                    }
                    ?>
                  </select>
                </div>
                <div class="mb-3">
                  <label class="form-label">Jenis Aksi</label>
                  <select name="change_type" class="form-select">
                    <option value="ADD">Tambah Stok</option>
                    <option value="REDUCE">Kurangi Stok</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label class="form-label">Jumlah</label>
                  <input type="number" name="qty" class="form-control" min="1" required>
                </div>
                <div class="mb-3">
                  <label class="form-label">Catatan</label>
                  <textarea name="note" class="form-control" rows="2"></textarea>
                </div>
                <button type="submit" name="submit" class="btn btn-primary w-100">Simpan Perubahan</button>
              </form>
            </div>
          </div>
        </div>

        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Riwayat Perubahan Stok</h5>
              <table class="table table-striped datatable">
                <thead>
                  <tr>
                    <th>Tanggal</th>
                    <th>Produk</th>
                    <th>Aksi</th>
                    <th>Qty</th>
                    <th>User</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $query = mysqli_query($conn, "SELECT sl.*, p.product_name, u.name FROM stock_logs sl 
                                               LEFT JOIN products p ON sl.product_id = p.id 
                                               LEFT JOIN users u ON sl.created_by = u.id 
                                               ORDER BY sl.created_at DESC LIMIT 10");
                  while ($row = mysqli_fetch_assoc($query)) {
                      $badge = ($row['change_type'] == 'ADD') ? 'bg-success' : 'bg-danger';
                      $label = ($row['change_type'] == 'ADD') ? '+' : '-';
                      echo "<tr>
                              <td>".date('d/m/Y H:i', strtotime($row['created_at']))."</td>
                              <td>{$row['product_name']}</td>
                              <td><span class='badge $badge'>$label {$row['change_type']}</span></td>
                              <td>{$row['qty']}</td>
                              <td>{$row['name']}</td>
                            </tr>";
                  }
                  ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>
    </section>

  </main>

  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; 2026 <strong><span>inventory25550023</span></strong>
    </div>
  </footer>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/js/main.js"></script>

  <?php if (isset($_GET['success'])): ?>
    <script>alert('Stok berhasil diperbarui!');</script>
  <?php endif; ?>

</body>

</html>