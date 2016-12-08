<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>2048</title>
    <style type="text/css">
        body{
            text-align:center;
            font-size:36px;
            font-weight:bold;
            background-color: #e3c887;
        }
        table{
            text-align:center;
            font-size:36px;
            font-weight:bold;
            margin:0 auto;
            margin-top:100px;
            border-radius:10px;
            background-color: #999;
        }
        td{width:80px;height:80px;border-radius:10px;background-color: #fff;}
        span{color:#FF0000;font-size:36px;}
    </style>
</head>
<body onkeydown="operator()">
<table id="tab" cellspacing="8" >
    <tr>
        <td id="1"></td>
        <td id="2"></td>
        <td id="3"></td>
        <td id="4"></td>
    </tr>
    <tr>
        <td id="5"></td>
        <td id="6"></td>
        <td id="7"></td>
        <td id="8"></td>
    </tr>
    <tr>
        <td id="9"></td>
        <td id="10"></td>
        <td id="11"></td>
        <td id="12"></td>
    </tr>
    <tr>
        <td id="13"></td>
        <td id="14"></td>
        <td id="15"></td>
        <td id="16"></td>
    </tr>
</table>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
    //定义数字的背景色
    var color={"":"#fff","2":"#acf6ef","4":"#e3c887","8":"#2ae0c8","16":"#fbb8ac",
        "32":"#fe6673","64":"#CC3333","128":"#0066CC", "256":"#6633CC",
        "512":"#FF0099","1024":"#990033","2048":"#6600FF","4096":"#CC0066"};

    $(document).ready(function () {
        //初始化
        for(var i=1;i<=2;i++) {
            initGame();
        }
    });

    function initGame() {
        //判断游戏是否结束
        var count=0;
        for(var i=1;i<=16;i++){
            if($("#"+index).text()==''){
                count++;
            }
        }
        if(count==0){
            alert("game over! restart game!");
            //重新开始游戏
            location.reload();
        }

        //在表格中随机的两个位置随机出现两个数字（2,4）
            //将这两个数字随机分配到表格的两个位置中
            var index=getRandomNum(1,16);
            console.log("id"+index);
            var num=getRandomNum(1,2)*2;
            if($("#"+index).text()==''){
                $("#"+index).text(num);
                //改变背景颜色
                $("#"+index).css("background-color",color[num]);
            }else {
                initGame();
            }

    }

    var result=false;
    var length;
    //定义键盘事件
    function operator() {
        //判断是否存在相加的数
        if(event.keyCode==37) toLeft();
        if(event.keyCode==38) toTop();
        if(event.keyCode==39) toRight();
        if(event.keyCode==40) toButtom();
        //同时产生两个随机数（当存在两个相加的数的时候）
        if(result){
            for(var i=1;i<=2;i++) {
                initGame();
            }
        }

    }


    function toLeft() {
        //存放每一排第一个的数字（如果full的长度达到4个，并且每一排不存在可以相加的，那么当前操作不能继续产生随机数）
        var full=new Array();
        //遍历每一排的td（1-4,5-8,9-12,13-16）
        //遍历每一排
        for(var i=1;i<=4;i++){
            //遍历每一排中的每一个td的值
            var values=new Array();
            for(var k=(i*4-3);k<=i*4;k++){
                if($("#"+k).text()!=''){
                    var value=parseInt($("#"+k).text());
                    $("#"+k).text("");
                    $("#"+k).css("background-color","#fff");
                    values.push(value);
                }
            }

            //将数组中的数字按顺序（相邻的相同的可以叠加）重新组合放入td
            var orderValue=new Array();//新的组合
            changeNum(values,orderValue);
            var count=0;
            for(var k=(i*4-3);k<=i*4;k++){
                if(count<orderValue.length){
                    var num=orderValue[count];
                    $("#"+k).text(num);
                    //改变背景颜色
                    $("#"+k).css("background-color",color[num]);
                }
                count++;
            }

            full.push(parseInt($("#"+(i*4-3)).text()));
            length=full.length;
        }
    }

    function changeNum(values,orderValue) {
        for(var j=0;j<values.length;j++){
            if(values[j]==values[j+1]){
                var num=values[j]+values[j+1];
                orderValue.push(num);
                values.splice(0,2);
                changeNum(values,orderValue);
                if(length==4){
                    result=true;
                }
            }else {
                var num=values[j];
                orderValue.push(num);
                values.splice(0,1);
                changeNum(values,orderValue);
                if(length!=4){
                    result=true;
                }
            }
        }
    }

    function toTop() {

    }

    function toRight() {

    }

    function toButtom() {

    }


    //获取随机数
    function getRandomNum(min,max) {
        return Math.round(Math.random()*(max-min))+min;
    }
</script>