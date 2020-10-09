
window.onscroll = () => scroll();
let categoryNumber;
let pageProducts;
let quantityProduct = 12;

// Показать товары
let eventAll = {
  target: {
    dataset: {
      category: "1000",
    }
  }
}
showFirstProducts(eventAll);

let nextProductsBtn = document.querySelector('.next-products');
if (nextProductsBtn) {
  nextProductsBtn.onclick = showNextProducts;
}

// Запрос в базу данных по категории
let caregoryButtons = document.querySelectorAll('.products-category__list li');
for (let categoryButton of caregoryButtons) {
  categoryButton.onclick = showFirstProducts;

}

function showFirstProducts(e) {
  pageProducts = 0;
  categoryNumber = e.target.dataset.category;
  let response = fetch(`components/show_products.php?category=${categoryNumber}&page=${pageProducts}`)
    .then(function (response) {
      return response.json();
    })
    .then(function (result) {
      showButtonNextProducts(result);
      createProducts(result);

    });
};



function createProducts(goods) {
  const productsContainer = document.querySelector(".products__container");
  // productsContainer.innerHTML = '';
  console.log(productsContainer.innerHTML);
  let goodsList = '';
  if (goods.length == 0) {
    goodsList += `
        <string>В данной категории нет товаров!</string>
        `;
  }

  for (let item of goods) {
    goodsList += `
        <div class="product">
            <h3 class="product-h3">${item.title}</h3>
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


function showButtonNextProducts(result) {
  if (result.length < 13) {
    nextProductsBtn.style.display = 'none';
  } else {
    pageProducts += 12;
    result.pop()
    nextProductsBtn.style.display = 'inline-block';
  }

}


function showNextProducts(e) {
  e.preventDefault();
  let response = fetch(`components/show_products.php?category=${categoryNumber}&page=${pageProducts}`)
    .then(function (response) {
      return response.json();
    })
    .then(function (result) {
      if (result.length == 0) {
        goodsList += `
            <string>В данной категории нет товаров!</string>
            `;
      }
      const productsContainer = document.querySelector(".products__container");
      let goodsList = '';
      showButtonNextProducts(result);


      for (let item of result) {
        goodsList += `
            <div class="product">
                <h3 class="product-h3">${item.title}</h3>
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

function scroll() {
  const progressLine = document.querySelector('.progress-line');
  progressLine.style.display = 'block';
  let winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  let height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  let scrolled = (winScroll / height) * 100;
  progressLine.style.width = scrolled + "%";
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

function closeMenu() {
  mobileMenu.style.display = 'none';
}