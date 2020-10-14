"use strict";
class Product {
  constructor(id, title, count, size, price, img_url, show_product) {
    this.id = id;
    this.title = title;
    this.p_count = count;
    this.p_seze = size;
    this.p_price = price;
    this.img_url = img_url;
    this.show_product = show_product;
    this.elem = document.createElement("div");
    this.elem.classList.add('product');
    this.elem.innerHTML = `<h3 class="product-h3">${this.title}</h3>
                <div class="product-img__wrap">
                  <img class="product-img" src="${this.img_url}" alt="${this.title}" />
                </div>
                <ul class="product__property">
                  <li class="product-count">
                    <p>${this.p_count}</p>
                  </li>
                  <li class="product-size">
                    <p>${this.p_seze}</p>
                  </li>
                  <li class="product-price">
                    <p>${this.p_price}</p>
                  </li>
                </ul>
                <div class="product-buttons">
                <a href="#" class="product__btn" data-id="${this.id}">Заказать</a>
                <a href="#" class="add_bascet" data-id="${this.id}"><img class="item-img" src="img/button-card-image.svg" alt="В корзину"></a>
                </div>
                `;

  }
  openOrderWindow(e) {
    e.preventDefault();
    console.log(this.id);
    orderPopUp.style.display = "flex";
    let dataProduct = document.querySelector("[name=data-procuct]");
    dataProduct.value = `${this.title}, ${this.p_price}`;
  }

  addLocalItemBacket(e) {
    let price = parseInt(`${this.p_price}`.replace(/\D+/g, ""));
    bascetSpan.style.color = '#ad3d5b';
    setTimeout(function () {
      bascetSpan.style.color = 'white';
    }, 200);
    const itemData = {
      id: this.id,
      title: this.title,
      price: price,
      img_url: this.img_url,
      count: 1,
    }
    e.preventDefault();

    if (!localStorage.getItem(`backet-${this.id}`)) {
      localStorage.setItem(`backet-${this.id}`, JSON.stringify(itemData));
      console.log(`${this.title} успешно добавлен в корзину!`);
    } else {
      let itemData = JSON.parse(localStorage.getItem(`backet-${this.id}`));
      itemData.count++;
      localStorage.setItem(`backet-${this.id}`, JSON.stringify(itemData));
    }
    showItemsBascet();
  }

}
class ProductBascet {
  constructor(id, img_url, title, price, count) {
    this.id = id;
    this.img_url = img_url;
    this.title = title;
    this.price = price;
    this.count = count;
    this.summProduct = price * count;
    this.elem = document.createElement("div");
    this.elem.classList.add('goods-item');

    this.elem.innerHTML = `
      <img class="item-img" src="${this.img_url}" alt="">
      <h5 class="item-title">${this.title}</h5>
      <span class="item-price">${this.summProduct}</span>
      <a href="" class="item-minus">-</a>
      <input type="text" class="item-count" value="${this.count}">
      <a href="" class="item-plus">+</a>
      <a href="" class="item-delete">X</a>
  `;

  }
  countMinus(e) {
    e.preventDefault();
    let itemData = JSON.parse(localStorage.getItem(`backet-${this.id}`));
    itemData.count--;
    localStorage.setItem(`backet-${this.id}`, JSON.stringify(itemData));
    if (itemData.count <= 0) {
      localStorage.removeItem(`backet-${this.id}`);
    }
    showItemsBascet();
  }

  countPlus(e) {
    e.preventDefault();
    let itemData = JSON.parse(localStorage.getItem(`backet-${this.id}`));
    itemData.count++;
    localStorage.setItem(`backet-${this.id}`, JSON.stringify(itemData));
    showItemsBascet();
  }

  countChange() {
    let itemCountChange = this.elem.querySelector('.item-count');
    let itemData = JSON.parse(localStorage.getItem(`backet-${this.id}`));
    itemData.count = itemCountChange.value;
    localStorage.setItem(`backet-${this.id}`, JSON.stringify(itemData));
    if (itemData.count <= 0) {
      localStorage.removeItem(`backet-${this.id}`);
    }
    showItemsBascet();
  }

  countDelete(e) {
    e.preventDefault();
    localStorage.removeItem(`backet-${this.id}`);
    showItemsBascet();
  }

}

window.onscroll = () => scroll();
let categoryNumber;
let pageProducts;
let quantityProduct = 12;

let orderPopUp = document.querySelector(".order-wrap");
let productBtn = document.querySelector(".product__btn");
let orderClose = document.querySelector(".order-close");
let orderOverlay = document.querySelector(".menu__overlay");

orderClose.onclick = closeOrderWindow;

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

