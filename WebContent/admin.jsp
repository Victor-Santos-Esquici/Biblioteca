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
	    <title>Admin</title>
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
	    
	    	<a href="RelatorioController?action=alunosInativos" class="btn btn-success">Alunos ativos</a>
	    	<a href="RelatorioController?action=alunosAtivos" class="btn btn-danger">Alunos inativos</a>
	    	<br><br>
	    	<table id="alunos" class="table table-striped table-bordered">
	    		<thead>
	    			<tr>
	    				<th>Nome</th>
	    				<th>Sobrenome</th>
	    				<th>E-mail</th>
	    				<th>Endereço</th>
	    				<th width="50px">Situação</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<c:forEach items="${alunoList}" var="aluno">
		    			<tr>
		    				<td class="studentName"><c:out value="${aluno.nome}"/></td>
		    				<td class="studentLastName"><c:out value="${aluno.sobrenome}"/></td>
		    				<td class="studentEmail"><c:out value="${aluno.email}"/></td>
		    				<td class="studentAddress"><c:out value="${aluno.endereco}"/></td>
		    				<td class="studentSituation"><c:out value="${aluno.situacao}"/></td>
		    			</tr>
		    		</c:forEach>
	    		</tbody>
	    	</table>
	    
	    	<!-- content -->
	
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
	    		
	    		$(".studentSituation").each(function(){
	    			if($(this).text() == "true")
    				{
	    				$(this).text("Ativo");
    				}
	    			else
	    			{
	    				$(this).text("Inativo");
	    			}
	    		});
	    		
	    		if($("td").hasClass("dataTables_empty"))
    			{
	    			$("#alunos_wrapper").hide();
    			}
	    	});
	    </script>
	</body>
</html>