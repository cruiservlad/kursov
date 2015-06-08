<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<aside class='right-side'><section class='content-header'>
	<h1><small>Информация о пользователе</small></h1>
	</section>
	<section class="content">
    <div class="row">
        <section class="col-lg-7">  
        
 			<c:if test="${Error_Login == true}" >
				<div class="alert alert-danger alert-dismissable">
					<i class="fa fa-warning"></i>
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						Вы не смогли зарегистрироваться, потому что:
						<ul class='list-group'>
							<c:if test="${Error_Login_Email == true}" > <li class='list-group-item list-group-item-danger'>Данный email адрес уже зарегистрирован</li> </c:if>
							<c:if test="${Error_Login_Login == true}" > <li class='list-group-item list-group-item-danger'>Данный логин уже зарегистрирован</li> </c:if>
						</ul>Проверьте правильность введенных данных и повторите попытку
				</div>
			</c:if>
 
			<div class="box box-primary">
		        <div class="box-header"><h3 class="box-title"><font face="font-face">Информация о пользователе</font></h3></div>
		        	<c:choose>
					    <c:when test="${sessionScope.Login == null || sessionScope.Login != nameShow}">
					        <div class="form-horizontal"><div class="box-body">
					        	<div class="form-group">
				                	<label for="exampleSelectLogin" class="col-sm-2 control-label">Логин:</label>
				                    <div class="col-sm-8"><input type="text" class="form-control" id="exampleSelectLogin" value="${nameShow}" disabled></div>
				            	</div>
				            	<div class="form-group">
					            	<div class="form-inline">
					                	<label for="exampleInputFirstName" class="col-sm-2 control-label">Имя:</label>
					                    <div class="col-sm-2"><input type="text" class="form-control" value="${Check_Name_First}" id="exampleInputFirstName" disabled></div>
					                    <label for="exampleInputSecondName" class="col-sm-3 control-label">Фамилия:</label>
					                    <div class="col-sm-3"><input type="text" class="form-control" value="${Check_Name_Last}" id="exampleInputSecondName" disabled></div>		                        
					            	</div>
				                </div>
				                <div class="form-group">
				                	<label for="exampleInputAge" class="col-sm-2 control-label">Возраст:</label>
					                <div class="col-sm-3"><input type="number" value="${Check_Age}" class="form-control" id="exampleInputAge" disabled></div>
				                </div>
				                <c:if test="${sessionScope.Login != null}">
					            	<form action="index?page=user&user=${nameShow}&method=follower" method="POST">
					            		<c:if test="${Follower == false}"><button name="submit" type="submit" class="btn btn-primary">Подписаться</button></c:if>
					            		<c:if test="${Follower == true}"><button name="submit" type="submit" class="btn btn-danger">Отписаться</button></c:if>
					            	<form>
				            	</c:if>
					        </div></div>
					    </c:when>
					    <c:otherwise>
						        <div class="form-horizontal"><div class="box-body">
					        	<div class="form-group">
				                	<label for="exampleSelectLogin" class="col-sm-2 control-label">Логин:</label>
				                    <div class="col-sm-8"><input type="text" class="form-control" id="exampleSelectLogin" value="${nameShow}" disabled></div>
				            	</div>
				            	<div class="form-group">
					            	<div class="form-inline">
					                	<label for="exampleInputFirstName" class="col-sm-2 control-label">Имя:</label>
					                    <div class="col-sm-2"><input type="text" class="form-control" value="${Check_Name_First}" id="exampleInputFirstName" disabled></div>
					                    <label for="exampleInputSecondName" class="col-sm-3 control-label">Фамилия:</label>
					                    <div class="col-sm-3"><input type="text" class="form-control" value="${Check_Name_Last}" id="exampleInputSecondName" disabled></div>		                        
					            	</div>
				                </div>
				                <div class="form-group">
				                	<label for="exampleInputAge" class="col-sm-2 control-label">Возраст:</label>
					                <div class="col-sm-3"><input type="number" value="${Check_Age}" class="form-control" id="exampleInputAge" required></div>
				                </div>
					        </div></div>
					    </c:otherwise>
					</c:choose>
				</div>
        </section>
	</div>