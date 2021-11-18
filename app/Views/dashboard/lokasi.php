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
      <th scope="col">Lokasi</th>
      <th scope="col">Penanggung Jawab</th>
      <th scope="col">Keterangan</th>
      <th scope="col">Aksi</th>
    </tr>
  </thead>
  <tbody>
    <?php $i = 1 ?>
    <?php foreach ($lokasi as $data) : ?>
      <tr>
        <th scope="row"><?= $i++; ?></th>
        <td><?= $data['nama_lokasi']; ?></td>
        <td><?= $data['penanggung_jawab']; ?></td>
        <td><?= $data['keterangan']; ?></td>
        <td>
          <button class="btn btn-sm">
            <a href="/lokasi/edit/<?= $data['id_lokasi']; ?>">
              <img src="https://img.icons8.com/ios-glyphs/20/E9C46A/pencil--v1.png" />
            </a>
          </button>
          <button class="btn btn-sm" onclick="alert('Apakah anda yakin menghapus data ini?')">
            <a href="/lokasi/delete/<?= $data['id_lokasi']; ?>">
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