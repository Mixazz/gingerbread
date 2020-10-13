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
                <a href="#" class="product__btn" data-id="${this.id}">Заказать</a>`;

  }
  openOrderWindow(e) {
    e.preventDefault();
    console.log(this.id);
    orderPopUp.style.display = "flex";
    let dataProduct = document.querySelector("[name=data-procuct]");
    dataProduct.value = `${this.title}, ${this.p_price}`;
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
orderClose.onclick = closeOrderWindow;

function closeOrderWindow() {
  orderPopUp.style.display = "none";
};


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
    console.log(item.show_product);
    productsContainer.append(item.elem);
    let orderBtn = item.elem.querySelector(".product__btn");
    orderBtn.onclick = item.openOrderWindow.bind(item);


  }
  // productsContainer.innerHTML = goodsList;
  // goodsList = '';
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
      // if (result.length == 0) {
      //   goodsList += `
      //       <string>В данной категории нет товаров!</string>
      //       `;
      // }
      const productsContainer = document.querySelector(".products__container");
      // goodsList = '';
      showButtonNextProducts(result);



      for (let item of result) {
        item = new Product(item.id, item.title, item.p_count, item.p_seze, item.p_price, item.img_url);
        productsContainer.append(item.elem);
      }

      // goodsList = '';
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




// productBtn.onclick = function (e) {
//   preventDefault(e)
//   orderPopUp.style.display = 'flex';
// }

