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
	    <link href="css/remodal.css" rel="stylesheet" type="text/css">
	    <link href="css/remodal-default-theme.css" rel="stylesheet" type="text/css">
	    <link rel="icon" href="images/favicon.png" type="image/x-icon">
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
		    					<a href="#editModal" type="button" class="btn btn-sm btn-warning btnEdit btnSize">Editar</a>
		    					<a href="#deleteModal" type="button" class="btn btn-sm btn-danger btnDelete btnSize">Deletar</a>
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
					<legend class="text-center">Editar Aluno</legend>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Nome</label>  
						<div class="col-md-12 center-block text-center pagination-centered inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
								<input name="firstName" placeholder="Nome" class="form-control" type="text">
							</div>
						</div>
					</div>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Sobrenome</label> 
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
								<input name="lastName" placeholder="Sobrenome" class="form-control" type="text">
							</div>
						</div>
					</div>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">E-Mail</label>  
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
								<input name="email" placeholder="Endereço de e-mail" class="form-control" type="text">
							</div>
						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Endereço</label>  
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
								<input name="endereco" placeholder="Endereço físico" class="form-control" type="text">
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
				<h2>Deseja deletar este aluno?</h2>
				<p class="deleteStudent"></p>
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
			            firstName: {
			                validators: {
			                        stringLength: {
		                        	message: 'O nome deve conter no mínimo 2 caracteres.',
			                        min: 2,
			                    },
			                        notEmpty: {
			                        message: 'Preencha o nome do aluno.'
			                    }
			                }
			            },
			             lastName: {
			                validators: {
			                     stringLength: {
			                    	message: 'O sobrenome deve conter no mínimo 2 caracteres.',
			                        min: 2,
			                    },
			                    notEmpty: {
			                        message: 'Preencha o sobrenome do aluno.'
			                    }
			                }
			            },
			            email: {
			                validators: {
			                    notEmpty: {
			                        message: 'Preencha o e-mail do aluno.'
			                    },
			                    emailAddress: {
			                        message: 'Este endereço de e-mail está inválido.'
			                    }
			                }
			            },
			            endereco: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Preencha o endereço do aluno.'
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
	    		$("#alunos").DataTable({
	    			"language": {
	    				"url": "json/Portuguese-Brasil.json"
	    			}
	    		});
	    		
	    		$(".btnEdit").click(function(){
	    			var $item = $(this).closest("tr");
	    			var studentName = $($item).find(".studentName").html();
	    			var studentLastName = $($item).find(".studentLastName").html();
	    			var studentEmail = $($item).find(".studentEmail").html();
	    			var studentAddress = $($item).find(".studentAddress").html();
	    			
	    			$("input[name='firstName']").val(studentName);
	    			$("input[name='lastName']").val(studentLastName);
	    			$("input[name='email']").val(studentEmail);
	    			$("input[name='endereco']").val(studentAddress);
	    		});
	    		
	    		$(".btnDelete").click(function(){
	    			var $item = $(this).closest("tr");
	    			var studentName = $($item).find(".studentName").html();
	    			var studentLastName = $($item).find(".studentLastName").html();
	    			$(".deleteStudent").empty().append(studentName + " " + studentLastName);
	    		});
	    	});
	    </script>
	</body>
</html>