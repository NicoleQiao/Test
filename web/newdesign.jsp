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
<style type="text/css">
p{font-size:14px;}
span {font-size:14px;}
</style>
    </head>
    <body>
        <h2>录入磁铁设计信息</h2>       
              <div class="easyui-panel"  style="width:100%;;padding:30px 60px;text-align: center" >
            <form id="form" method="post" >
                <div style="margin:0 auto;text-align: center">
                    <span>磁铁种类: </span> 
                    <select  id="magtype" style="width:15%;height: 25px" >
                        <option >二极铁</option>
                        <option >四极铁</option>
                        <option >六极铁</option>
                        <option >八极铁</option>
                    </select>
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="margin-right: 50px" onclick="newtype()">新建种类</a>
                    <span>磁铁型号: </span>
                    <select  id="magfamily" style="width:15%;height: 25px" >
                        <option>A</option>
                        <option>B</option>
                    </select>
                    <a href="#"  class="easyui-linkbutton" data-options="iconCls:'icon-add'"style="margin-right: 50px" onclick="newfamily()">新建型号</a>
                </div>
                <div id="table" style="width: 1000px;margin:0 auto; ">
                    <div id="table1" style="margin-left:20px ;float: left ">
                        <p >请输入磁铁设计要求：<a href="javascript:void(0)" class="easyui-linkbutton" onclick="getChanges1()">查看修改项</a></p>
                        <table id="design_require" class="easyui-propertygrid" style="width:400px" data-options="
                               url: 'design_require.json',
                               method: 'get',
                               showGroup: true,
                               scrollbarSize: 0,
                               columns: mycolumns
                               ">
                        </table>   
                        <div style="margin:10px 0;"></div>
                        <div class="easyui-panel" title="其他信息" >
                            <div style="margin-bottom:10px">
                                <input class="easyui-textbox" label="磁铁设计人：（多人请用分号隔开）" labelPosition="top" style="width:100%">
                            </div>
                            <div style="margin-bottom:10px">
                                <input class="easyui-textbox" label="磁铁负责人：（多人请用分号隔开）" labelPosition="top" style="width:100%">
                            </div>
                            <div style="margin-bottom:10px">
                                <input class="easyui-filebox" label="上传机械设计图:（PDF格式）" labelPosition="top" data-options="prompt:'选择机械设计文件...'" style="width:100%">
                            </div>
                            <div style="margin-bottom:20px">
                                <input class="easyui-filebox" label=上传物理设计图：（PDF格式）" labelPosition="top" data-options="prompt:'选择物理设计文件...'" style="width:100%">
                            </div>                            
                        </div>
                    </div>
                    <div id="table2" style="margin-left:20px ;float: right">
                        <p>请输入磁铁设计参数：<a href="javascript:void(0)" class="easyui-linkbutton" onclick="getChanges2()">查看修改项</a></p>
                        <table id="design_para" class="easyui-propertygrid" style="width:400px" data-options="
                               url: 'design_para.json',
                               method: 'get',
                               showGroup: true,
                               scrollbarSize: 0,
                               columns: mycolumns
                               ">
                        </table>                    
                    </div>
                </div>
            </form>
        </div>
        <div style="text-align:center;width:100%">
            <p style="margin-right: 10px">输入完成请点击提交
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>
            </p>
        </div>

        <script type="text/javascript">
            function submitForm() {
                $('#form').form('submit');
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
            var mycolumns = [[
                    {field: 'name', title: '设计参数', width: 100, sortable: true},
                    {field: 'value', title: '数值', width: 100, resizable: false}
                ]];
            function getChanges1() {
                var s = '';
                var rows = $('#design_require').propertygrid('getChanges');
                for (var i = 0; i < rows.length; i++) {
                    s += rows[i].name + ':' + rows[i].value + ',';
                }
                alert(s);
            }
            function getChanges2() {
                var s = '';
                var rows = $('#design_para').propertygrid('getChanges');
                for (var i = 0; i < rows.length; i++) {
                    s += rows[i].name + ':' + rows[i].value + ',';
                }
                alert(s);
            }
        </script>   
    </body>
</html>
