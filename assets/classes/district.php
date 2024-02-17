<?php
if(isset($_GET['division'])){
require "../../connection.php";
$selectDistrict = "SELECT * FROM `district` WHERE `division_id`='".$_GET['division']."'";
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