<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Оформление заказа</title>
  <link rel="stylesheet" href="css/style.css" />
</head>

<body>
  <div class="container order-bascet-wrap">
    <h1>Оформить заказ</h1>
    <div class="order-bascet bascet-goods">

    </div>
    <div class="bascet-summ-wrap">Общая сумма заказа <span class="bascet-summ"></span> руб</div>
    <div class="order-form-wrap">
      <form class="order-form">
        <input type="text" class="input" name="name" placeholder="Введите ваше имя" required>
        <input type="phone" class="input" name="phone" placeholder="Введите ваш телефон" required>
        <textarea name="msg" class="input" id="" cols="30" rows="7" placeholder="Напишите ваше вообщение"></textarea>
        <input type="text" name="data-order" class="data-order" hidden>
        <input type="submit" class="order-button" name="submit" value="Отправить заявку">
      </form>
    </div>
  </div>

  <script src="js/order.js"></script>
</body>

</html>