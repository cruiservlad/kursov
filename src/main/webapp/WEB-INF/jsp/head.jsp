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
		<c:when test="${page_user == true}"><jsp:include page="other_page/user.jsp" /></c:when>
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
				<c:if test="${Ok_Delete == true}" >
		    		<section class="col-lg-7">
						<div class="alert alert-success alert-dismissable">
							<i class="fa fa-info"></i>
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							Ваша запись была успешно удалена!
							<META HTTP-EQUIV='REFRESH' CONTENT='2;/index'>
						</div>
					</section>
				</c:if>
				<c:if test="${Error_Delete == true}" >
		    		<section class="col-lg-7">
						<div class="alert alert-warning alert-dismissable">
							<i class="fa fa-warning"></i>
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							Данная запись не принадлежит Вам! 
							<META HTTP-EQUIV='REFRESH' CONTENT='2;/'>
						</div>
					</section>
				</c:if>
				<c:if test="${UnFollower == true || Follower == true}" >
		    		<section class="col-lg-7">
						<div class="alert alert-success alert-dismissable">
							<i class="fa fa-info"></i>
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							<c:if test="${UnFollower == true}" >Вы успешно отписались от: ${NameFollower}</c:if>
							<c:if test="${Follower == true}" >Вы успешно подписались на: ${NameFollower}</c:if>
							<META HTTP-EQUIV='REFRESH' CONTENT='3;/index'>
						</div>
					</section>
				</c:if>
		    	<c:forEach var="post" items="${posts}" varStatus="postStat">
			        <section class="col-lg-7">  
						<div class="box box-primary">
					        <div class="box-header"><h3 class="box-title">#${post.idx}&nbsp;${post.header}</h3></div>
					        <div class="box-body">
					        	<p>${post.text}</p>
					        	<p class="text-right"><button class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal${post.idx}">Развернуть запись</button> | <small><c:if test="${sessionScope.Login != null}"><a href="/index?page=user&user=${post.userId}" title="Просмотреть профиль ${post.userId}"></c:if>${post.userId}<c:if test="${sessionScope.Login != null}"></a></c:if> | ${post.getTNew()}</small></p>
					        	<p class="pull-left visible-xs"><button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Меню</button></p>
					        </div>
						</div>
			        </section>
			        <div class="modal fade" id="myModal${post.idx}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
						<div class="modal-content">
						  <div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel"  style="color:#000000">#${post.idx}&nbsp;${post.header}</h4>
						  </div>
						  <div class="modal-body">
							${post.text}
							<hr>
							<h4 class="modal-title" align="right">Комментарии</h4>
							<p>Блок</p>
						  </div>
						  
							
						  <div class="modal-footer">
						  	<c:if test="${sessionScope.Login != null && sessionScope.Login == post.userId}">
						  		<form action="index?page=delete_post&postid=${post.idx}" method="POST">
						  			<div class="pull-left"><button type="submit" class="btn btn-warning">Удалить</button></div>
						  		</form>
						  	</c:if>
							<div class="pull-right"><button type="button" class="btn btn-danger" data-dismiss="modal">Закрыть</button></div>
						  </div>
						</div>
					  </div>
					</div>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
	<jsp:include page="footer.jsp" />
