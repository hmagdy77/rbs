<?php
include '../connect.php';
    $id      = filterRequest('id'); 
    $stmt = $con->prepare("DELETE FROM `alerts` WHERE `id` = ?");
    $stmt->execute(array($id));
    $cont = $stmt->rowCount();
    if($cont > 0){
        deleteFile("saved",$image);
        echo json_encode(array('status' => 'suc'));
    }else{
        echo json_encode(array('status' => 'fail'));
    }
?>
