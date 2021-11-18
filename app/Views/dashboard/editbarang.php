<?= $this->extend('dashboard/layout/template'); ?>

<?= $this->section('content'); ?>
<div class="row">
    <div class="col-8">
        <h1>Tambah data</h1>
        <form action="<?= base_url('barang/updatebarang'); ?>" method="POST" enctype="multipart/form-data">
            <?= csrf_field(); ?>
            <input type="hidden" name="id_barang" value="<?= $barang['id_barang']; ?>">
            <input type="hidden" name="oldImg" value="<?= $barang['gambar']; ?>">
            <div class="mb-3 row">
                <label for="nama_barang" class="col-sm-2 col-form-label">Nama Barang</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="nama_barang" name="nama_barang" value="<?= $barang['nama_barang']; ?>">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="spesifikasi" class="col-sm-2 col-form-label">Spesifikasi</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="spesifikasi" name="spesifikasi" value="<?= $barang['spesifikasi']; ?>">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="lokasi" class="col-sm-2 col-form-label">Lokasi</label>
                <div class="col-sm-10">
                    <select name="lokasi" id="lokasi" class="form-select" aria-label="Default select example">
                        <option value="<?= $barang['lokasi']; ?> selected"><?= $barang['nama_lokasi']; ?></option>
                        <?php foreach ($lokasi as $data) : ?>
                            <option value="<?= $data['id_lokasi']; ?>"><?= $data['nama_lokasi']; ?></option>
                        <?php endforeach ?>
                    </select>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="kondisi" class="col-sm-2 col-form-label">Kondisi</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="kondisi" name="kondisi" value="<?= $barang['kondisi']; ?>">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="jumlah_barang" class="col-sm-2 col-form-label">Jumlah Barang</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="jumlah_barang" name="jumlah_barang" value="<?= $barang['jumlah_barang']; ?>">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="sumber_dana" class="col-sm-2 col-form-label">Sumber Dana</label>
                <div class="col-sm-10">
                    <select name="sumber_dana" id="sumber_dana" class="form-select" aria-label="Default select example">
                        <option value="<?= $barang['sumber_dana']; ?> selected"><?= $barang['nama_sumber']; ?></option>
                        <?php foreach ($sumber as $sumber_dana) : ?>
                            <option value="<?= $sumber_dana['id_sumber']; ?>"><?= $sumber_dana['nama_sumber']; ?></option>
                        <?php endforeach ?>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <label for="inputImage" class="col-sm-2 col-form-label">Image</label>
                <div class="col-sm-2">
                    <img src="/img/uploaded/<?= $barang['gambar']; ?>" class="img-thumbnail img-preview">
                </div>
                <div class="col-sm-8">
                    <input type="file" class="form-control" id="img" name="img" onchange="previewImg()">
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