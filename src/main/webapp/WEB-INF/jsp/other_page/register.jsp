<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<aside class='right-side'><section class='content-header'>
	<h1><small>Регистрация пользователя</small></h1>
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
		        <div class="box-header"><h3 class="box-title"><font face="font-face">Регистрация нового пользователя</font></h3></div>
		        	<c:choose>
					    <c:when test="${sessionScope.Login != null}">
					        Вы уже зарегистрированы!
					        <META HTTP-EQUIV='REFRESH' CONTENT='1;/index'>
					    </c:when>
					    <c:when test="${Register_Ok == true}">
					        <div class="alert alert-success alert-dismissable">
								<i class="fa fa-success"></i>
								<button type="button" class="close" data-dismiss="success" aria-hidden="true">&times;</button>
									Вы успешно зарегистрировались, теперь авторизуйтесь под своим логином и паролем!
							</div>
					        <META HTTP-EQUIV='REFRESH' CONTENT='3;/index?page=auth'>
					    </c:when>
					    <c:when test="${Register_Ok == false}">
					        <div class="alert alert-danger alert-dismissable">
								<i class="fa fa-warning"></i>
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
									Произошла какая - то неведомая ошибка и мы не смогли Вас зарегистрировать!
							</div>
					        <META HTTP-EQUIV='REFRESH' CONTENT='3;/index?page=auth'>
					    </c:when>
					    <c:otherwise>
						        <form action="index?page=register" method="POST" class="form-horizontal">
						        <div class="box-body">
									<div class="form-group<c:if test="${Error_Login_Email == true}" > has-error</c:if>">
				                        <label for="exampleInputEmail1" class="col-sm-2 control-label">Введите email:</label>
				                        <div class="col-sm-8">
					                        <div class="input-group">
					                        	<input name="email" type="email" class="form-control" value="${email}" id="exampleInputEmail1" placeholder="Ваш email адрес" required autocomplete="on">
					                        	<div class="input-group-addon">@</div>
					                        </div>
					                	</div>
				                    </div>
				                    <div class="form-group">
				                        <label for="exampleInputPassword1" class="col-sm-2 control-label">Введите пароль:</label>
				                        <div class="col-sm-8"><input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Пароль" required></div>
				                    </div>
				                    <div class="form-group<c:if test="${Error_Login_Login == true}"> has-error</c:if>">
				                        <label for="exampleInputLogin" class="col-sm-2 control-label">Логин:</label>
				                        <div class="col-sm-8"><input name="login" type="text" class="form-control" value="${login}" id="exampleInputLogin" placeholder="Логин, пример: pisarevvlad. Не более 16 символов" maxlength="16" required></div>
				                    </div>
				                    <div class="form-group">
					                    <div class="form-inline">
					                        <label for="exampleInputFirstName" class="col-sm-2 control-label">Введите имя:</label>
					                        <div class="col-sm-2"><input name="FirstName" type="text" class="form-control" value="${FirstName}" id="exampleInputFirstName" placeholder="Имя" required></div>
					                        <label for="exampleInputSecondName" class="col-sm-3 control-label">Введите фамилию:</label>
					                        <div class="col-sm-3"><input name="SecondName" type="text" class="form-control" value="${SecondName}" id="exampleInputSecondName" placeholder="Фамилия" required></div>		                        
					                    </div>
				                    </div>
				                    <div class="form-group">
				                        <label for="exampleInputAge" class="col-sm-2 control-label">Сколько Вам лет:</label>
					                    <div class="col-sm-3"><input name="Age" type="number" value="${Age}" min=16 max=99 class="form-control" id="exampleInputAge" placeholder="Возраст" required></div>
				                    </div>
				                    <div class="form-group">
					                        <label for="exampleInputGroup" class="col-sm-2 control-label">Название группы:</label>
					                        <div class="col-sm-3"><input name="NameGroup" value="${NameGroup}" type="text" class="form-control" id="exampleInputGroup" placeholder="Название группы" required></div>
				                    </div>
				                    <div class="form-group">
				                        <label for="exampleInputInstitut" class="col-sm-2 control-label">Название института:</label>
					                    <div class="col-sm-3">
					                    	<select name="NameUniversity" class="form-control" id="exampleInputInstitut" required>
					                    		<option disabled></option>
					                    		<optgroup label="Институты">
						                        	<option value=1>Институт высоких технологий и пьезотехники</option>
													<option value=2>Институт радиотехнических систем и управления</option>
													<option value=3>Институт нанотехнологий, электроники и приборостроения</option>
													<option value=4>Институт компьютерных технологий и информационной безопасности</option>
													<option value=5>Институт управления в экономических, экологических и социальных системах</option>
												</optgroup>
					                    	</select>
					                	</div>
				                    </div>
				                    <div class="form-group">
										<label for="TextNewsPre" class="col-sm-2 control-label">Чем планируете заниматься после обучения в институте?</label>
										<div class="col-sm-8"><textarea style="resize:vertical;" class="form-control" rows="4" name="TextNewsPre" id="TextNewsPre" required>${TextNewsPre}</textarea></div>
									</div>

				                    <br><button name="submit" type="submit" class="btn btn-primary">Зарегистрироваться</button>
				                    </div>
				            	</form>
					    </c:otherwise>
					</c:choose>
				</div>
        </section>
	</div>