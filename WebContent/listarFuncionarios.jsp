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
	    <title>Admin - Listar Funcionários</title>
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
	    
	    	<table id="funcionarios" class="table table-striped table-bordered" cellspacing="0" width="100%">
	    		<thead>
	    			<tr>
	    				<th>Nome</th>
	    				<th>Endereço</th>
	    				<th>Telefone</th>
	    				<th>Salário</th>
	    				<th>Biblioteca</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<tr>
	    				<td>Victor</td>
	    				<td>Av. Lorem Ipsum</td>
	    				<td>(55) 99999-9999</td>
	    				<td>R$ 10.000</td>
	    				<td>Biblioteca 1</td>
	    			</tr>
	    			<tr>
	    				<td>Luan</td>
	    				<td>Av. puta que Ipsum</td>
	    				<td>(55) 77777-7777</td>
	    				<td>R$ 15.000</td>
	    				<td>Biblioteca 2</td>
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
	    		$("#funcionarios").DataTable({
	    			"language": {
	    				"url": "json/Portuguese-Brasil.json"
	    			}
	    		});
	    	});
	    </script>
	</body>
</html>