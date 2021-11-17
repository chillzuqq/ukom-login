<!-- Sidebar -->
<div class="d-flex flex-column flex-shrink-0 p-3 text-white dash-side">
    <a href="<?= base_url('dashboard'); ?>" class="d-flex align-items-center justify-content-center mb-md-0 me-md-auto text-white text-decoration-none">
        <img src="<?= base_url('img/oi_logo_putih.png'); ?>" class="dash-logo me-3" alt="">
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li>
            <a href="<?= base_url('dashboard'); ?>" class="nav-link text-white">
                <i class="bi-grid-1x2-fill me-1"></i>
                Dashboard
            </a>
        </li>
        <li>
            <a href="<?= base_url('dashboard/barang'); ?>" class="nav-link text-white">
                <i class="bi-people-fill me-1"></i>
                Barang
            </a>
        </li>
        <li>
            <a href="<?= base_url('dashboard/peminjaman'); ?>" class="nav-link text-white">
                <i class="bi-archive-fill me-1"></i>
                Peminjaman
            </a>
        </li>
    </ul>
</div>