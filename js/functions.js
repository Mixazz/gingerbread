function closeOrderWindow() {
  orderPopUp.style.display = "none";
};
function closeMenu() {
  mobileMenu.style.display = 'none';
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
  let basketLocalStorage = 0;
  bascetGoods.innerHTML = '';
  bascetSumm = 0;
  for (let i = 0; i < localStorage.length; i++) {
    let key = localStorage.key(i);
    if (key.search("backet") == 0) {
      basketLocalStorage++;
      createProductsInBuscet(JSON.parse(localStorage.getItem(key)));
    }
  }
  bascetSpan.innerHTML = `${basketLocalStorage} товар${declination(basketLocalStorage, ['', 'а', 'ов'])}`;
  if (basketLocalStorage == 0) {
    bascetSpan.innerHTML = "Корзина пустая";
    footerBascet.style.display = 'none';
    bascetGoods.innerHTML = '<p style="text-align: center; padding: 10px">В корзине нет товаров</p>';
    showBascetSumm.innerHTML = 0;
  } else {
    footerBascet.style.display = 'block';
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