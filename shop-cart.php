<?php
	session_start();
    include "header.php";
?>

	<div class="page-content bg-white">
		<!-- Banner  -->
		<div class="dz-bnr-inr style-1 text-center bg-parallax" style="background-image:url('assets/images/banner/bnr4.jpg'); background-size:cover; background-position:center;">
			<div class="container">
				<div class="dz-bnr-inr-entry">
					<h1>Shop Cart</h1>
					<!-- Breadcrumb Row -->
					<nav aria-label="breadcrumb" class="breadcrumb-row">
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Shop Cart</li>
						</ul>
					</nav>
					<!-- Breadcrumb Row End -->
				</div>
			</div>
		</div>
		<!-- Banner End -->
		
		<!-- Cart Section -->
		<section class="content-inner-1">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<div class="d-flex justify-content-between align-items-center">
							<h5 class="title m-b15 m-lg-30">Related Products</h5>
							<a href="javascript:void(0);" class="btn btn-primary panel-btn">Filter</a>
						</div>
						<?php
							require_once('db.php');

							$user_id = 1; // Replace this with the actual user's ID from the session

							// Query to fetch at least 5 relevant products added in the cart
							$query = "SELECT c.product_id, p.name, p.picture, p.price
									FROM cartitems c
									INNER JOIN products p ON c.product_id = p.product_id
									WHERE c.cart_id IN (
										SELECT cart_id FROM cartitems WHERE product_id = c.product_id AND cart_id IN (
											SELECT cart_id FROM carts WHERE user_id = $user_id
										)
									)
									GROUP BY c.product_id
									LIMIT 5";

							$result = db::getRecords($query);

							// Display relevant products in the HTML structure
							foreach ($result as $product) {
								echo '
								<div class="dz-shop-card style-1">
									<div class="dz-media">
										<img src="' . $product['picture'] . '" alt="/">
									</div>
									<div class="dz-content">
										<div class="dz-head">
											<h6 class="dz-name mb-0">
												<svg class="m-r10" width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
													<rect x="0.5" y="0.5" width="16" height="16" stroke="#0F8A65"/>
													<circle cx="8.5" cy="8.5" r="5.5" fill="#0F8A65"/>
												</svg>
												<a href="product-detail.html">' . $product['name'] . '</a>
											</h6>
										</div>
										<div class="dz-body">
											<p class="mb-0"><span class="text-primary font-weight-500">$' . $product['price'] . '</span> For a one</p>
											<form action="add_to_cart.php" method="post">
												<input type="hidden" name="product_id" value="' . $product['product_id'] . '">
												<input type="hidden" name="quantity" value="1">
												<button type="submit" name="add_to_cart" class="btn btn-primary btn-sm">Add to Cart</button>
											</form>
										</div>
									</div>
								</div>';
							}
						?>
					</div>
					<div class="col-lg-4">
						<aside class="side-bar sticky-top">
							<div class="shop-filter style-1">
								<div class="d-flex justify-content-between">
									<div class="widget-title">
										<h5 class="title m-b30">Cart <span class="text-primary">(03)</span></h5>
									</div>
									<a href="javascript:void(0);" class="panel-close-btn"><i class="fa-solid fa-xmark"></i></a>
								</div>
								<?php
									require_once('db.php');

									// Fetch cart items from the database
									$user_id = 1; // Replace this with the actual user's ID from the session
									$cartItemsQuery = "SELECT ci.product_id, p.name AS product_name, p.picture, ci.quantity, p.price 
													FROM cartitems ci 
													INNER JOIN products p ON ci.product_id = p.product_id 
													INNER JOIN carts c ON ci.cart_id = c.cart_id 
													WHERE c.user_id = $user_id";

									$cartItems = db::getRecords($cartItemsQuery);

									// Display cart items in the HTML structure
									foreach ($cartItems as $item) {
										echo '
										<div class="cart-item style-1">
											<div class="dz-media">
												<img src="' . $item['picture'] . '" alt="' . $item['product_name'] . '">
											</div>
											<div class="dz-content">
												<div class="dz-head">
													<h6 class="title mb-0">' . $item['product_name'] . '</h6>
													<a href="javascript:void(0);"><i class="fa-solid fa-xmark text-danger"></i></a>
												</div>
												<div class="dz-body">
													<div class="btn-quantity style-1">
														<input type="text" value="' . $item['quantity'] . '" name="quantity" readonly>
													</div>
													<h5 class="price text-primary mb-0">$' . $item['price'] * $item['quantity'] . '</h5>
												</div>
											</div>
										</div>';
									}
								?>
							<?php
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
									'delivery_charges' => 5.00,
									'taxes' => $taxes,
									'total' => $total,
								);
								// session_start();
								$_SESSION['bill_details'] = $billDetails;
								// Render HTML
								?>
								<div class="order-detail">
									<h6>Bill Details</h6>
									<table>
										<tbody>
											<tr>
												<td>Item Total</td>
												<td class="price text-primary">$<?php echo number_format($itemTotal, 2); ?></td>
											</tr>
											<tr>
												<td>Delivery Type:</td>
												<td>
													<form action="checkout.php" method="post">
														<div class="delivery-options">
															<label for="delivery">Delivery</label>
															<input type="radio" id="delivery" name="delivery_type" value="delivery">

															<label for="dineIn">Dine-in</label>
															<input type="radio" id="dineIn" name="delivery_type" value="dineIn">
														</div>
														<input type="hidden" name="bill_details" value='<?php echo json_encode($billDetails); ?>'>
												</td>
											</tr>
											<tr class="tax">
												<td>Govt Taxes & Other Charges</td>
												<td class="price text-primary">$<?php echo number_format($taxes, 2); ?></td>
											</tr>
											<tr class="total">
												<td><h6>Total</h6></td>
												<td class="price text-primary">$<?php echo number_format($total, 2); ?></td>
											</tr>
										</tbody>
									</table>
									<button type="submit" class="btn btn-primary d-block text-center btn-md w-100 btn-hover-1">
										<span>Proceed to Checkout <i class="fa-solid fa-arrow-right"></i></span>
									</button>
									</form>
								</div>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</section>
		<!-- cart Section -->
	</div>

<?php
    include "footer.php"
?>