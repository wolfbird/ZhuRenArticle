
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>发布文章</title>
        <link rel="stylesheet"  type="text/css"  href="/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/css/nprogress.css">
        <link rel="stylesheet" type="text/css" href="/css/style.css">
        <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
        <script src="/ueditor/ueditor.config.js"></script>
        <script src="/ueditor/ueditor.all.js"></script>
        <link rel="shortcut icon" href="images/favicon.ico">

        <script>
        function PushNewArticle(){
            var content = document.getElementById("container").value;
            var title = document.getElementById("txtTitle").value;
            if(${sessionScope.username==null}){
                $('#pleaseLogin').modal('toggle');
                return false;
            }
            if(title == ""){
                $('#pleaseTitleDoNotSendNull').modal('toggle');
                return false;
            }

            if(content == ""){
                $('#pleaseDoNotSendNull').modal('toggle');
                return false;
            }


            document.getElementById("newArticleForm").submit();
        }
    </script>

</head>
<body class="user-select">

<header class="header" >
    <%@include file="header.jsp"%><!--静态包含-->
</header>

<section class="container">
    <div class="content-wrap">

        <div class="" style="background-color:antiquewhite  ; height: 880px ;border:solid 1px #999999; border-radius:20px; resize:none" >
            <form id="newArticleForm" method="post" action="${pageContext.request.contextPath }/sendArticle.action">
                <header class="article-header" style="padding-left: 20px;padding-right: 20px">
                    <div ><input type="text" id="txtTitle" name="newArticleTitle" class="form-control search clearable" placeholder="给你的文章起个标题吧！" autocomplete="off"></div>
                    <div class="btn-group" style="float:right ;padding-top: 10px" >
                        <button type="button" class="btn btn-danger" style="background-color: white;color: black;" onclick="PushNewArticle();">发表文章</button>
                        <button style="height: 34px;background-color: #D55161;" type="button" class="btn btn-info dropdown-toggle hidden-xs hidden-sm" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li style="padding: 5px;"><input type="checkbox" name="newHiddenCheckBox" value="yes">匿名发表</li>
                        </ul>
                    </div>


                </header>
                <article class="article-content" style="padding-top: 5px;padding-left: 20px;padding-right: 20px ;height: 600px">

                    <%--<textarea  autofocus="autofocus" style="height: 600px ;border:solid 1px #050505; border-radius:20px; resize:none; "  id="container" name="newArticleContent" class="form-control search clearable" autocomplete="off"></textarea>--%>
                    <script id="container" name="newArticleContent"  type="text/plain"></script>
                    <script type="text/javascript">
                        var ue = UE.getEditor('container', {
                            autoHeightEnabled: true,
                            autoFloatEnabled: true,
                            initialFrameHeight: 670
                        });
                    </script>


                </article>
            </form>
        </div>
        </div>
        <%--<aside class="sidebar">--%>
            <%--<div class="widget widget_sentence">--%>
            <%--<a  target="_blank" rel="nofollow"  >--%>
                <%--<img style="width: 100%" src="pic/sendqian.png" ></a>--%>
        <%--</div>--%>

    <%--</aside>--%>
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
<div id="pleaseTitleDoNotSendNull" class="modal fade">
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
                <h4 style="text-align: center;">请把标题写上哦</h4>
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
                <h4 style="text-align: center;">内容一个字没写，你发个鸡儿？</h4>
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