<?php
session_start();
$title = 'Аутентификация';
require_once("../components/headerAdmin.php");
?>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-12">
            <h1 class="my-4 text-center"><?= $title ?></h1>
        </div>
        <div class="col-8 ">
            <form action="../components/auth_obr.php" method="POST" class='auth-form'>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text" class="form-control" name="login" placeholder="Введите логин" required>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-unlock-alt"></i></span>
                    </div>
                    <input type="password" class="form-control" name="password" placeholder="Введите пароль" required>
                </div>
                <p class="error-message text-danger"></p>
                <input type="submit" class="btn btn-primary btn-block" value="Войти">
            </form>
            <div class="alert alert-success d-none" role="alert">
            </div>
        </div>
    </div>
</div>
<?php
require_once("../components/footerAdmin.php");
?>