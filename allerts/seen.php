<?php
include '../connect.php';
$reciver      =  filterRequest('reciver');     //1
$seen         =  filterRequest('seen');        //2
$seen_at      =  filterRequest('seen_at');     //3
$id           =  filterRequest('id');          //4
$stmt = $con->prepare("UPDATE `alerts` SET `reciver` = ?, `seen` = ?, `seen_at` =? WHERE `id`= ?");
$stmt->execute(array($reciver, $seen ,$seen_at, $id));
$cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc'));
}else{
    echo json_encode(array('status' => 'fail'));
}
?>