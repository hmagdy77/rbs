<?php
include '../connect.php';
$emp_name     = filterRequest('emp_name');     //1     
$day          = filterRequest('day');          //2
$emp_attend   = filterRequest('emp_attend');   //3
$emp_holiday  = filterRequest('emp_holiday');  //4
$stmt = $con->prepare("SELECT * FROM `attend` WHERE `emp_name` = ? AND `day` = ?");
$stmt->execute(array($emp_id, $day));
$cont = $stmt->rowCount();
if($cont > 0){
echo json_encode(array('status' => 'found'));
}else{
    $stmt = $con->prepare("INSERT INTO `attend`(`emp_name`, `day`, `emp_attend` ,`emp_holiday`)  VALUES(?,?,?,?)");
    $stmt->execute(array($emp_name, $day, $emp_attend, $emp_holiday));
    $cont = $stmt->rowCount();
    if($cont > 0){
    echo json_encode(array('status' => 'suc'));
    }else{
    echo json_encode(array('status' => 'fail'));
}
}
?> 