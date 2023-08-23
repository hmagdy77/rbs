<?php
include '../connect.php';
$name         =  filterRequest('name');    //1
$desc         =  filterRequest('desc');    //2
$id           =  filterRequest('id');      //3
$stmt = $con->prepare("UPDATE `services` SET `name`=?, `desc`=?  WHERE `id`=? ");
$stmt->execute(array($name, $desc, $id));
$cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc'));
}else{
    echo json_encode(array('status' => 'fail'));
}
?>