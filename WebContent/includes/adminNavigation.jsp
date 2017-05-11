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
						<li><a href="listarLivros.jsp">Listar</a></li>
						<li><a href="criarLivro.jsp">Criar</a></li>
						<li><a href="atualizarLivro.jsp">Atualizar</a></li>
						<li><a href="atualizarLivro.jsp">Deletar</a></li>
					</ul>
				</li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Alunos<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="listarAlunos.jsp">Listar</a></li>
						<li><a href="criarAluno.jsp">Criar</a></li>
						<li><a href="atualizarAluno.jsp">Atualizar</a></li>
						<li><a href="atualizarAluno.jsp">Deletar</a></li>
					</ul>
				</li>

				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Funcionários<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="listarFuncionarios.jsp">Listar</a></li>
						<li><a href="criarFuncionario.jsp">Criar</a></li>
						<li><a href="atualizarFuncionario.jsp">Atualizar</a></li>
						<li><a href="atualizarFuncionario.jsp">Deletar</a></li>
					</ul>
				</li>

				<li><a href="index.jsp">Logout</a></li>
			</ul>
		</div>
	</div>
</nav>