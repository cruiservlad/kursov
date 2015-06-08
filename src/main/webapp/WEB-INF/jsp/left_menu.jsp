<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="wrapper row-offcanvas row-offcanvas-left">
<aside class="left-side sidebar-offcanvas">
    <section class="sidebar">
        <div class="user-panel">
        	<c:choose>
				<c:when test="${sessionScope.Login != null}">
					<div class="pull-left info">
						<p>Добро пожаловать, <%= session.getAttribute("Name_First")%>!</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="pull-left info">
						<p><font face="font-face">Добро пожаловать, гость!</font></p>
		            </div>
				</c:otherwise>
			</c:choose>
        </div>
        <ul class="sidebar-menu">
            <li>
                <a href="/index">
					<i class="fa fa-home"></i>
                    <span> Главная странца</span>
                </a>
            </li>
            <li>
                <a href="/index?page=random_post">
					<i class="fa fa-bolt"></i>
                    <span> Случайный публичный пост</span>
                </a>
            </li>
			<c:if test="${sessionScope.Login != null && page_posting != true}" >
				<li>
					<i class="fa fa-share"></i>
	                    <span><button class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Создать новую запись</button></span>
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
							<div class="modal-content">
							  <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel"  style="color:#000000">Создание нового поста</h4>
							  </div>
							  <div class="modal-body">
								<form action="index?page=post_create" method="POST" class="form-horizontal" id="post_create">
									<div class="box-body">
										<div class="form-group">
											<label for="TextNewsPre" class="col-sm-3 control-label">Заголовок поста</label>
											<div class="col-sm-9"><input name="Header" type="text" class="form-control" value="${Header}" id="TextNewsPre" placeholder="Заголовок поста" maxlength="64" required></div>
										</div>
										<div class="form-group">
											<label for="TextNews" class="col-sm-3 control-label">Текст новости</label>
											<div class="col-sm-9"><textarea style="resize:vertical;" class="form-control" rows="3" name="TextNews" id="TextNews" placeholder="Чем Вы хотите поделиться?" required>${TextNewsPre}</textarea></div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">Новость публичная?</label>
											<div class="form-inline">
						                        <div class="col-sm-2"><input name="publicNews" type="radio" value="1" class="form-control" id="PublicYes"><label for="PublicYes" class="control-label">да</label></div>
						                        <div class="col-sm-2"><input name="publicNews" type="radio" value="0" class="form-control" id="PublicNo" checked><label for="PublicNo" class="control-label">нет</label></div>	                        
						                    </div>
										</div>
						        	</div>
								</form>
							  </div>
							  <div class="modal-footer">
							  	<div class="pull-left"><button type="submit" class="btn btn-success" form="post_create">Пост</button></div>
								<button type="button" class="btn btn-danger" data-dismiss="modal">Закрыть</button>
							  </div>
							</div>
						  </div>
						</div>
				</li>
			</c:if>	
        </ul>
    </section>
</aside>