<?php
  require_once '../core/init.php';
  $id = $_POST['id'];
  $id = (int)$id;
  $sql = "SELECT * FROM products WHERE id = '$id'";
  $result = $db->query($sql);
  $product = mysqli_fetch_assoc($result);
  $brand_id = $product['brand'];
  $sql_brand = "SELECT brand FROM brands WHERE id = '$brand_id'";
  $brand_query = $db->query($sql_brand);
  $brand = mysqli_fetch_assoc($brand_query);
  $weight = $product['weights'];
  $weight = rtrim($weight,',');
  $weight_array = explode(',', $weight);
?>

<!-- Details Modal-->
<?php ob_start(); ?> <!-- Read everything and add to buffer -->

<div class="modal fade details-1" id="details-modal" tabindex="-1" role="dialog" aria-labelledby="details-1" aria-hidden="true">
  <div class="model-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button class="close" type="button" onclick="closeModal()" aria-lable="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title text-center"><?= $product['title']; ?></h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
          <div class="row">
            <span id="modal_errors" class="bg-danger"></span>
            <div class="col-sm-6">
              <div class="center-block">
                <img src="<?= $product['image']; ?>" alt="<?= $product['title']; ?>" class="details img-responsive">
              </div>
            </div>
            <div class="col-sm-6">
              <h4>Details</h4>
              <p><?= nl2br($product['description']); ?></p>
              <hr>
              <p>Price : $<?= $product['price']; ?></p>
              <p>Brand : <?= $brand['brand']; ?></p>
              <form action="add_cart.php" method="post" id="add_product_form">
                <input type="hidden" name="product_id" value="<?php echo $id;?>">
                <input type="hidden" name="available" id="available" value="">
                <div class="form-group">
                  <div class="col-xs-3">
                    <label for="quantity">Quantity:</label>
                    <input type="number" min="0" class="form-control" name="quantity" id="quantity">
                  </div><div class="col-xs-9"></div>
                </div><br><br>

                <div class="form-group"><br><br>
                  <label for="size"> Weight:</label>
                  <select name="size" id="size" class="form-control">
                    <option value=""></option>
                    <?php foreach($weight_array as $string) {
                      $string_array = explode(':', $string);
                      $weight_lb = $string_array[0];
                      $available = $string_array[1];
                      if ($available >0) {
                          echo '<option value="'.$weight_lb.'" data-available="'.$available.'">'.$weight_lb.' ('.$available.' Available)</option>';
                      }
                    }
                  </select>
                </div>-->
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-default" onclick="closeModal()">Close</button>
        <button class="btn btn-warning" onclick="add_to_cart();return false;"><span class="glyphicon glyphicon-shopping-cart"></span>Add To Cart</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">

  $('#size').change(function(){
    var available = $('#size option:selected').data("available");
    $('#available').val(available);
  });

  function closeModal(){
    $('#details-modal').modal('hide');
    setTimeout(function(){
      $('#details-modal').remove();
      $('.modal-backdrop').remove();
    },500);
  }
</script>
<?php echo ob_get_clean(); ?>