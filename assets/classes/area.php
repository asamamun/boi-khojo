<?php
if(isset($_GET['district'])){
require "../../connection.php";
$id = $conn->escape_string($_GET['district']);
$selectDistrict = "SELECT * FROM `area` WHERE `district_id`='".$id."'";
$selectResult = $conn->query($selectDistrict);

if($selectResult->num_rows > 0 ){
	$row = array();
	while($r = $selectResult->fetch_array(MYSQLI_ASSOC)){
		$row[] = $r;
		}
		echo json_encode(["result"=>"1","records"=>$row]);
	}
else echo json_encode(["result"=>"0"]);

}