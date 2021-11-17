<?= $this->extend('dashboard/layout/template'); ?>

<?= $this->section('content'); ?>
<div class="row">
    <div class="col-6">
        <h1>Tambah data</h1>
        <form action="<?= base_url('dashboard/savebarang'); ?>" method="POST" enctype="multipart/form-data">
            <?= csrf_field(); ?>
            <div class="mb-3 row">
                <label for="nama_barang" class="col-sm-2 col-form-label">Nama Barang</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="nama_barang" name="nama_barang">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="spesifikasi" class="col-sm-2 col-form-label">Spesifikasi</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="spesifikasi" name="spesifikasi">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="lokasi" class="col-sm-2 col-form-label">Lokasi</label>
                <div class="col-sm-10">
                    <select name="lokasi" id="lokasi" class="form-select" aria-label="Default select example">
                        <?php foreach ($lokasi as $data) : ?>
                            <option value="<?= $data['id_lokasi']; ?>"><?= $data['nama_lokasi']; ?></option>
                        <?php endforeach ?>
                    </select>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="kondisi" class="col-sm-2 col-form-label">Kondisi</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="kondisi" name="kondisi">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="jumlah_barang" class="col-sm-2 col-form-label">Jumlah Barang</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="jumlah_barang" name="jumlah_barang">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="sumber_dana" class="col-sm-2 col-form-label">Sumber Dana</label>
                <div class="col-sm-10">
                    <select name="sumber_dana" id="sumber_dana" class="form-select" aria-label="Default select example">
                        <?php foreach ($sumber as $sumber_dana) : ?>
                            <option value="<?= $sumber_dana['id_sumber']; ?>"><?= $sumber_dana['nama_sumber']; ?></option>
                        <?php endforeach ?>
                    </select>
                </div>
            </div>
            <button type="submit" class="btn btn-col m-1 text-white">
                <img src="https://img.icons8.com/ios-glyphs/25/ffffff/add.png" />
                Tambah
            </button>
        </form>
    </div>
</div>
<?= $this->endsection(); ?>