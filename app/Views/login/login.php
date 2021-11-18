<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />

  <!-- CSS -->
  <link rel="stylesheet" href="css/login.css" />
  <!-- ICON -->
  <link rel="icon" href="img/icon.png" />
  <title>Login | Our Inventory</title>
</head>

<body>
  <div class="container-fluid mb-5">
    <div class="container-fluid logo_section">
      <div class="row">
        <div class="col">
          <img src="img/OI_logo_ijo.png" alt="" class="io_logo" />
        </div>
      </div>
    </div>
    <div class="container-fluid content-section mt-4">
      <div class="row mt-4">
        <div class="col-6 form_section container-hero">
          <img src="img/hero_login.png" alt="" class="hero_login" />
        </div>
        <div class="col-6 form_section">
          <div class="form-wrapper container">
            <form action="<?= base_url(); ?>/login/auth" method="POST">
              <p class="form_title mb-4">Login</p>
              <div class="mb-3 input_wrapper">
                <input type="text" class="form-control form_component mb-4" id="exampleInputUsername1" placeholder="Username" name="username" />
              </div>
              <div class="mb-3">
                <input type="password" class="form-control form_component mb-4" id="exampleInputPassword1" placeholder="Password" name="password" />
              </div>
              <button type="submit" class="btn btn_submit form_component">Submit</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="footer mt-5 position-absolute"></div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html>