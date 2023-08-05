<?php
header("Content-Type: application/json; charset=UTF-8");
require_once __DIR__ . "/dbConnect.php";
$db = new DB_CONNECT();
$db->connect();

// Get req body raw data JSONObject and convert json to php object
$req_body= file_get_contents('php://input');
$post_data = json_decode($req_body, true);

$restaurantId = isset($post_data['restaurantId']) ? $post_data['restaurantId'] : '';
$userId = isset($post_data['userId']) ? $post_data['userId'] : '';

class Review {
    public static function generateReview ($row) {
        return [
            "reviewId " => (int)$row["reviewId"],
            "username" => $row["username"],
            "restaurantName" => $row["name"],
            "comment" => $row["comment"],
            "date" => $row["date"]
        ];
    }
}

$sql = "SELECT * FROM r_reviews r, r_users u, r_restaurants t 
        WHERE r.userId = u.userId
        AND r.restaurantId = t.restaurantId
        AND ( r.restaurantId = '$restaurantId'
        OR r.userId = '$userId')";


$result = mysqli_query($db->myconn, $sql);

if (mysqli_num_rows($result) > 0) {
    $data = [];
    foreach ($result as $row) {
        $rest_db = Review::generateReview($row);
        $data[] = $rest_db;
    }
    $response = array("status" => 1, "data" => $data);
    echo json_encode($response);
} else {
    $response = array("status" => 0, "message" => "No data found");
    echo json_encode($response);
}
?>