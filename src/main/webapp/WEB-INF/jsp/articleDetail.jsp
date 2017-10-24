<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/31
  Time: 15:07
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

    <title>${article.articleTitle}</title>

    <link rel="stylesheet"  type="text/css"  href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/nprogress.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/bootstrapValidator.min.css">

    <link rel="shortcut icon" href="images/favicon.ico">

    <script>
        function PushNewComment(){
            var content = document.getElementById("comment-textarea").value;

            if(${sessionScope.username==null}){
                $('#pleaseLogin').modal('toggle');
                return false;
            }

            if(content == ""){
                $('#pleaseDoNotSendNull').modal('toggle');
                return false;
            }
            document.getElementById("comment-form").submit();
        }

        function thumbsUp(){

            if(${sessionScope.username==null}){
                $('#pleaseLogin').modal('toggle');
                return false;
            }

            document.getElementById("thumbsUpForm").submit();
        }

        function thumbsDown(){

            if(${sessionScope.username==null}){
                $('#pleaseLogin').modal('toggle');
                return false;
            }

            document.getElementById("thumbsDownForm").submit();
        }




    </script>
</head>
<body class="user-select single">

<header class="header" >
    <%@include file="header.jsp"%><!--静态包含-->
</header>

<section class="container">
    <div class="content-wrap">
        <div class="content">
            <header class="article-header">
                <h1 class="article-title"><a href="#"  >${article.articleTitle}</a></h1>
                <div class="article-meta"> <span class="item article-meta-time">
	  <time class="time" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="发表时间：${article.getArticleChangeDate()}"><i class="glyphicon glyphicon-time"></i> ${article.getArticleChangeDate()}</time>
	  </span> <span class="item article-meta-views" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="火热度：${article.articleValue}"><i class="glyphicon glyphicon-fire"></i> ${article.articleValue}</span> <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="评论量"><i class="glyphicon glyphicon-comment"></i> ${commentList.size()}</span> </div>
            </header>
            <article class="article-content">

                <p id="artcilecontent">${article.articleContent}</p>


                <div class="bdsharebuttonbox" style=" padding-bottom: 20px  ;" >
                    <div class="col-lg-1"  style="float: right">
                        <div class="btn-group-vertical" role="group" aria-label="...">

                            <form id="thumbsUpForm" action="${pageContext.request.contextPath}/thumbsUp.action" method="post">
                                <input type="hidden" name="articleId" value="${article.articleId}"/>
                                <c:choose>
                                <c:when test="${starValue==1}">
                                    <button type="button" class="btn btn-default" onclick="thumbsUp();"><span class="glyphicon glyphicon-thumbs-up" style="color: red"></span></button> </c:when>
                                <c:otherwise>
                                    <button type="button" class="btn btn-default" onclick="thumbsUp();"><span class="glyphicon glyphicon-thumbs-up"></span></button> </c:otherwise></c:choose>
                            </form>
                            <h5></h5>

                            <form  style="padding-top: 10px" id="thumbsDownForm" action="${pageContext.request.contextPath}/thumbsDown.action" method="post">
                                <input type="hidden" name="articleId" value="${article.articleId}"/>
                                <c:choose>
                                <c:when test="${starValue==-1}">
                                    <button type="button" class="btn btn-default" onclick="thumbsDown();"><span class="glyphicon glyphicon-thumbs-down"  style="color: red"></span></button> </c:when>
                                <c:otherwise>
                                    <button type="button" class="btn btn-default" onclick="thumbsDown();"><span class="glyphicon glyphicon-thumbs-down"></span></button> </c:otherwise> </c:choose>
                            </form>
                        </div>
                    </div>

                </div>



                <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a></div>

                <script>                  window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "1", "bdSize": "32" }, "share": {} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=0.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
            </article>


            <div style="padding-top: 15px" class="title" id="comment">
                <h3>评论</h3>
            </div>
            <div id="respond">
                <form id="comment-form" name="comment-form" action="${pageContext.request.contextPath }/sendComment.action" method="POST">
                    <div class="comment">

                        <div class="comment-box">
                            <textarea placeholder="您的评论或留言" name="newCommentCotent" id="comment-textarea" cols="100%" rows="3" tabindex="3"></textarea>
                            <div class="comment-ctrl">
                                <input type="hidden" name="articleId" value="${article.articleId}"/>
                                <button type="submit" name="comment-submit" id="comment-submit" tabindex="4"  onclick="PushNewComment();">评论</button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
            <div id="postcomments">
                <ol id="comment_list" class="commentlist">
                    <c:forEach  items="${commentList}" var="comment" varStatus="varStatus">
                        <li class="comment-content"><span class="comment-f">#${varStatus.count}</span><div class="comment-main"><p><a class="address" href="/user.action?userName=${userId2userNameMap[comment.userId]}" rel="nofollow" target="_blank">${userId2userNameMap[comment.userId]}</a><span class="time">${article.getArticleChangeDate()} </span><br>${comment.commentContent}</p></div></li>
                    </c:forEach>
                </ol>
            </div>
        </div>
    </div>
    <aside class="sidebar">

        <div class="widget widget-tabs" style="height: 250px">
            <div class="media" style="height: 170px ;padding-top: 10px " >
                <img class="media-object" src="pic/${article.articleAvatar}" height="150px" width="150px" style="margin: 0 auto ;border-color: #9d9d9d" draggable="false">
            </div>
            <div>
                <c:if test="${article.articleHidden==0}">
                    <a href="${pageContext.request.contextPath }/user.action?userName=${user.userName}"> <h3 style="text-align: center;background-color: #e7e7e7">${user.userName}</h3>  </a>

                    <h5 style="text-align: center;padding-top: 8px"><span class="glyphicon glyphicon-grain"></span> 声望 ${user.userValue}</h5>  </c:if>
                <c:if test="${article.articleHidden==1}">
                    <a href=""> <h3 style="text-align: center ">匿名Homie</h3>  </a>
                </c:if>

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

        <div class="widget widget_sentence">
            <a href="#" target="_blank" rel="nofollow"  >
                <img style="width: 100%" src="images/advertisment.jpg" ></a>
        </div>


    </aside>
</section>


<%@include file="footer.jsp"%><!--静态包含-->


<%--Dialogs--%>
<div id="pleaseLogin" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">这个这个。。
                </h1>
            </div>
            <div class="modal-body">
                <h4 style="text-align: center;">请先登录</h4>
            </div>
        </div>
    </div>
</div>
<div id="pleaseDoNotSendNull" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">这个这个。。
                </h1>
            </div>
            <div class="modal-body">
                <h4 style="text-align: center;">发送内容不能为空</h4>
            </div>
        </div>
    </div>
</div>

<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/nprogress.js"></script>
<script src="/js/jquery.lazyload.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.ias.js"></script>
<script src="/js/scripts.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
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