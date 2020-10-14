import ProductRow from './adminProductRow.js';

getAllProducts();

function getAllProducts() {
    fetch('/admin/getAllProducts.php')
        .then(function (response) {
            return response.json()
        })
        .then(function (result) {
            let products = result;
            for (let product of products) {
                let productRow = new ProductRow(product.id, product.title, product.p_count, product.p_seze, product.p_price, product.img_url, product.show_product);
            }

        })
}
