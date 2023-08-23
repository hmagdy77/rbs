<?php
include '../connect.php';
$title        =  filterRequest('title');       //1
$content      =  filterRequest('content');     //3
$creater      =  filterRequest('creater');     //2
$reciver      =  filterRequest('reciver');     //4
$seen         =  filterRequest('seen');        //5
$agent        =  filterRequest('agent');       //6
$created_at   =  filterRequest('created_at');  //7
$seen_at      =  filterRequest('seen_at');     //8
$stmt = $con->prepare("INSERT INTO `alerts`(`title`, `content`, `creater`, `reciver`, `seen`, `agent`, `created_at`, `seen_at`) VALUES (?,?,?,?,?,?,?,?)");
$stmt->execute(array($title, $content, $creater, $reciver, $seen, $agent, $created_at, $seen_at));
$cont = $stmt->rowCount();
    if($cont > 0){
    echo json_encode(array('status' => 'suc'));
}   else{
    echo json_encode(array('status' => 'fail'));
}
?>

