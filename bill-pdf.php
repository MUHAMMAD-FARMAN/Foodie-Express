<?php
session_start();
require('fpdf.php');

// Retrieve bill details from the session
if (isset($_SESSION['bill_details'])) {
    $billDetails = $_SESSION['bill_details'];

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

    // Output the PDF as a download named 'bill.pdf'
    $pdf->Output('bill.pdf', 'D');
} else {
    // Handle scenario where bill details are not available
    echo "No bill details found!";
}
?>
