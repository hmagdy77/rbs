<?php
include '../connect.php';
$emp_name   = filterRequest('emp_name');   
$start    = filterRequest('start');   
$end      = filterRequest('end');   
$stmt = $con->prepare("SELECT * FROM emp_attend WHERE `emp_name` = ? AND `day` BETWEEN ? AND ?");
$stmt->execute(array($emp_name, $start, $end));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc', 'data' =>$data));
}else{
    echo json_encode(array('status' => 'fail', 'data' =>$data));
}
?>