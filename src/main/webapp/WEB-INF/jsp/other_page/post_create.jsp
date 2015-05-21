<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<aside class='right-side'><section class='content-header'>
	<h1><small>Написание поста</small></h1>
	</section>
	<section class="content">
    <div class="row">
        <section class="col-lg-7">  
        	<c:if test="${Error_Post == true}" >
				<div class="alert alert-danger alert-dismissable">
					<i class="fa fa-warning"></i>
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						Одно из полей было пустым, и разместить запись не удалось!
				</div>
			</c:if>
 			<c:choose>
				<c:when test="${sessionScope.Login == null}">
					Вы еще не авторизованы! Доступ к данной функции закрыт!
					<META HTTP-EQUIV='REFRESH' CONTENT='3;/index?page=auth'>
				</c:when>
				<c:otherwise>
					<div class="box box-primary">
			        <div class="box-header"><h3 class="box-title">Создание новой записи</h3></div>
						<form action="index?page=post_create" method="POST" class="form-horizontal">
							<div class="box-body">
								<div class="form-group">
									<label for="TextNewsPre" class="col-sm-2 control-label">Заголовок поста</label>
									<div class="col-sm-8"><input name="Header" type="text" class="form-control" value="${Header}" id="TextNewsPre" placeholder="Заголовок поста" maxlength="64" required></div>
								</div>
								<div class="form-group">
									<label for="TextNews" class="col-sm-2 control-label">Текст новости</label>
									<div class="col-sm-8"><textarea style="resize:vertical;" class="form-control" rows="3" name="TextNews" id="TextNewsPre" placeholder="Чем Вы хотите поделиться?" required>${TextNewsPre}</textarea></div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">Новость публичная?</label>
									<div class="form-inline">
					                	<div class="col-sm-1"><input name="publicNews" type="radio" value="1" class="form-control" id="PublicYes"><label for="PublicYes" class="control-label">да</label></div>
					                    <div class="col-sm-1"><input name="publicNews" type="radio" value="0" class="form-control" id="PublicNo" checked><label for="PublicNo" class="control-label">нет</label></div>	                        
					            	</div>
								</div>
								<div class="form-group">
									<label for="exampleInputFile" class="col-sm-2 control-label">Доп. материалы:</label>
									<div class="col-sm-4"><input name="File" type="file" class="form-control" id="exampleInputFile" placeholder="Выберите файл"></div>
								</div>
								
				            	<br><button name="submit" type="submit" class="btn btn-primary">Разместить</button>
				        	</div>
						</form>		
						
						    <!--<form method="POST" enctype="multipart/form-data" action="/upload">
        File to upload: <input type="file" name="file"><br /> 
        Name: <input type="text" name="name"><br /> <br /> 
           <input type="submit" value="Upload"> Press here to upload the file!
    	</form> -->
						
										    
					</div>
				</c:otherwise>
			</c:choose>
        </section>
	</div>