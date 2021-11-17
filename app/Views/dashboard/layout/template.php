<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Icon -->
    <link rel="icon" href="<?= base_url('img/icon.png'); ?>" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

    <!-- CSS -->
    <link rel="stylesheet" href="<?= base_url('css/style.css'); ?>">

    <title><?= $title; ?></title>
</head>

<body class="bg-light h-100">
    <?= $this->include('dashboard/layout/sidebar'); ?>

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
                <?= $this->renderSection('content'); ?>
            </div>
        </div>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>

</html>