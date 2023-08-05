<?php
header("Content-Type: application/json; charset=UTF-8");
require_once __DIR__ . "/dbConnect.php";
$db = new DB_CONNECT();
$db->connect();

class Restaurant {
    public static function generateRestaurant ($row) {
        return [
            "restaurantId " => (int)$row["restaurantId "],
            "name" => $row["name"],
            "photo" => $row["photo"],
            "cat" => $row["category"],
            "desc" => $row["description"],
            "openinghours" => $row["openinghours"]
            
        ];
    }
}

$sql = "SELECT * FROM r_restaurants";
$result = mysqli_query($db->myconn, $sql);

if (mysqli_num_rows($result) > 0) {
    $data = [];
    foreach ($result as $row) {
        $rest_db = Restaurant::generateRestaurant($row);
        $data[] = $rest_db;
    }
    $response = array("status" => 1, "data" => $data);
    echo json_encode($response);
} else {
    $response = array("status" => 0, "message" => "No data found");
    echo json_encode($response);
}

?>