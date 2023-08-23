<?php
include '../connect.php';
    $id            =  filterRequest('id');              //8
    $stmt = $con->prepare("DELETE FROM `opreations` WHERE `id`=? ");
    $stmt->execute(array( $id));
    $cont = $stmt->rowCount();
    if($cont > 0){
        echo json_encode(array('status' => 'suc'));
    }else{
        echo json_encode(array('status' => 'fail'));
    }
?>