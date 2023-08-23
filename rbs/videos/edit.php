<?php
include '../connect.php';
    $campaign_id  =  filterRequest('campaign_id');   //1
    $messages     =  filterRequest('messages');      //2
    $reach        =  filterRequest('reach');         //3
    $comments     =  filterRequest('comments');      //4
    $likes        =  filterRequest('likes');         //5
    $date         =  filterRequest('date');          //6
    $id           =  filterRequest('id');            //7
    $stmt = $con->prepare("UPDATE `statistics` SET `campaign_id`=?,`messages`=?,`reach`=?,`comments`=?,`likes`=?,`date`=? WHERE `id`=?");
    $stmt->execute(array($campaign_id, $messages, $reach, $comments, $likes, $date, $id));
    $cont = $stmt->rowCount();
    if($cont > 0){
        echo json_encode(array('status' => 'suc'));
    }else{
        echo json_encode(array('status' => 'fail'));
    }
?>