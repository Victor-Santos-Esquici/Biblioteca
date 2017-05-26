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
	    <title>Admin - Listar Bibliotecas</title>
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/modern-business.css" rel="stylesheet">
	    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	    <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
	    <link href="css/remodal.css" rel="stylesheet" type="text/css">
	    <link href="css/remodal-default-theme.css" rel="stylesheet" type="text/css">
	    <link rel="icon" href="images/favicon.png" type="image/x-icon" />
	</head>

	<body>
	
	    <!-- Navigation -->
	    <jsp:include page="includes/adminNavigation.jsp"/>

	    <!-- Page Content -->
	    <div class="container dataTable">
	    
	    	<table id="bibliotecas" class="table table-striped table-bordered">
	    		<thead>
	    			<tr>
	    				<th>Nome</th>
	    				<th>Endereço</th>
	    				<th>Gerenciar</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<c:forEach items="${bibliotecaList}" var="biblioteca">
		    			<tr>
		    				<td class="libraryName"><c:out value="${biblioteca.nome}"/></td>
		    				<td class="libraryAddress"><c:out value="${biblioteca.endereco}"/></td>
		    				<td>
		    					<a href="#editModal" type="button" class="btn btn-sm btn-warning btnEdit">Editar</a>
		    					<a href="#deleteModal" type="button" class="btn btn-sm btn-danger btnDelete">Deletar</a>
		    				</td>
		    			</tr>
	    			</c:forEach>
	    		</tbody>
	    	</table>
	    	
			<div class="remodal" data-remodal-id="editModal">
				<button data-remodal-action="close" class="remodal-close"></button>
				<form class="well form-horizontal" method="post" id="registerForm">
					<fieldset>
			
					<!-- Form Name -->
					<legend class="text-center">Editar Biblioteca</legend>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Nome</label>  
						<div class="col-md-12 center-block text-center pagination-centered inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
								<input name="name" placeholder="Nome" class="form-control" type="text">
							</div>
						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Endereço</label> 
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
								<input name="address" placeholder="Endereço físico" class="form-control"  type="text">
							</div>
						</div>
					</div>
			
					<!-- Button -->
					<div class="form-group">
						<div class="col-md-12">
							<button type="submit" class="btn btn-warning">Enviar <span class="glyphicon glyphicon-send"></span></button>
						</div>
					</div>
					
					</fieldset>
				</form>
				<br>
				<button data-remodal-action="cancel" class="remodal-cancel">Cancelar</button>
			</div>
			
			<div class="remodal" data-remodal-id="deleteModal">
				<button data-remodal-action="close" class="remodal-close"></button>
				<h2>Deseja deletar esta biblioteca?</h2>
				<p class="deleteLibrary"></p>
				<br>
				<button data-remodal-action="cancel" class="remodal-cancel">Não</button>
				<button data-remodal-action="confirm" class="remodal-confirm">Sim</button>
			</div>
	
	        <!-- Footer -->
			<jsp:include page="includes/footer.jsp"/>
		
	    </div>
	
	    <script src="js/jquery.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="js/jquery.dataTables.min.js"></script>
	    <script src="js/remodal.js"></script>
	    <script src="js/bootstrapValidator.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#registerForm').bootstrapValidator({
			        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
			        feedbackIcons: {
			            valid: 'glyphicon glyphicon-ok',
			            invalid: 'glyphicon glyphicon-remove',
			            validating: 'glyphicon glyphicon-refresh'
			        },
			        fields: {
			            name: {
			                validators: {
			                        notEmpty: {
			                        message: 'Preencha o nome da biblioteca.'
			                    }
			                }
			            },
			             address: {
			                validators: {
			                    notEmpty: {
			                        message: 'Preencha o endereço físico da biblioteca.'
			                    }
			                }
			            }
	            	}
		        })
		        .on('success.form.bv', function(e) {
		            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
		                $('#registerForm').data('bootstrapValidator').resetForm();
		
		            // Prevent form submission
		            e.preventDefault();
		
		            // Get the form instance
		            var $form = $(e.target);
		
		            // Get the BootstrapValidator instance
		            var bv = $form.data('bootstrapValidator');
		
		            // Use Ajax to submit form data
		            $.post($form.attr('action'), $form.serialize(), function(result) {
		                console.log(result);
		            }, 'json');
		        });
			});
		</script>	
 	    <script>
	    	$(document).ready(function(){
	    		$("#bibliotecas").DataTable({
	    			"language": {
	    				"url": "json/Portuguese-Brasil.json"
	    			}
	    		});
	    		
	    		$(".btnEdit").click(function(){
	    			var $item = $(this).closest("tr");
	    			var libraryName = $($item).find(".libraryName").html();
	    			var libraryAddress = $($item).find(".libraryAddress").html();
	    			$("input[name='name']").val(libraryName);
	    			$("input[name='address']").val(libraryAddress);
	    		});
	    		
	    		$(".btnDelete").click(function(){
	    			var $item = $(this).closest("tr");
	    			var libraryName = $($item).find(".libraryName").html();
	    			$(".deleteLibrary").empty().append(libraryName);
	    		});
	    	});
    	</script>
	</body>
</html>