<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<title>北京地铁</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<style type="text/css">
/*设置超链接样式*/
table {
	border-collapse: collapse;
	border-spacing: 0;
}

a {
	color: #5086a5;
	text-decoration: none;
	font-size: 12px;
}

a:hover {
	color: #5086a5;
	text-decoration: underline;
	font-size: 12px;
}

a:visited {
	color: #5086a5;
	font-size: 12px;
}
/*整个tab层居中，宽度为600px*/
#tabDiv {
	width: 600px;
	margin: 1em auto;
	padding-bottom: 10px;
	border-right: #b2c9d3 1px solid;
	border-top: #b2c9d3 1px solid;
	border-left: #b2c9d3 1px solid;
	border-bottom: #b2c9d3 1px solid;
	background: #ffffff;
}
/*tab头的样式*/
#tabsHead {
	padding-left: 0px;
	height: 26px;
	background-color: #e8f7fc;
	font-size: 1em;
	margin: 1px 0px 0px;
	color: #5086a5;
	line-height: 26px;
}


/*已选tab头（超链接）的样式*/
.curtab {
	padding-top: 0px;
	padding-right: 10px;
	padding-bottom: 0px;
	padding-left: 10px;
	border-right: #b2c9d3 1px solid;
	font-weight: bold;
	float: left;
	cursor: pointer;
	background: #ffffff;
}
/*未选tab头（超链接）的样式*/
.tabs {
	border-right: #c1d8e0 1px solid;
	padding-top: 0px;
	padding-right: 10px;
	padding-bottom: 0px;
	padding-left: 10px;
	font-weight: normal;
	float: left;
	cursor: pointer;
}
p {
	font-size: 12pt;
	text-indent: 2em;
}
li {
  	border-bottom-style: solid;
  	border-bottom-color: #EEE;
  	border-bottom-width: thin;
  	height: 25px;
	font-family: "宋体";
	font-size: 12pt;
}
</style>

<script type="text/jscript">	
        //显示tab（tabHeadId：tab头中当前的超链接；tabContentId要显示的层ID）
        function showTab(tabHeadId,tabContentId) 
        {
            //tab层
            var tabDiv = document.getElementById("tabDiv");
            //将tab层中所有的内容层设为不可见
            //遍历tab层下的所有子节点
            var taContents = tabDiv.childNodes;
            for(i=0; i<taContents.length; i++) 
            {
                //将所有内容层都设为不可见
                if(taContents[i].id!=null && taContents[i].id != 'tabsHead')
                {
                    taContents[i].style.display = 'none';
                }
            }
            //将要显示的层设为可见
            document.getElementById(tabContentId).style.display = 'block';          
            //遍历tab头中所有的超链接
            var tabHeads = document.getElementById('tabsHead').getElementsByTagName('a');
            for(i=0; i<tabHeads.length; i++) 
            { 
                //将超链接的样式设为未选的tab头样式
                tabHeads[i].className='tabs'; 
            }
            //将当前超链接的样式设为已选tab头样式
            document.getElementById(tabHeadId).className='curtab';
            document.getElementById(tabHeadId).blur();
        }
</script>

<script>
        function showTime() {
            var date = new Date();

            // 年月日
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDate();

            // 时分秒
            var hour = date.getHours();
            var minute = date.getMinutes();
            var second = date.getSeconds();

            // 实时显示
            var element = document.getElementById('time');
            element.innerHTML = '<h1>' + year + '年 ' + month + '月 ' + day + '日        时间：' + hour + ':' + minute + ':' + second;
        }

        setInterval('showTime()', 1000);
    </script>


