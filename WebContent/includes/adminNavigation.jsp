<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span>
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="admin.jsp">Admin</a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="AlunoController?action=listarAlunos">Alunos</a></li>
				
				<li><a href="BibliotecaController?action=listarBibliotecas">Bibliotecas</a></li>
				
				<li><a href="CategoriaController?action=listarCategorias">Categorias</a></li>
				
				<li><a href="FuncionarioController?action=listarFuncionarios">Funcionários</a></li>
				
				<li><a href="LivroController?action=listarLivros">Livros</a></li>

				<li><a href="index.jsp">Logout</a></li>
			</ul>
		</div>
	</div>
</nav>