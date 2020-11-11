<!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <!-- Place this tag in your head or just before your close body tag. -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="../assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/black-dashboard.min.js?v=1.0.0"></script><!-- Black Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
        
      $().ready(function() {
        $sidebar = $('.sidebar');
        $navbar = $('.navbar');
        $main_panel = $('.main-panel');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');
        sidebar_mini_active = true;
        white_color = false;

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();



        $('.fixed-plugin a').click(function(event) {
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .background-color span').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data', new_color);
          }

          if ($main_panel.length != 0) {
            $main_panel.attr('data', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data', new_color);
          }
        });

        $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            sidebar_mini_active = false;
            blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
          } else {
            $('body').addClass('sidebar-mini');
            sidebar_mini_active = true;
            blackDashboard.showSidebarMessage('Sidebar mini activated...');
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);
        });

        $('.switch-change-color input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (white_color == true) {

            $('body').addClass('change-background');
            setTimeout(function() {
              $('body').removeClass('change-background');
              $('body').removeClass('white-content');
            }, 900);
            white_color = false;
          } else {

            $('body').addClass('change-background');
            setTimeout(function() {
              $('body').removeClass('change-background');
              $('body').addClass('white-content');
            }, 900);

            white_color = true;
          }


        });

        $('.light-badge').click(function() {
          $('body').addClass('white-content');
        });

        $('.dark-badge').click(function() {
          $('body').removeClass('white-content');
        });
      });
    });
  </script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      demo.initDashboardPageCharts();

    });
  </script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "black-dashboard-free"
      });
  </script>
  
  <script type="text/javascript">
      (function($){
  $.fn.multiselect = function() {
    
    var selector = this;
    var options = $.extend({
          onChange: function() {}
      }, arguments[0] || {});
      
    activate();

    /////////

    function activate() {
           
      //events
      $(selector).find('.title').on('click', function(e) {
        $(this).parent().find('.select-options').toggle();
      });
      
      $(selector).find('input[type="checkbox"]').change(function(e){
        options.onChange.call(this);
      });
      
    }
  };
  
}(jQuery));

$(document).ready(function() {
  $('.select-list').multiselect({
    onChange: updateTable
  });
});
  
    function updateTable() {
      var checkboxValue = $(this).val();
      var isChecked = $(this).is(':checked');

    }
      function eliminarRegistro(path, id){

          Swal.fire({
            title: 'Você tem certeza?',
            text: "Você não poderá reverter isso!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sim, exclua!'
          }).then((result) => {
            if (result.isConfirmed) {
                var message = Swal.fire(
                'Excluído!',
                'Seu registro foi deletado.',
                'success'
              );
                if(path === '/funcionarios'){
                    $.get('${pageContext.request.contextPath}/views/DelFuncionario?idFuncionario='+id, function(data) {
                        message();
                    });
                }else if(path === '/clientes'){
                    $.get('${pageContext.request.contextPath}/views/DelCliente?idCliente='+id, function(data) {
                        message();
                    });
                }else if(path === '/tiposPizza'){
                    $.get('${pageContext.request.contextPath}/views/DelTipoPizza?idTipoPizza='+id, function(data) {
                        message();
                    });
                }else if(path === '/pizzas'){
                    $.get('${pageContext.request.contextPath}/views/DelPizza?idPizza='+id, function(data) {
                          message();
                    })
                }
                
                
                setTimeout(function(){ location.reload(); }, 1500);
                
            }
          })
          
      }
      
      function editarFuncionario(path, id){
        if(path === '/funcionarios'){
            $.get('${pageContext.request.contextPath}/views/GetFuncionario?idFuncionario='+id, function(data) {
                 $('#editarFunciomarioModal').modal();
            });
        }else if(path === '/clientes'){
            $.get('${pageContext.request.contextPath}/views/GetCliente?idCliente='+id, function(data) {
                 $('#editarFunciomarioModal').modal();
            })
        }else if(path === '/tiposPizza'){
            $.get('${pageContext.request.contextPath}/views/GetTipoPizza?idTipoPizza='+id, function(data) {
                 $('#editarTipoPizza').modal();
            })
        }else if(path === '/pizzas'){
            $.get('${pageContext.request.contextPath}/views/GetPizza?idPizza='+id, function(data) {
                 $('#editarPizzaModal').modal();
            })
        }
      }
      function refresh(){
        <%--
            request.getSession().removeAttribute("eidtarUserId");
        --%>
        location.reload();
      }
  </script>