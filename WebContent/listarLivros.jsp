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
	    <title>Admin - Listar Livros</title>
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/modern-business.css" rel="stylesheet">
	    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	    <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
	</head>

	<body>
	
	    <!-- Navigation -->
	    <jsp:include page="includes/adminNavigation.jsp"/>

	    <!-- Page Content -->
	    <div class="container dataTable">
	    
	    	<table id="livros" class="table table-striped table-bordered">
	    		<thead>
	    			<tr>
	    				<th>Título</th>
	    				<th>Editora</th>
	    				<th>Valor</th>
	    				<th>Categoria</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<tr>
	    				<td>O Senhor dos Anéis</td>
	    				<td>Lorem Ipsum</td>
	    				<td>R$ 50,00</td>
	    				<td>Aventura</td>
	    			</tr>
	    			<tr>
	    				<td>O Hobbit</td>
	    				<td>Lorem Ipsum</td>
	    				<td>R$ 20,00</td>
	    				<td>Aventura</td>
	    			</tr>
	    		</tbody>
	    	</table>
	
	        <!-- Footer -->
			<jsp:include page="includes/footer.jsp"/>
		
	    </div>
	
	    <script src="js/jquery.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="js/jquery.dataTables.min.js"></script>
	    <script>
    	$(document).ready(function(){
    		$("#livros").DataTable({
    			"language": {
    				"url": "json/Portuguese-Brasil.json"
    			}
    		});
    	});
	    </script>
	</body>
</html>