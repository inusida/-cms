<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<SCRIPT language=javascript>
</SCRIPT>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>

    body{
        margin:0;
        padding: 0;
        background: #2f3542;
    }

    .box{
        color: #dfe4ea;
        font-size: 100px;
        text-align: center;
        border: 5px solid rgba(164,176,190,0);
    }

    .box_text{
        font-size: 20px;
        margin: 10px;
        color: white;
    }

    .box_img{
        margin: 10px;
    }

    .main{
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%,-50%);
        width: 600px;
        height: auto;
        display: grid;
        grid-template-columns: repeat(3,1fr);
        grid-template-rows: repeat(2,1fr);
        grid-gap: 10px;
    }


    .box1{
        grid-column: 1 / 2;
        grid-row: 1 / 2;
        background: #eccc68;
    }

    .box2{
        grid-column: 2 / 4;
        grid-row: 1 / 2;
        background: #ff7f50;
    }

    .box3{
        grid-column: 1 / 2;
        grid-row: 2 / 3;
        background: #7bed9f;
    }

    .box4{
        grid-column: 2 / 3;
        grid-row: 2 / 3;
        background: #70a1ff;
    }
    .box5{
        grid-column: 3 / 4;
        grid-row: 2 / 3;
        background: #ed6452;
    }
    .box6 {
        grid-column: 1 / 2;
        grid-row: 3 / 4;
        background: #ed52ea;
    }
    .box7{
        grid-column: 2 / 3;
        grid-row: 3 / 4;
        background: #00ffe1;
    }
    .box8{
        grid-column: 3 / 4;
        grid-row: 3 / 4;
        background: #ff00b7;
    }


    .box:hover{
        border: 5px solid rgba(241,242,246,0.8);
        transition: 0.3s linear;
        background: #3742fa;
    }

</style>
<HTML>
<%
    String username = (String) session.getAttribute("user");
    String type = (String) session.getAttribute("type");
    if (username == null){
        response.sendRedirect(path + "index.jsp");
    }else{
%>
<head>
    <title>系统管理员</title>
</head>
<body>
    <%if(type.equals("系统管理员")){%>
    <div class="main">
        <div class="box box1">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_personnel_management.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                人事管理
            </div>
        </div>
        <div class="box box2" onclick="location.href='<%=basePath%>user/index.jsp'">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_user_management.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                用户管理
            </div>
        </div>
        <div class="box box3">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_reception_management.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                接待管理
            </div>
        </div>
        <div class="box box4">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_oldman_management.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                老人管理
            </div>
        </div>
        <div class="box box5">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_bed_management.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                床位管理
            </div>
        </div>
        <div class="box box6">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_fee_management.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                费用管理
            </div>
        </div>
        <div class="box box7">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_service_management.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                服务管理
            </div>
        </div>
        <div class="box box8" onclick="if (confirm('确定要退出吗？')){location.href='<%=basePath %>AdminServlet?method=adminexit';}">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_exit.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                退出
            </div>
        </div>
    </div>
    <%}else{%>
    <div class="main">
        <div class="box box2">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_user_management.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                用户管理
            </div>
        </div>
        <div class="box box1">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_reception_management.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                护理任务
            </div>
        </div>
        <div class="box box3">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_oldman_management.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                老人管理
            </div>
        </div>
        <div class="box box4">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_service_management.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                服务记录
            </div>
        </div>
        <div class="box box5" onclick="if (confirm('确定要退出吗？')){location.href='<%=basePath %>AdminServlet?method=adminexit';}">
            <div class="box_img">
                <img src="<%=basePath%>images/icon_exit.png" height="45px" width="45px">
            </div>
            <div class="box_text">
                退出
            </div>
        </div>
    </div>
    <%}%>
</body>
<%}%>
</HTML>