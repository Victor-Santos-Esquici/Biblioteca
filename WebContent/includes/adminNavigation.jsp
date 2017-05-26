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
						<li><a href="listarLivros.jsp">Gerenciar</a></li>
						<li><a href="cadastrarLivro.jsp">Cadastrar</a></li>
					</ul>
				</li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Alunos<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="AlunoController?action=listarAlunos">Gerenciar</a></li>
						<li><a href="AlunoController?action=cadastrarAlunos">Cadastrar</a></li>
					</ul>
				</li>

				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Funcionários<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="listarFuncionarios.jsp">Gerenciar</a></li>
						<li><a href="cadastrarFuncionario.jsp">Cadastrar</a></li>
					</ul>
				</li>
				
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Categorias<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="listarCategorias.jsp">Gerenciar</a></li>
						<li><a href="cadastrarCategoria.jsp">Cadastrar</a></li>
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