<?= $this->extend('dashboard/layout/template'); ?>

<?= $this->section('content'); ?>

<div class="row">
  <div class="col">
    <h1><?= $table_title; ?></h1>
  </div>
</div>

<!-- Table -->
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Barang</th>
      <th scope="col">Jumlah Masuk</th>
      <th scope="col">Jumlah Keluar</th>
      <th scope="col">Total Barang</th>
    </tr>
  </thead>
  <tbody>
    <?php $i = 1 ?>
    <?php foreach ($stok as $data) : ?>
      <tr>
        <th scope="row"><?= $i++; ?></th>
        <td><?= $data['nama_barang']; ?></td>
        <td><?= $data['jml_masuk']; ?></td>
        <td><?= $data['jml_keluar']; ?></td>
        <td><?= $data['total_barang']; ?></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>
</div>
<?= $this->endsection(); ?>