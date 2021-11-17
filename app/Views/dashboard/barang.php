<?= $this->extend('dashboard/layout/template'); ?>

<?= $this->section('content'); ?>
<div class="row">
  <div class="col">
    <h1><?= $table_title; ?></h1>
  </div>
  <div class="col d-flex justify-content-end">
    <button class="btn btn-col m-1">
      <img src="https://img.icons8.com/ios-glyphs/25/ffffff/add.png" />
      <a href="<?= base_url('barang/createbarang'); ?>" class="text-decoration-none text-white">
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
      <th scope="col">Nama Barang</th>
      <th scope="col">Lokasi</th>
      <th scope="col">Jumlah Barang</th>
      <th scope="col">Sumber Dana</th>
      <th scope="col">Aksi</th>
    </tr>
  </thead>
  <tbody>
    <?php $i = 1 ?>
    <?php foreach ($barang as $data) : ?>
      <tr>
        <th scope="row"><?= $i++; ?></th>
        <td><?= $data['nama_barang']; ?></td>
        <td><?= $data['nama_lokasi']; ?></td>
        <td><?= $data['jumlah_barang']; ?></td>
        <td><?= $data['nama_sumber']; ?></td>
        <td>
          <button class="btn btn-sm">
            <img src="https://img.icons8.com/ios-glyphs/20/264653/visible.png" />
          </button>
          <button class="btn btn-sm">
            <img src="https://img.icons8.com/ios-glyphs/20/E9C46A/pencil--v1.png" />
          </button>
          <button class="btn btn-sm">
            <a href="/barang/delete/<?= $data['id_barang']; ?>">
              <img src="https://img.icons8.com/ios-glyphs/20/E76F51/trash--v1.png" />
            </a>
          </button>
        </td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>
</div>
<?= $this->endsection(); ?>