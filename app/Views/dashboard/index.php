<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <!-- Icon -->
  <link rel="icon" href="img/icon.png" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

  <!-- CSS -->
  <link rel="stylesheet" href="css/style.css">

  <title>Dashboard | Our Inventory</title>
</head>

<body class="bg-light h-100">
  <!-- Sidebar -->
  <div class="d-flex flex-column flex-shrink-0 p-3 text-white dash-side">
    <a href="/" class="d-flex align-items-center justify-content-center mb-md-0 me-md-auto text-white text-decoration-none">
      <img src="img/oi_logo_putih.png" class="dash-logo me-3" alt="">
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li>
        <a href="#" class="nav-link text-white">
          <i class="bi-grid-1x2-fill me-1"></i>
          Dashboard
        </a>
      </li>
      <li>
        <a href="#" class="nav-link text-white">
          <i class="bi-people-fill me-1"></i>
          User
        </a>
      </li>
      <li>
        <a href="#" class="nav-link text-white">
          <i class="bi-archive-fill me-1"></i>
          Peminjaman
        </a>
      </li>
    </ul>
  </div>

  <!-- Main Container -->
  <div class="main">

    <!-- Navbar -->
    <nav class="navbar navbar-light bg-white">
      <div class="container-fluid">
        <a class="navbar-brand ms-auto" href="#">
          <img src="https://img.icons8.com/ios-glyphs/25/2a9d8f/running.png" />
          Logout
        </a>
      </div>
    </nav>

    <!-- Content -->
    <div class="container">
      <div class="container my-5 ms-auto bg-white p-3">
        <div class="row">
          <div class="col">
            <h1>Data User</h1>
          </div>
          <div class="col d-flex justify-content-end">
            <button class="btn btn-col m-1">
              <img src="https://img.icons8.com/ios-glyphs/25/ffffff/add.png" />
              <a href="" class="text-decoration-none text-white">
                Tambah
              </a>
            </button>
          </div>
        </div>

        <!-- Table -->
        <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Nama</th>
              <th scope="col">Username</th>
              <th scope="col">Level</th>
              <th scope="col">Aksi</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>Nana Sukmana</td>
              <td>admin</td>
              <td>Administrator</td>
              <td>
                <button class="btn btn-sm">
                  <img src="https://img.icons8.com/ios-glyphs/20/264653/visible.png" />
                </button>
                <button class="btn btn-sm">
                  <img src="https://img.icons8.com/ios-glyphs/20/E9C46A/pencil--v1.png" />
                </button>
                <button class="btn btn-sm">
                  <img src="https://img.icons8.com/ios-glyphs/20/E76F51/trash--v1.png" />
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>

</html>