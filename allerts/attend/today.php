<?php
include '../connect.php';
$day  = filterRequest('day');  //1
$stmt = $con->prepare("SELECT * FROM emp_attend WHERE `day` = ? ");
$stmt->execute(array($day));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc', 'data' =>$data));
}else{
    echo json_encode(array('status' => 'fail', 'data' =>$data));
}
?>