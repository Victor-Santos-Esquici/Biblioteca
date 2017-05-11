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
	    
	    
	    <style>
			.form-login {
			    background-color: #EDEDED;
			    padding-top: 10px;
			    padding-bottom: 20px;
			    padding-left: 20px;
			    padding-right: 20px;
			    border-radius: 15px;
			    border-color:#d2d2d2;
			    border-width: 5px;
			    box-shadow:0 1px 0 #cfcfcf;
			    margin-top: 50px;
			}
			
			h4 { 
			 border:0 solid #fff; 
			 border-bottom-width:1px;
			 padding-bottom:10px;
			 text-align: center;
			}
	    </style>
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
	    	<!-- Login -->
	        <div class="row">
	        	<div class="col-md-offset-5 col-md-3">
	        		<div class="form-login">
			        	<form method="post" action="">
			        		<h4>Login</h4>
			        		<input class="form-control input-sm chat-input" type="text" id="user" name="user" placeholder="Usuário" required>
			        		<br>
			        		<input class="form-control input-sm chat-input" type="password" id="pass" name="pass" placeholder="Senha" required>
			        		<br>
			        		<div class="text-center">
					            <span class="group-btn text-center">     
					                <button type="submit" class="btn btn-primary btn-md">Login <i class="fa fa-sign-in"></i></button>
					            </span>
			        		</div>
			        	</form>	        		
	        		</div>
	        	</div>
	        </div>
	        
	        <!-- Footer -->
	        <footer class="container navbar-fixed-bottom">
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
   
	</body>
</html>