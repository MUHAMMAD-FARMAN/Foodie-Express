<?php
    include "header.php";
?>

<div class="page-content bg-white">
		<!-- Banner  -->
		<div class="dz-bnr-inr style-1 text-center bg-parallax" style="background-image:url('assets/images/banner/bnr5.jpg'); background-size:cover; background-position:center;">
			<div class="container">
				<div class="dz-bnr-inr-entry">
					<h1>Shop Wishlist</h1>
					<!-- Breadcrumb Row -->
					<nav aria-label="breadcrumb" class="breadcrumb-row">
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Shop Wishlist</li>
						</ul>
					</nav>
					<!-- Breadcrumb Row End -->
				</div>
			</div>
		</div>
		<!-- Banner End -->
		
		<!-- Wishlist Section -->
		<div class="content-inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 m-b30">
						<div class="table-responsive">
							<table class="table check-tbl table-responsive-md">
								<thead>
									<tr>
										<th>Product</th>
										<th>Product Name</th>
										<th>Unit Price</th>
										<th>Add to cart </th>
										<th class="text-end">Close</th>
									</tr>
								</thead>
								<tbody>
								<?php
    require_once('db.php');

    // Fetch wishlist data from the database
    $wishlistQuery = "SELECT p.product_id, p.name AS product_name, p.picture AS product_image, p.price AS product_price
                      FROM wishlist w
                      INNER JOIN products p ON w.product_id = p.product_id";
    $wishlistItems = db::getRecords($wishlistQuery);

    // Display wishlist items in the HTML table structure
    foreach ($wishlistItems as $wishlistItem) {
?>
        <tr>
            <td class="product-item-img"><img src="<?php echo $wishlistItem['product_image']; ?>" alt="<?php echo $wishlistItem['product_name']; ?>"></td>
                                    <td class="product-item-name"><?php echo $wishlistItem['product_name']; ?></td>
                                    <td class="product-item-price">$<?php echo $wishlistItem['product_price']; ?></td>
                                    <td class="product-item-totle">
                                        <form action="add_to_cart.php" method="post">
                                            <input type="hidden" name="product_id" value="<?php echo $wishlistItem['product_id']; ?>">
                                            <input type="number" name="quantity" value="1" min="1" id="quantity_<?php echo $wishlistItem['product_id']; ?>">
                                            <button type="submit" name="add_to_cart" class="btn btn-gray btn-hover-2">
                                                Add To Cart
                                            </button>
                                        </form>
                                    </td>
                                    <td class="product-item-close">
                                        <a href="javascript:void(0);" class="remove-from-wishlist" data-product-id="<?php echo $wishlistItem['product_id']; ?>" class="bg-danger">
                                            <i class="fa fa-close"></i>
                                        </a>
                                    </td>
                                </tr>
                                <?php
                                    }
                                ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Wishlist Section -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.remove-from-wishlist').click(function() {
                    var productId = $(this).data('product-id');

                    // Make an AJAX request to remove the product from the wishlist
                    $.ajax({
                        type: 'POST',
                        url: 'remove_from_wishlist.php', // Replace with your PHP script handling wishlist item removal
                        data: { product_id: productId },
                        success: function(response) {
                            // If the removal is successful, remove the row from the table
                            $(this).closest('tr').remove();
                            alert('Product removed from the wishlist');
                        },
                        error: function() {
                            alert('Error removing product from the wishlist');
                        }
                    });
                });
            });
        </script>

	</div>

<?php
    include "footer.php"
?>