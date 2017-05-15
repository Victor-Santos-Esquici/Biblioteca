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
	    
	    <link href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
	    
	    <style>
	    	#tableData{
	    		margin-top: 50px;
	    	}
	    </style>
	</head>

	<body>
	
	    <!-- Navigation -->
	    <jsp:include page="includes/adminNavigation.jsp"/>

	    <!-- Page Content -->
	    <div id="tableData" class="container">
	    
	    	<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
	    		<thead>
	    			<tr>
	    				<th>Nome</th>
	    				<th>E-mail</th>
	    				<th>Endereço</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<tr>
	    				<td>Victor</td>
	    				<td>victor_santos@email.com</td>
	    				<td>Av. Lorem Ipsum</td>
	    			</tr>
	    			<tr>
	    				<td>Luan</td>
	    				<td>luan_souza@email.com</td>
	    				<td>Rua Lorem Ipsum</td>
	    			</tr>
	    		</tbody>
	    	</table>
	
	        <!-- Footer -->
			<jsp:include page="includes/footer.jsp"/>
		
	    </div>
	
	    <script src="js/jquery.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	    <script>
	    	$(document).ready(function(){
	    		$("#example").DataTable();
	    	});
	    </script>
	</body>
</html>