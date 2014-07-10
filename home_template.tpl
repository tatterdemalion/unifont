<html>
<head>
<meta charset="utf-8"/>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/css/bootstrap.min.css"/>
<style>
#in {
    height: 100%;
}

#in, #out {
    font-size: 1.5em;
}
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $('#in').on('input', function(){
        console.log($(this).val());
        $.get('/convert/',
              {'text': $(this).val(), 'font': window.location.hash.substring(1)},
              function(data){$('#out').html(data);}
        );
    });
});
</script>
</head>
<body>
    <nav class="navbar navbar-default" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">UNIFONT</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Select Font<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#caligraphy">Caligraphy</a></li>
                <li><a href="#caligraphy_bold">Caligraphy Bold</a></li>
                <li class="divider"></li>
                <li><a href="#fraktur">Fraktur</a></li>
                <li><a href="#fraktur_bold">Fraktur Bold</a></li>
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
        
<div class="container-fluid">
    <div class="row">
        <textarea class="col-md-6" id="in"></textarea>
        <div id="out" class="col-md-6"></div>
    </div>
</div>
</body>
</html>
