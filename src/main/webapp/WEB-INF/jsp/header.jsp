
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/29
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%--<header class="header">--%>



    <nav class="navbar navbar-default" id="navbar">
        <div class="container">
            <div class="header-topbar hidden-xs link-border">
                <ul class="site-nav topmenu">
                    <li><a href="/home.action">首页</a></li>
                </ul>
                欢迎来到逐人文章</div>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                <h1 class="logo hvr-bounce-in"><a href="#"><img src="images/logo_white.png" ></a></h1>


            </div>

            <div style="display: inline;text-align: center;" class="sendButton"><a  style="" href="/articleClick.action" >点击发表文章!</a></div>
            <div class="collapse navbar-collapse" id="header-navbar" style="display: inline">

                <ul class=" navbar-nav navbar-right">

                    <%--已登陆--%>
                    <c:if test="${sessionScope.username != null}">
                        <li><a href="${pageContext.request.contextPath}/user.action?userName=${sessionScope.username}">${sessionScope.username}</a></li>
                        <li><a href="${pageContext.request.contextPath }/logout.action">退出</a></li>
                    </c:if>

                    <%--未登录--%>
                    <c:if test="${sessionScope.username == null}">
                        <li><a  id="registerButton" data-toggle="modal" data-target="#register" href=""><span class="glyphicon glyphicon-user"></span> 注册</a></li>
                        <li><a id="loginButton" data-toggle="modal" data-target="#login" href=""><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                    </c:if>

                </ul>
            </div>
        </div>
    </nav>



<%--注册界面--%>
<div id="register" class="modal fade"  >
    <div class="modal-dialog"  style="width: 500px">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">注册</h1>
            </div>
            <div class="modal-body">
                <form id="registerForm" role="form" class="form-signin" action="${pageContext.request.contextPath}/register.action"
                      method="post">


                    <div class="form-group">
                        <label for="">用户名：</label><input class="form-control" type="text" name="username" />
                    </div>
                    <div class="form-group">
                        <label for="">密码：</label><input class="form-control" type="password" name="password" />
                    </div>
                    <div class="form-group">
                        <label for="">确认密码：</label><input class="form-control" type="password" name="repassword"  />
                    </div>

                    <div class="form-group">
                        <button  id="submitbutton" class="btn btn-lg btn-primary btn-block" type="submit">确认注册</button>

                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
                </form>
            </div>
        </div>
    </div>
</div>
<%--登陆界面--%>
<div id="login" class="modal fade" tabindex="-1" >
    <div class="modal-dialog"  style="width: 500px">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">登陆</h1>
            </div>
            <div class="modal-body">
                <form id="loginForm" role="form" class="form-signin" action="${pageContext.request.contextPath}/login.action"
                      method="post">


                    <div class="form-group">
                        <label for="">用户名：</label><input class="form-control" type="text" name="username"  id="username" />
                    </div>
                    <div class="form-group">
                        <label for="">密码：</label><input class="form-control" type="password" name="password" id="password" />
                    </div>


                    <div class="form-group">
                        <button id="submitbutton2" class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>

                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register">点我注册</a>
                </form>
            </div>
        </div>
    </div>
</div>




