<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<div style="margin: 0 auto;width: 500px;">
翻译：
    <form>
        请输入：
        <input type="text" id="word">
        <select id="to">
            <option value="zh">中文</option>
            <option value="en">英语</option>
            <option value="yue">粤语</option>
            <option value="wyw">文言文</option>
            <option value="jp">日语</option>
            <option value="kor">韩语</option>
            <option value="fra">法语</option>
            <option value="spa">西班牙语</option>
            <option value="th">泰语</option>
            <option value="ara">阿拉伯语</option>
            <option value="ru">俄语</option>
            <option value="pt">葡萄牙语</option>
            <option value="de">德语</option>
            <option value="it">意大利语</option>
            <option value="el">希腊语</option>
            <option value="nl">荷兰语</option>
            <option value="pl">波兰语</option>
            <option value="bul">保加利亚语</option>
            <option value="est">爱沙尼亚语</option>
            <option value="dan">丹麦语</option>
            <option value="fin">芬兰语</option>
            <option value="cs">捷克语</option>
            <option value="rom">罗马尼亚语</option>
            <option value="slo">斯洛文尼亚语</option>
            <option value="swe">瑞典语</option>
            <option value="hu">匈牙利语</option>
            <option value="cht">繁体中文</option>
        </select>
        <input type="button" value="翻译" id="translate">
    </form>

<textarea id="result" style="margin-top:20px;">结果</textarea>
</div>
</body>
</html>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/webjars/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
    $("#translate").click(function () {
        var word=$("#word").val();
        var to=$("#to").val();
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/translate", //请求地址 type: "POST", //请求方式
            data: {
                word: word,
                from:"auto",
                to:to
            }, //请求参数
            success: function (data) {
               if(data==1){
                   alert("please input word!");
               }else {
                   console.log(data);
                   $("#result").text(data);
               }
            }
        });
    });
</script>