<?php
echo $_FILES['file']['name'] . "<br>";
echo $_FILES['file']['size'] . "<br>";
echo $_FILES['file']['type'] . "<br>";
echo $_FILES['file']['tmp_name'] . "<br>";


function resize_photo($path, $filename, $filesize, $type, $tmp_name)
{
    $quality = 20; //Качество в процентах. В данном случае будет сохранено 60% от начального качества.
    $size = 10485760; //Максимальный размер файла в байтах. В данном случае приблизительно 10 МБ.
    if ($filesize < $size) {
        switch ($type) {
            case 'image/jpeg':
                $source = imagecreatefromjpeg($tmp_name);
                break; //Создаём изображения по
            case 'image/png':
                $source = imagecreatefrompng($tmp_name);
                break;  //образцу загруженного  
            case 'image/gif':
                $source = imagecreatefromgif($tmp_name);
                break; //исходя из его формата
                return "false1";
        }
        imagejpeg($source, $path . $filename, $quality); //Сохраняем созданное изображение по указанному пути в формате jpg
        imagedestroy($source); //Чистим память
        return "true";
    } else return "false2";
}
echo resize_photo('path/to/dir/', $_FILES['file']['name'], $_FILES['file']['size'], $_FILES['file']['type'], $_FILES['file']['tmp_name']);
