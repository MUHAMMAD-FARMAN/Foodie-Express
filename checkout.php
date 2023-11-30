<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Handle other form data

    $deliveryType = $_POST['delivery_type'];

    // Store $billDetails array in a session variable
    $billDetails = $_SESSION["bill_details"];
    // $_SESSION['bill_details'] = $billDetails;
    // echo "<script>alert('$billDetails')</script>";

    if ($deliveryType === 'dineIn') {
        // Redirect to the bill-pdf.php page for dine-in bill generation
        header("Location: bill-pdf.php");
        exit();
    } elseif ($deliveryType === 'delivery') {
        // Redirect to the shop checkout page for delivery
        header("Location: shop-checkout.php");
        exit();
    }
}
?>
