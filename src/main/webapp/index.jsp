<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <title>电子图书列表</title>
    <script type="text/javascript" src="/resource/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="/resource/js/bootstrap.min.css">
    <script type="text/javascript" src="/resource/js/jquery.pagination.js"></script>
    <script type="text/javascript">
        $(function () {
            getPage(0);
        })
        function getPage(pageNum) {

            pageNum=pageNum+1;
            var choose = $("[name=choose]").val();
            $.ajax({
                url:"/entry/getPage",
                type:"POST",
                data:{"pageNum":pageNum,"choose":choose},
                success:function (data) {
                    $("#content").html("");
                    $.each(data.list,function (i, item) {
                        $("#content").append("<tr>\n" +
                            "<td>"+item.id+"</td>\n" +
                            "<td>"+item.title+"</td>\n" +
                            "<td>"+item.summary+"</td>\n" +
                            "<td>"+item.uploaduser+"</td>\n" +
                            "<td>"+item.createdate+"</td>\n" +
                            "<td><a href=\'/update.jsp?id="+item.id+"&title="+item.title+"&summary="+item.summary+"&uploaduser="+item.uploaduser+"&createdate="+item.createdate+"'\>修改</a></td>\n" +
                            "<td><a href=\"javascript:void(0);\" onclick=\"del("+item.id+")\">删除</a></td>\n" +
                            "</tr>");
                    });
                    var num =data.pageNum-1;
                    $("#pagination").pagination(data.total,{
                        current_page:num,//当前页
                        items_per_page:data.pageSize,//页大小
                        num_display_entries:2,//连续分页主体部分显示的分页条目数
                        num_edge_entries:1,//两侧显示的首尾分页的条目数
                        prev_text:"上一页",
                        next_text:"下一页",
                        ellipse_text:"...",
                        prev_show_always:true,
                        next_show_always:true,
                        callback:getPage
                    })
                }
            })
        }
            function addPage() {
                location.href="/add.jsp";
            }
            function del(id) {
                if (confirm("确定删除吗？")==true){
                    $.ajax({
                        url:"/entry/del",
                        data:{"id":id},
                        success:function (data) {
                            if (data){
                                $("#success").css("display","block");
                                getPage(1);
                            }
                        }
                    })
                }else{
                    $("#fail").css("display","block");
                }
            }
    </script>
    <style type="text/css">
        body{margin: 0 auto;text-align: center}
        table{margin: 0 auto;text-align: center}
        #title {background-color: antiquewhite}
        #content tr:nth-child(odd){background-color: aquamarine}
        #content tr:nth-child(even){background-color: #faf2cc}
        a{text-decoration: none}
    </style>



<body>
    <form>
        图书分类：
        <select name="choose" id="id3">
            <option value="0">全部</option>
            <option value="1">小说</option>
            <option value="2">动漫</option>
        </select>
        <input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="新增电子图书" onclick="addPage()">
        <h2>电子图书列表</h2>
        <table border="1px solid">
            <thead id="title">
                <tr>
                    <td>图书编号</td>
                    <td>图书名称</td>
                    <td>图书摘要</td>
                    <td>上传人</td>
                    <td>上传时间</td>
                    <td colspan='2'>操作</td>
                </tr>
            <tbody id="content">
            </tbody>
            <tfoot>
                <tr id="success" style="display: none">
                    <td>删除成功！</td>
                </tr>
                <tr id="fail" style="display: none">
                    <td>删除失败！</td>
                </tr>
            </tfoot>
            </thead>
        </table>
        <div class="pagination" id="pagination">

        </div>
    </form>
</body>
</html>
