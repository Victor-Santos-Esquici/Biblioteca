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
	    <title>Admin - Cadastrar Livro</title>
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/modern-business.css" rel="stylesheet">
	    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   	    <style>
	    	#contact_form{
	    		margin-top: 50px;
	    	}
	    </style>
	</head>

	<body>
	
	    <!-- Navigation -->
	    <jsp:include page="includes/adminNavigation.jsp"/>

	    <!-- Page Content -->
	    <div class="container">
			<form class="well form-horizontal" action=" " method="post"  id="contact_form">
				<fieldset>
		
				<!-- Form Name -->
				<legend class="text-center">Cadastrar Livro</legend>
		
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">Título</label>  
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<input  name="title" placeholder="Título" class="form-control"  type="text">
						</div>
					</div>
				</div>
		
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">Editora</label> 
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<input name="editor" placeholder="Editora" class="form-control"  type="text">
						</div>
					</div>
				</div>
		
				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label">Valor</label>  
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
							<input name="price" placeholder="Valor" class="form-control"  type="text">
						</div>
					</div>
				</div>
				
				<!-- Select Basic -->
				<div class="form-group"> 
					<label class="col-md-4 control-label">Categoria</label>
					<div class="col-md-4 selectContainer">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
							<select name="category" class="form-control selectpicker" >
								<option value=" " >Selecione uma Categoria</option>
								<option>Alabama</option>
								<option>Alaska</option>
							</select>
						</div>
					</div>
				</div>
				
				<!-- Select Basic -->
				<div class="form-group"> 
					<label class="col-md-4 control-label">Biblioteca</label>
					<div class="col-md-4 selectContainer">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
							<select name="library" class="form-control selectpicker" >
								<option value=" " >Selecione a Biblioteca</option>
								<option>Alabama</option>
								<option>Alaska</option>
							</select>
						</div>
					</div>
				</div>
		
				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<button type="submit" class="btn btn-warning" >Enviar <span class="glyphicon glyphicon-send"></span></button>
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
		<script>
			$(document).ready(function() {
				$('#contact_form').bootstrapValidator({
			        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
			        feedbackIcons: {
			            valid: 'glyphicon glyphicon-ok',
			            invalid: 'glyphicon glyphicon-remove',
			            validating: 'glyphicon glyphicon-refresh'
			        },
			        fields: {
			            title: {
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
			             editor: {
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
			            price: {
			                validators: {
			                    notEmpty: {
			                        message: 'Preencha o e-mail do aluno.'
			                    },
			                    emailAddress: {
			                        message: 'Este endereço de e-mail está inválido.'
			                    }
			                }
			            },
			            category: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Preencha o endereço do funcionário.'
			            		}
			            	}
			            },
			            library: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Preencha o telefone do funcionário.'
			            		}
			            	}
			            }
	            	}
		        })
		        .on('success.form.bv', function(e) {
		            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
		                $('#contact_form').data('bootstrapValidator').resetForm();
		
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
	</body>
</html>