<?php
include '../connect.php';
$id              =  filterRequest('id');              //1
$name            =  filterRequest('name');            //2
$phone1          =  filterRequest('phone1');          //3
$phone2          =  filterRequest('phone2');          //4
$active          =  filterRequest('active');          //5
$renewal_date    =  filterRequest('renewal_date');    //6
// $image           =  imageUpload("image", "saved/");   //7
// Facebook
$fb_posts        =  filterRequest('fb_posts');        //8
$fb_rells        =  filterRequest('fb_rells');        //9
$fb_storys       =  filterRequest('fb_storys');       //10
$fb_videos       =  filterRequest('fb_videos');       //11
//instgram
$ins_posts       =  filterRequest('ins_posts');       //12
$ins_rells       =  filterRequest('ins_rells');       //13
$ins_storys      =  filterRequest('ins_storys');      //14
$ins_videos      =  filterRequest('ins_videos');      //15
$ins_highlight   =  filterRequest('ins_highlight');   //16
// Website
$wb_blog         =  filterRequest('wb_blog');         //17
$wb_photos       =  filterRequest('wb_photos');       //18
$wb_videos       =  filterRequest('wb_videos');       //19
//Youtube
$yt_shorts       =  filterRequest('yt_shorts');       //20
$yt_videos       =  filterRequest('yt_videos');       //21
//Design
$ds_frame        =  filterRequest('ds_frame');        //22
$ds_cover        =  filterRequest('ds_cover');        //23
$ds_posts        =  filterRequest('ds_posts');        //24
    $stmt = $con->prepare("UPDATE `agents` SET `name`=? ,`phone1`=? ,`phone2`=? ,`fb_posts`=? ,`fb_rells`=? ,`fb_storys`=? ,`fb_videos`=? ,`ins_posts`=? ,`ins_rells`=?, `ins_storys`=?, `ins_videos`=?, `ins_highlight`=?, `wb_blog`=?, `wb_photos`=?, `wb_videos`=?, `yt_shorts`=?, `yt_videos`=?, `ds_frame`=?, `ds_cover`=?, `ds_posts`=?, `active`=?, `renewal_date`=? WHERE  `id`=? ");
    $stmt->execute(array($name, $phone1, $phone2, $fb_posts, $fb_rells, $fb_storys, ,$fb_videos ,$ins_posts ,$ins_rells ,$ins_storys ,$ins_videos ,$ins_highlight ,$wb_blog ,$wb_photos ,$wb_videos ,$yt_shorts ,$yt_videos ,$ds_frame ,$ds_cover ,$ds_posts ,$active ,$renewal_date, $id));
    $cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc'));
}else{
    echo json_encode(array('status' => 'fail'));
}

?>