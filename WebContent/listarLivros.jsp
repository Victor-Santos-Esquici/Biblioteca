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
	    <link href="css/remodal.css" rel="stylesheet" type="text/css">
	    <link href="css/remodal-default-theme.css" rel="stylesheet" type="text/css">
	    <link rel="icon" href="images/favicon.png" type="image/x-icon" />
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
	    				<th>Biblioteca</th>
	    				<th>Gerenciar</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<tr>
	    				<td class="bookTitle">O Senhor dos Anéis</td>
	    				<td class="bookPublisher">Lorem Ipsum</td>
	    				<td class="bookPrice">50,00</td>
	    				<td class="bookCategory">Aventura</td>
	    				<td class="bookLibrary">Alabama</td>
	    				<td>
	    					<a href="#editModal" type="button" class="btn btn-sm btn-warning btnEdit">Editar</a>
	    					<a href="#deleteModal" type="button" class="btn btn-sm btn-danger btnDelete">Deletar</a>
	    				</td>
	    			</tr>
	    			<tr>
	    				<td class="bookTitle">O Hobbit</td>
	    				<td class="bookPublisher">Lorem Ipsum</td>
	    				<td class="bookPrice">20,00</td>
	    				<td class="bookCategory">Drama</td>
	    				<td class="bookLibrary">Alaska</td>
	    				<td>
	    					<a href="#editModal" type="button" class="btn btn-sm btn-warning btnEdit">Editar</a>
	    					<a href="#deleteModal" type="button" class="btn btn-sm btn-danger btnDelete">Deletar</a>
	    				</td>
	    			</tr>
	    		</tbody>
	    	</table>
	    	
			<div class="remodal" data-remodal-id="editModal">
				<button data-remodal-action="close" class="remodal-close"></button>
				<form class="well form-horizontal" method="post"  id="registerForm">
					<fieldset>
			
					<!-- Form Name -->
					<legend class="text-center">Cadastrar Livro</legend>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Título</label>  
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
								<input  name="title" placeholder="Título" class="form-control"  type="text">
							</div>
						</div>
					</div>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Editora</label> 
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
								<input name="publisher" placeholder="Editora" class="form-control"  type="text">
							</div>
						</div>
					</div>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12">Valor</label>  
						<div class="col-md-12 inputGroupContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
								<input id="price" name="price" placeholder="00.000,00" class="form-control" type="text" maxlength="9">
							</div>
						</div>
					</div>
					
					<!-- Select Basic -->
					<div class="form-group"> 
						<label class="col-md-12">Categoria</label>
						<div class="col-md-12 selectContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
								<select name="category" class="form-control selectpicker" >
									<option value=" " >Selecione uma Categoria</option>
									<option value="Aventura">Aventura</option>
									<option value="Drama">Drama</option>
								</select>
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
				<h2>Deseja deletar este livro?</h2>
				<p class="deleteBook"></p>
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
			            title: {
			                validators: {
			                        notEmpty: {
			                        message: 'Preencha o título do livro.'
			                    }
			                }
			            },
			             publisher: {
			                validators: {
			                    notEmpty: {
			                        message: 'Preencha o nome da editora do livro.'
			                    }
			                }
			            },
			            price: {
			                validators: {
			                    notEmpty: {
			                        message: 'Preencha o preço do livro.'
			                    }
			                }
			            },
			            category: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Selecione a categoria do livro.'
			            		}
			            	}
			            },
			            library: {
			            	validators: {
			            		notEmpty: {
			            			message: 'Selecione a biblioteca do livro.'
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
	    		$("#livros").DataTable({
	    			"language": {
	    				"url": "json/Portuguese-Brasil.json"
	    			}
	    		});
	    		
				$("#price").mask("00.000,00", {reverse: true});
				
	    		$(".btnEdit").click(function(){
	    			var $item = $(this).closest("tr");
	    			var bookTitle = $($item).find(".bookTitle").html();
	    			var bookPublisher = $($item).find(".bookPublisher").html();
	    			var bookPrice = $($item).find(".bookPrice").html();
	    			var bookCategory = $($item).find(".bookCategory").html();
	    			var bookLibrary = $($item).find(".bookLibrary").html();
	    			$("input[name='title']").val(bookTitle);
	    			$("input[name='publisher']").val(bookPublisher);
	    			$("input[name='price']").val(bookPrice);
	    			$("option[value='"+bookCategory+"']").attr("selected", "selected");
	    			$("option[value='"+bookLibrary+"']").attr("selected", "selected");
	    		});
	    		
	    		$(".btnDelete").click(function(){
	    			var $item = $(this).closest("tr");
	    			var bookTitle = $($item).find(".bookTitle").html();
	    			$(".deleteBook").empty().append(bookTitle);
	    		});
	    	});
	    </script>
	</body>
</html>