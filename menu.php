<?php
    include "header.php";
?>

	
	<div class="page-content bg-white">
		<!-- Banner  -->
		<div class="dz-bnr-inr style-1 text-center bg-parallax" style="background-image:url('assets/images/banner/bnr5.jpg'); background-size:cover; background-position:center;">
			<div class="container">
				<div class="dz-bnr-inr-entry">
					<h1>Our Menu</h1>
					<!-- Breadcrumb Row -->
					<nav aria-label="breadcrumb" class="breadcrumb-row">
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Our Menu</li>
						</ul>
					</nav>
					<!-- Breadcrumb Row End -->
				</div>
			</div>
		</div>
		<!-- Banner End -->
		
		<!-- Our Menu-->
		<section class="content-inner">
			<div class="container">
				<div class="row">
					<div class="col-xl-10 col-lg-9 col-md-12">
						<div class="site-filters style-1 clearfix">
							<ul class="filters" data-bs-toggle="buttons">
								<li data-filter=".All" class="btn active"><a href="javascript:void(0);"><span><i class="flaticon-fast-food"></i></span>ALL</a></li>
								<li data-filter=".drink" class="btn"><a href="javascript:void(0);"><span><i class="flaticon-cocktail"></i></span>COLD DRINK</a></li>
								<li data-filter=".pizza" class="btn"><a href="javascript:void(0);"><span><i class="flaticon-pizza-slice"></i></span>PIZZA</a></li>
								<li data-filter=".salad" class="btn"><a href="javascript:void(0);"><span><i class="flaticon-salad"></i></span>SALAD</a></li>
								<li data-filter=".sweet" class="btn"><a href="javascript:void(0);"><span><i class="flaticon-cupcake"></i></span>SWEETS</a></li>
								<li data-filter=".spicy" class="btn"><a href="javascript:void(0);"><span><i class="flaticon-chili-pepper"></i></span>SPICY</a></li>
								<li data-filter=".burger" class="btn"><a href="javascript:void(0);"><span><i class="flaticon-hamburger-1"></i></span>BURGER</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-2 col-lg-3 col-md-12 text-lg-end mb-lg-0 m-b30 d-flex d-lg-block align-items-center justify-content-between">
						<strong class="filter-item-show d-lg-none">51,740 items</strong>
						<a data-bs-toggle="offcanvas" href="#offcanvasFilter" role="button" aria-controls="offcanvasFilter" class="btn btn-primary filter-btn btn-hover-2">
							Filter <span><i class="icon-filter m-l5"></i></span>
						</a>
					</div>
					<div class="offcanvas offcanvas-end filter-category-sidebar" tabindex="-1" id="offcanvasFilter" >
						<button type="button" class="btn-close style-1" data-bs-dismiss="offcanvas" aria-label="Close"><i class="la la-close"></i></button>
						<div class="offcanvas-body">
							<div class="widget">
								<div class="widget-title">
									<h4 class="title">Refine By Categories</h4>
								</div>
                                <div class="category-check-list">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-01">
										<label class="form-check-label" for="productCheckBox-01">
											Pizza
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-02">
										<label class="form-check-label" for="productCheckBox-02">
											Hamburger
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-03">
										<label class="form-check-label" for="productCheckBox-03">
											Cold Drink
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-04">
										<label class="form-check-label" for="productCheckBox-04">
											Sandwich
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-05">
										<label class="form-check-label" for="productCheckBox-05">
											Muffin
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-06">
										<label class="form-check-label" for="productCheckBox-06">
											Burrito
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-07">
										<label class="form-check-label" for="productCheckBox-07">
											Taco
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-08">
										<label class="form-check-label" for="productCheckBox-08">
											Hot Dog
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-09">
										<label class="form-check-label" for="productCheckBox-09">
											Noodles
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-10">
										<label class="form-check-label" for="productCheckBox-10">
											Macrony
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-11">
										<label class="form-check-label" for="productCheckBox-11">
											Cheese Pasta
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-12">
										<label class="form-check-label" for="productCheckBox-12">
											Fish Fry
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-13">
										<label class="form-check-label" for="productCheckBox-13">
											Cold Coffee
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-14">
										<label class="form-check-label" for="productCheckBox-14">
											Manchurian
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-15">
										<label class="form-check-label" for="productCheckBox-15">
											Dosa
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-16">
										<label class="form-check-label" for="productCheckBox-16">
											Momos
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-17">
										<label class="form-check-label" for="productCheckBox-17">
											Soup
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-18">
										<label class="form-check-label" for="productCheckBox-18">
											Chicken Burger
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-19">
										<label class="form-check-label" for="productCheckBox-19">
											Beverages
										</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="" id="productCheckBox-20">
										<label class="form-check-label" for="productCheckBox-20">
											Lemon Lime Soda
										</label>
									</div>
								</div>
                            </div>
							<div class="widget">
								<div class="widget-title">
									<h4 class="title">Near Me</h4>
								</div>
                                <div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="productCheckBox-21">
									<label class="form-check-label" for="productCheckBox-21">
										Ortus Restaurant
									</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="productCheckBox-22">
									<label class="form-check-label" for="productCheckBox-22">
										Amar Punjabi Restaurant
									</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="productCheckBox-23">
									<label class="form-check-label" for="productCheckBox-23">
										Other
									</label>
								</div>
                            </div>
							<div class="widget rating-filter">
								<div class="widget-title">
									<h4 class="title">Rating</h4>
								</div>
                                <ul>
									<li><span>5 Star</span></li>
									<li><i class="icon-star-on"></i></li>
									<li><i class="icon-star-on"></i></li>
									<li><i class="icon-star-on"></i></li>
									<li><i class="icon-star-on"></i></li>
									<li><i class="icon-star-on"></i></li>
								</ul>
								<ul>
									<li><span>4 Star</span></li>
									<li><i class="icon-star-on"></i></li>
									<li><i class="icon-star-on"></i></li>
									<li><i class="icon-star-on"></i></li>
									<li><i class="icon-star-on"></i></li>
								</ul>
								<ul>
									<li><span>3 Star</span></li>
									<li><i class="icon-star-on"></i></li>
									<li><i class="icon-star-on"></i></li>
									<li><i class="icon-star-on"></i></li>
								</ul>
								<ul>
									<li><span>2 Star</span></li>
									<li><i class="icon-star-on"></i></li>
									<li><i class="icon-star-on"></i></li>
								</ul>
								<ul>
									<li><span>1 Star</span></li>
									<li><i class="icon-star-on"></i></li>
								</ul>
                            </div>
							<div class="widget">
								<div class="widget-title">
									<h4 class="title">Price Range</h4>
								</div>
								<div class="range-slider style-1">
									<div id="slider-tooltips"></div>
								</div>
                            </div>
						</div>
					</div>
				</div>
				<ul id="" class="row">
				<?php
    require_once('db.php');

    // Fetch data from the products table
    $productQuery = "SELECT * FROM products WHERE Active = 1"; // Consider only active products
    $products = db::getRecords($productQuery);

    // Display products in the HTML structure
    foreach ($products as $product) {
?>
        <li class="card-container col-lg-3 col-md-6 col-sm-6 m-b30 All <?php echo $product['menu_item_id']; ?>">
            <div class="dz-img-box style-2 box-hover">
                <div class="dz-media">
                    <img src="<?php echo $product['picture']; ?>" alt="<?php echo $product['name']; ?>">
                </div>
                <div class="dz-content">
                    <h4 class="dz-title"><a href="product-detail.html"><?php echo $product['name']; ?></a></h4>
                    <p><?php echo $product['description']; ?></p>
                    <h5 class="dz-price text-primary">$<?php echo $product['price']; ?></h5>
                    <form action="add_to_cart.php" method="post">
                        <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>">
                        <input type="number" name="quantity" value="1" min="1" id="quantity_<?php echo $product['product_id']; ?>">
                        <button type="submit" name="add_to_cart" class="btn btn-primary btn-hover-2">
                            Add To Cart
                        </button>
                    </form>
                    <button class="add-to-favorites btn btn-primary btn-hover-2" data-product-id="<?php echo $product['product_id']; ?>">
                        <!-- Font Awesome Heart Icon (you can use your icon/image) -->
                        <i class="fas fa-heart"></i> Add to Favorites
                    </button>
                </div>
            </div>
        </li>
<?php
    }
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('.add-to-favorites').click(function() {
            var productId = $(this).data('product-id');

            // Make an AJAX request to add the product to favorites
            $.ajax({
                type: 'POST',
                url: 'addToFavorites.php', // Replace with your PHP script handling wishlist addition
                data: { product_id: productId },
                success: function(response) {
                    alert(response); // Show success or error message returned from PHP script
                },
                error: function() {
                    alert('Error adding to favorites');
                }
            });
        });
    });
</script>

				</ul>
			</div>
		</section>
		<!-- Our Menu-->
		
	</div>

<?php
    include "footer.php"
?>