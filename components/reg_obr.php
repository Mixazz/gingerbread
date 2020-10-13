<?php
// header('Content-Type: text/html; charset=utf-8');
// Принимаем переменные
// _$GET $_POST - глобальные переменные
$login = $_POST['login'];
$password = $_POST['password'];
$email = $_POST['email'];
$name = $_POST['name'];
// trim() — Удаляет пробелы (или другие символы) из начала и конца строки
$login = trim($login);
$password = trim($password);
$email = trim($email);
$name = trim($name);


// htmlspecialchars() -  Преобразует специальные символы в HTML-сущности (запрещают скрипты и сторонний код если он введен в input)
$login = htmlspecialchars($login);
$password = htmlspecialchars($password);
$email = htmlspecialchars($email);
$name = htmlspecialchars($name);

if (empty($login) || empty($password) || empty($email) || empty($name)) {
    exit("Не все поля заполнены"); // Проверяем переменные на пустоту и останавливаем скрипт
}
//Подключение базы данных
require_once('db.php');

//Проверяем есть ли пользователь в базе, если есть останавливаем скрипт

$result = $mysqli->query("SELECT * FROM `pestons` WHERE `login` ='$login'");
$result = $result->fetch_assoc(); //Расшифровывает данные в виде ассоциотивного массива находит первый элемент которые соответствует значениям в WHERE в данном случае проверяет `login` ='$login' есть ли данный логин в базе

if (isset($result)) { //isset — Определяет, была ли установлена переменная значением, отличным от NULL
    exit("Такой польлзователь уже существует!");
};

$result = $mysqli->query("SELECT * FROM `pestons` WHERE `email` ='$email'");
$result = $result->fetch_assoc();

if (isset($result)) {
    exit("Такой email уже существует!");
};

// Шифруем пароль
$password = password_hash($password, PASSWORD_BCRYPT);

//Добавляем пользователя в базу данных

// INSERT - добавление значений в базу данных
$result = $mysqli->query("INSERT INTO `pestons`(`login`, `password`, `name`, `email`) VALUES ('$login', '$password', '$name', '$email')");

//Выводим на экран 
if ($result) {
    exit("ok");
} else {
    exit("Не удалось добавить пользователя");
}



// echo "Логин - $login<br>";
// echo "Пароль - $password<br>";
// echo "Имя - $firstname<br>";
// echo "Фамилия - $lastname<br>";
// echo "Дата рождения - $birthday<br>";
