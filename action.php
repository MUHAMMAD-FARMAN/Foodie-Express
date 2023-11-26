<?php
require_once('db.php'); // Include the database utility class file

// Initialize variables to store alert information
$alertMessage = "";
$alertClass = "";

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["submit"])) {
    // Sanitize and retrieve form data
    $name = $_POST['dzName'];
    $phone = $_POST['dzPhoneNumber'];
    $email = $_POST['dzEmail'];
    $numberOfPeople = $_POST['numberOfPeople'];
    $date = $_POST['date'];
    $time = $_POST['time'];

    // Validate the number of people against available seats
    $seats = db::getRecord("SELECT seating_id, total_seats FROM seatingmanagement WHERE restaurant_id = 1 AND total_seats >= $numberOfPeople AND (table_status = 'Available' OR table_status = 1) ORDER BY total_seats ASC LIMIT 1");

    if ($seats) {
        // Insert data into TableBooking table
        $seatingId = $seats['seating_id'];
        $insertQuery = "INSERT INTO TableBooking (customer_name, phone_number, email, number_of_people, checkin_time, seating_id, restaurant_id) VALUES ('$name', '$phone', '$email', '$numberOfPeople', '$date $time', '$seatingId', 1)";
        $insertedId = db::insertRecord($insertQuery);

        if ($insertedId) {
            $alertMessage = "Table booked successfully! Your seating ID is: $seatingId";
            $alertClass = "alert-success";
            // Update seatingmanagement table to make the table unavailable
            db::query("UPDATE seatingmanagement SET table_status = 0 WHERE seating_id = $seatingId");
        } else {
            $alertMessage = "Failed to book the table.";
            $alertClass = "alert-danger";
        }
    } else {
        $alertMessage = "No suitable table available for $numberOfPeople people.";
        $alertClass = "alert-danger";
    }
}
?>

<!-- Add this script in your HTML to display alerts -->
<script>
    <?php if (!empty($alertMessage)) { ?>
        alert("<?php echo $alertMessage; ?>");
    <?php } ?>
</script>
