</div><br><br>

<!-- Footer -->
<footer>
       <div class="container">
          Copyright &copy; by <a href="https://www.linkedin.com/in/priyankaphapale/"> Shubham Deshpande</a>
          All Rights Reserved from 2020 - 2028
       </div>
</footer>




<script type="text/javascript">
    $(window).scroll(function(){
    var vscroll = $(this).scrollTop();
    $('#logotext').css({
      "transform" : "translate(0px,"+vscroll/2+"px)"
    });

    var vscroll = $(this).scrollTop();
    $('#background').css({
      "transform" : "translate("+vscroll/5+"px,-"+vscroll/12+"px)"
    });

    var vscroll = $(this).scrollTop();
    $('#foreground').css({
      "transform" : "translate(0px,"+vscroll/2+"px)"
    });
  });

  function detailsmodal(id){
    var data = {"id" : id};
    $.ajax({
      url : 'includes/detailsmodal.php',
      method : "post",
      data : data,
      success : function(data){
        $('body').append(data);
        $('#details-modal').modal('toggle');
      },
      error : function(){
        alert("Something went wrong");
      }
    });
  }

  function add_to_cart(){
      $('#modal_errors').html("");
      var quantity = $('#quantity').val();
      var available = 3;
      var error = '';
      var data = $('#add_product_form').serialize();

      if (quantity == '' || quantity == 0) {
         error += '<p class="text-warning text-center"> Please select quantity.</p>';
         $('#modal_errors').html(error);
         return;
      }
      else if(quantity>3){
          error += '<p class="text-warning text-center"> There are only '+available+' available.</p>';
          $('#modal_errors').html(error);
          return;
      }
      else{
        $.ajax({
          url: '/E-Commerce-Website/admin/includes/add_cart.php',
          method : 'post',
          data : data,
          success : function(){
            location.reload();
          },
          error : function(){alert("Something went wrong");}
        })
      }
  }

  function update_cart(mode,edit_id){
      var data = {'mode':mode,'edit_id':edit_id};
      $.ajax({
          url: '/E-Commerce-Website/admin/includes/update_cart.php',
          method : 'post',
          data : data,
          success : function(){
            location.reload();
          },
          error : function(){alert("Something went wrong");}
      });
  }

</script>
</body>
</html>