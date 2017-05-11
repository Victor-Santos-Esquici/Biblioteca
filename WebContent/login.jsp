<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>

<html lang="en">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="Sistema de biblioteca.">
	    <meta name="author" content="Victor Santos">
	    <title>Biblioteca</title>
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/modern-business.css" rel="stylesheet">
	    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	</head>

	<body>
	
	    <!-- Navigation -->
	    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	        <div class="container">
	            <!-- Brand and toggle get grouped for better mobile display -->
	            <div class="navbar-header">
	                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                </button>
	                <a class="navbar-brand" href="index.jsp">Biblioteca</a>
	            </div>
	            <!-- Collect the nav links, forms, and other content for toggling -->
	            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                <ul class="nav navbar-nav navbar-right">
	                    <li>
	                        <a href="">Livros</a>
	                    </li>
	                    <li>
	                        <a href="">Unidades</a>
	                    </li>
	                    <li>
	                    	<a href="login.jsp">Login</a>
	                    </li>
	                </ul>
	            </div>
	            <!-- /.navbar-collapse -->
	        </div>
	        <!-- /.container -->
	    </nav>
	
	    
	
	    <!-- Page Content -->
	    <div class="container">
	
	        <!-- Marketing Icons Section -->
	        <div class="row">
	            <div class="col-lg-12">
	                <h1 class="page-header text-center">Login</h1>
	            </div>
	        </div>
	        <!-- /.row -->
	
	        <div class="row">
	        	<div class="col-lg-12 text-center">
		        	<form method="post" action="">
		        		<label for="user">Usuário</label>
		        		<br>
		        		<input type="text" id="user" name="user">
		        		<br>
		        		<label for="pass">Senha</label>
		        		<br>
		        		<input type="password" id="pass" name="pass">
		        		<br>
		        		<br>
		        		<button id="btnLogin" type="button">Logar</button>
		        	</form>
	        	</div>
	        </div>
	        
	        <!-- Footer -->
	        <footer class="container navbar-fixed-bottom" style="border: solid 1px;">
	            <div class="row">
	                <div class="col-lg-12">
	                    <p>Copyright &copy; Your Website 2014</p>
	                </div>
	            </div>
	        </footer>
	    </div>
	    <!-- /.container -->
	
	    <script src="js/jquery.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    
	    <script>
	    	$(document).ready(function(){
	    		
	    		$("#btnLogin").click(function(){
	    			
	    			$(".formError").remove();
	    			
		    		if(!$("#user").val()){
		    			$("label[for='user']").append("<p class='formError' style='color: red;'>É obrigatório preencher o login.</p>");
		    		}
		    		
		    		if(!$("#pass").val()){
		    			$("label[for='pass']").append("<p class='formError' style='color: red;'>É obrigatório preencher a senha.</p>");
		    		}
		    		
		    		
	    		});
	    	});	
	    </script>
	
	</body>
</html>