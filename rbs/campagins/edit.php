<?php
include '../connect.php';
$agent_name   =  filterRequest('agent_name');      //1
$id           =  filterRequest('id');              //2
$image        =  imageUpload("image", "saved/");   //3
$link         =  filterRequest('link');            //4
$active       =  filterRequest('active');          //5
$start_date   =  filterRequest('start_date');      //6
$end_date     =  filterRequest('end_date');        //7
    $stmt = $con->prepare("UPDATE `campaigns` SET `agent_name`=?,`name`=?, `link`=?,`active`=?,`start_date`=?,`end_date`=? WHERE `id`=?");
    $stmt->execute(array($agent_name, $name, $link, $active, $start_date, ,$end_date ,$id));
    $cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc'));
}else{
    echo json_encode(array('status' => 'fail'));
}
?>