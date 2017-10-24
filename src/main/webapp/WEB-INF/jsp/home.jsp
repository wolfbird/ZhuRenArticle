<%@ page import="com.article.bean.Article" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/30
  Time: 14:59
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

    <title>Home</title>
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
            <div id="focusslide" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#focusslide" data-slide-to="0" class="active"></li>
                    <li data-target="#focusslide" data-slide-to="1"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <a target="_blank"  >
                            <img src="images/homepic1.jpg"  class="img-responsive" style="width: 820px "></a>
                    </div>
                    <div class="item">
                        <a  target="_blank"  >
                            <img src="images/qianpic.png"  class="img-responsive"></a>
                    </div>
                </div>
                <a class="left carousel-control" href="#focusslide" role="button" data-slide="prev" rel="nofollow"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">上一个</span> </a> <a class="right carousel-control" href="#focusslide" role="button" data-slide="next" rel="nofollow"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">下一个</span> </a> </div>
            <article class="excerpt-minic excerpt-minic-index">
                <h2><span class="red">【热烈欢迎】</span><a target="_blank"  title="你能找到这里真的是太巨了" >你能找到这里真的是太巨了，所以，这个网站到底是用来干什么的呢?</a>
                </h2>
                <p class="note">这是一个可以发表和浏览文章的圣地，你可以将你喜欢的文章发布在这里，虽然没什么吊人会过来看，但说不定，你的文章就为某位用户的人生带来光明！还等什么，发表文章吧，这样我的网站看起来就会很气派和牛批。</p>
            </article>
            <div class="title">
                <h3>最新发布</h3>

            </div>

            <c:if test="${articleList.size()<=10}">
                <c:forEach items="${articleList}" var="article" varStatus="varStatus">
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
                     <%--<p  style="height: 60px;width: 643px;overflow:hidden" class="note">${article.articleContent}</p>--%>
                     <p  style="height: 20px;width: 643px;overflow:hidden;text-overflow:ellipsis;-o-text-overflow: ellipsis;white-space:nowrap ;" class="note"> ${article.getChangeArticleContent()} </p>

                 </article>
                </c:forEach>
            </c:if>




            <c:if test="${articleList.size()>10}">
                <c:forEach items="${articleList}" var="article" end="10">
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
                <a href="/allArticle.action" class="package list-group-item" >
                    <div class="row">
                        <h4 style="text-align: center;">查看更多</h4>
                    </div>
                </a>
            </c:if>


        </div>
    </div>




    <aside class="sidebar">
        <div class="fixed">
            <div class="widget widget-tabs">
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#notice" aria-controls="notice" role="tab" data-toggle="tab" >统计信息</a></li>
                    <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab" >联系站长</a></li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane contact active" id="notice">
                        <h2>文章总数:
                            ${articleList.size()}篇
                        </h2>

                    </div>
                    <div role="tabpanel" class="tab-pane contact" id="contact">
                        <h2>QQ:531940981
                            <a href="" target="_blank" rel="nofollow" data-toggle="tooltip" data-placement="bottom" title=""  data-original-title="QQ"></a>
                        </h2>
                        <h2>Email:thewolfbird@163.com
                            <a href="#" target="_blank" data-toggle="tooltip" rel="nofollow" data-placement="bottom" title=""  data-original-title="#"></a></h2>
                    </div>
                </div>
            </div>

        </div>

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


        <div  id="startswf"  style="text-align: center;" >

                <embed   id="player" src="images/dangsilence.swf"
                       allowfullscreen="true" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" volume="100"
                       type="application/x-shockwave-flash" width="358px" height="240px" ></embed>
            <%--play="false"  flashvars="autoplay=false&play=false" menu="false" hidden="false" loop="false"--%>

        <%--    <embed   height="%50" width="%50" quality="high" allowfullscreen="true" controls=smallconsole type="application/x-shockwave-flash" src="//static.hdslb.com/miniloader.swf" flashvars="aid=8982532&page=1" pluginspage="//www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash"></embed>--%>
        </div>
        <%--<script type="text/javascript">document.getElementById("movie").style.height=document.getElementById("movie").scrollWidth*0.8+"px"</script>--%>

    </aside>


</section>


<%@include file="footer.jsp"%><!--静态包含-->

<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/nprogress.js"></script>
<script src="/js/jquery.lazyload.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.ias.js"></script>
<script src="/js/bootstrapValidator.min.js"></script>
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
