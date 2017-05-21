<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>

<html lang="pt-br">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="Sistema de biblioteca.">
	    <meta name="author" content="Victor Santos">
	    <title>Login</title>
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/modern-business.css" rel="stylesheet">
	    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	    <link rel="icon" href="images/favicon.png" type="image/x-icon" />
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
	    <jsp:include page="includes/homeNavigation.jsp"/>
	
	    <!-- Page Content -->
	    <div class="container">
	    	<!-- Login -->
	        <div class="row">
	        	<div class="col-md-offset-5 col-md-3">
	        		<div class="form-login">
			        	<form method="post">
			        		<h4>Login</h4>
			        		<input class="form-control input-sm chat-input" type="text" id="user" name="user" placeholder="Usuário" required>
			        		<br>
			        		<input class="form-control input-sm chat-input" type="password" id="pass" name="pass" placeholder="Senha" required>
			        		<br>
			        		<div class="text-center">
					            <span class="group-btn text-center">     
					                <button type="button" class="btn btn-primary btn-md">Login <i class="fa fa-sign-in"></i></button>
					            </span>
			        		</div>
			        	</form>	        		
	        		</div>
	        	</div>
	        </div>
	        
	        <!-- Footer -->
			<jsp:include page="includes/footer.jsp"/>
			
	    </div>
	    <!-- /.container -->
	
	    <script src="js/jquery.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script>
	    	$(document).ready(function(){
	    		$(".btn-primary").click(function(){
	    			if($("#user").val() == "admin" && $("#pass").val() == "admin"){
	    				window.location = "/Biblioteca/admin.jsp";
	    			}
	    		});
	    	});
	    </script>
   
	</body>
</html>