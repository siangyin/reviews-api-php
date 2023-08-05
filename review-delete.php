<?php
header("Content-Type: application/json; charset=UTF-8");
require_once __DIR__ . '/dbConnect.php';
$db= new DB_CONNECT();
$db->connect();

// Get req body raw data JSONObject and convert json to php object
$req_body= file_get_contents('php://input');
$post_data = json_decode($req_body, true);

$reviewId = isset($post_data['reviewId']) ? $post_data['reviewId'] : '';

if (empty($reviewId) ) {
    $response = array("status" => 0, "message" => "Please provide all required detail");
    echo json_encode($response);
} else {
    $sql = "DELETE r_reviews WHERE reviewId = '$reviewId'";
    $result = mysqli_query($db->myconn, $sql);

    if ($result){
        
        $response = array("status" => 1, "message" => "Review Deleted");
    echo json_encode($response);
    } else {
    // request failed
    $response = array("status" => 0, "message" => "Review delete failed");
    echo json_encode($response);
    }
}

?>
