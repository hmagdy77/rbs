<!-- <?php
include '../connect.php';
$agent_name   =  filterRequest('agent_name');      //1
$name         =  filterRequest('name');            //2
$image        =  imageUpload("image", "saved/");   //3
$link         =  filterRequest('link');            //4
$active       =  filterRequest('active');          //5
$start_date   =  filterRequest('start_date');      //6
$end_date     =  filterRequest('end_date');        //7
// INSERT INTO `services`(`id`, `name`, `desc`) VALUES ([value-1],[value-2],[value-3])
if($image !='fail'){
    $stmt = $con->prepare("INSERT INTO `campaigns`(`agent_name`, `name`, `image`, `link`, `active`, `start_date`, `end_date`) VALUES (?,?,?,?,?,?,?)");
    $stmt->execute(array($agent_name, $name, $image, $link, $active, $start_date, ,$end_date ));
    $cont = $stmt->rowCount();
if($cont > 0){
    echo json_encode(array('status' => 'suc'));
}else{
    echo json_encode(array('status' => 'fail'));
}
}else{
    echo json_encode(array('status' => $msgError));
}
?> -->