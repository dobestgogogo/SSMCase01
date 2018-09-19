<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--<% String title=new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8"); %>
<% String summary=new String(request.getParameter("summary").getBytes("ISO-8859-1"),"UTF-8"); %>
<% String uploaduser=new String(request.getParameter("uploaduser").getBytes("ISO-8859-1"),"UTF-8"); %>
<% String createdate=new String(request.getParameter("createdate").getBytes("ISO-8859-1"),"UTF-8"); %>--%>
<html>
<head>
    <title>修改</title>
    <script type="text/javascript" src="/resource/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        function goIndex() {
            location.href="/index.jsp";
        }
    </script>
    <style type="text/css">
        body{margin: 0 auto;text-align: center}
        table{margin: 0 auto;text-align: center}
        td {text-align: center}
        input {text-align: center}
        a{text-decoration: none}
    </style>
</head>
<body>
    <form action="/entry/update?id=${param.id}" method="post">
        <table border="1px solid">
            <tr>
                <td colspan="2"><h1>更新电子图书</h1></td>
            </tr>
            <tr>
                <td>图书编号</td>
                <td>${param.id}</td>
            </tr>
            <tr>
                <td>图书名称<span style="color: red">(*)</span></td>
                <td><input type="text" name="title" value="${param.title}"></td><%--<%=title%>--%>
            </tr>
            <tr>
                <td>图书摘要</td>
                <td><textarea name="summary">${param.summary}</textarea></td><%--<%=summary%>--%>
            </tr>
            <tr>
                <td>上传人</td>
                <td><input type="text" name="uploaduser" value="${param.uploaduser}"></td><%--<%=uploaduser%>--%>
            </tr>
            <tr>
                <td>上传时间<span style="color: red">(*)</span></td>
                <td><input type="text" name="createdate" value="${param.createdate}"></td><%--<%=createdate%>--%>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" value="返回" onclick="goIndex()"></td>
            </tr>
        </table>
    </form>
</body>
</html>
