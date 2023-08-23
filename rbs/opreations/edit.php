<?php
include '../connect.php';
    $agent         =  filterRequest('agent');           //1
    $price         =  filterRequest('price');           //2
    $service_name  =  filterRequest('service_name');    //3
    $service_desc  =  filterRequest('service_desc');    //4
    $desc          =  filterRequest('desc');            //5
    $kind          =  filterRequest('kind');            //6
    $time          =  filterRequest('time');            //7
    $id            =  filterRequest('id');              //8
    
    $stmt = $con->prepare("UPDATE `opreations` SET `agent`=?, `price`=?, `service_name`=?, `service_desc`=?, `desc`=?, `kind`=?, `time`=?  WHERE `id`=? ");
    $stmt->execute(array($agent ,$price ,$service_name, $service_desc, $desc, $kind ,$time, $id));
    $cont = $stmt->rowCount();
    if($cont > 0){
        echo json_encode(array('status' => 'suc'));
    }else{
        echo json_encode(array('status' => 'fail'));
    }
?>