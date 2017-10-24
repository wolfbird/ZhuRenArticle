<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/11
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>全部文章</title>
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
        <div class="content">
            <div class="title">
                <h3 style="line-height: 1.3">全部文章</h3>
            </div>

            <c:forEach items="${articleList}" var="article">
                <article class="excerpt excerpt-1" style="" >

                    <a class="focus"  target="_blank" >
                        <img class="thumb" data-original="pic/${article.articleAvatar}" src="pic/${article.articleAvatar}" style=" width:100px;height:100px;border-radius:4px; display: inline;"   >  </a>
                    <header>
                        <c:if test="${article.articleHidden==0}"> <a class="cat"  >${userId2NameMap[article.userId]}<i></i></a></c:if>
                        <c:if test="${article.articleHidden==1}"> <a class="cat" >匿名Homie<i></i></a></c:if>
                        <h2><a href="/article.action?articleId=${article.articleId}" title="${article.articleTitle}" target="_blank" >${article.articleTitle}</a>
                        </h2>
                    </header>


                    <p class="meta">
                        <time class="time" ><i class="glyphicon glyphicon-time"></i> ${article.getArticleChangeDate()}</time>
                        <span class="views"><i class="glyphicon glyphicon-fire"></i> ${article.articleValue}</span> <a class="comment"  title="评论" target="_blank" ><i class="glyphicon glyphicon-comment"></i> ${articleId2ComCntMap[article.articleId]}</a>
                    </p>
                        <%--<%= ((Article)request.getAttribute("article")).getArticleDate() %>--%>
                    <p  style="height: 20px;width: 643px;overflow:hidden;text-overflow:ellipsis;-o-text-overflow: ellipsis;white-space:nowrap ;" class="note"> ${article.getChangeArticleContent()} </p>

                </article>
            </c:forEach>

            <ul class="pagination" style="float: right">
                <c:forEach items="${pageinfo.navigatepageNums}" var="pageNumber">
                    <li>
                        <a href="/allArticle.action?pn=${pageNumber}">${pageNumber}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <aside class="sidebar">




        <div class="widget widget_hot">
            <h3>热门文章</h3>
            <ul>
                <c:forEach items="${articleHotComList}" var="article">
                    <li > <a  href="/article.action?articleId=${article.articleId}" >
        <span class="thumbnail">
				<img class="thumb" data-original="pic/${article.articleAvatar}" src="pic/${article.articleAvatar}"   style="display: block;">
			</span>

                        <span style="padding-top: 15px" class="text"><strong style="font-size: 15px">${article.articleTitle}</strong></span><span class="muted"><i class="glyphicon glyphicon-time"></i>
				${article.getArticleChangeShortDate()}
			</span><span class="muted"><i class="glyphicon glyphicon-fire"></i> ${article.articleValue}</span>
                        <span class="muted"><i class="glyphicon glyphicon-comment"></i> ${articleId2ComCntMap[article.articleId]}</span></a></li>
                </c:forEach>
            </ul>
        </div>


        <div class="widget widget_hot">
            <h3>精品文章</h3>
            <ul>
                <c:forEach items="${articleStarList}" var="article">
                    <li > <a  href="/article.action?articleId=${article.articleId}" >
        <span class="thumbnail">
				<img class="thumb" data-original="pic/${article.articleAvatar}" src="pic/${article.articleAvatar}"   style="display: block;">
			</span>

                        <span style="padding-top: 15px" class="text"><strong style="font-size: 15px">${article.articleTitle}</strong></span><span class="muted"><i class="glyphicon glyphicon-time"></i>
			${article.getArticleChangeShortDate()}
			</span><span class="muted"><i class="glyphicon glyphicon-fire"></i> ${article.articleValue}</span>
                        <span class="muted"><i class="glyphicon glyphicon-comment"></i> ${articleId2ComCntMap[article.articleId]}</span></a></li>
                </c:forEach>
            </ul>
        </div>

        <div class="widget widget_sentence">
            <a href="#" target="_blank" rel="nofollow"  >
                <img style="width: 100%" src="images/advertisment.jpg" ></a>
        </div>

    </aside>
</section>


<%@include file="footer.jsp"%><!--静态包含-->

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
