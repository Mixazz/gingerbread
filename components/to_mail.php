<?php 
$phone = $_POST["phone"];
if (isset($_POST["submit"])) {
$to = "mixaz@bk.ru";
$subject = "Письмо с сайта";
$charset = "utf-8";
$headerss ="Content-type: text/html; charset=$charset\r\n";
$headerss.="MIME-Version: 1.0\r\n";
$headerss.="Date: ".date('D, d M Y h:i:s O')."\r\n";
$msg = "Имя: ".$_POST["name"]."\n";
$msg .= "Телефон: ".$_POST["phone"]."\n";
$msg .= "Товар: ".$_POST["data-procuct"]."\n";
$msg .= "Сообщение: ".$_POST["msg"]."\n";
echo $msg;
mail($to, $subject, $msg, $headerss);
print "Сообщение успешно отправлено!";
} else {
    echo "При отправки сообщения произошла ошибка!";}