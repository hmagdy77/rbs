<?php
include '../connect.php';
    $agent         =  filterRequest('agent');           //1
    $price         =  filterRequest('price');           //2
    $service_name  =  filterRequest('service_name');    //3
    $service_desc  =  filterRequest('service_desc');    //4
    $desc          =  filterRequest('desc');            //5
    $kind          =  filterRequest('kind');            //6
    $time          =  filterRequest('time');            //7
    $stmt = $con->prepare("INSERT INTO `opreations`(`agent`, `price`, `service_name`, `service_desc`, `desc`, `kind`, `time`) VALUES (?,?,?,?,?,?,?)");
    $stmt->execute(array($agent ,$price ,$service_name, $service_desc, $desc, $kind ,$time));
    $cont = $stmt->rowCount();
    if($cont > 0){
        echo json_encode(array('status' => 'suc'));
    }else{
        echo json_encode(array('status' => 'fail'));
    }
?>