<?php
require_once('components/db.php');
// Выборка по категории
// SELECT * FROM `products` JOIN `category-products` ON `products`.`id`=`category-products`.`id_product` WHERE `category-products`.`id_caregory`=9
$result = $mysqli->query("SELECT * FROM `products` WHERE 1");
$products = [];
while ($row = $result->fetch_assoc()) {

  $products[] = $row;
}
?>
<!DOCTYPE html>
<html lang="ru">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Имбирные пряники ручной работы от AnutaCookie</title>
  <link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="css/style.css" />
  <script src="js/main.js" defer></script>
</head>

<body>
  <div class="progress-line"></div>
  <header class="header">
    <div class="header__container">
      <div class="headeer__left">
        <a class="header-logo" href="./">
          <img class="header-logo__logo" src="img/logo.png" alt="" />
          <p class="header-logo__description">
            Имбирные пряники ручной работы<br />
            с доставкой по Москве и всей России
          </p>
        </a>
      </div>
      <div class="header__center">
        <div class="header-menu">
          <ul class="header-menu__list">
            <li class="header-menu__list-item">
              <a class="header-menu__list-link scroll-to" href="#promo">Главная</a>
            </li>

            <li class="header-menu__list-item">
              <a class="header-menu__list-link scroll-to header-menu__list-link_active" href="#buy-2">Расчитать
                стоимость</a>
            </li>
            <li class="header-menu__list-item">
              <a class="header-menu__list-link scroll-to header-menu__list-link_active" href="#buy-2">Каталог
                пряников</a>
            </li>
          </ul>
          <div class="header-contacts header-contacts_mobile"></div>
        </div>
      </div>
      <div class="header__rigth">
        <div class="header-socials header-socials_desktop">
          <p class="header-socials__title">
            Связаться с нами<br />
            в WhatsApp:
          </p>
          <div class="header-socials__items">
            <a class="header-socials__item header-socials__item_whatsapp" href="#"><img src="/img/wp.svg" alt="" /></a>
          </div>
        </div>
        <div class="header-menu__open">
          <div class="header-menu__icon"></div>
        </div>
      </div>
    </div>
  </header>
  <section class="promo">
    <div class="container">
      <div class="promo__container">
        <h1>
          Имбирные пряники ручной работы<br />
          от AnutaCookie
        </h1>
        <div class="promo-advantages">
          <div class="promo-advantages__item">
            <div class="promo-advantages__item-col_left">
              <div class="promo-advantages__item-icon-container">
                <img src="img/mixer.svg" alt="" class="promo-advantages__item-icon" />
              </div>
            </div>
            <div class="promo-advantages__item-right">
              <p class="promo-advantages__item-title">
                Ручная роспись на пряниках
              </p>
            </div>
          </div>
          <div class="promo-advantages__item">
            <div class="promo-advantages__item-col_left">
              <div class="promo-advantages__item-icon-container">
                <img src="img/mixer.svg" alt="" class="promo-advantages__item-icon" />
              </div>
            </div>
            <div class="promo-advantages__item-right">
              <p class="promo-advantages__item-title">
                Пищевая печать на пряниках
              </p>
            </div>
          </div>
          <div class="promo-advantages__item">
            <div class="promo-advantages__item-col_left">
              <div class="promo-advantages__item-icon-container">
                <img src="img/handshake.svg" alt="" class="promo-advantages__item-icon" />
              </div>
            </div>
            <div class="promo-advantages__item-right">
              <p class="promo-advantages__item-title">Корпоративные заказы</p>
            </div>
          </div>
        </div>
        <div class="promo__button-container">
          <button class="button">Быстрый расчет</button>
        </div>
      </div>
    </div>
    <div class="promo__blackout">
      <img class="img3" src="img/bg-after.png" alt="" />
    </div>
  </section>
  <section class="products">
    <div class="container">
      <h2>Каталог пряников</h2>
      <div class="products-category">
        <ul class="products-category__list">
          <li data-category="1000">Все пряники</li>
          <li data-category="1">Корпоративные</li>
          <li data-category="2">14 ферваля</li>
          <li data-category="3">23 ферваля</li>
          <li data-category="4">8 марта</li>
          <li data-category="5">С фотопечатью</li>
          <li data-category="6">Пряники на торт</li>
          <li data-category="7">На свадьбу</li>
          <li data-category="12">Тематические</li>
          <li data-category="8">День учителя / воспитателя</li>
          <li data-category="9">В школу</li>
          <li data-category="10">День рождение</li>
          <li data-category="11">Новый год</li>
        </ul>
      </div>
    </div>

    <div class="container">
      <div class="products__container">
        <?php foreach ($products as $item) : ?>

          <div class="product">
            <h3 class="product-h3">Пряники медали</h3>
            <div class="product-img__wrap">
              <img class="product-img" src="<?= $item['img_url'] ?>" alt="<?= $item['title'] ?>" />
            </div>
            <ul class="product__property">
              <li class="product-count">
                <p><?= $item['p_count'] ?></p>
              </li>
              <li class="product-size">
                <p><?= $item['p_seze'] ?></p>
              </li>
              <li class="product-price">
                <p><?= $item['p_price'] ?></p>
              </li>
            </ul>
            <a href="#" class="product__btn">Заказать</a>
          </div>
        <?php endforeach; ?>
      </div>
      <a href="" class="next-products">Показать еще</a>
    </div>
    </div>
  </section>
  <section class="clients"></section>
  <section class="order"></section>
  <footer>
    <div class="conrainer">

    </div>
  </footer>
</body>

</html>