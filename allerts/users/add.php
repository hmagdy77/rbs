 <?php
include '../connect.php';
$user_name        = filterRequest('user_name');  
$user_password    = filterRequest('user_password');  
$user_admin       = filterRequest('user_admin');  
$stmt = $con->prepare("SELECT * FROM `users` WHERE `user_name` =?");
$stmt->execute(array($user_name));
$cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'found'));
}else{
    $stmt = $con->prepare("INSERT INTO `users`(`user_name`, `user_password`, `user_admin`)  VALUES (?,?,?)");
    $stmt->execute(array($user_name, $user_password, $user_admin));
    $cont = $stmt->rowCount();
    if($cont > 0){
    echo json_encode(array('status' => 'suc'));
    }else{
    echo json_encode(array('status' => 'fail'));
    }
}
?> 