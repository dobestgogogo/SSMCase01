<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/8/28
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <title>增加电子图书</title>
    <script type="text/javascript" src="/resource/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        function checkNull() {
            var title = $("[name=title]").val();
            var time = $("[name=createdate]").val();
            if (title=="" || title==null){
                alert("图示名称不能为空！")
                return false;
            }
            if (time=="" || time==null){
                alert("上传时间不能为空！")
                return false;
            }
            //日期的正则表达式
            var reg = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
            if (reg.test(time)==false){
                alert("日期格式不正确，正确格式为：2018-01-01")
                return false;
            }
        }
        function goAdd() {
            location.href="/index.jsp";
        }
    </script>
    <style type="text/css">
        #kuang{margin: 0 auto;text-align: center;width: 700px;height: 300px}
        .div {padding: 0 400px 15px 0}
        #div4 {padding-right: 290px}
        a{text-decoration: none}
    </style>
</head>
<body>
    <div id="kuang" style="border: 1px solid">
        <h1>增加电子图书</h1>
        <form action="/entry/add" method="post" onsubmit="return checkNull() ">
            <div id="div1" class="div">
                图书名称(*)：
                <input type="text" name="title">
            </div>
            <div id="div2" class="div">
                图书摘要：
                <textarea name="text"></textarea>
            </div>
            <div id="div3" class="div">
                &nbsp;&nbsp;&nbsp;上&nbsp;&nbsp;传&nbsp;&nbsp;人：
                <input type="text" name="uploaduser">
            </div>
            <div id="div4" class="div">
                上传时间(*)：
                <input type="text" name="createdate">(yyyy-MM-dd)
            </div>
            <input type="submit" value="提交">    <input type="button" value="返回" onclick="goAdd()">
        </form>
    </div>
</body>
</html>
