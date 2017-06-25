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
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Livros<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="LivroController?action=listarLivros">Gerenciar</a></li>
						<li><a href="LivroController?action=cadastrarLivros">Cadastrar</a></li>
					</ul>
				</li>

				<li>
					<a href="AlunoController?action=listarAlunos">Alunos</a>
				</li>

				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Funcionários<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="FuncionarioController?action=listarFuncionarios">Gerenciar</a></li>
						<li><a href="FuncionarioController?action=cadastrarFuncionario">Cadastrar</a></li>
					</ul>
				</li>
				
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Categorias<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="CategoriaController?action=listarCategorias">Gerenciar</a></li>
						<li><a href="CategoriaController?action=cadastrarCategoria">Cadastrar</a></li>
					</ul>
				</li>
				
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Bibliotecas<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="BibliotecaController?action=listarBibliotecas">Gerenciar</a></li>
						<li><a href="BibliotecaController?action=cadastrarBiblioteca">Cadastrar</a></li>
					</ul>
				</li>

				<li><a href="index.jsp">Logout</a></li>
			</ul>
		</div>
	</div>
</nav>