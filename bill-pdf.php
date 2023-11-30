<?php
session_start();
require('fpdf.php');

// Function to insert order data into the database
function insertOrderIntoDatabase($billDetails)
{
    require_once('db.php');

    // Construct the SQL query to insert into orders table
    $orderSql = "INSERT INTO orders (cart_id, restaurant_id, order_date, order_type, `status`, total_price, discount, delivery_address, table_number, pickup_time, CreatedAt, UpdatedAt, Active)
    VALUES (1, 1, NOW(), 'Dine-in', 'Active', '{$billDetails['total']}', 0, NULL, NULL, NULL, NOW(), NOW(), 1)";

    // Insert data into the "orders" table using the db class
    $insertedOrderId = db::insertRecord($orderSql);

    return $insertedOrderId;
}

// Function to generate PDF bill
function generateBillPDF($billDetails)
{


    $user_id = 1; // Replace this with the actual user's ID from the session    // Remove cart items associated with the user's cart
    
    $query = "UPDATE products AS p
    SET total_sales = COALESCE(
        (SELECT SUM(ci.quantity) AS item_total
        FROM cartitems ci
        INNER JOIN carts c ON ci.cart_id = c.cart_id
        WHERE ci.product_id = p.product_id AND c.user_id = $user_id
        GROUP BY ci.product_id), 0)";
        
    $result = db::query($query);

    $removeCartItemsSql = "DELETE ci FROM cartitems ci
                        INNER JOIN carts c ON ci.cart_id = c.cart_id
                        WHERE c.user_id = $user_id";

    $removedCartItems = db::query($removeCartItemsSql);

    // Change order status to Inactive for orders associated with the user's cart
    $changeOrderStatusSql = "UPDATE orders SET `status` = 'Inactive' WHERE cart_id IN (SELECT cart_id FROM carts WHERE user_id = $user_id)";
    $changedOrderStatus = db::query($changeOrderStatusSql);

    // Create a new PDF instance
    $pdf = new FPDF();
    $pdf->AddPage();
   
    // Set font
    $pdf->SetFont('Arial', '', 12);

    // Title
    $pdf->Cell(0, 10, 'Bill Details', 0, 1, 'C'); // Center-aligned title
    $pdf->Ln(); // Line break

    // Output bill details from the array
    foreach ($billDetails as $detail => $value) {
        $pdf->Cell(80, 10, $detail, 1); // Detail description
        $pdf->Cell(40, 10, '$' . number_format($value, 2), 1, 1); // Detail value
    }

    return $pdf;
}

// Retrieve bill details from the session
if (isset($_SESSION["bill_details"])) {
    $billDetails = $_SESSION['bill_details'];

    // Insert order data into the database
    $insertedOrderId = insertOrderIntoDatabase($billDetails);

    // Generate PDF bill
    $pdf = generateBillPDF($billDetails);

    // Output the PDF as a download named 'bill.pdf'
    $pdf->Output('bill.pdf', 'D');

    // Clear the session variable
    unset($_SESSION["bill_details"]);

    $updateOrdersSql = "UPDATE orders 
    SET `status` = 'Inactive' 
    WHERE cart_id IN (SELECT cart_id FROM carts WHERE user_id = $user_id)";

    // Execute the query to update the status of orders
    $updatedOrders = db::query($updateOrdersSql);

} else {
    // Handle scenario where bill details are not available
    echo "No bill details found!";
}
?>
