<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
	    <link rel="icon" href="images/favicon.png" type="image/x-icon">
	</head>

	<body>
	    <!-- Navigation -->
	    <jsp:include page="includes/adminNavigation.jsp"/>

	    <!-- Page Content -->
	    <div class="container contentMargin">
			<a class="btn btn-success" href="AlunoController?action=insert">Adicionar</a>
			<br><br>
	    	<table id="alunos" class="table table-striped table-bordered">
	    		<thead>
	    			<tr>
	    				<th>Nome</th>
	    				<th>Sobrenome</th>
	    				<th>E-mail</th>
	    				<th>Endereço</th>
	    				<th width="50px">Gerenciar</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<c:forEach items="${alunoList}" var="aluno">
		    			<tr>
		    				<td class="studentName"><c:out value="${aluno.nome}"/></td>
		    				<td class="studentLastName"><c:out value="${aluno.sobrenome}"/></td>
		    				<td class="studentEmail"><c:out value="${aluno.email}"/></td>
		    				<td class="studentAddress"><c:out value="${aluno.endereco}"/></td>
		    				<td width="50px">
		    					<a href="AlunoController?action=edit&codMatricula=<c:out value="${aluno.codMatricula}"/>" type="button" class="btn btn-sm btn-warning btnEdit btnSize">Editar</a>
		    					<a href="AlunoController?action=delete&codMatricula=<c:out value="${aluno.codMatricula}"/>" type="button" class="btn btn-sm btn-danger btnDelete btnSize">Deletar</a>
		    				</td>
		    			</tr>
		    		</c:forEach>
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
	    		$("#alunos").DataTable({
	    			"language": {
	    				"url": "json/Portuguese-Brasil.json"
	    			}
	    		});	
	    	});
	    </script>
	</body>
</html>