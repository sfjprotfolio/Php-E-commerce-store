<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

include 'components/wishlist_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Home-Jenny's Shop</title>

   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<div class="home-bg">

<section class="home">
   <h2><B><I>TOP SELLING PRODUCTS</I></B></h2>
   <!---->

   <!---->
 <div class="containertj">
   <div class="slidetj active">
      <img src="images/jewella.png" alt="">
   </div>
   <div class="slidetj next">
      <img src="images/pendant-2.png" alt="">
   </div>
   <div class="slidetj ">
      <img src="images/Ellipse.png" alt="">
   </div>
   <div class="slidetj">
      <img src="images/Powder puff-3.png" alt="">
   </div>
   <div class="slidetj prev">
      <img src="images/Foundation.png" alt="">
   </div>
   <div class="button-containertj">
      <div class="buttontj" id="left"><i class="fas fa-angle-left"></i></div>
      <div class="buttontj" id="right"><i class="fas fa-angle-right"></i></div>
</div>
</div>
</section>

</div>

<section class="category">

   <h1 class="heading">Shop by Category</h1>

   <div class="swiper category-slider">

   <div class="swiper-wrapper">

   <a href="category.php?category=laptop" class="swiper-slide slide">
      <img src="images/item-1.png" alt="">
      <h3>Cleanser</h3>
   </a>

   <a href="category.php?category=tv" class="swiper-slide slide">
      <img src="images/item-2.png" alt="">
      <h3>Foundation</h3>
   </a>

   <a href="category.php?category=mouse" class="swiper-slide slide">
      <img src="images/item-4.png" alt="">
      <h3>Eyeliner</h3>
   </a>

   <a href="category.php?category=fridge" class="swiper-slide slide">
      <img src="images/item-5.png" alt="">
      <h3>Rings</h3>
   </a>

   <a href="category.php?category=washing" class="swiper-slide slide">
      <img src="images/item-6.png" alt="">
      <h3>Lipsticks</h3>
   </a>

   <a href="category.php?category=smartphone" class="swiper-slide slide">
      <img src="images/item-7.png" alt="">
      <h3>Earrings</h3>
   </a>

   <a href="category.php?category=watch" class="swiper-slide slide">
      <img src="images/item-8.png" alt="">
      <h3>Necklace</h3>
   </a>

   </div>

   <div class="swiper-pagination"></div>

   </div>

</section>

<section class="home-products">

   <h1 class="heading">Latest Products</h1>

   <div class="swiper products-slider">

   <div class="swiper-wrapper">

   <?php
     $select_products = $conn->prepare("SELECT * FROM `products` LIMIT 6"); 
     $select_products->execute();
     if($select_products->rowCount() > 0){
      while($fetch_product = $select_products->fetch(PDO::FETCH_ASSOC)){
   ?>
   <form action="" method="post" class="swiper-slide slide">
      <input type="hidden" name="pid" value="<?= $fetch_product['id']; ?>">
      <input type="hidden" name="name" value="<?= $fetch_product['name']; ?>">
      <input type="hidden" name="price" value="<?= $fetch_product['price']; ?>">
      <input type="hidden" name="image" value="<?= $fetch_product['image_01']; ?>">
      <button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>
      <a href="quick_view.php?pid=<?= $fetch_product['id']; ?>" class="fas fa-eye"></a>
      <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" alt="">
      <div class="name"><?= $fetch_product['name']; ?></div>
      <div class="flex">
         <div class="price"><span>$</span><?= $fetch_product['price']; ?><span>/-</span></div>
         <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if(this.value.length == 2) return false;" value="1">
      </div>
      <input type="submit" value="add to cart" class="btn" name="add_to_cart">
   </form>
   <?php
      }
   }else{
      echo '<p class="empty">no products added yet!</p>';
   }
   ?>

   </div>

   <div class="swiper-pagination"></div>

   </div>
<div>

<h1>Top 10 products</h1>
<table class="table table-striped table-bordered">
<thead>
<tr>
<th>Name</th>
<th>Sold</th>

</tr>
</thead>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "shop_db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT name,Sold FROM products ORDER BY Sold DESC Limit 10";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo '<tbody>';
    echo '<tr>';
        echo '<td>'.$row["name"].'</td>';
        echo '<td>'.$row["Sold"].'</td>';
        echo '</tr>';
        echo '</tbody>';
  }
} else {
  echo "0 results";
}

$conn->close();
?>

</table>
</div>
<div>
<h1>Top 10 Customers</h1>
<table class="table table-striped table-bordered ">
<thead>
<tr>
<th>Name</th>
<th>Amount spend</th>

</tr>
</thead>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "shop_db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT name,Purchased_worth FROM users ORDER BY Purchased_worth DESC limit 10";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {

    echo '<tbody>';
echo '<tr>';
    echo '<td>'.$row["name"].'</td>';
    echo '<td>'.$row["Purchased_worth"].'</td>';
    echo '</tr>';
	 echo '</tbody>';
   }
} else {
  echo "0 results";
}

$conn->close();
?>
</table>

</div>
</section>









<?php include 'components/footer.php'; ?>

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<script src="js/script.js"></script>

<script>

var swiper = new Swiper(".home-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
    },
});

 var swiper = new Swiper(".category-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      0: {
         slidesPerView: 2,
       },
      650: {
        slidesPerView: 3,
      },
      768: {
        slidesPerView: 4,
      },
      1024: {
        slidesPerView: 5,
      },
   },
});

var swiper = new Swiper(".products-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      550: {
        slidesPerView: 2,
      },
      768: {
        slidesPerView: 2,
      },
      1024: {
        slidesPerView: 3,
      },
   },
});

</script>

</body>
</html>