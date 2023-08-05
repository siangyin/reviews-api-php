<?php
header("Content-Type: application/json; charset=UTF-8");
require_once __DIR__ . "/dbConnect.php";
$db = new DB_CONNECT();
$db->connect();

class Review {
    public static function generateReview($row) {
        return [
            "reviewId" => (int)$row["reviewId"],
            "username" => $row["username"],
            "restaurantName" => $row["name"],
            "comment" => $row["comment"],
            "date" => $row["date"]
        ];
    }
}

// Assuming you have the values for $restaurantId and $userId properly obtained and sanitized.

// Assuming $restaurantId and $userId are integers, otherwise use appropriate data types and sanitization.
$restaurantId = (int)$_POST['restaurantId'];
$userId = (int)$_POST['userId'];

// Using prepared statements to prevent SQL injection

// Fetch reviews by restaurantId
if (!empty($restaurantId)) {
    $stmt = $db->myconn->prepare("SELECT * FROM r_reviews r
                                 JOIN r_users u ON r.userId = u.userId
                                 JOIN r_restaurants t ON r.restaurantId = t.restaurantId
                                 WHERE r.restaurantId = ?");
    $stmt->bind_param("i", $restaurantId); // "i" indicates an integer parameter
}
// Fetch reviews by userId
elseif (!empty($userId)) {
    $stmt = $db->myconn->prepare("SELECT * FROM r_reviews r
                                 JOIN r_users u ON r.userId = u.userId
                                 JOIN r_restaurants t ON r.restaurantId = t.restaurantId
                                 WHERE r.userId = ?");
    $stmt->bind_param("i", $userId); // "i" indicates an integer parameter
}
else {
    $response = array("status" => 0, "message" => "No data found");
    echo json_encode($response);
    exit;
}

$stmt->execute();

$result = $stmt->get_result();

if ($result->num_rows > 0) {
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

$stmt->close();
?>
