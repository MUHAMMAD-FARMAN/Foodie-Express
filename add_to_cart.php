<?php
require_once('db.php');

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["add_to_cart"])) {
    // Retrieve data from the form
    $product_id = $_POST['product_id'];
    $quantity = $_POST['quantity'];
    
    // Default user ID
    $user_id = 1; // Change this to retrieve the actual user ID from the session

    // Check if the cart for the user already exists, if not, create a new cart
    $cartQuery = "SELECT cart_id FROM carts WHERE user_id = $user_id";
    $cartResult = db::getRecord($cartQuery);
    $cart_id = $cartResult ? $cartResult['cart_id'] : null;

    if (!$cart_id) {
        // Create a new cart for the user if it doesn't exist
        $createCartQuery = "INSERT INTO carts (user_id) VALUES ($user_id)";
        $createCartResult = db::query($createCartQuery);

        if ($createCartResult) {
            $cart_id = mysqli_insert_id(db::open()); // Get the last inserted cart ID
        }
    }

    if ($cart_id) {
        // Check if the product already exists in the cartitems table
        $checkQuery = "SELECT * FROM cartitems WHERE cart_id = $cart_id AND product_id = $product_id";
        $checkResult = db::getRecord($checkQuery);

        if ($checkResult) {
            // Product already exists in cart, update quantity
            $newQuantity = $checkResult['quantity'] + $quantity;
            $cart_item_id = $checkResult['cart_item_id'];
            $updateQuery = "UPDATE cartitems SET quantity = $newQuantity WHERE cart_item_id = $cart_item_id";
            $updateResult = db::query($updateQuery);

            if ($updateResult) {
                echo "Product quantity updated in cart successfully";
            } else {
                echo "Failed to update product quantity in cart";
            }
        } else {
            // Product does not exist in cart, insert new record
            $insertQuery = "INSERT INTO cartitems (cart_id, product_id, quantity) VALUES ($cart_id, $product_id, $quantity)";
            $result = db::query($insertQuery);

            if ($result) {
                echo "Product added to cart successfully";
            } else {
                echo "Failed to add product to cart";
            }
        }
    } else {
        echo "Failed to create a cart for the user";
    }
} else {
    echo "Invalid request";
}
?>
