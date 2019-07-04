<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page deferredSyntaxAllowedAsLiteral="true" %>
<!DOCTYPE html>
<html>
<head>
    <base href="${pageContext.request.contextPath}/"/>
    <title>添加需求</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./Css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="./Css/bootstrap-responsive.css"/>
    <link rel="stylesheet" type="text/css" href="./Css/style.css"/>
    <script type="text/javascript" src="./Js/jquery.js"></script>
    <script type="text/javascript" src="./Js/bootstrap.js"></script>
    <script type="text/javascript" src="./Js/ckform.js"></script>
    <script type="text/javascript" src="./Js/common.js"></script>
    <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="./ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="./ueditor/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }

        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<form action="/demand/save" method="post" id="form">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td class="tableleft">标题</td>
            <td><input type="text" id="title" name="title" value="" style="width: 360px;"/></td>
        </tr>
        <tr>
            <td class="tableleft">紧急状态</td>
            <td>
                <input type="radio" name="level" value="2" checked/> 非常紧急
                <input type="radio" name="level" value="1"/> 紧急
            </td>
        </tr>
        <tr>
            <td class="tableleft">选择学校</td>
            <td>
                <select name="schoolId">
                    <c:forEach items="${schools}" var="school">
                        <option value="${school.id}">${school.schoolName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td class="tableleft">详细信息</td>
            <td>
                <div>
                    <textarea id="content" name="content" rows="5" cols="5"></textarea>
                </div>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="button" id="submit-button" class="btn btn-primary">保存</button>
                <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
<script type="text/javascript">
    $("#backid").click(function () {
        window.location.href = "demand/page_query/1/5";
    });
    $("#submit-button").click(function () {
        let param1 = $("#title");
        let param2 = $("#content");
        if (param1.val() == "") {
            alert("标题不能为空");
            param1.focus();
            return;
        }
        if (param2.val() == "") {
            alert("详细信息不能为空");
            param2.focus();
            return;
        }
        $("#form").submit();
    });
</script>
</html>