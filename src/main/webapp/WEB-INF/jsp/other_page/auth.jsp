<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<aside class='right-side'><section class='content-header'>
	<h1><small>Авторизация пользователя</small></h1>
	</section>
	<section class="content">
    <div class="row">
        <section class="col-lg-7">  
        
 			<c:if test="${Error_Login == true}" >
				<div class="alert alert-danger alert-dismissable">
					<i class="fa fa-warning"></i>
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						Вы не смогли авторизоваться, на это есть несколько причин:
					<ul class='list-group'>
						<li class='list-group-item list-group-item-danger'>Неправильно указан логин</li>
						<li class='list-group-item list-group-item-danger'>Неправильно указан пароль</li>
					</ul>Проверьте правильность введенных данных и повторите попытку
				</div>
			</c:if>
 
			<div class="box box-primary">
		        <div class="box-header"><h3 class="box-title">Вход в панель управления</h3></div>
		        	<c:choose>
					    <c:when test="${sessionScope.Login != null}">
					        Вы уже авторизованы!
					        <META HTTP-EQUIV='REFRESH' CONTENT='1;/index'>
					    </c:when>
					    <c:otherwise>
					        <form action="index?page=auth" method="POST">
								<div class="box-body">
				                    <div class="form-group">
				                        <label for="exampleInputEmail1">Введите email:</label>
				                        <input name="login" type="email" class="form-control" id="exampleInputEmail1" placeholder="Ваш email адрес" required autofocus autocomplete="on">
				                    </div>
				                    <div class="form-group">
				                        <label for="exampleInputPassword1">Введите пароль:</label>
				                        <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Пароль" required>
				                    </div>
									<button name="submit" type="submit" class="btn btn-primary">Авторизоватся</button>
									&nbsp;<a href="index?page=register"> Еще не зарегистрированы?</a>
									&nbsp;<a href="#"> Забыли пароль?</a>
				                </div>
				            </form>
					    </c:otherwise>
					</c:choose>
				</div>
        </section>
	</div>