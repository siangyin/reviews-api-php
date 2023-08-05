<?php

class DB_CONNECT {
  var $myconn;

  function connect() {
    define('DB_USER', "root"); // db user
    define('DB_PASSWORD', ""); // db password (default is empty)
    define('DB_DATABASE', "MyDatabase"); // database name
    define('DB_SERVER', "localhost"); // db server
 
    // Connecting to the MySQL database
    $con = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD,DB_DATABASE) or die(mysqli_error($con));
    $this->myconn = $con;
    // Return the connection cursor
    return $this->myconn;
  }
    // Function to close the database connection
    function close($myconn) {
      mysqli_close($myconn);
} }

?>
