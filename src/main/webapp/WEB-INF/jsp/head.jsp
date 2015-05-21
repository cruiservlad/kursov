<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<c:choose>
			<c:when test="${page_auth == true}"><title>Студенческий блог | Авторизация</title></c:when>
			<c:when test="${page_reg == true}"><title>Студенческий блог | Регистрация</title></c:when>
			<c:otherwise><title>Студенческий блог | Главная страница</title></c:otherwise>
		</c:choose>
    	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <link href="../css/style.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="../image/server_image/favicon.ico"/>
		<style>
			.skin-blue .navbar {
			background-color: #3b5998;
			}
			
			.skin-blue .logo {
			background-color: #3b5998;
			color: #f9f9f9;
			}
			
			.skin-blue .logo:hover {
			background-color: #3b5998;
			}
			
			.bg-yellow {
				background-color: #FF9C00 !important;
			}
			
			.bg-aqua {
			  background-color: #3C3C3C !important;
			}
	
			.bg-green {
			  background-color: #009450 !important;
			}
			.bg-light-blue {
				background-color: #3b5998;
			}
		</style>
	</head>
	

	<jsp:include page="header.jsp" />
	
	<jsp:include page="left_menu.jsp" />
	
	<c:choose>
		<c:when test="${page_auth == true}"><jsp:include page="other_page/auth.jsp" /></c:when>
		<c:when test="${page_reg == true}"><jsp:include page="other_page/register.jsp" /></c:when>
		<c:when test="${page_unlogin == true}"><jsp:include page="other_page/unlogin.jsp" /></c:when>
		<c:when test="${page_posting == true}"><jsp:include page="other_page/post_create.jsp" /></c:when>
		<c:otherwise>
			<aside class='right-side'><section class='content-header'>
			<h1><small>Главная страница</small></h1>
			</section>
			<section class="content">
		    <div class="row">
		    	<c:if test="${Good_Post == true}" >
		    		<section class="col-lg-7">
						<div class="alert alert-success alert-dismissable">
							<i class="fa fa-info"></i>
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							Запись успешно размещена
							<META HTTP-EQUIV='REFRESH' CONTENT='2;/index'>
						</div>
					</section>
				</c:if>
		    	<c:forEach var="post" items="${posts}">
			        <section class="col-lg-7">  
						<div class="box box-primary">
					        <div class="box-header"><h3 class="box-title">#${post.idx}&nbsp;${post.header}</h3></div>
					        <div class="box-body">
					        	<p>${post.text}</p>
					        	<p class="text-right"><small>${post.userId} | ${post.getTNew()}</small></p>
					        </div>
						</div>
			        </section>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
	
	<jsp:include page="footer.jsp" />
