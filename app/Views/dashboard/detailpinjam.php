<?= $this->extend('dashboard/layout/template'); ?>

<?= $this->section('content'); ?>
<div class="row">
    <div class="col">
        <h1><?= $page_title; ?></h1>
    </div>
</div>
<div class="row">
    <div class="col-4">
        <img src="<?= base_url(); ?>/img/uploaded/<?= $pinjam['gambar']; ?>" class="w-100" alt="">
        <button class="btn btn-col my-5 ">
            <img src="https://img.icons8.com/ios-glyphs/30/ffffff/chevron-left.png" />
            <a href="<?= base_url('peminjaman'); ?>" class="text-decoration-none text-white">
                Kembali
            </a>
        </button>
        <?php if ($pinjam['tgl_kembali'] == null) : ?>
            <button class="btn btn-col my-5 ">
                <img src="https://img.icons8.com/ios-glyphs/30/ffffff/move-stock.png" />
                <a href="<?= base_url('peminjaman'); ?>/kembali/<?= $pinjam['id_pinjam']; ?>" class="text-decoration-none text-white">
                    Konfirmasi Pengembalian
                </a>
            </button>
        <?php endif ?>
    </div>
    <div class="col-6">
        <h3>Peminjam</h3>
        <?= $pinjam['nama']; ?>
        <h3>Nama Barang</h3>
        <?= $pinjam['nama_barang']; ?>
        <h3>Jumlah Pinjam</h3>
        <?= $pinjam['jml_pinjam']; ?>
        <h3>Tanggal Pinjam</h3>
        <?= $pinjam['tgl_pinjam']; ?>
        <h3>Tanggal Kembali</h3>
        <?= $pinjam['tgl_kembali']; ?>
        <h3>Kondisi</h3>
        <?= $pinjam['kondisi']; ?>
    </div>

</div>
<?= $this->endsection(); ?>