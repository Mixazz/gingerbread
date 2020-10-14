<!-- <?php
      require_once('components/db.php');
      // Выборка по категории
      // SELECT * FROM `products` JOIN `category-products` ON `products`.`id`=`category-products`.`id_product` WHERE `category-products`.`id_caregory`=9
      $result = $mysqli->query("SELECT * FROM `products` WHERE 1 LIMIT 0, 12");
      $products = [];
      while ($row = $result->fetch_assoc()) {

        $products[] = $row;
      }
      ?> -->
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
  <div class="menu__mobile-wrap">
    <div class="menu__mobile">
      <h3>Меню</h3>
      <ul>
        <li>Главная</li>
        <li>Расчитать стоимость</li>
        <li>Каталаг пряников</li>
      </ul>
    </div>
    <div class="menu__mobile-close">X</div>
    <div class="menu__overlay"></div>
  </div>
  <div class="order-wrap">
    <div class="order-form-wrap">
      <div class="order-close">X</div>
      <h4>Отправить заявку</h4>
      <p>В форму заявки напишите ваше пожелание по пряникам их количеству, размерам и т.п.
        или название желаемого набора.</p>
      <p>И я свяжусь с вами в ближайшее время для уточнения информации.</p>
      <form action="components/to_mail.php" method="POST" class="order-form">
        <input type="text" class="input" name="name" placeholder="Введите ваше имя" required>
        <input type="phone" class="input" name="phone" placeholder="Введите ваш телефон" required>
        <textarea name="msg" class="input" id="" cols="30" rows="7"></textarea>
        <input type="text" name="data-procuct" hidden>
        <input type="submit" class="order-button" name="submit" value="Отправить заявку">

      </form>
    </div>

    <div class="order-overlay"></div>
  </div>

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
        </div>
      </div>
      <div class="header__rigth">
        <div class="header-socials header-socials_desktop">
          <p class="header-socials__title">
            Связаться с нами<br />
            в WhatsApp:
          </p>
          <div class="header-socials__items">
            <a class="header-socials__item header-socials__item_whatsapp" href="#"><img src="img/wp.svg" alt="" /></a>
          </div>
        </div>
        <div class="header-menu__open">
          <div class="header-menu__icon"></div>
        </div>
      </div>
    </div>
    <div class="bascet">
      <div class="bascet-button">
        <img src="img/button-card-image.svg" alt="">
        <span class="bascet-span">Корзина</span>
      </div>
      <div class="bascet-goods-wrap">
        <h4>Товары добавленные в корзину</h4>
        <div class="bascet-goods"></div>
        <div class="bascet-summ-wrap">Общая сумма заказа <span class="bascet-summ"></span> руб</div>
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
          <li class="all-products" data-category="1000">Все пряники</li>
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
      </div>
      <a href="" class="next-products" data-start="0">Показать еще</a>
    </div>
    </div>
  </section>
  <section class="clients"></section>
  <section class="order"></section>
  <footer>
    <div class="container">
      <div class="footer-block">
        <div class="footer-logo">
          <img src="img/logo.png" alt="Logo">
        </div>
        <nav class="footer-nav">
          <a href="#" class="footer-link">Корпоративные заказы</a>
          <a href="#" class="footer-link">Имбирные пряники на свадьбу</a>
          <a href="#" class="footer-link">Пищевая печать на пряниках</a>
          <a href="#" class="footer-link">Пряники ручной работы</a>
        </nav>
        <div class="social-links">
          <a href="" class="social-link"><img src="img/instagram.svg" alt="instagram"></a>
          <a href="" class="social-link"><img src="img/facebook.svg" alt="facebook"></a>
          <a href="" class="social-link"><img src="img/vk.svg" alt="vkontakte"></a>
        </div>
      </div>
    </div>
  </footer>
</body>

</html>