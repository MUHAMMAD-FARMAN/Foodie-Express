<?php
    include "header.php";
?>
<?php
	require_once('db.php');
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
	$total = $itemTotal + $deliveryCharges + $taxes;

	// Prepare bill details array
	$billDetails = array(
		'item_total' => $itemTotal,
		'delivery_charges' => 0.00,
		'taxes' => $taxes,
		'total' => $total,
	);
?>
	<div class="page-content bg-white">
		<!-- Banner  -->
		<div class="dz-bnr-inr style-1 text-center bg-parallax" style="background-image:url('assets/images/banner/bnr3.jpg'); background-size:cover; background-position:center;">
			<div class="container">
				<div class="dz-bnr-inr-entry">
					<h1>Shop Checkout</h1>
					<!-- Breadcrumb Row -->
					<nav aria-label="breadcrumb" class="breadcrumb-row">
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Shop Checkout</li>
						</ul>
					</nav>
					<!-- Breadcrumb Row End -->
				</div>
			</div>
		</div>
		<!-- Banner End -->
		
		<!-- Cart Section -->
		<section class="content-inner">
			<div class="container">
			<form class="shop-form" action="process_order.php" method="post">
				<div class="row">
					<div class="col-lg-6">
						<div class="widget">
							<h4 class="widget-title">Billing & Shipping Address</h4>
							
							<div class="row">
								<div class="form-group col-md-6 m-b20">
									<input name="first_name" required type="text" class="form-control" placeholder="First Name">
								</div>
								<div class="form-group col-md-6 m-b20">
									<input name="last_name" required type="text" class="form-control" placeholder="Last Name">
								</div>
							</div>
							<div class="form-group m-b20">
								<input name="company_name" required type="text" class="form-control" placeholder="Company Name">
							</div>
							<div class="form-group m-b20">
								<input name="address" required type="text" class="form-control" placeholder="Address">
							</div>
							<div class="row">
								<div class="form-group col-md-6 m-b20">
									<input name="apartment" required type="text" class="form-control" placeholder="Apartment, suite, unit etc.">
								</div>
								<div class="form-group col-md-6 m-b20">
									<input name="city" required type="text" class="form-control" placeholder="Town / City">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 m-b20">
									<input name="state" required type="text" class="form-control" placeholder="State / County">
								</div>
								<div class="form-group col-md-6 m-b20">
									<input name="zipcode" required type="text" class="form-control" placeholder="Postcode / Zip">
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 m-b20">
									<input name="email" required type="email" class="form-control" placeholder="Email">
								</div>
								<div class="form-group col-md-6 m-b20">
									<input name="phone" required type="text" class="form-control dz-number" placeholder="Phone">
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6">
						<h4 class="widget-title">Order Total</h4>
						<table class="table-bordered check-tbl mb-4">
							<tbody>
								<tr>
									<td>Order Subtotal</td>
									<td class="product-price">$<?php echo number_format($itemTotal, 2); ?></td>
								</tr>
								<tr>
									<td>Shipping</td>
									<td>Free Shipping</td>
								</tr>
								<tr>
									<td>Taxes</td>
									<td class="price text-primary">$<?php echo number_format($taxes, 2); ?></td>
									<!-- <td>Free Shipping</td> -->
								</tr>
								<!-- <tr>
									<td>Coupon</td>
									<td class="product-price">$28.00</td>
								</tr> -->
								<tr>
									<td>Total</td>
									<td class="product-price-total">$<?php echo number_format($total, 2); ?></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<button type="submit" class="btn btn-primary d-block text-center btn-md w-100 btn-hover-1">
					<span>Place Order</span>
				</button>
			</form>
				<div class="dz-divider bg-gray-dark icon-center my-5">
					<i class="fa fa-circle bg-white text-primary"></i>
				</div>
				<div class="row">
					
					<div class="col-lg-6">
						<form class="shop-form widget">
							<h4 class="widget-title">Payment Method</h4>
							<div class="form-group m-b20">
								<input type="text" class="form-control" placeholder="Name on Card">
							</div>
							<div class="form-group m-b20">
								<select class="form-select default-select">
									<option value="Credit Card Type">Credit Card Type</option>
									<option value="Another option">Another option</option>
									<option value="A option">A option</option>
									<option value="Potato">Potato</option>
								</select>	
							</div>
							<div class="form-group m-b20">
								<input name="dzOther[CreditCardNumber]" type="text" class="form-control" placeholder="Credit Card Number">
							</div>
							<div class="form-group m-b20">
								<input name="dzOther[CardVerificationNumber]" type="text" class="form-control" placeholder="Card Verification Number">
							</div>
							<div class="form-group">
								<button class="btn btn-gray btn-hover-2" type="submit" value="submit" name="submit">Place Order Now </button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<!-- cart Section -->
		
	</div>

<?php
    include "footer.php"
?>