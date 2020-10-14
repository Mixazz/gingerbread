const formImage = document.querySelector('.form-image');
const filePreview = document.querySelector('.file-preview');

formImage.addEventListener("change", () => {
  upliadFile(formImage.files[0]);


});
function upliadFile(file) {

  var reader = new FileReader();
  reader.onload = function (e) {
    filePreview.innerHTML = `<img src="${e.target.result}" alt="Фото">`;
  };
  reader.onerror = function (e) {
    alert("Ошибка");
  }
  reader.readAsDataURL(file);
}