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
        <script type="text/javascript">
            function submit() {
                var yn = window.confirm("确认提交？");
                if (yn) {
                    alert("您已提交成功");
                }
            }
        </script>
    </head>
    <body>
        <h2>录入磁铁设计信息</h2>       
        <div class="easyui-panel"  style="width:100%;padding:60px 60px;position: relative;" >
            <form action="NewDesign" method="POST" target="_blank" >
                <div style="margin:0 auto;text-align: center">
                    <span>磁铁种类: </span> 
                    <select  id="magtype" name="magtype" style="width:15%;height: 25px" >
                        <option value="b">二极铁</option>
                        <option value="q">四极铁</option>
                        <option value="h">六极铁</option>
                        <option value="o">八极铁</option>
                    </select>
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="margin-right: 50px" onclick="newtype()">新建种类</a>
                    <span>磁铁型号: </span>
                    <select  id="magfamily" name="magfamily" style="width:15%;height: 25px" >
                        <option value="1">A</option>
                        <option value="2">B</option>
                    </select>
                    <a href="#"  class="easyui-linkbutton" data-options="iconCls:'icon-add'"style="margin-right: 50px" onclick="newfamily()">新建型号</a>
                </div>
                <div id="table" style="width: 1000px;margin:0 auto; ">
                    <div id="table1" style="margin-left:20px ;float: left ">
                        <p> 请输入磁铁设计要求：
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="getChanges1()">查看修改项</a>

                        </p>                                               
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
                                <input  class="easyui-textbox" label="磁铁设计人：（多人请用分号隔开）" labelPosition="top" style="width:100%">
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
                        <p>请输入磁铁设计参数：
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="getChanges2()">查看修改项</a>
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="addrow()">新增设计参数</a>
                        </p>
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
                <div style="width:1800px;position: absolute;bottom: 0;margin:0 auto;text-align: center">
                    <p>输入完成请点击提交
                        <input style="width:90px; " TYPE="submit" VALUE="提交" onclick="submit()">
                    </p>
                </div>

            </form>

        </div>


        <script type="text/javascript">
            function newtype()
            {
                var name = window.prompt("新建磁铁类型", "");
                if (name !== null && name !== "")
                {
                    var x = document.getElementById("magtype");
                    var option = document.createElement("option");
                    option.text = name;
                    option.value = name;
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
                    option.value = name;
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
            function addrow() {
                var input = window.prompt("新建设计参数,格式：参数名/参数组名/参数类型(text,number,date,datetime)", "property/others/text");
                var slice = input.split("/");
                var property = slice[0];
                var group = slice[1];
                var type;
                if (slice[2] === "text") {
                    type = "text";
                } else if (slice[2] === "number") {
                    type = "numberbox";
                } else {
                    alert("格式错误");
                }
                var row = {
                    name: property,
                    value: '',
                    group: group,
                    editor: type
                };
                $('#design_para').propertygrid('appendRow', row);
            }
        </script>   
    </body>
</html>
