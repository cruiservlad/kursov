<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 	<body class="skin-blue">
    <header class="header">
		<a href="/index" class="logo">Student blog for sfedu</a>
	    <nav class="navbar navbar-static-top" role="navigation">
		    <div class="navbar-right">
		        <ul class="nav navbar-nav">
					<li class="dropdown user user-menu">
						<c:choose>
						    <c:when test="${sessionScope.Login != null}">
						        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="glyphicon glyphicon-user"></i>
									<span><%= session.getAttribute("Name_First")%><i class="caret"></i></span>
				                </a>
				                <ul class="dropdown-menu">
				                    <li class="user-header bg-light-blue">
				                    	<c:choose>
						    				<c:when test="${sessionScope.IdUser == 1}">
					                    		<img src="../image/server_image/admin_photo.png" class="img-circle" alt="User Image" />
					                    	</c:when>
					                    	<c:otherwise>
										        <img src="../image/server_image/0.png" class="img-circle" alt="User Image" />
										    </c:otherwise>
										</c:choose>
					                    <p><%= session.getAttribute("Name_First")%> <%= session.getAttribute("Name_Second")%></p>
					                </li>
					                <li class="user-footer">
					                    <!--<div class="pull-left">
					                        <a href="#" class="btn btn-default btn-flat">Инфо</a>
					                    </div>-->
					                    <div class="pull-right">
					                        <a href="/index?page=unlogin" class="btn btn-default btn-flat">Выйти</a>
					                    </div>
					                </li>
					             </ul>
						        
						    </c:when>
						    <c:otherwise>
						        <a href='/index?page=auth'><i class='glyphicon glyphicon-user'></i><span>Авторизоваться</span></a>
						    </c:otherwise>
						</c:choose>
					</li>	
		        </ul>
		    </div>
	    </nav>
	</header>