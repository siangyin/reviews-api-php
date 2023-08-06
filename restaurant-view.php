<?php
header("Content-Type: application/json; charset=UTF-8");
require_once __DIR__ . '/dbConnect.php';
$db= new DB_CONNECT();
$db->connect();

// Get req body raw data JSONObject and convert json to php object
$req_body= file_get_contents('php://input');
$post_data = json_decode($req_body, true);

$restaurantId = isset($post_data['restaurantId']) ? $post_data['restaurantId'] : '';

// Assuming you have established a connection to your database already

// Sanitize the input to prevent SQL injection
$restaurantId = mysqli_real_escape_string($db->myconn, $restaurantId);

$sql = "SELECT * FROM r_restaurants t,r_reviews r
        WHERE t.restaurantId = r.restaurantId
        AND r.restaurantId = '$restaurantId'";

$result = mysqli_query($db->myconn, $sql);

if (mysqli_num_rows($result) > 0) {
    // has found matching user 
    $row = mysqli_fetch_assoc($result);
    $response = array(
        "status" => 1,
        "message" => "Restaurant details list successful.",
        "Name" => $row["name"], 
        "photo" => $row["photo"],
        "description" => $row["description"],
        "openinghours" => $row["openinghours"] 
        /*
        "username" => $row["username"], 
        "comment" => $row["comment"],
        "createdOn" => $row["createdOn"] */
    );
    echo json_encode($response);
} else {
    $response = array(
        "status" => 0,
        "message" => "No restaurant found."
    );
    echo json_encode($response); 
}
?>


