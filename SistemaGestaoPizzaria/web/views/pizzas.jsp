	<%@page import="java.util.Iterator"%>
	<%@page import="java.util.List"%>
	<%@page import="com.model.TipoPizzaModel"%>
	<%@page import="com.modelDAO.TipoPizzaDAO"%>
        <%@page import="com.model.PizzaModel"%>
	<%@page import="com.modelDAO.PizzaDAO"%>
	<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

	<%@page contentType="text/html" pageEncoding="UTF-8"%>

	<!DOCTYPE html>
	<html lang="pt-br">

	<head>


		<title>
			SIGP :: Pizzas
		</title>
	<%@ include file="components/head-links.jsp" %>
	</head>

	<body class="">
		<div class="wrapper">
				<div class="sidebar">
			<!--
				Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
		-->
			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="javascript:void(0)" class="simple-text logo-mini">
						SIGP - 
					</a>
					<a href="javascript:void(0)" class="simple-text logo-normal">
						Gestão de Pizzaria
					</a>
				</div>
				<ul class="nav">
					<li>
						<a href="dashboard.jsp">
							<i class="tim-icons icon-chart-pie-36"></i>
							<p>Dashboard</p>
						</a>
					</li>
					<li>
						<a href="pedidos.jsp">
							<i class="tim-icons icon-notes"></i>
							<p>Pedidos</p>
						</a>
					</li>
					<li>
							<a id="cardapioAnch" href="cardapios.jsp"  >
							<i class="tim-icons icon-single-copy-04"></i>
							<p>Cardapios</p>
						</a>
					</li>
					<li class="active ">
						<a id="pizzasAnch" href="pizzas.jsp">
							<i class="fas fa-pizza-slice"></i>
							<p>Pizzas</p>
						</a>
					</li>
					<li>
						<a href="clientes.jsp">
							<i class="fas fa-users"></i>
							<p>Clientes</p>
						</a>
					</li>
					<li>
						<a href="funcionarios.jsp">
							<i class="fas fa-user-friends"></i>
							<p>Funcionários</p>
						</a>
					</li>
					<!--li>
						<a href="utilizadores.jsp">
							<i class="fas fa-user-cog"></i>
							<p>Utilizadores</p>
						</a>
					</li-->
				</ul>
			</div>
		</div>
			<div class="main-panel">
				<!-- Navbar -->
				<nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
					<div class="container-fluid">
						<div class="navbar-wrapper">
							<div class="navbar-toggle d-inline">
								<button type="button" class="navbar-toggler">
									<span class="navbar-toggler-bar bar1"></span>
									<span class="navbar-toggler-bar bar2"></span>
									<span class="navbar-toggler-bar bar3"></span>
								</button>
							</div>
							<a class="navbar-brand" href="javascript:void(0)">Pizzas</a>
						</div>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-bar navbar-kebab"></span>
							<span class="navbar-toggler-bar navbar-kebab"></span>
							<span class="navbar-toggler-bar navbar-kebab"></span>
						</button>
                                                <%@include file="components/top-nav.jsp" %>
					</div>
				</nav>
				<div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<i class="tim-icons icon-simple-remove"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- End Navbar -->
				<div id="content" class="content">
						<div class="row" style="padding: 5px!important;">
								<div class="col-md-12">
											<button type="submit" class="btn btn-fill btn-primary" data-toggle="modal"  data-target="#adicionarModal" style="float: right;">Adicionar Pizzas</button>
								</div>
						</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card ">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table tablesorter " id="">
											<thead class=" text-primary">
												<tr>
						<div class="col-md-12">
							<div class="card ">
													<th>
														Nome
													</th>
													<th>
														Tipo
													</th>
													<th>
														Ingredientes
													</th>
													<th class="text-center">
														Preço
													</th>
													<th class="text-center" colspan="2">
														Acção
													</th>
												</tr>
											</thead>
											<tbody>
                                                                                            
                                                                                            <%
											PizzaDAO pizzaDAO = new PizzaDAO();
											List<PizzaModel> listaPizza = pizzaDAO.getListaPizza();
											Iterator<PizzaModel> j = listaPizza.iterator();
											PizzaModel pizza = null;
											while (j.hasNext()) {
                                                                                            pizza = j.next();
											%>
												<tr>
													<td><%= pizza.getNome() %></td>
													<td><%= pizza.getTipoPizza()%></td>
													<td><%= pizza.getIngredientes()%></td>
													<td class="text-center"><%= pizza.getPreco()%> Kz</td> 
													<td class="text-center">
														<button type="submit" class="btn btn-fill btn-primary btn-tiny" data-toggle="modal"  data-target="#editarModal"><i class="tim-icons icon-pencil"></i></button>
														<button type="submit" class="btn btn-fill btn-primary btn-tiny" onclick="eliminarRegistro()"><i class="tim-icons icon-trash-simple"></i></button>
													</td>
												</tr>
                                                                                                <%}%>
                                                                                                
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					
					
					</div>
								
					<div class="row">
						<div class="col-lg-6 col-md-12">
							<div class="card card-tasks">
								<div class="card-header ">
									<h6 class="title d-inline">Tipos de Pizzas</h6>
									<p class="card-category d-inline">Hoje</p>
									<div class="dropdown">
										<button type="button" class="btn btn-link dropdown-toggle btn-icon" data-toggle="modal"  data-target="#adicionarTipoPizza">
											<i class="tim-icons icon-simple-add"></i>
										</button>
									</div>
								</div>
								<div class="card-body ">
									<div class="table-full-width table-responsive">
										<table class="table">
											<tbody>
													
												<%
											TipoPizzaDAO tipoPizzaDAO = new TipoPizzaDAO();
											List<TipoPizzaModel> list = tipoPizzaDAO.getListaTipoPizza();
											Iterator<TipoPizzaModel> i = list.iterator();
											TipoPizzaModel tipoPizza = null;
											while (i.hasNext()) {
													tipoPizza = i.next();
											%>
											
												<tr>
													<td>
														<p><%= tipoPizza.getNome() %> - <%= tipoPizza.getPreco()%> Kz</p>
													</td>
													<td class="td-actions text-right">
														<button type="button" rel="tooltip" title="" class="btn btn-link" data-toggle="modal" data-target="#editarTipoPizza" onclick="editarFuncionario('/tiposPizza',<%=tipoPizza.getIdtipo_pizza()%>) ">
															<i class="tim-icons icon-pencil"></i>
														</button>
                                                                                                                <button type="button" rel="tooltip" title="" class="btn btn-link" onclick="eliminarRegistro('/tiposPizza',<%=tipoPizza.getIdtipo_pizza()%>)">
															<i class="tim-icons icon-trash-simple"></i>
														</button>
													</td>
												</tr>
												
											
												<%}%>
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<footer class="footer">
					<div class="container-fluid">

						<div class="copyright">
								&copy;
							<script>
								document.write(new Date().getFullYear())
							</script>
							<a href="javascript:void(0)" target="_blank">Programação IV</a>
						</div>
					</div>
				</footer>
			</div>
		</div>
	
			<!-- Modal -->
	<div class="modal fade" id="editarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content card">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Editar Cardapio</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
									<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
									<form>
										<div class="row">
											<div class="col-md-12 px-md-1">
												<div class="form-group">
													<label>Nome</label>
													<input type="text" class="form-control" placeholder="Nome do cliente">
												</div>
											</div>
										</div>
										<!--div class="row">
											<div class="col-md-12 pl-md-1">
												<div class="form-group">
													<label for="exampleInputEmail1">Data</label>
													<input type="date" class="form-control">
												</div>
											</div>
										</div-->
										<div class="row">
											<div class="col-md-12 px-md-1">
												<div class="select-list">
		<div class="title">Pizzas</div>
		<div class="select-options">
			<div class="option"> 
					<input type="checkbox" name="vehicle" id="option1" value="" />
					<label for="option1">Platform</label>
			</div>
			<div class="option"> 
					<input type="checkbox" name="vehicle" id="option2" />
					<label for="option2">Device ID</label>
			</div>
					<div class="option"> 
					<input type="checkbox" name="vehicle" id="option3" />
					<label for="option3">Token</label>
			</div>
					<div class="option"> 
					<input type="checkbox" name="vehicle" id="option4" />
					<label for="option4">Option 1</label>
			</div>
		</div>
	</div>
											</div>
										</div>
									</form>
								</div>
								<div class="card-footer">
									
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="button" class="btn btn-primary">Adicionar</button
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
			
			
		<div class="modal fade" id="adicionarTipoPizza" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content card">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Adicionar Tipo de PIzza</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
									<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">

									<form action="addTipoPizza" method="POST">

											<div class="row">
												<div class="col-md-12 px-md-1">
													<div class="form-group">
														<label>Tipo</label>
														<input type="text" name="nome" class="form-control" placeholder="Tipo da pizza">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12 px-md-1">
													<div class="form-group">
														<label>Preço</label>
														<input type="text" name="preco" class="form-control" placeholder="000,00">
													</div>
												</div>
											</div>
									
											<div class="card-footer">
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
												<button type="submit" class="btn btn-primary">Adicionar</button>
											</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
                                                                                                
        <div class="modal fade" id="editarTipoPizza" data-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content card">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Editar Tipo de Pizza</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="refresh()">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
                                            <div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
                                                                    <form action="EditTipoPizza" method="POST">
										<div class="row">
                                                                                     <input type="hidden" name="idTipoPizza" value="<%= session.getAttribute("eidtarUserId") != null ? session.getAttribute("eidtarUserId"): null %>">
											<div class="col-md-12 px-md-1">
												<div class="form-group">
													<label>Nome</label> ID : <%= session.getAttribute("eidtarUserId") %>
                                                                                                        <input type="text" name="tipo" class="form-control" value="<%= session.getAttribute("eidtarUserId") != null ? tipoPizzaDAO.getTipoPizza(Integer.parseInt(session.getAttribute("eidtarUserId").toString())).getNome(): "" %>" placeholder="Tipo de Pizza">
												</div>
											</div>
										</div>
                                                                                <div class="row">
											<div class="col-md-12 px-md-1">
												<div class="form-group">
													<label>Preco</label>
                                                                                                        <input type="text" name="preco" class="form-control" value="<%= session.getAttribute("eidtarUserId") != null ? tipoPizzaDAO.getTipoPizza(Integer.parseInt(session.getAttribute("eidtarUserId").toString())).getPreco(): "" %>" placeholder="Tipo de Pizza">
												</div>
											</div>
										</div>
                                                                                                
                                                                            <div class="card-footer">
                                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="refresh()">Cancelar</button>
                                                                                <button type="submit" class="btn btn-primary">Adicionar</button
                                                                            </div>
									</form>
								</div>
			
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>

					<!-- Modal -->
	<div class="modal fade" id="adicionarModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content card">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Adicionar Cardapio</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
									<form action="addPizza" method="POST">
										<div class="row">
											<div class="col-md-12 px-md-1">
												<div class="form-group">
													<label>Nome</label>
													<input type="text" name="nome" class="form-control" placeholder="Nome da pizza">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 pl-md-1">
												<div class="form-group">
													<label>Ingredientes</label>
                                                                                                         <textarea name="ingredientes" rows="4" cols="80" class="form-control" placeholder="Escreva aqui!"></textarea>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12 px-md-1">
												<div class="select-list">
		<div class="title">Pizzas</div>
		<div class="select-options">
                     <%
                        TipoPizzaDAO tiposPizzaDAO = new TipoPizzaDAO();
                        List<TipoPizzaModel> listTipsoSelect = tiposPizzaDAO.getListaTipoPizza();
                        Iterator<TipoPizzaModel> t = listTipsoSelect.iterator();
                        TipoPizzaModel tiposPizza = null;
                        while (t.hasNext()) {
                                        tiposPizza = t.next();
                        %>
			<div class="option"> 
                            <input type="radio" name="tipoPizzaId" id="option1" value="<%= tiposPizza.getIdtipo_pizza()%>" />
                            <label for="option"><%= tiposPizza.getNome() %></label>
			</div>
			   <%}%>
		</div>
	</div>
											</div>
										</div>
                		<div class="card-footer">
									
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-primary">Adicionar</button>
								</div>
							</div>
									</form>
								</div>
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<% if(session.getAttribute("insertStatus") == "nInserido" || session.getAttribute("insertStatus") == "nAtualizado" ) { %>
   
       <script type="text/javascript">
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Por favor preencher todos os campos.'
            })
        </script>
      
   <% } %>

     <% if(session.getAttribute("insertStatus") == "inserido") { %>
   
       <script type="text/javascript">
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Registo cadastrado com sucesso!',
                showConfirmButton: false,
                timer: 1500
            })
        </script>
    
   <% } %>
   
    <% if(session.getAttribute("insertStatus") == "atualizado") { %>
   
       <script type="text/javascript">
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'cadastrado com sucesso!',
                showConfirmButton: false,
                timer: 1500
            })
        </script>
    
   <% } %>

    <% session.removeAttribute("insertStatus"); %>

		<%@ include file="components/footer-scripts.jsp" %>
	</body>

	</html>