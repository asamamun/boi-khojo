<?php
require "../../connection.php";

$selectDivision = "SELECT * FROM `division` WHERE 1";
$selectResult = $conn->query($selectDivision);

if($selectResult->num_rows > 0 ){
	$row = array();
	while($r = $selectResult->fetch_array(MYSQLI_ASSOC)){
		$row[] = $r;
		}
		echo json_encode($row);
	}
else json_encode(["result"=>"no data found"]);