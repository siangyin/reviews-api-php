<?php
header("Content-Type: application/json; charset=UTF-8");
require_once __DIR__ . '/dbConnect.php';
$db= new DB_CONNECT();
$db->connect();

// Get req body raw data JSONObject and convert json to php object
$req_body= file_get_contents('php://input');
$post_data = json_decode($req_body, true);

$userId = isset($post_data['userId']) ? $post_data['userId'] : '';
$restaurantId = isset($post_data['restaurantId']) ? $post_data['restaurantId'] : '';
$comment = isset($post_data['comment']) ? $post_data['comment'] : '';

if (empty($userId) || empty($restaurantId) || empty($comment)) {
    $response = array("status" => 0, "message" => "Please provide all required detail");
    echo json_encode($response);
} else {
  // has all values
  // INSERT INTO `r_reviews`(`reviewId`, `userId`, `restaurantId`, `comment`, `date`) 

  $sql = "INSERT INTO r_reviews (userId, restaurantId, comment) VALUES ('$userId', '$restaurantId', '$comment')";
  $result = mysqli_query($db->myconn, $sql);
  if ($result){

     $response = array("status" => 1, "message" => "Review added");
    echo json_encode($response);
  } else {
    // request failed
    $response = array("status" => 0, "message" => "Request failed");
    echo json_encode($response);
  }
}

?>
