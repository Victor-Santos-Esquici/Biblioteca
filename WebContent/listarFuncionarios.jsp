<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.model.Funcionario" %>
<%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html>

<html lang="pt-br">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="Sistema de biblioteca.">
	    <meta name="author" content="Victor Santos">
	    <title>Admin - Listar Funcion�rios</title>
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
	    
	    	<table id="funcionarios" class="table table-striped table-bordered">
	    		<thead>
	    			<tr>
	    				<th>Nome</th>
	    				<th>Sobrenome</th>
	    				<th>E-mail</th>
	    				<th>Endere�o</th>
	    				<th>Telefone</th>
	    				<th>Sal�rio</th>
	    				<th>Biblioteca</th>
	    				<th>Gerenciar</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<jsp:useBean id="dao" class="br.com.dao.FuncionarioDAO"/>
	    			<%
		    			ArrayList<Funcionario> funcionarios = new ArrayList<Funcionario>();
	    				funcionarios = dao.select();
	    				for(Funcionario funcionario: funcionarios){
	    			%>
	    			<tr>
	    				<td class="workerName"><% out.print(funcionario.getNome()); %></td>
	    				<td class="workerLastName"><% out.print(funcionario.getSobrenome()); %></td>
	    				<td class="workerEmail"><% out.print(funcionario.getEmail()); %></td>
	    				<td class="workerAddress"><% out.print(funcionario.getEndereco()); %></td>
	    				<td class="workerPhone"><% out.print(funcionario.telefone); %></td>
	    				<td class="workerSalary"><% out.print(funcionario.getSalario()); %></td>
	    				<td class="workerLibrary"><% out.print(funcionario.getCodBib()); %></td>
	    				<td>
	    					<a href="#editModal" type="button" class="btn btn-sm btn-warning btnEdit">Editar</a>
	    					<a href="#deleteModal" type="button" class="btn btn-sm btn-danger btnDelete">Deletar</a>
	    				</td>
	    			</tr>
	    			<%
	    				}
	    			%>
	    		</tbody>
	    	</table>
	    	
			<div class="remodal" data-remodal-id="editModal">
				<button data-remodal-action="close" class="remodal-close"></button>
				<form class="well form-horizontal" method="post"  id="registerForm">
					<fieldset>
			
					<!-- Form Name -->
					<legend class="text-center">Editar Funcion�rio</legend>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Nome</label>  
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
								<input  name="firstName" placeholder="Nome" class="form-control"  type="text">
							</div>
						</div>
					</div>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Sobrenome</label> 
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
								<input name="lastName" placeholder="Sobrenome" class="form-control"  type="text">
							</div>
						</div>
					</div>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">E-Mail</label>  
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
								<input name="email" placeholder="Endere�o de e-mail" class="form-control"  type="text">
							</div>
						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Endere�o</label>  
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
								<input name="address" placeholder="Endere�o f�sico" class="form-control"  type="text">
							</div>
						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Telefone</label>  
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
								<input id="phone" name="phone" placeholder="(55) 99999-9999" class="form-control"  type="text" maxlength="15">
							</div>
						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Sal�rio</label>  
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
								<input id="salary" name="salary" placeholder="00.000,00" class="form-control"  type="text" maxlength="9">
							</div>
						</div>
					</div>
					
					<!-- Select Basic -->
					<div class="form-group"> 
						<label class="col-md-12">Biblioteca</label>
						<div class="col-md-12 selectContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
								<select name="library" class="form-control selectpicker" >
									<option value=" " >Selecione a Biblioteca</option>
									<option value="Alabama">Alabama</option>
									<option value="Alaska">Alaska</option>
								</select>
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
				<h2>Deseja deletar este funcion�rio?</h2>
				<p class="deleteWorker"></p>
				<br>
				<button data-remodal-action="cancel" class="remodal-cancel">N�o</button>
				<button data-remodal-action="confirm" class="remodal-confirm">Sim</button>
			</div>
	
	        <!-- Footer -->
			<jsp:include page="includes/footer.jsp"/>
		
	    </div>
	
	    <script src="js/jquery.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="js/jquery.dataTables.min.js"></script>
	    <script src="js/jquery.mask.min.js"></script>
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
		                        	message: 'O nome deve conter no m�nimo 2 caracteres.',
			                        min: 2,
			                    },
			                        notEmpty: {
			                        message: 'Preencha o nome do funcion�rio.'
			                    }
			                }
			            },
			             lastName: {
			                validators: {
			                     stringLength: {
			                    	message: 'O sobrenome deve conter no m�nimo 2 caracteres.',
			                        min: 2,
			                    },
			                    notEmpty: {
			                        message: 'Preencha o sobrenome do funcion�rio.'
			                    }
			                }
			            },
			            email: {
			                validators: {
			                    notEmpty: {
			                        message: 'Preencha o e-mail do aluno.'
			                    },
			                    emailAddress: {
			                        message: 'Este endere�o de e-mail est� inv�lido.'
			                    }
			                }
			            },
			            address: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Preencha o endere�o do funcion�rio.'
			            		}
			            	}
			            },
			            phone: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Preencha o telefone do funcion�rio.'
			            		}
			            	}
			            },
			            salary: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Preencha o sal�rio do funcion�rio.'
			            		}
			            	}
			            },
			            library: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Selecione a biblioteca do funcion�rio.'
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
	    		$("#funcionarios").DataTable({
	    			"language": {
	    				"url": "json/Portuguese-Brasil.json"
	    			}
	    		});
	    		
				$("#phone").mask("(00) 00000-0000");
				$("#salary").mask("00.000,00", {reverse: true});
	    		
	    		$(".btnEdit").click(function(){
	    			var $item = $(this).closest("tr");
	    			var workerName = $($item).find(".workerName").html();
	    			var workerLastName = $($item).find(".workerLastName").html();
	    			var workerEmail = $($item).find(".workerEmail").html();
	    			var workerAddress = $($item).find(".workerAddress").html();
	    			var workerPhone = $($item).find(".workerPhone").html();
	    			var workerSalary = $($item).find(".workerSalary").html();
	    			var workerLibrary = $($item).find(".workerLibrary").html();
	    			$("input[name='firstName']").val(workerName);
	    			$("input[name='lastName']").val(workerLastName);
	    			$("input[name='email']").val(workerEmail);
	    			$("input[name='address']").val(workerAddress);
	    			$("input[name='phone']").val(workerPhone);
	    			$("input[name='salary']").val(workerSalary);
	    			$("option[value='"+workerLibrary+"']").attr("selected", "selected");
	    		});
	    		
	    		$(".btnDelete").click(function(){
	    			var $item = $(this).closest("tr");
	    			var workerName = $($item).find(".workerName").html();
	    			$(".deleteWorker").empty().append(workerName);
	    		});
	    	});
	    </script>
	</body>
</html>