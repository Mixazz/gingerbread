export default class ProductRow {
    constructor(id, title, coiunt, size, price, img_url, show) {
        this.id = id;
        this.title = title;
        this.coiunt = coiunt;
        this.size = size;
        this.price = price;
        this.img_url = img_url;
        this.show = show;
        this.elem = document.createElement('tr');
        this.row = `
        <td>${this.id}</td>
        <td>${this.title}</td>
        <td>${this.coiunt}</td>
        <td>${this.size}</td>
        <td>${this.price}</td>
        <td>${this.show}</td>
        <td><button class="btn  btn-info">Изменить</button></td>
        <td><button class="btn  btn-danger ml-1">Удалить</button></td>
        `;
        this.elem.innerHTML = this.row;
        this.elemEdit = document.createElement('tr');

        let tbody = document.querySelector('.products-table tbody');
        tbody.append(this.elem);

        let deleteButton = this.elem.querySelector(".btn-danger");

        deleteButton.onclick = this.deleteProduct.bind(this);
        let editProduct = this.elem.querySelector('.btn-info');
        editProduct.onclick = this.editProduct.bind(this);
    }

    deleteProduct() {

        let productRow = this;
        if (!confirm(`Вы действительно хотите удалить товар "${productRow.title}" `)) {
            return;
        }
        fetch(`delite_product.php?id=${productRow.id}`)
            .then(function (response) {
                return response.text()
            })
            .then(function (result) {
                if (result == "ok") {
                    console.log(`Товар успешно удален!`);
                    productRow.elem.remove();
                } else {
                    console.log(result);
                }
            });

    }

    editProduct() {
        let productRow = this;
        location.replace(`edit_product.php?id=${productRow.id}`);

    }

}
