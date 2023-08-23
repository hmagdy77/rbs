<?php
include '../connect.php';
$emp_exit     = filterRequest('emp_exit');     //1
$minutes      = filterRequest('minutes');      //2
$day_id       = filterRequest('day_id');       //3
$stmt->execute(array($day_id));
$cont = $stmt->rowCount();
$stmt = $con->prepare("UPDATE `attend` SET  `emp_exit`=?, `minutes`=? ,`is_exit` = '1' WHERE `day_id`= ?");
$stmt->execute(array($emp_exit, $minutes, $day_id));
$cont = $stmt->rowCount();
if($cont > 0){
echo json_encode(array('status' => 'suc'));
}else{
echo json_encode(array('status' => 'fail'));
}
?> 