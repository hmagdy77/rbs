<?php
include '../connect.php';
    $id      = filterRequest('id'); 
    $image   = filterRequest('image'); 
    $stmt = $con->prepare("DELETE FROM `agents` WHERE `id` = ?");
    $stmt->execute(array($id));
    $cont = $stmt->rowCount();
    if($cont > 0){
        deleteFile("saved",$image);
        echo json_encode(array('status' => 'suc'));
    }else{
        echo json_encode(array('status' => 'fail'));
    }
?>
