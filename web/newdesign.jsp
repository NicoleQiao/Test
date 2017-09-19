<%-- 
    Document   : homepage
    Created on : 2017-9-5, 17:03:12
    Author     : qiaoys
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="jquery-easyui-1.5.3/themes/icon.css">
        <script type="text/javascript" src="jquery-easyui-1.5.3/jquery.min.js"></script>
        <script type="text/javascript" src="jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
        <title>录入-磁铁设计</title>

    </head>
    <body>

        <h2>录入磁铁设计信息</h2>
        <p>Fill the form and submit it.</p>   
        <div style="margin:20px 0;"></div>
        <div class="easyui-panel"  style="width:100%;padding:30px 60px;">
            <form id="form" method="post">
                <div style="margin-left:20px">
                    <a>磁铁类型</a> 
                    <select  id="magtype" style="width:15%;height: 25px" >
                        <option >二极铁</option>
                        <option >四极铁</option>
                        <option >六极铁</option>
                        <option >八极铁</option>
                    </select>
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'"style="margin-right: 100px" onclick="newtype()">Add</a>
                    <a>磁铁类型</a>
                    <select  id="magfamily" style="width:15%;height: 25px" >
                        <option>A</option>
                        <option>B</option>
                    </select>
                    <a href="#"  class="easyui-linkbutton" data-options="iconCls:'icon-add'"style="margin-right: 50px" onclick="newfamily()">Add</a>
                </div>
                <div style="margin-left:20px">
                </div>
            </form>
            <div style="text-align:center;padding:5px 0">
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Submit</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">Clear</a>
            </div>
        </div>
        <script>

            function displayResult() {

            }
        </script>
        <script type="text/javascript">
            function submitForm() {
                $('#form').form('submit');
            }
            function clearForm() {
                $('#form').form('clear');
            }
            function newtype()
            {

                var name = window.prompt("新建磁铁类型", "");
                if (name !== null && name !== "")
                {
                    var x = document.getElementById("magtype");
                    var option = document.createElement("option");
                    option.text = name;
                    try {

                        x.add(option, x.options[null]);
                    } catch (e) {
                        x.add(option, null);
                    }
                }
            }
            function newfamily()
            {
                var name = window.prompt("新建磁铁型号", "");
                if (name !== null && name !== "")
                {
                     var x = document.getElementById("magfamily");
                    var option = document.createElement("option");
                    option.text = name;
                    try {

                        x.add(option, x.options[null]);
                    } catch (e) {
                        x.add(option, null);
                    }
                }
            }
        </script>  

    </body>
</html>
