<?= $this->extend('dashboard/layout/template'); ?>

<?= $this->section('content'); ?>
<div class="row">
    <div class="col">
        <h1><?= $page_title; ?></h1>
    </div>
</div>
<div class="row">
    <div class="col-4">
        <img src="<?= base_url(); ?>/img/uploaded/<?= $barang['gambar']; ?>" class="w-100" alt="">
        <button class="btn btn-col my-5 ">
            <img src="https://img.icons8.com/ios-glyphs/30/ffffff/chevron-left.png" />
            <a href="<?= base_url('barang'); ?>" class="text-decoration-none text-white">
                Kembali
            </a>
        </button>
    </div>
    <div class="col-6">
        <h3>Nama Barang</h3>
        <?= $barang['nama_barang']; ?>
        <h3>Spesifikasi</h3>
        <?= $barang['spesifikasi']; ?>
        <h3>Lokasi</h3>
        <?= $barang['nama_lokasi']; ?>
        <h3>Kondisi</h3>
        <?= $barang['kondisi']; ?>
        <h3>Jumlah Barang</h3>
        <?= $barang['jumlah_barang']; ?>
        <h3>Sumber dana</h3>
        <?= $barang['nama_sumber']; ?>
    </div>

</div>
<?= $this->endsection(); ?>