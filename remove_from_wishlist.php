<?php
    // Include your database connection
    require_once('db.php');

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Get the product ID from the AJAX request
        $productID = $_POST['product_id'];

        // Query to remove the product from the wishlist
        $removeQuery = "DELETE FROM wishlist WHERE product_id = $productID"; // Modify this query as per your table structure

        // Execute the deletion query
        $result = db::query($removeQuery);

        if ($result) {
            echo 'Product removed successfully'; // Send success message back to the AJAX call
        } else {
            echo 'Error removing product from wishlist'; // Send error message back to the AJAX call
        }
    }
?>
