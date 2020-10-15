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

function showItemsBascet() {

  let basketLocalStorage = 0;
  bascetGoods.innerHTML = '';
  bascetSumm = 0;
  for (let i = 0; i < localStorage.length; i++) {
    let key = localStorage.key(i);
    if (key.search("backet") == 0) { //Есть совпадения в LocalStorage
      basketLocalStorage++;
      createProductsInBuscet(JSON.parse(localStorage.getItem(key)));
    }
  }
  if (basketLocalStorage == 0) {
    showBascetSummText.style.display = "none";
    bascetGoods.innerHTML = `
      <p style="padding: 30px">Ваша корзине нет товаров, добавьте хотя бы один товар!</p>
      <a href="index.php">Вернуться на главную страницу</a>`;
    orderForm.style.display = "none";
  } else {
    showBascetSummText.style.display = 'inline';
    orderForm.style.display = 'flex';
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
  return true;
}

let bascetGoods = document.querySelector('.order-bascet');
let showBascetSumm = document.querySelector(".bascet-summ");
let showBascetSummText = document.querySelector(".bascet-summ-wrap");
let orderForm = document.querySelector(".order-form");

orderForm.onsubmit = function (e) {
  e.preventDefault();
  send();
}

showItemsBascet();

async function send() {
  let dataOrder = [];
  for (let i = 0; i < localStorage.length; i++) {
    let key = localStorage.key(i);
    if (key.search("backet") == 0) {
      dataOrder.push(localStorage.getItem(key));
      // localStorage.removeItem(key);
    }
  }

  dataOrder = JSON.stringify(dataOrder);
  let inputdataOrder = document.querySelector("[name=data-order]");
  inputdataOrder.value = dataOrder;
  let formData = new FormData(orderForm);

  let requestLink = "/components/order_to_mail.php";
  let requestMethod = "POST";
  let response = await fetch(requestLink, {
    method: requestMethod,
    body: formData,
  });
  let result = await response.text();
  showItemsBascet();
  bascetGoods.innerHTML = result;
}