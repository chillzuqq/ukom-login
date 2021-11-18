<!-- Sidebar -->
<div class="d-flex flex-column flex-shrink-0 p-3 text-white dash-side">
    <a href="<?= base_url('dashboard'); ?>" class="d-flex align-items-center justify-content-center mb-md-0 me-md-auto text-white text-decoration-none">
        <img src="<?= base_url('img/oi_logo_putih.png'); ?>" class="dash-logo me-3" alt="">
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li>
            <a href="<?= base_url('barang'); ?>" class="nav-link text-white">
                <img src="https://img.icons8.com/ios-glyphs/60/ffffff/product.png" style="width: 13%;" />
                Barang
            </a>
        </li>
        <li>
            <a href="<?= base_url('peminjaman'); ?>" class="nav-link text-white">
                <img src="https://img.icons8.com/ios-glyphs/60/ffffff/inventory-flow.png" style="width: 13%;" />
                Peminjaman
            </a>
        </li>
        <li>
            <a href="<?= base_url('lokasi'); ?>" class="nav-link text-white">
                <img src="https://img.icons8.com/ios-glyphs/60/ffffff/place-marker.png" style="width: 13%;" />
                Lokasi
            </a>
        </li>
        <li>
            <a href="<?= base_url('stok'); ?>" class="nav-link text-white">
                <img src="https://img.icons8.com/ios-glyphs/60/ffffff/gallery.png" style="width: 13%;" />
                Stok
            </a>
        </li>
    </ul>
</div>