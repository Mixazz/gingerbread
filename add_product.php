<!doctype html>
<html lang="ru">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Добавление товара</title>
</head>

<body>
    <div class="container">
        <h1 class="text-center">Добавление товара</h1>
        <div class="row mt-4 justify-content-center">

            <form class="col-8" action="components/add_product_obr.php" method="POST" enctype="multipart/form-data">
                <div class="input-group flex-nowrap mb-1">
                    <div class="input-group-prepend icon">
                        <span class="input-group-text icon" id="addon-wrapping"><i class="fas fa-heading"></i></span>
                    </div>
                    <input type="text" class="form-control" name="title" placeholder="Название товара">
                </div>
                <div class="input-group flex-nowrap mb-1">
                    <div class="input-group-prepend icon">
                        <span class="input-group-text icon" id="addon-wrapping"><i class="fas fa-tag"></i></span>
                    </div>
                    <input type="text" class="form-control" name="price" placeholder="Цена">
                </div>
                <div class="input-group flex-nowrap mb-1">
                    <div class="input-group-prepend icon">
                        <span class="input-group-text" id="addon-wrapping"><i class="far fa-comment"></i></span>
                    </div>
                    <input type="text" class="form-control" name="count" placeholder="Коллитество в коробке">
                </div>
                <div class="input-group flex-nowrap mb-1">
                    <div class="input-group-prepend icon">
                        <span class="input-group-text" id="addon-wrapping"><i class="far fa-comment"></i></span>
                    </div>
                    <input type="text" class="form-control" name="size" placeholder="Размер пряника">
                </div>
                <input type="file" class="form-control-file mb-1" name="picture">
                <input type="submit" class="btn btn-primary btn-block" value="Добавить">
            </form>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>

</html>