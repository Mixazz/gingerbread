<?php
session_start();
session_destroy();
// Такое перенапровление возможно только если страница пустая (нет html кода, нет echo)
header("Location: /admin/index.php");
