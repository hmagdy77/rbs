<?php
include '../connect.php';
$emp_id  = filterRequest('emp_id');       //1
$stmt = $con->prepare("SELECT * FROM emp_attend WHERE `emp_id`=?");
$stmt->execute(array($emp_id));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc', 'data' =>$data));
}else{
    echo json_encode(array('status' => 'fail', 'data' =>$data));
}
?>