<?php
include '../connect.php';
$name         =  filterRequest('name');    //1
$desc         =  filterRequest('desc');    //2
$stmt = $con->prepare("INSERT INTO `services`( `name`, `desc`) VALUES (?,?)");
$stmt->execute(array($name, $desc));
$cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc'));
}else{
    echo json_encode(array('status' => 'fail'));
}
?>