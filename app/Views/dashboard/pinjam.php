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
        Buat Peminjaman
      </a>
    </button>
  </div>
</div>

<!-- Table -->
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Peminjam</th>
      <th scope="col">Barang Pinjam</th>
      <th scope="col">Jumlah Pinjam</th>
      <th scope="col">Aksi</th>
    </tr>
  </thead>
  <tbody>
    <?php $i = 1 ?>
    <?php foreach ($pinjam as $data) : ?>
      <tr>
        <th scope="row"><?= $i++; ?></th>
        <td><?= $data['nama']; ?></td>
        <td><?= $data['nama_barang']; ?></td>
        <td><?= $data['jml_pinjam']; ?></td>
        <td>
          <button class="btn btn-sm">
            <a href="/peminjaman/detail/<?= $data['id_pinjam']; ?>">
              <img src="https://img.icons8.com/ios-glyphs/20/264653/visible.png" />
            </a>
          </button>
        </td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>
</div>
<?= $this->endsection(); ?>