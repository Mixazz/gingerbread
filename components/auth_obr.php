<?php
session_start(); // запуск сессии, запускается в начале файла, обычно она живет 30 мин (Хранит данные)
$login = $_POST['login'];
$password = $_POST['password'];

$login = htmlspecialchars(trim($login));
$password = htmlspecialchars(trim($password));

//Подключение базы данных
require_once('db.php');

if (empty($login) || empty($password)) {
    exit("Не все поля заполнены");
}

$result = $mysqli->query("SELECT * FROM `pestons` WHERE `login` = '$login'")->fetch_assoc();


if (isset($result) && password_verify($password, $result['password'])) {
    $_SESSION['id'] = $result['id'];
    $_SESSION['login'] = $result['login'];
    $_SESSION['email'] = $result['email'];
    $_SESSION['isAdmin'] = $result['isAdmin'];


    // Вариант репенаправления с помощъю JS
    exit("ok<script>window.location.href = '/admin/admin.php';</script>");
} else {
    exit("Не верный логин или пароль");
}
