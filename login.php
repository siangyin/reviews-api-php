<?php
header("Content-Type: application/json; charset=UTF-8");
require_once __DIR__ . '/dbConnect.php';
$db = new DB_CONNECT();
$db->connect();

$req_body = file_get_contents('php://input');
$post_data = json_decode($req_body, true);

$email = isset($post_data['email']) ? $post_data['email'] : '';
$password = isset($post_data['password']) ? $post_data['password'] : '';

if (empty($email) || empty($password)){
  $response = array("status" => 0, "message" => "Please provide email and password");
    echo json_encode($response);
} else {
   // has email & pw
  $sql = "SELECT * FROM r_users WHERE email = '$email' AND password = '$password'";
    $result = mysqli_query($db->myconn, $sql);

    if (mysqli_num_rows($result) > 0) {
      // has found matching user 
      $row = mysqli_fetch_assoc($result);
        $response = array(
            "status" => 1,
            "message" => "User logged in successfully",
            "userId" => (int)$row["userId"],
            "username" => $row["username"],
            "email" => $row["email"],
            "createdOn" => $row["createdOn"]
        );
        echo json_encode($response);

    } else {
      // not result handle err
      $response = array("status" => 0, "message" => "Invalid login");
        echo json_encode($response);
    }
}

?>