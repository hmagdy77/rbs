<?php
include '../connect.php';
$id       =  filterRequest('id');       //1
$account  =  filterRequest('account');  //2
    $stmt = $con->prepare("UPDATE `agents` SET  `account`= `account` + ? WHERE `id`=? ");
    $stmt->execute(array($account, $id));
    $cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc'));
}else{
    echo json_encode(array('status' => 'fail'));
}
?>