<body background="image/back4.jpg">

   <div id="time"></div>

	<div style="width: 100%; font-family: 微软雅黑; text-align: center; font-size: 20pt;">北京地铁信息</div>

	<div id="tabDiv" style="width: 1000px">

		<div id="tabsHead">
			
			<a id="tabs1" class="curtab" href="javascript:showTab('tabs1','tabContent1')">车站查询</a> <a id="tabs2" class="tabs" href="javascript:showTab('tabs2','tabContent2')">路线查询</a>
			<a id="tabs3" class="tabs" href="javascript:showTab('tabs3','tabContent3')">起点——终点查询</a>
		</div>

		<div id="tabContent1" style="display: block">
			<table style="border-width: 0; width: 100%">
				<tr>
					<td rowspan="3" style="width: 300px; text-align: center"><img alt="张明明" src="image/ditie.png" style="width: 280px" /></td>
					<td colspan="3" rowspan="3">
						<font size=5 color="blue"><B>北京地铁信息查询</B></font>
                         <form action="ListServlet" onsubmit="return fun1()" method="post">
            			<table border="1" style="border-left-color: aqua; border-bottom-color: aqua; width: 701px; border-top-style: solid; border-top-color: aqua; border-right-style: solid; border-left-style: solid; height: 380px; border-right-color: aqua; border-bottom-style: solid">
                  		<tr>
                		<td>出发地： </td>
                			<td>
                    	<label>
                        <input type="test" name="stStation" >
                      
                    	</label>
                			</td>
                 </tr>
                 <tr>
                <td>目的地： </td>
                <td>
                    <label>
                        <input type="test" name="enStation" >
                      
                    </label>
                </td>
                 </tr>
            <tr>
                <td>出发地： </td>
              
                <td>
                    <label>
                        <select name="leixing">
					<option value="站点分类">站点分类
					<option value="A">A
					<option value="B">B
					</select>
                    </label>
                </td>
                <td>
                    <label>
                        <select name="leixing">
					<option value="站点名称">站点名称
					<option value="A">A
					<option value="B">B
					</select>
                    </label>
                </td>
                <td>目的地： </td>
                <td>
                <label>
                        <select name="leixing">
					<option value="站点分类">站点分类
					<option value="A">A
					<option value="B">B
					</select>
                    </label>
                   </td>
                   
                   <td>
                    <label>
                        <select name="leixing">
					<option value="站点名称">站点名称
					<option value="A">A
					<option value="B">B
					</select>
                    </label>
                   </td>
                
            <tr align="center">
                <td colspan="2">
                    <input type="submit" value="提交" />
                    <input type="reset" value="重置" />
                </td>
            </tr>
        </table>
    </form>
    
    			<table width="50%" cellspacing="10">
				  <tr align="center">
					<td>路线</td>
					<td>车站名</td>
					 </tr>
    
    			<c:forEach items="${list }"  var="u"  varStatus="status">
						<tr align="center">
							<td>${u.nol }</td>
							<td>${u.name }</td>
						</tr>
				</c:forEach>
				</table>
				</td>
				</tr>
				</table>
		</div>
		<!--以下为路线查询部分内容-->
		<div id="tabContent2" style="display: none">
		<table style="border-width: 0; width: 100%">
				<tr>
					<td rowspan="3" style="width: 300px; text-align: center"><img alt="张明明" src="image/ditie.png" style="width: 280px" /></td>
					<td colspan="3" rowspan="3">
						<font size=5 color="blue"><B>北京地铁信息查询</B></font>
                         <form action="LuxianServelt" onsubmit="return fun1()" method="post">
            			<table border="1" style="border-left-color: aqua; border-bottom-color: aqua; width: 701px; border-top-style: solid; border-top-color: aqua; border-right-style: solid; border-left-style: solid; height: 380px; border-right-color: aqua; border-bottom-style: solid">
                  		<tr>
                			<td>路线名称： </td>
                			<td>
                    			<label>
                        			<input type="test" name="nol1" value="线路名称，如1号线" >
                      
                    			</label>
                			</td>
                			
                			<td>
                    			<label>
                        		<select name="nol2">
								<option value="路线名称">路线名称
								<option value="1">1号线
								<option value="2">2号线
								</select>
                    			</label>
                			</td>
                 	  </tr>
                 
                
            <tr align="center">
                <td colspan="2">
                    <input type="submit" value="提交" />
                    <input type="reset" value="重置" />
                </td>
            </tr>
        </table>
    </form>
    
    			<table width="50%" cellspacing="10">
				  <tr align="center">
					<td>路线</td>
					<td>车站名</td>
					 </tr>
    
    			<c:forEach items="${list }"  var="u"  varStatus="status">
						<tr align="center">
							<td>${u.nol }</td>
							<td>${u.name }</td>
						</tr>
				</c:forEach>
				</table>
				</td>
				</tr>
				</table>
		</div>
		<div id="tabContent3" style="display: none">
			<ul>
				<li>努力学习专业知识，如Javaweb开发，Android开发等</li>
				<li>学习数据库原理，计算机网络知识等</li>
				<li>准备参加中国服务外包杯，以及以后的软件杯等</li>
			</ul>
		</div>
	</div>
	<hr />
</body>
</html>
</html>