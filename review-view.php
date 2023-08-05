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

$sql = "SELECT * FROM r_reviews r , r_user u ,r_restaurant t
WHERE r.userId=u.userId,
AND r.restaurantId= t.restaurantId,
AND r.reviewId = '$reviewId'";

  $result = mysqli_query($db->myconn, $sql);
  if (mysqli_num_rows($result) > 0) {
    // has found matching user 
    $row = mysqli_fetch_assoc($result);
      $response = array(
          "status" => 1,
          "message" => "review details list successful.",
          "restaurantName" => (int)$row["t.name"],
          "userName" => (int)$row["u.name"],
          "comment" => $row["r.comment"],
          "date" => (int)$row["r.date"],
      );
      echo json_encode($response);
 } else {
   // request failed
   $response = array("status" => 0, "message" => "review details list failed.");
   echo json_encode($response);
 }
?>
