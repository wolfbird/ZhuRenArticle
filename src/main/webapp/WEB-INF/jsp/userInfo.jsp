<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/14
  Time: 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>"它"的地盘</title>
    <link rel="stylesheet"  type="text/css"  href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/nprogress.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/bootstrapValidator.min.css">

    <link rel="shortcut icon" href="images/favicon.ico">


</head>
<body class="user-select">


<header class="header" >
    <%@include file="header.jsp"%><!--静态包含-->
</header>

<section class="container">
    <div class="content-wrap">
        <div class="content" style="padding: 0; overflow:hidden; position:relative;height:600px" >



            <div  class="panel panel-default" style="height: 600px">
                <div class="panel-heading">"它"的记录</div>
                <div class="panel-body">
                    <div class="alert alert-info alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                         开始了解它吧，你会想与它成为朋友的！
                    </div>

                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active">
                            <a href="#Articles" data-toggle="tab">TA的文章</a>
                        </li>
                        <li>
                            <a href="#Comments" data-toggle="tab">TA的评论</a>
                        </li>
                        <li>
                            <a href="#ThumbsUp" data-toggle="tab">TA赞过的</a>
                        </li>
                        <li>
                            <a href="#ThumbsDown" data-toggle="tab">TA踩过的</a>
                        </li>
                    </ul>

                    <h1></h1>

                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade in active" id="Articles">
                            <c:if test="${articleList.size()==0}"><h3 style="color: gray;margin-top: 15px">暂无</h3></c:if>
                            <ul class="list-group">
                                <c:forEach items="${articleList}" var="article"  varStatus="varStatus">
                                    <li class="list-group-item">

                                        <a href="/article.action?articleId=${article.articleId}">${article.articleTitle}</a>


                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="tab-pane fade" id="Comments">
                            <c:if test="${commentList.size()==0}"><h3 style="color: gray;margin-top: 15px">暂无</h3></c:if>
                            <ul class="list-group">
                                <c:forEach items="${commentList}" var="comment" varStatus="varStatus">
                                    <li class="list-group-item">
                                        评论  <a href="${pageContext.request.contextPath}/article.action?articleId=${comment.articleId}"><em>文章</em></a> ${comment.commentContent}

                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="tab-pane fade" id="ThumbsUp">
                            <c:if test="${ThumbsUpArticleList.size()==0}"><h3 style="color: gray;margin-top: 15px">暂无</h3></c:if>
                            <ul class="list-group">
                                <c:forEach items="${ThumbsUpArticleList}" var="article">
                                    <li class="list-group-item">
                                        <a href="${pageContext.request.contextPath}/article.action?articleId=${article.articleId}">${article.articleTitle}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="tab-pane fade" id="ThumbsDown">
                            <c:if test="${ThumbsDownArticleList.size()==0}"><h3 style="color: gray;margin-top: 15px">暂无</h3></c:if>
                            <ul class="list-group">
                                <c:forEach items="${ThumbsDownArticleList}" var="article">
                                    <li class="list-group-item">
                                        <a href="${pageContext.request.contextPath}/article.action?articleId=${article.articleId}">${article.articleTitle}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <aside class="sidebar">

        <div class="widget widget-tabs" style="height: 400px">
            <div  class="panel panel-default" style="height: 400px">
                <div class="panel-heading">我的资料</div>
                <div class="panel-body">

                    <div class="media" style="height: 200px ;padding-top: 10px " >
                        <img class="media-object" src="pic/${user.userAvatar}" height="150px" width="150px" style="margin: 0 auto ;" draggable="false">

                    </div>
                    <div>

                        <h3 style="text-align: center;">${user.userName}</h3>  </a>

                        <h5 style="text-align: center;padding-top: 12px"><span class="glyphicon glyphicon-grain" ></span> 声望 ${user.userValue}</h5>
                        <h5 style="text-align: center;padding-top: 12px"><span class="glyphicon glyphicon-pencil"></span> ${user.userBio} </h5>
                        <h5 style="text-align: center;padding-top: 12px;padding-bottom: 12px"><span class="glyphicon glyphicon-map-marker"></span> ${user.userLocation} </h5>


                    </div>

                </div>
            </div>
        </div>






    </aside>
