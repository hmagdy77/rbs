<?php
include '../connect.php';
    $agent_name      =  filterRequest('agent_name');      //1
    $date            =  filterRequest('date');            //2
    // Facebook
    $fb_posts        =  filterRequest('fb_posts');        //3
    $fb_rells        =  filterRequest('fb_rells');        //4
    $fb_storys       =  filterRequest('fb_storys');       //5
    $fb_videos       =  filterRequest('fb_videos');       //6
    //instgram
    $ins_posts       =  filterRequest('ins_posts');       //7
    $ins_rells       =  filterRequest('ins_rells');       //8
    $ins_storys      =  filterRequest('ins_storys');      //9
    $ins_videos      =  filterRequest('ins_videos');      //10
    $ins_highlight   =  filterRequest('ins_highlight');   //11
    // Website
    $wb_blog         =  filterRequest('wb_blog');         //12
    $wb_photos       =  filterRequest('wb_photos');       //13
    $wb_videos       =  filterRequest('wb_videos');       //14
    //Youtube
    $yt_shorts       =  filterRequest('yt_shorts');       //15
    $yt_videos       =  filterRequest('yt_videos');       //16
    //Design
    $ds_frame        =  filterRequest('ds_frame');        //17
    $ds_cover        =  filterRequest('ds_cover');        //18
    $ds_posts        =  filterRequest('ds_posts');        //19
    $stmt = $con->prepare("INSERT INTO `reports`(`agent_name`, `fb_posts`, `fb_rells`, `fb_storys`, `fb_videos`, `ins_posts`, `ins_rells`, `ins_storys`, `ins_videos`, `ins_highlight`, `wb_blog`, `wb_photos`, `wb_videos`, `yt_shorts`, `yt_videos`, `ds_frame`, `ds_cover`, `ds_posts`, `date`) VALUES (?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?)");
    $stmt->execute(array($agent_name, $fb_posts, $fb_rells, $fb_storys, ,$fb_videos ,$ins_posts ,$ins_rells ,$ins_storys ,$ins_videos ,$ins_highlight ,$wb_blog ,$wb_photos ,$wb_videos ,$yt_shorts ,$yt_videos ,$ds_frame ,$ds_cover ,$ds_posts ,$date));
    $cont = $stmt->rowCount();
    if($cont > 0){
        echo json_encode(array('status' => 'suc'));
    }else{
        echo json_encode(array('status' => 'fail'));
    }

?>