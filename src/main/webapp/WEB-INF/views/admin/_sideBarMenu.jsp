<!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

          <!-- Sidebar user panel (optional) -->
          <div class="user-panel">
            <div class="pull-left image">
              <img src="${pageContext.request.contextPath}/resources/admin/imgs/sopheak.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p>Alexander Pierce</p>
              <!-- Status -->
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>

          <!-- search form (Optional) -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->

          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <!-- <li class="header">HEADER</li> -->
            <!-- Optionally, you can add icons to the links -->
            <li <c:if test="${active=='Dashboard'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/admin"><i class="fa fa-tachometer"></i> <span>Dashboard</span></a></li>
            <li <c:if test="${active=='Users'}">class="active"</c:if>><a href="${pageContext.request.contextPath}/admin/users"><i class="fa fa-users"></i><span>Users</span></a></li>
            <li ><a href="#"><i class="fa fa-sticky-note-o"></i><span>Memos</span></a></li>
            <li ><a href="#"><i class="fa fa-line-chart"></i><span>Statistics</span></a></li>
            <li ><a href="#"><i class="fa fa-bug"></i><span>Black List</span><span class="label pull-right bg-red">10</span></a></li>
            <!-- <li class="treeview">
              <a href="#"><i class="fa fa-link"></i> <span>Multilevel</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="#">Link in level 2</a></li>
                <li><a href="#">Link in level 2</a></li>
              </ul>
            </li> -->
          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>
      
      <!-- ----------------------------CONTENT ---------------------------- -->
      
      
        <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            ${pageTitle}
            <small>${pageDesc}</small>
          </h1>
          <!-- <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
            <li class="active">Here</li>
          </ol> -->
        </section>

        <!-- Main content -->
        <section class="content">