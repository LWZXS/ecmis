
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title>jQuery UI 自动完成（Autocomplete） - 包含重音</title>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/easyui.css" type="text/css"/>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/icon.css" type="text/css"/>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/demo.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/statics/css/jquery-ui.min.css" type="text/css"/>

    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.min.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery-ui.min.js"></script>
    <style>
        body{
            font: 62.5% "Trebuchet MS", sans-serif;
            margin: 50px;
        }
        .demoHeaders {
            margin-top: 2em;
        }
        #dialog-link {
            padding: .4em 1em .4em 20px;
            text-decoration: none;
            position: relative;
        }
        #dialog-link span.ui-icon {
            margin: 0 5px 0 0;
            position: absolute;
            left: .2em;
            top: 50%;
            margin-top: -8px;
        }
        #icons {
            margin: 0;
            padding: 0;
        }
        #icons li {
            margin: 2px;
            position: relative;
            padding: 4px 0;
            cursor: pointer;
            float: left;
            list-style: none;
        }
        #icons span.ui-icon {
            float: left;
            margin: 0 4px;
        }
        .fakewindowcontain .ui-widget-overlay {
            position: absolute;
        }
        select {
            width: 200px;
        }
    </style>
</head>
<body>

<div class="ui-widget">
    <form>
        <label for="developer">开发人员：</label>
        <input id="developer">
    </form>
</div>
<script type="text/javascript">

    $( "#developer" ).accordion();
    var availableTags = [
        "ActionScript",
        "AppleScript",
        "Asp",
        "BASIC",
        "C",
        "C++",
        "Clojure",
        "COBOL",
        "ColdFusion",
        "Erlang",
        "Fortran",
        "Groovy",
        "Haskell",
        "Java",
        "JavaScript",
        "Lisp",
        "Perl",
        "PHP",
        "Python",
        "Ruby",
        "Scala",
        "Scheme"
    ];
    $( "#developer" ).autocomplete({
        source: availableTags
    });
</script>
</body>
</html>