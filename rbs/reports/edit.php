<?php
include '../connect.php';
$id              =  filterRequest('id');              //1
$agent_name      =  filterRequest('agent_name');      //2
$date            =  filterRequest('date');            //3
// Facebook
$fb_posts        =  filterRequest('fb_posts');        //4
$fb_rells        =  filterRequest('fb_rells');        //5
$fb_storys       =  filterRequest('fb_storys');       //6
$fb_videos       =  filterRequest('fb_videos');       //7
//instgram
$ins_posts       =  filterRequest('ins_posts');       //8
$ins_rells       =  filterRequest('ins_rells');       //9
$ins_storys      =  filterRequest('ins_storys');      //10
$ins_videos      =  filterRequest('ins_videos');      //11
$ins_highlight   =  filterRequest('ins_highlight');   //12
// Website
$wb_blog         =  filterRequest('wb_blog');         //13
$wb_photos       =  filterRequest('wb_photos');       //14
$wb_videos       =  filterRequest('wb_videos');       //15
//Youtube
$yt_shorts       =  filterRequest('yt_shorts');       //16
$yt_videos       =  filterRequest('yt_videos');       //17
//Design
$ds_frame        =  filterRequest('ds_frame');        //18
$ds_cover        =  filterRequest('ds_cover');        //19
$ds_posts        =  filterRequest('ds_posts');        //20
    $stmt = $con->prepare("UPDATE `reports` SET `agent_name`=?,`fb_posts`=?,`fb_rells`=?,`fb_storys`=?,`fb_videos`=?,`ins_posts`=?,`ins_rells`=?,`ins_storys`=?,`ins_videos`=?,`ins_highlight`=?,`wb_blog`=?,`wb_photos`=?,`wb_videos`=?,`yt_shorts`=?,`yt_videos`=?,`ds_frame`=?,`ds_cover`=?,`ds_posts`=?,`date`=? WHERE `id`=? ");
    $stmt->execute(array($agent_name, $fb_posts, $fb_rells, $fb_storys, ,$fb_videos ,$ins_posts ,$ins_rells ,$ins_storys ,$ins_videos ,$ins_highlight ,$wb_blog ,$wb_photos ,$wb_videos ,$yt_shorts ,$yt_videos ,$ds_frame ,$ds_cover ,$ds_posts ,$date ,$id));
    $cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc'));
}else{
    echo json_encode(array('status' => 'fail'));
}
 
?>