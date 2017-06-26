<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="br.com.model.Biblioteca" %>
<%@ page import="java.util.ArrayList" %>
  
<!DOCTYPE html>

<html lang="pt-br">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="Sistema de biblioteca.">
	    <meta name="author" content="Victor Santos">
	    <title>Admin - Cadastrar Funcionário</title>
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/modern-business.css" rel="stylesheet">
	    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	    <link rel="icon" href="images/favicon.png" type="image/x-icon">
	</head>

	<body>
	    <!-- Navigation -->
	    <jsp:include page="includes/adminNavigation.jsp"/>

	    <!-- Page Content -->
	    <div class="container contentMargin">
			<a class="btn btn-success" href="FuncionarioController?action=listarFuncionarios">Listar</a>
			<br><br>
			<form action="FuncionarioController" class="well form-horizontal" method="post"  id="registerForm">
				<fieldset>
					<!-- Form Name -->
					<legend class="text-center">Cadastrar Funcionário</legend>
					
					<!-- Hidden ID -->
					<input type="hidden" name="codFunc" readonly="readonly" value="<c:out value="${funcionario.codFunc}"/>">
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Nome</label>  
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
								<input  name="firstName" placeholder="Nome" class="form-control"  type="text" value="<c:out value="${funcionario.nome}"/>">
							</div>
						</div>
					</div>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Sobrenome</label> 
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
								<input name="lastName" placeholder="Sobrenome" class="form-control"  type="text" value="<c:out value="${funcionario.sobrenome}"/>">
							</div>
						</div>
					</div>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">E-Mail</label>  
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
								<input name="email" placeholder="Endereço de e-mail" class="form-control"  type="text" value="<c:out value="${funcionario.email}"/>">
							</div>
						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Endereço</label>  
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
								<input name="address" placeholder="Endereço físico" class="form-control"  type="text" value="<c:out value="${funcionario.endereco}"/>">
							</div>
						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Telefone</label>  
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
								<input id="phone" name="phone" placeholder="(55) 99999-9999" class="form-control"  type="text" maxlength="15" value="<c:out value="${funcionario.telefone}"/>">
							</div>
						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label">Salário</label>  
						<div class="col-md-4 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
								<input id="salary" name="salary" placeholder="00.000,00" class="form-control"  type="text" maxlength="9" value="<c:out value="${funcionario.salario}"/>">
							</div>
						</div>
					</div>
					
					<!-- Select Basic -->
					<div class="form-group"> 
						<label class="col-md-4 control-label">Biblioteca</label>
						<div class="col-md-4 selectContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
								<select name="library" class="form-control selectpicker" data-biblioteca="<c:out value="${funcionario.codBib}"/>">
									<option value=" " >Selecione a Biblioteca</option>
									
									<jsp:useBean id="dao" class="br.com.dao.BibliotecaDAO"/>
									
									<%
										ArrayList<Biblioteca> bibliotecas = new ArrayList<Biblioteca>();
										bibliotecas = dao.select();
										for (Biblioteca biblioteca: bibliotecas)
										{
									%>
									
									<option value="<% out.print(biblioteca.getCodBib()); %>"><% out.print(biblioteca.getNome()); %></option>
									
									<% } %>
								</select>
							</div>
						</div>
					</div>
			
					<!-- Button -->
					<div class="form-group text-center">
						<label class="col-md-4"></label>
						<div class="col-md-4">
							<button type="submit" class="btn btn-warning">Enviar <span class="glyphicon glyphicon-send"></span></button>
						</div>
					</div>
				</fieldset>
			</form>
	
	        <!-- Footer -->
			<jsp:include page="includes/footer.jsp"/>
	    </div>
	
	    <script src="js/jquery.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="js/bootstrapValidator.min.js"></script>
	    <script src="js/jquery.mask.min.js"></script>
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
			                        message: 'Preencha o nome do funcionário.'
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
			                        message: 'Preencha o sobrenome do funcionário.'
			                    }
			                }
			            },
			            email: {
			                validators: {
			                    notEmpty: {
			                        message: 'Preencha o e-mail do funcionário.'
			                    },
			                    emailAddress: {
			                        message: 'Este endereço de e-mail está inválido.'
			                    }
			                }
			            },
			            address: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Preencha o endereço do funcionário.'
			            		}
			            	}
			            },
			            phone: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Preencha o telefone do funcionário.'
			            		}
			            	}
			            },
			            salary: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Preencha o salário do funcionário.'
			            		}
			            	}
			            },
			            library: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Selecione a biblioteca do funcionário.'
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
				$("#phone").mask("(00) 00000-0000");
				$("#salary").mask("00.000,00", {reverse: true});
				
				var optionID = $("select[name='library']").data("biblioteca");
				$("option[value='"+optionID+"']").attr("selected", "selected");
			});	
		</script>
	</body>
</html>