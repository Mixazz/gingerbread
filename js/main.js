
window.onscroll = () => scroll();

// Запрос в базу данных
let caregoryButtons = document.querySelectorAll('.products-category__list li');
for (let categoryButton of caregoryButtons) {
  categoryButton.onclick = function (e) {
    let response = fetch(`components/show_products.php?category=${e.target.dataset.category}`)
      .then(function (response) {
        return response.json();
      })
      .then(function (result) {
        showCaralog(result);

      });
  };
}


function scroll() {
  const progressLine = document.querySelector('.progress-line');
  progressLine.style.display = 'block';
  let winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  let height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  let scrolled = (winScroll / height) * 100;
  progressLine.style.width = scrolled + "%";
}

function showCaralog(goods) {
  const productsContainer = document.querySelector(".products__container");
  productsContainer.innerHTML = '';
  let goodsList = '';
  if (goods.length == 0) {
    goodsList += `
        <string>В данной категории нет товаров!</string>
        `;
  }

  for (let item of goods) {
    goodsList += `
        <div class="product">
            <h3 class="product-h3">Пряники медали</h3>
            <div class="product-img__wrap">
              <img class="product-img" src="${item.img_url}" alt="${item.title}" />
            </div>
            <ul class="product__property">
              <li class="product-count">
                <p>${item.p_count}</p>
              </li>
              <li class="product-size">
                <p>${item.p_seze}</p>
              </li>
              <li class="product-price">
                <p>${item.p_price}</p>
              </li>
            </ul>
            <a href="#" class="product__btn">Заказать</a>
          </div>
        `;
  }
  productsContainer.innerHTML = goodsList;
  goodsList = '';
}



// Показать еще товары
const nextProductsBtn = document.querySelector('.next-products');
nextProductsBtn.onclick = nextProducts;


function nextProducts(e) {
  e.preventDefault();
  let response = fetch(`components/next_products.php`)
    .then(function (response) {
      return response.json();
    })
    .then(function (result) {
      const productsContainer = document.querySelector(".products__container");
      let goodsList = '';
      if (result.length == 0) {
        goodsList += `
            <string>В данной категории нет товаров!</string>
            `;
      }

      for (let item of result) {
        goodsList += `
            <div class="product">
                <h3 class="product-h3">Пряники медали</h3>
                <div class="product-img__wrap">
                  <img class="product-img" src="${item.img_url}" alt="${item.title}" />
                </div>
                <ul class="product__property">
                  <li class="product-count">
                    <p>${item.p_count}</p>
                  </li>
                  <li class="product-size">
                    <p>${item.p_seze}</p>
                  </li>
                  <li class="product-price">
                    <p>${item.p_price}</p>
                  </li>
                </ul>
                <a href="#" class="product__btn">Заказать</a>
              </div>
            `;
      }
      productsContainer.innerHTML += goodsList;
      goodsList = '';
    });
}

let btnMenuOpen = document.querySelector(".header-menu__open");
let mobileMenu = document.querySelector(".menu__mobile-wrap");
let mobileMenuOverlay = document.querySelector(".menu__overlay");
let mobileMenuClose = document.querySelector(".menu__mobile-close")

btnMenuOpen.onclick = function () {
  mobileMenu.style.display = 'block';
}
mobileMenuClose.onclick = function () {
  closeMenu();
}
mobileMenuOverlay.onclick = function () {
  closeMenu();
}

function closeMenu () {
  mobileMenu.style.display = 'none';
}