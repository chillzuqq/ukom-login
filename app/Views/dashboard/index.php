<?= $this->extend('dashboard/layout/template'); ?>

<?= $this->section('content'); ?>

<div class="row">
  <div class="col">
    <h1>Data User</h1>
  </div>
  <div class="col d-flex justify-content-end">
    <button class="btn btn-col m-1">
      <img src="https://img.icons8.com/ios-glyphs/25/ffffff/add.png" />
      <a href="" class="text-decoration-none text-white">
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
      <th scope="col">Nama</th>
      <th scope="col">Username</th>
      <th scope="col">Level</th>
      <th scope="col">Aksi</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Nana Sukmana</td>
      <td>admin</td>
      <td>Administrator</td>
      <td>
        <button class="btn btn-sm">
          <img src="https://img.icons8.com/ios-glyphs/20/264653/visible.png" />
        </button>
        <button class="btn btn-sm">
          <img src="https://img.icons8.com/ios-glyphs/20/E9C46A/pencil--v1.png" />
        </button>
        <button class="btn btn-sm">
          <img src="https://img.icons8.com/ios-glyphs/20/E76F51/trash--v1.png" />
        </button>
      </td>
    </tr>
  </tbody>
</table>
</div>
<?= $this->endsection(); ?>