let caregoryButtons = document.querySelectorAll('.products-category__list li');
for (let categoryButton of caregoryButtons) {
  categoryButton.onclick = showFirstProducts;

}
function closeOrderWindow() {
  orderPopUp.style.display = "none";
};

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

  productsContainer.innerHTML = '';
  // let goodsList = '';
  if (goods.length == 0) {
    productsContainer.innerHTML = `
        <string>В данной категории нет товаров!</string>
        `;
    return;
  }

  for (let item of goods) {
    item = new Product(item.id, item.title, item.p_count, item.p_seze, item.p_price, item.img_url, item.show_product);
    // goodsList;
    productsContainer.append(item.elem);
    let orderBtn = item.elem.querySelector(".product__btn");
    let addButtonBascet = item.elem.querySelector(".add_bascet");
    orderBtn.onclick = item.openOrderWindow.bind(item);
    addButtonBascet.onclick = item.addLocalItemBacket.bind(item);


  }
  // productsContainer.innerHTML = goodsList;
  // goodsList = '';
}

function showButtonNextProducts(result) {
  if (result.length < 13) {
    nextProductsBtn.style.display = 'none';
  } else {
    pageProducts += 12;
    result.pop();
    nextProductsBtn.style.display = 'inline-block';
  }

}
function createProduct(item) {
  item = new Product(item.id, item.title, item.p_count, item.p_seze, item.p_price, item.img_url);
  productsContainer.append(item.elem);
  let orderBtn = item.elem.querySelector(".product__btn");
  let addButtonBascet = item.elem.querySelector(".add_bascet");
  orderBtn.onclick = item.openOrderWindow.bind(item);
  addButtonBascet.onclick = item.addLocalItemBacket.bind(item);
}

function showNextProducts(e) {
  e.preventDefault();
  let response = fetch(`components/show_products.php?category=${categoryNumber}&page=${pageProducts}`)
    .then(function (response) {
      return response.json();
    })
    .then(function (result) {
      const productsContainer = document.querySelector(".products__container");
      showButtonNextProducts(result);

      for (let item of result) {
        createProduct(item);
      }
    });
}

function showItemsBascet() {
  if (localStorage.length == 0) {
    bascetSpan.innerHTML = "Корзина пустая";
    bascetGoods.innerHTML = '';
    showBascetSumm.innerHTML = 0;
    return false;
  }
  bascetGoods.innerHTML = '';
  bascetSumm = 0;
  for (let i = 0; i < localStorage.length; i++) {

    bascetSpan.innerHTML = `${localStorage.length} товар${declination(localStorage.length, ['', 'а', 'ов'])}`;
    let key = localStorage.key(i);
    createProductsInBuscet(JSON.parse(localStorage.getItem(key)));
  }
}

function createProductsInBuscet(product) {
  if (!localStorage.length) {
    return false;
  }
  let itemBascet = new ProductBascet(product.id, product.img_url, product.title, product.price, product.count);
  bascetGoods.append(itemBascet.elem);
  bascetSumm = bascetSumm + itemBascet.summProduct;
  showBascetSumm.innerHTML = bascetSumm;
  let itemCountButtinMines = itemBascet.elem.querySelector('.item-minus');
  let itemCountButtinPlus = itemBascet.elem.querySelector('.item-plus');
  let itemCountButtinDelete = itemBascet.elem.querySelector('.item-delete');
  let itemCountChange = itemBascet.elem.querySelector('.item-count');

  itemCountChange.addEventListener('change', itemBascet.countChange.bind(itemBascet))
  itemCountButtinMines.addEventListener('click', itemBascet.countMinus.bind(itemBascet));
  itemCountButtinPlus.addEventListener('click', itemBascet.countPlus.bind(itemBascet));
  itemCountButtinDelete.addEventListener('click', itemBascet.countDelete.bind(itemBascet));

}

function declination(number, txt) {
  var cases = [2, 0, 1, 1, 1, 2];
  return txt[(number % 100 > 4 && number % 100 < 20) ? 2 : cases[(number % 10 < 5) ? number % 10 : 5]];
}
function scroll() {
  const progressLine = document.querySelector('.progress-line');
  progressLine.style.display = 'block';
  let winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  let height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  let scrolled = (winScroll / height) * 100;
  progressLine.style.width = scrolled + "%";
}
let bascetSumm = 0;
let productsContainer = document.querySelector(".products__container");
let bascetSpan = document.querySelector('.bascet-span');
let btnMenuOpen = document.querySelector(".header-menu__open");
let mobileMenu = document.querySelector(".menu__mobile-wrap");
let mobileMenuOverlay = document.querySelector(".menu__overlay");
let mobileMenuClose = document.querySelector(".menu__mobile-close");
let bascetGoods = document.querySelector('.bascet-goods');
let showBascetSumm = document.querySelector(".bascet-summ");
let buttonOpenBascet = document.querySelector(".bascet-button");
let openBaccet = document.querySelector(".bascet-goods-wrap");

buttonOpenBascet.onclick = function () {
  if (openBaccet.style.display == 'flex') {
    openBaccet.style.display = 'none';
  } else {
    openBaccet.style.display = 'flex';
  }

}
// showBascetSumm.innerHTML = +bascetSumm;

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

if (localStorage.getItem("backet")) {
  array = JSON.parse(localStorage.getItem("array"));
  console.log(JSON.parse(localStorage.getItem("bascet")));
}
showItemsBascet();

