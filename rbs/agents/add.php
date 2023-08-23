<?php
include '../connect.php';
$name            =  filterRequest('name');            //1
$phone1          =  filterRequest('phone1');          //2
$phone2          =  filterRequest('phone2');          //3
$active          =  filterRequest('active');          //4
$renewal_date    =  filterRequest('renewal_date');    //5
$image           =  imageUpload("image", "saved/");   //6
// Facebook
$fb_posts        =  filterRequest('fb_posts');        //7
$fb_rells        =  filterRequest('fb_rells');        //8
$fb_storys       =  filterRequest('fb_storys');       //9
$fb_videos       =  filterRequest('fb_videos');       //10
//instgram
$ins_posts       =  filterRequest('ins_posts');       //11
$ins_rells       =  filterRequest('ins_rells');       //12
$ins_storys      =  filterRequest('ins_storys');      //13
$ins_videos      =  filterRequest('ins_videos');      //14
$ins_highlight   =  filterRequest('ins_highlight');   //15
// Website
$wb_blog         =  filterRequest('wb_blog');         //16
$wb_photos       =  filterRequest('wb_photos');       //17
$wb_videos       =  filterRequest('wb_videos');       //18
//Youtube
$yt_shorts       =  filterRequest('yt_shorts');       //19
$yt_videos       =  filterRequest('yt_videos');       //20
//Design
$ds_frame        =  filterRequest('ds_frame');        //21
$ds_cover        =  filterRequest('ds_cover');        //22
$ds_posts        =  filterRequest('ds_posts');        //23
if($image !='fail'){
    $stmt = $con->prepare("INSERT INTO `agents`(`name`, `phone1`, `phone2`, `fb_posts`, `fb_rells`, `fb_storys`, `fb_videos`, `ins_posts`, `ins_rells`, `ins_storys`, `ins_videos`, `ins_highlight`, `wb_blog`, `wb_photos`, `wb_videos`, `yt_shorts`, `yt_videos`, `ds_frame`, `ds_cover`, `ds_posts`, `active`, `image`, `renewal_date`) VALUES (?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?)");
    $stmt->execute(array($name, $phone1, $phone2, $fb_posts, $fb_rells, $fb_storys, $fb_videos ,$ins_posts ,$ins_rells ,$ins_storys ,$ins_videos ,$ins_highlight ,$wb_blog ,$wb_photos ,$wb_videos ,$yt_shorts ,$yt_videos ,$ds_frame ,$ds_cover ,$ds_posts ,$active ,$image ,$renewal_date));
    $cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc'));
}else{
    echo json_encode(array('status' => 'fail'));
}
}else{
    echo json_encode(array('status' => $msgError));
}
?>