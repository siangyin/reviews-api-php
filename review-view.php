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


// Assuming you have established a connection to your database already

// Sanitize the input to prevent SQL injection
$reviewId = mysqli_real_escape_string($db->myconn, $reviewId);

$sql = "SELECT * FROM r_reviews r, r_users u, r_restaurants t 
        WHERE r.userId = u.userId
        AND r.restaurantId = t.restaurantId
        AND r.reviewId = '$reviewId'";

$result = mysqli_query($db->myconn, $sql);

if (mysqli_num_rows($result) > 0) {
    // has found matching user 
    $row = mysqli_fetch_assoc($result);
    $response = array(
        "status" => 1,
        "message" => "Review details list successful.",
        "restaurantName" => $row["name"], // Remove (int) cast if "name" is a string
        "username" => $row["username"], // Remove (int) cast if "name" is a string
        "comment" => $row["comment"],
        "date" => $row["date"] // Assuming "date" is stored as a string or timestamp
    );
    echo json_encode($row);
} else {
    $response = array(
        "status" => 0,
        "message" => "No review found."
    );
    echo json_encode($response); //1234
}
?>


