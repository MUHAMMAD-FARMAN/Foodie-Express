<?php
require_once('db.php'); // Include your database connection script

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['product_id'])) {
        $product_id = $_POST['product_id'];
        $user_id = 1; // Replace this with the actual user's ID from the session

        // Check if the product is not already in the wishlist for the user
        $checkQuery = "SELECT COUNT(*) AS count FROM wishlist WHERE user_id = $user_id AND product_id = $product_id";
        $checkResult = db::getRecord($checkQuery);

        if ($checkResult['count'] == 0) {
            // Product is not in the wishlist, so add it
            $insertQuery = "INSERT INTO wishlist (user_id, product_id) VALUES ($user_id, $product_id)";
            $insertResult = db::insertRecord($insertQuery);

            if ($insertResult) {
                // Successfully added to the wishlist
                echo "Product added to favorites successfully!";
            } else {
                // Error adding to the wishlist
                echo "Error adding product to favorites";
            }
        } else {
            // Product is already in the wishlist
            echo "Product is already in favorites!";
        }
    }
}
?>
