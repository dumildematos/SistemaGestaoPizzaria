<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String navLink = ""; %>
 <% session.setAttribute("navLink", "dashboard"); %>
<!DOCTYPE html>
<html lang="pt-br">

<head>

  <title>
    SIGP :: Cardapios
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
        <li class="active ">
            <a id="cardapioAnch" href="cardapios.jsp"  >
            <i class="tim-icons icon-single-copy-04"></i>
            <p>Cardapios</p>
          </a>
        </li>
        <li>
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
            <a class="navbar-brand" href="javascript:void(0)">Cardapios</a>
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
                    <button type="submit" class="btn btn-fill btn-primary" data-toggle="modal"  data-target="#adicionarModal" style="float: right;">Adicionar Cardapio</button>
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
                          Data
                        </th>
                        <th class="text-center">
                          Total Preço Unit.
                        </th>
                        <th class="text-center">
                          Acção
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          Light Simples
                        </td>
                        <td>
                          20/12/2020
                        </td>
                        <td class="text-center">
                          1236,738 Kz
                        </td>
                        <td class="text-center">
                          <button type="submit" class="btn btn-fill btn-primary btn-tiny" data-toggle="modal"  data-target="#editarModal"><i class="tim-icons icon-pencil"></i></button>
                           <button type="submit" class="btn btn-fill btn-primary btn-tiny" onclick="eliminarRegistro()"><i class="tim-icons icon-trash-simple"></i></button>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          Big Familiar
                        </td>
                        <td>
                          02/04/2020
                        </td>
                        <td class="text-center">
                          3223,789 Kz
                        </td>
                        <td class="text-center">
                          <button type="submit" class="btn btn-fill btn-primary btn-tiny" data-toggle="modal"  data-target="#editarModal"><i class="tim-icons icon-pencil"></i></button>
                           <button type="submit" class="btn btn-fill btn-primary btn-tiny" onclick="eliminarRegistro()"><i class="tim-icons icon-trash-simple"></i></button>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          Simple Vegan
                        </td>
                        <td>
                           07/06/2020
                        </td>
                        <td class="text-center">
                          1256,142 Kz
                        </td>
                        <td class="text-center">
                          <button type="submit" class="btn btn-fill btn-primary btn-tiny" data-toggle="modal"  data-target="#editarModal"><i class="tim-icons icon-pencil"></i></button>
                           <button type="submit" class="btn btn-fill btn-primary btn-tiny" onclick="eliminarRegistro()"><i class="tim-icons icon-trash-simple"></i></button>
                        </td>
                      </tr>
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
                        <input type="text" class="form-control" placeholder="Nome do cardápio">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                     <div class="col-md-12 pl-md-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Data</label>
                        <input type="date" class="form-control">
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
                <form>
                  <div class="row">
                    <div class="col-md-12 px-md-1">
                      <div class="form-group">
                        <label>Nome</label>
                        <input type="text" class="form-control" placeholder="Nome do cardápio">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                     <div class="col-md-12 pl-md-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Data</label>
                        <input type="date" class="form-control">
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
  
  <%@ include file="components/footer-scripts.jsp" %>
</body>

</html>