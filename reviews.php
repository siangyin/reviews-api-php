<?php
header("Content-Type: application/json; charset=UTF-8");
require_once __DIR__ . "/dbConnect.php";
$db = new DB_CONNECT();
$db->connect();

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
        AND restaurantId = '$restaurantId'
        OR userId = '$userId'";


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