<?php
// Include the db.php file
include 'db.php';

// Check if the form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $company_name = $_POST["company_name"];
    $address = $_POST["address"];
    $apartment = $_POST["apartment"];
    $city = $_POST["city"];
    $state = $_POST["state"];
    $zipcode = $_POST["zipcode"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];

    $user_id = 1; // Replace this with the actual user's ID from the session

    // Calculate item total
    $itemTotalQuery = "SELECT SUM(p.price * ci.quantity) AS item_total
                    FROM cartitems ci 
                    INNER JOIN products p ON ci.product_id = p.product_id 
                    INNER JOIN carts c ON ci.cart_id = c.cart_id 
                    WHERE c.user_id = $user_id";

    $itemTotalResult = db::getRecord($itemTotalQuery);
    $itemTotal = isset($itemTotalResult['item_total']) ? $itemTotalResult['item_total'] : 0;

    // Define delivery charges, taxes, and calculate the total
    $deliveryCharges = 0.00;
    $taxes = 3.50;
    $total_price = $itemTotal + $deliveryCharges + $taxes;

    // Construct the SQL query to insert into orders table
    $orderSql = "INSERT INTO orders (cart_id, restaurant_id, order_date, order_type, `status`, total_price, discount, delivery_address, table_number, pickup_time, CreatedAt, UpdatedAt, Active)
    VALUES (1, 1, NOW(), 'Delivery', 'Active', '$total_price', 0, '$address', NULL, NULL, NOW(), NOW(), 1)";

    // Insert data into the "orders" table using the db class
    $insertedOrderId = db::insertRecord($orderSql);

    if ($insertedOrderId) {
        echo "New order record created successfully with ID: " . $insertedOrderId;

        // Check if deliver_type is 'Delivery'
        $deliver_type = 'Delivery'; // Replace this with your actual logic to get deliver_type from the form
        if ($deliver_type === 'Delivery') {
            $deliveryDriverId = 1; // Replace this with the actual delivery driver ID

            // Construct the SQL query for deliveryassignments table
            $deliveryAssignmentSql = "INSERT INTO deliveryassignments (order_id, driver_id, assign_date, delivery_status, CreatedAt, UpdatedAt, Active)
            VALUES ($insertedOrderId, $deliveryDriverId, NOW(), 'Assigned', NOW(), NOW(), 1)";

            // Insert data into the "deliveryassignments" table using the db class
            $insertedAssignmentId = db::insertRecord($deliveryAssignmentSql);

            if ($insertedAssignmentId) {
                echo "New delivery assignment created successfully with ID: " . $insertedAssignmentId;

                // Remove cart items associated with the user's cart
                $removeCartItemsSql = "DELETE ci FROM cartitems ci
                INNER JOIN carts c ON ci.cart_id = c.cart_id
                WHERE c.user_id = $user_id";

                $removedCartItems = db::query($removeCartItemsSql);

                if ($removedCartItems) {
                    echo "Cart items removed for user ID: " . $user_id;
                    
                    //remove associated deliveryassignments
                    $removeDeliveryAssignments = "DELETE FROM deliveryassignments WHERE order_id IN (SELECT order_id FROM orders WHERE cart_id IN (SELECT cart_id FROM carts WHERE user_id = $user_id))";
                    $removedDeliveryAssignments = db::query($removeDeliveryAssignments);
                    if($removedDeliveryAssignments){
                        echo "Delivery Assignments removed for user ID: " . $user_id;
                    } else {
                        echo "Error removing delivery assignments";
                    }
      
                    // Remove associated orders
                    // Construct the SQL query to update the status of orders to inactive
                    $updateOrdersSql = "UPDATE orders 
                    SET `status` = 'Inactive' 
                    WHERE cart_id IN (SELECT cart_id FROM carts WHERE user_id = $user_id)";

                    // Execute the query to update the status of orders
                    $updatedOrders = db::query($updateOrdersSql);

                    if ($updatedOrders) {
                        echo "Orders updated for user ID: " . $user_id;
                
                        // Remove all products from the cart for the user
                        // $removeFromCartSql = "DELETE FROM carts WHERE user_id = $user_id";
                        // $removedFromCart = db::query($removeFromCartSql);
                
                        // if ($removedFromCart) {
                        //     echo "Products removed from the cart for user ID: " . $user_id;
                        // } else {
                        //     echo "Error removing products from the cart";
                        // }
                    } else {
                        echo "Error updating orders";
                    }
                } else {
                    echo "Error removing cart items";
                }
            } else {
                echo "Error inserting delivery assignment";
            }
        }
    } else {
        echo "Error inserting order record";
    }
}
?>