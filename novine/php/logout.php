<?php

require 'C:\wamp64\www\novine\process\db.php';

$_SESSION = [];
session_unset();
session_destroy();
header("Location: pocetna.php");
