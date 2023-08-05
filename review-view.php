<?php
header("Content-Type: application/json; charset=UTF-8");
require_once __DIR__ . '/dbConnect.php';
$db= new DB_CONNECT();
$db->connect();

// Get req body raw data JSONObject and convert json to php object
$req_body= file_get_contents('php://input');
$post_data = json_decode($req_body, true);

$reviewId = isset($post_data['reviewId']) ? $post_data['reviewId'] : '';
$comment = isset($post_data['comment']) ? $post_data['comment'] : '';

$sql = "SELECT * FROM r_reviews WHERE reviewId = '$reviewId'";
  $result = mysqli_query($db->myconn, $sql);
  if ($result){
    
    $response = array("status" => 1, "message" => "review details list successful.");
   echo json_encode($response);
 } else {
   // request failed
   $response = array("status" => 0, "message" => "review details list failed.");
   echo json_encode($response);
 }
?>
