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
	    <title>Admin - Listar Alunos</title>
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/modern-business.css" rel="stylesheet">
	    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	    <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
	    <link href="css/remodal.css" rel="stylesheet" type="text/css">
	    <link href="css/remodal-default-theme.css" rel="stylesheet" type="text/css">
	</head>

	<body>
	
	    <!-- Navigation -->
	    <jsp:include page="includes/adminNavigation.jsp"/>

	    <!-- Page Content -->
	    <div class="container dataTable">
	    
	    	<table id="alunos" class="table table-striped table-bordered">
	    		<thead>
	    			<tr>
	    				<th>Nome</th>
	    				<th>E-mail</th>
	    				<th>Endereço</th>
	    				<th>Gerenciar</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<tr>
	    				<td>Victor</td>
	    				<td>victor_santos@email.com</td>
	    				<td>Av. Lorem Ipsum</td>
	    				<td>
	    					<button type="button" class="btn btn-sm btn-warning">Editar</button>
	    					<button type="button" class="btn btn-sm btn-danger">Deletar</button>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td>Luan</td>
	    				<td>luan_souza@email.com</td>
	    				<td>Rua Lorem Ipsum</td>
	    				<td>
	    					<a href="#modal" type="button" class="btn btn-sm btn-warning">Editar</a>
	    					<a type="button" class="btn btn-sm btn-danger">Deletar</a>
	    				</td>
	    			</tr>
	    		</tbody>
	    	</table>
	    	
			<div class="remodal" data-remodal-id="modal">
				<button data-remodal-action="close" class="remodal-close"></button>
				<h1>Remodal</h1>
				<p>Responsive, lightweight, fast, synchronized with CSS animations, fully customizable modal window plugin with declarative configuration and hash tracking.</p>
				<br>
				<button data-remodal-action="cancel" class="remodal-cancel">Cancel</button>
				<button data-remodal-action="confirm" class="remodal-confirm">OK</button>
			</div>
	
	        <!-- Footer -->
			<jsp:include page="includes/footer.jsp"/>
		
	    </div>
	
	    <script src="js/jquery.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="js/jquery.dataTables.min.js"></script>
	    <script src="js/remodal.js"></script>
	    <script>
	    	$(document).ready(function(){
	    		$("#alunos").DataTable({
	    			"language": {
	    				"url": "json/Portuguese-Brasil.json"
	    			}
	    		});
	    	});
	    </script>
	</body>
</html>