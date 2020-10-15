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
let bascetSumm = 0;

let orderPopUp = document.querySelector(".order-wrap");
let productBtn = document.querySelector(".product__btn");
let orderClose = document.querySelector(".order-close");
let orderOverlay = document.querySelector(".order-overlay");
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
let nextProductsBtn = document.querySelector('.next-products');
let caregoryButtons = document.querySelectorAll('.products-category__list li');
let bascet = document.querySelector('.bascet');
let footerBascet = document.querySelector('.bascet-summ-wrap');


orderClose.onclick = closeOrderWindow;
orderOverlay.onclick = closeOrderWindow;

// Показать товары при загрузке страницы
let eventAll = {
  target: {
    dataset: {
      category: "1000",
    }
  }
}
showFirstProducts(eventAll);

if (nextProductsBtn) {
  nextProductsBtn.onclick = showNextProducts;
}

for (let categoryButton of caregoryButtons) {
  categoryButton.onclick = showFirstProducts;
}

buttonOpenBascet.onclick = function () {
  if (openBaccet.style.display == 'flex') {
    openBaccet.style.display = 'none';
  } else {
    openBaccet.style.display = 'flex';
  }
}

btnMenuOpen.onclick = function () {
  mobileMenu.style.display = 'block';
}
mobileMenuClose.onclick = function () {
  closeMenu();
}
mobileMenuOverlay.onclick = function () {
  closeMenu();
}

if (localStorage.getItem("backet")) {
  array = JSON.parse(localStorage.getItem("array"));
  console.log(JSON.parse(localStorage.getItem("bascet")));
}
showItemsBascet();

window.addEventListener('scroll', function () {
  if (window.pageYOffset < 85) {
    bascet.style.top = `${100 - window.pageYOffset}px`;
  } else if ((window.pageYOffset > 85))
    bascet.style.top = `15px`;
})