<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String navLink = ""; %>
 <% session.setAttribute("navLink", "dashboard"); %>
<!DOCTYPE html>
<html lang="pt-br">

<head>

  <title>
    SIGP :: Pedidos
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
        <li class="active ">
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
            <a class="navbar-brand" href="javascript:void(0)">Pedidos</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse" id="navigation">
            <ul class="navbar-nav ml-auto">
              <li class="search-bar input-group">
                <button class="btn btn-link" id="search-button" data-toggle="modal" data-target="#searchModal"><i class="tim-icons icon-zoom-split" ></i>
                  <span class="d-lg-none d-md-block">Search</span>
                </button>
              </li>
              <li class="dropdown nav-item">
                <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown">
                  <div class="notification d-none d-lg-block d-xl-block"></div>
                  <i class="tim-icons icon-sound-wave"></i>
                  <p class="d-lg-none">
                    Notifications
                  </p>
                </a>
                <ul class="dropdown-menu dropdown-menu-right dropdown-navbar">
                  <li class="nav-link"><a href="#" class="nav-item dropdown-item">Mike John responded to your email</a></li>
                  <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">You have 5 more tasks</a></li>
                  <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Your friend Michael is in town</a></li>
                  <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Another notification</a></li>
                  <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Another one</a></li>
                </ul>
              </li>
              <li class="dropdown nav-item">
                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                  <div class="photo">
                    <img src="assets/img/anime3.png" alt="Profile Photo">
                  </div>
                  <b class="caret d-none d-lg-block d-xl-block"></b>
                  <p class="d-lg-none">
                    Log out
                  </p>
                </a>
                <ul class="dropdown-menu dropdown-navbar">
                  <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Profile</a></li>
                  <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Settings</a></li>
                  <li class="dropdown-divider"></li>
                  <li class="nav-link"><a href="javascript:void(0)" class="nav-item dropdown-item">Log out</a></li>
                </ul>
              </li>
              <li class="separator d-lg-none"></li>
            </ul>
          </div>
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
                    <button type="submit" class="btn btn-fill btn-primary" data-toggle="modal"  data-target="#adicionarModal" style="float: right;">Adicionar Pedidos</button>
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
                          Cliente
                        </th>
                        <th>
                          Endereço
                        </th>
                        <th>
                          Data
                        </th>
                        <th class="text-center">
                          Total
                        </th>
                        <th class="text-center">
                          Acção
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          Ana Maria
                        </td>
                        <td>
                         Murro Bento - Kero Gika
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
                          Tomás Lucas
                        </td>
                        <td>
                         Vaiana - Vila de Viana
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
                          Emilia Miguel
                        </td>
                        <td>
                         Cazenga - Zanba 1
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
  
  <%@ include file="components/footer-scripts.jsp" %>
</body>

</html>