</section>


<%@include file="footer.jsp"%><!--静态包含-->








<%--修改信息模态框--%>
<div id="editInfo" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">编辑资料</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" action="/editInfo.action" method="post">
                    <div class="form-group">
                        <label for="">地区</label>
                        <input name="location" class="form-control" type="text" value="${user.userLocation}">
                    </div>
                    <div class="form-group">
                        <label for="">简介</label>
                        <input name="bio" class="form-control" type="text" value="${user.userBio}">
                    </div>
                    <div class="text-right">
                        <button class="btn btn-primary" type="submit">修改</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <input type="hidden" name="userId" value="${user.userId}">
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#editPwd">修改密码</a>
                </form>
            </div>
        </div>
    </div>
</div>
<%--修改密码模态框--%>
<div id="editPwd" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">修改密码</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" action="${pageContext.request.contextPath}/editPassword.action" method="post">
                    <div class="form-group">
                        <label for="">新密码</label>
                        <input name="password" class="form-control" type="password" >
                    </div>
                    <div class="form-group">
                        <label for="">再次输入</label>
                        <input name="passwordAgain" class="form-control" type="password" >
                    </div>
                    <div class="text-right">
                        <button class="btn btn-primary" type="submit">修改</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <input type="hidden" name="userId" value="${user.userId}">
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#editInfo">修改信息</a>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/nprogress.js"></script>
<script src="/js/jquery.lazyload.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.ias.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
<script src="/js/scripts.js"></script>
<script>
    $(document).ready(function() {
        $('#registerForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {/*input状态样式图片*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                /*验证：规则*/
                username: {//验证input项：验证规则
                    message: '用户名无效',

                    validators: {
                        notEmpty: {//非空验证：提示消息
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 2,
                            max: 10,
                            message: '用户名长度必须在2到10之间'
                        },
                        threshold: 2, //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                            url: '/exist.action',//验证地址
                            message: '用户已存在',//提示消息

                            delay: 2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                            type: 'POST'//请求方式,


                        },

                    }
                },
                password: {
                    message: '密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 2,
                            max: 10,
                            message: '密码长度必须在2到10之间'
                        },

                        different: {//不能和用户名相同
                            field: 'username',//需要进行比较的input name值
                            message: '不能和用户名相同'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '密码由数字字母下划线和.组成'
                        }
                    }
                },
                repassword: {
                    message: '密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 2,
                            max: 10,
                            message: '密码长度必须在2到10之间'
                        },
                        identical: {//相同
                            field: 'password',
                            message: '两次密码不一致'
                        },
                        different: {//不能和用户名相同
                            field: 'username',
                            message: '不能和用户名相同'
                        },
                        regexp: {//匹配规则
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '密码由数字字母下划线和.组成'
                        }
                    }
                }


            }
        })
        $('#submitbutton').click(function() {
            $('#registerForm').bootstrapValidator('validate');
        });

    });
</script>
<script>
    $(document).ready(function() {
        $('#loginForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {/*input状态样式图片*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                /*验证：规则*/
                username: {//验证input项：验证规则
                    message: '用户名无效',

                    validators: {
                        notEmpty: {//非空验证：提示消息
                            message: '用户名不能为空'
                        },



                    }
                },
                password: {
                    message: '密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },

                        threshold: 2, //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                            url: '/check.action',//验证地址
                            message: '用户名或密码错误',//提示消息
                            data: function (validator) {
                                return {
                                    username: $("#username").val(),
                                    password:$("#password").val(),

                                };
                            },
                            delay: 3000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                            type: 'POST'//请求方式,


                        },
                    }

                },


            }
        })


    });
</script>
</body>
</html>
