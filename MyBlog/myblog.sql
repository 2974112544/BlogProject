/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.16 : Database - myblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myblog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `myblog`;

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `article_id` bigint(30) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `releaseDate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `article_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `article_view` mediumtext,
  `article_text` longtext,
  `belong` varchar(255) DEFAULT NULL,
  `label` varchar(20) DEFAULT NULL,
  `commentNum` int(10) DEFAULT '0',
  `views` int(10) DEFAULT '0',
  `degree` bigint(15) NOT NULL DEFAULT '0',
  `ifComment` int(1) DEFAULT '1' COMMENT '1默认可以评论,0不行',
  `status` int(1) DEFAULT '0' COMMENT '0默认待审核，1驳回，2通过，3被举报',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `blog` */

insert  into `blog`(`article_id`,`author_id`,`author`,`avatar`,`releaseDate`,`article_title`,`article_view`,`article_text`,`belong`,`label`,`commentNum`,`views`,`degree`,`ifComment`,`status`) values 
(1,1,'test1','/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201106 00:20:32','js前端实现模糊查询','对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。//字符串方法indexOfvar len = list.length;var arr = [];for(var i=0;i=0){        arr.push(list[i]);    }}return arr;//正则表达式var len = list.length;var arr = [];var reg = new RegExp(keyWord);for(var i=0;i<len;i++){    //如果字符串中不包含目标字符会返回-1    if(list[i].match(reg)){        arr.push(list[i]);    }}return arr;','<p>对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。</p><p><br></p><p>//字符串方法indexOf</p><p>var len = list.length;</p><p>var arr = [];</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].indexOf(keyWord)&gt;=0){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p><p>//正则表达式</p><p>var len = list.length;</p><p>var arr = [];</p><p>var reg = new RegExp(keyWord);</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].match(reg)){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p>','JavaScript','JavaScript',0,127,0,1,1),
(2,3,'test3','/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201106 00:20:32','js前端实现模糊查询','对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。//字符串方法indexOfvar len = list.length;var arr = [];for(var i=0;i=0){        arr.push(list[i]);    }}return arr;//正则表达式var len = list.length;var arr = [];var reg = new RegExp(keyWord);for(var i=0;i<len;i++){    //如果字符串中不包含目标字符会返回-1    if(list[i].match(reg)){        arr.push(list[i]);    }}return arr;','<p>对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。</p><p><br></p><p>//字符串方法indexOf</p><p>var len = list.length;</p><p>var arr = [];</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].indexOf(keyWord)&gt;=0){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p><p>//正则表达式</p><p>var len = list.length;</p><p>var arr = [];</p><p>var reg = new RegExp(keyWord);</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].match(reg)){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p>','JavaScript','JavaScript',0,132,0,1,0),
(3,2,'test2','/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201106 00:20:32','js前端实现模糊查询','对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。//字符串方法indexOfvar len = list.length;var arr = [];for(var i=0;i=0){        arr.push(list[i]);    }}return arr;//正则表达式var len = list.length;var arr = [];var reg = new RegExp(keyWord);for(var i=0;i<len;i++){    //如果字符串中不包含目标字符会返回-1    if(list[i].match(reg)){        arr.push(list[i]);    }}return arr;','<p>对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。</p><p><br></p><p>//字符串方法indexOf</p><p>var len = list.length;</p><p>var arr = [];</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].indexOf(keyWord)&gt;=0){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p><p>//正则表达式</p><p>var len = list.length;</p><p>var arr = [];</p><p>var reg = new RegExp(keyWord);</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].match(reg)){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p>','JavaScript','JavaScript',0,81,0,1,1),
(4,1,'test','/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201106 00:20:32','js前端实现模糊查询（改）','对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。//字符串方法indexOfvar len = list.length;var arr = [];for(var i=0;i=0){        arr.push(list[i]);    }}return arr;//正则表达式var len = list.length;var arr = [];var reg = new RegExp(keyWord);for(var i=0;i<len;i++){    //如果字符串中不包含目标字符会返回-1    if(list[i].match(reg)){        arr.push(list[i]);    }}return arr;','<p>对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。</p><p><br></p><p>//字符串方法indexOf</p><p>var len = list.length;</p><p>var arr = [];</p><p>for(var i=0;i<len;i++){< p=\"\"></len;i++){<></p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].indexOf(keyWord)&gt;=0){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p><p>//正则表达式</p><p>var len = list.length;</p><p>var arr = [];</p><p>var reg = new RegExp(keyWord);</p><p>for(var i=0;i<len;i++){< p=\"\"></len;i++){<></p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].match(reg)){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p>','java','Java',6,111,1,1,0),
(5,2,'test','/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201106 00:20:32','js前端实现模糊查询','对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。//字符串方法indexOfvar len = list.length;var arr = [];for(var i=0;i=0){        arr.push(list[i]);    }}return arr;//正则表达式var len = list.length;var arr = [];var reg = new RegExp(keyWord);for(var i=0;i<len;i++){    //如果字符串中不包含目标字符会返回-1    if(list[i].match(reg)){        arr.push(list[i]);    }}return arr;','<p>对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。</p><p><br></p><p>//字符串方法indexOf</p><p>var len = list.length;</p><p>var arr = [];</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].indexOf(keyWord)&gt;=0){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p><p>//正则表达式</p><p>var len = list.length;</p><p>var arr = [];</p><p>var reg = new RegExp(keyWord);</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].match(reg)){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p>','JavaScript','JavaScript',0,79,0,1,0),
(6,3,'test','/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201106 00:20:32','js前端实现模糊查询','对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。//字符串方法indexOfvar len = list.length;var arr = [];for(var i=0;i=0){        arr.push(list[i]);    }}return arr;//正则表达式var len = list.length;var arr = [];var reg = new RegExp(keyWord);for(var i=0;i<len;i++){    //如果字符串中不包含目标字符会返回-1    if(list[i].match(reg)){        arr.push(list[i]);    }}return arr;','<p>对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。</p><p><br></p><p>//字符串方法indexOf</p><p>var len = list.length;</p><p>var arr = [];</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].indexOf(keyWord)&gt;=0){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p><p>//正则表达式</p><p>var len = list.length;</p><p>var arr = [];</p><p>var reg = new RegExp(keyWord);</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].match(reg)){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p>','java','Java',2,29,1,1,0),
(8,1,'test1','/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201112 17:15:32','LayUI富文本编辑器的使用--数据加载与编辑器创建的先后顺序','Layui 首个版本发布于2016年秋，官网说明兼容人类正在使用的全部浏览器（IE6/7除外），可作为后台系统与前台界面的速成开发方案。 刚接触该框架是公司想做一套通用的业务系统出来，我们希望包含用户、部门、角色管理和日志等基础功能，然后同时又能方便地扩展。  跟那些过往的编辑器一样，需要放置一个标签（一般为textarea文本域）作为编辑器的目标元素，然后调用 layedit.build(\'id\') 即可，如下所示：layui.use(\'layedit\', function(){ var layedit = layui.layedit; layedit.build(\'demo\'); //建立编辑器});对添加的内容执行修改操作时需要从数据库中取出文本内容再回显至编辑器中，可是layedit中获取数据必须早于构建编辑器，否则无法在编辑器中显示出来。代码如下：var pages;var groups;var totalRows; var layer;var jQuery;var form;var laypage;var text;var layedit;var index;/**获取数据放在layui.use之前**/$(document).ready(function(){	var $content = $(\"#emergencyPlan\");	var url = location.search;	var paramStr = url.substr(url.indexOf(\"?\")+1);	if(paramStr.indexOf(\"emergencyId\")>0){		var param = paramStr.substr(paramStr.indexOf(\"emergencyId\"));		var emergencyId = param.substr(param.indexOf(\"=\")+1);		$.post(			\"${ctx}/emergency/getEmergencyById.ht\",			{id:emergencyId},			function(result){				//alert(JSON.stringify(result));				if(result.status == \"0\"){					var vo = result.vo;					returnValue = vo.emergencyPlan;					$(\"#emergencyId\").val(vo.id);					$(\"#emergencyPlanTitle\").val(vo.emergencyPlanTitle);					$(\"#emergencyLevel\").val(vo.emergencyLevel);					$content.val(vo.emergencyPlan);					//$(\"#TrueEmergencyPlan\").val(vo.emergencyPlan); 					$(\"#remark\").val(vo.remark);				}else{					layer.msg(result.msg);				}			},			\"json\"		);	}		/*layui.use start */	layui.use([\'jquery\',\'form\',\'laypage\',\'layer\',\'laydate\',\'layedit\'],function(){		form = layui.form();		laypage = layui.laypage;		layer = layui.layer;		laydate =layui.laydate;			jQuery = layui.jquery;		layedit = layui.layedit;				//建立预案编辑器		//index = layedit.build(\"emergencyPlan\"); 		/* layedit.build(\'emergencyPlan\', {		    tool: [\'face\', \'link\', \'unlink\', \'|\', \'left\', \'center\', \'right\']		    ,height: 300		}); */				index = layedit.build(\'emergencyPlan\', {		    tool: [		    	 \'strong\'		    	  ,\'italic\'		    	  ,\'underline\' 		    	  ,\'del\' 		    	  		    	  ,\'|\' 		    	  		    	  ,\'left\' 		    	  ,\'center\' 		    	  ,\'right\' 		    	  ,\'link\' 		    	  ,\'unlink\'		    	]		    ,height: 200		});			//Form尺寸自适应		$(window).resize(function() {			var toolBarHeight = $(\".toolBar\").outerHeight();		    $(\"#emergencyForm\")		    	.height( $(this).height() - toolBarHeight - 30 )		}).resize();		});	/*layui.use end */});','<p><span><font size=\"3\"><span><span><span>Layui 首个版本发布于2016年秋，官网说明<span>兼容人类正在使用的全部浏览器（IE6/7除外），可作为后台系统与前台界面的速成开发方案。 刚接触该框架是公司想做一套通用的业务系统出来，我们希望包含用户、部门、角色管理和日志等基础功能，然后同时又能方便地扩展。</span></span></span></span></font></span></p><p><span><font face=\"\'Helvetica Neue\', Helvetica, \'PingFang SC\', 微软雅黑, Tahoma, Arial, sans-serif\" size=\"3\" color=\"#000000\"><span><span><span>&nbsp;&nbsp;</span></span></span></font></span></p><p><span><span><span><span>跟那些过往的编辑器一样，需要放置一个标签（一般为textarea文本域）作为编辑器的目标元素，然后调用&nbsp;<em>layedit.build(\'id\')</em>&nbsp;即可，如下所示：</span></span></span></span></p><p><span><br></span></p><p><span>&lt;textarea id=\"demo\" style=\"display: none;\"&gt;&lt;/textarea&gt;</span></p><ol class=\"layui-code-ol\"><li><font face=\"\'Helvetica Neue\', Helvetica, \'PingFang SC\', 微软雅黑, Tahoma, Arial, sans-serif\" size=\"3\" color=\"#000000\"><span><span><span>&lt;script&gt;</span></span></span></font></li><li><font face=\"\'Helvetica Neue\', Helvetica, \'PingFang SC\', 微软雅黑, Tahoma, Arial, sans-serif\" size=\"3\" color=\"#000000\"><span><span><span>layui.use(\'layedit\', function(){</span></span></span></font></li><li><font face=\"\'Helvetica Neue\', Helvetica, \'PingFang SC\', 微软雅黑, Tahoma, Arial, sans-serif\" size=\"3\" color=\"#000000\"><span><span><span> var layedit = layui.layedit;</span></span></span></font></li><li><font face=\"\'Helvetica Neue\', Helvetica, \'PingFang SC\', 微软雅黑, Tahoma, Arial, sans-serif\" size=\"3\" color=\"#000000\"><span><span><span> layedit.build(\'demo\'); //建立编辑器</span></span></span></font></li><li><font face=\"\'Helvetica Neue\', Helvetica, \'PingFang SC\', 微软雅黑, Tahoma, Arial, sans-serif\" size=\"3\" color=\"#000000\"><span><span><span>});</span></span></span></font></li></ol><p><ol class=\"layui-code-ol\"><li><font face=\"\'Helvetica Neue\', Helvetica, \'PingFang SC\', 微软雅黑, Tahoma, Arial, sans-serif\" size=\"3\" color=\"#000000\"><span><span><span>&lt;/script&gt;</span></span></span></font></li></ol><p><p><img src=\"https://img-blog.csdn.net/20170912102527551?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvcXFfMzQyMDk1Mjg=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center\"></p><pre id=\"best-content-1284382452\" class=\"best-text mb-10\" name=\"code\"><span><span>对添加的内容执行修改操作时需要从数据库中取出文本内容再回显至编辑器中，可是layedit中获取数据必须早于构建编辑器，否则无法在编辑器中显示出来。代码如下：</span></span></pre><p><span>&lt;script type=\"text/javascript\"&gt;</span></p></p><p><span>var pages;</span></p></p><p><span>var groups;</span></p><p><span>var totalRows;</span></p><p><span>&nbsp;</span></p><p><span>var layer;</span></p><p><span>var jQuery;</span></p><p><span>var form;</span></p><p><span>var laypage;</span></p><p><span>var text;</span></p><p><span>var layedit;</span></p><p><span>var index;</span></p><p><span>/**获取数据放在layui.use之前**/</span></p><p><span>$(document).ready(function(){</span></p><p><span><span>	</span>var $content = $(\"#emergencyPlan\");</span></p><p><span><span>	</span>var url = location.search;</span></p><p><span><span>	</span>var paramStr = url.substr(url.indexOf(\"?\")+1);</span></p><p><span><span>	</span>if(paramStr.indexOf(\"emergencyId\")&gt;0){</span></p><p><span><span>		</span>var param = paramStr.substr(paramStr.indexOf(\"emergencyId\"));</span></p><p><span><span>		</span>var emergencyId = param.substr(param.indexOf(\"=\")+1);</span></p><p><span><span>		</span>$.post(</span></p><p><span><span>			</span>\"${ctx}/emergency/getEmergencyById.ht\",</span></p><p><span><span>			</span>{id:emergencyId},</span></p><p><span><span>			</span>function(result){</span></p><p><span><span>				</span>//alert(JSON.stringify(result));</span></p><p><span><span>				</span>if(result.status == \"0\"){</span></p><p><span><span>					</span>var vo = result.vo;</span></p><p><span><span>					</span>returnValue = vo.emergencyPlan;</span></p><p><span><span>					</span>$(\"#emergencyId\").val(vo.id);</span></p><p><span><span>					</span>$(\"#emergencyPlanTitle\").val(vo.emergencyPlanTitle);</span></p><p><span><span>					</span>$(\"#emergencyLevel\").val(vo.emergencyLevel);</span></p><p><span><span>					</span>$content.val(vo.emergencyPlan);</span></p><p><span><span>					</span>//$(\"#TrueEmergencyPlan\").val(vo.emergencyPlan);&nbsp;</span></p><p><span><span>					</span>$(\"#remark\").val(vo.remark);</span></p><p><span><span>				</span>}else{</span></p><p><span><span>					</span>layer.msg(result.msg);</span></p><p><span><span>				</span>}</span></p><p><span><span>			</span>},</span></p><p><span><span>			</span>\"json\"</span></p><p><span><span>		</span>);</span></p><p><span><span>	</span>}</span></p><p><span>	</span></p><p><span><span>	</span>/*layui.use start */</span></p><p><span><span>	</span>layui.use([\'jquery\',\'form\',\'laypage\',\'layer\',\'laydate\',\'layedit\'],function(){</span></p><p><span><span>		</span>form = layui.form();</span></p><p><span><span>		</span>laypage = layui.laypage;</span></p><p><span><span>		</span>layer = layui.layer;</span></p><p><span><span>		</span>laydate =layui.laydate;<span>	</span></span></p><p><span><span>		</span>jQuery = layui.jquery;</span></p><p><span><span>		</span>layedit = layui.layedit;</span></p><p><span>		</span></p><p><span><span>		</span>//建立预案编辑器</span></p><p><span><span>		</span>//index = layedit.build(\"emergencyPlan\");&nbsp;</span></p><p><span><span>		</span>/* layedit.build(\'emergencyPlan\', {</span></p><p><span><span>		</span>&nbsp; &nbsp; tool: [\'face\', \'link\', \'unlink\', \'|\', \'left\', \'center\', \'right\']</span></p><p><span><span>		</span>&nbsp; &nbsp; ,height: 300</span></p><p><span><span>		</span>}); */</span></p><p><span>		</span></p><p><span><span>		</span>index = layedit.build(\'emergencyPlan\', {</span></p><p><span><span>		</span>&nbsp; &nbsp; tool: [</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span> \'strong\'</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>&nbsp; ,\'italic\'</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>&nbsp; ,\'underline\'&nbsp;</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>&nbsp; ,\'del\'&nbsp;</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>&nbsp;&nbsp;</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>&nbsp; ,\'|\'&nbsp;</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>&nbsp;&nbsp;</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>&nbsp; ,\'left\'&nbsp;</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>&nbsp; ,\'center\'&nbsp;</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>&nbsp; ,\'right\'&nbsp;</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>&nbsp; ,\'link\'&nbsp;</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>&nbsp; ,\'unlink\'</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>]</span></p><p><span><span>		</span>&nbsp; &nbsp; ,height: 200</span></p><p><span><span>		</span>});<span>	</span></span></p><p><span><span>		</span>//Form尺寸自适应</span></p><p><span><span>		</span>$(window).resize(function() {</span></p><p><span><span>			</span>var toolBarHeight = $(\".toolBar\").outerHeight();</span></p><p><span><span>		</span>&nbsp; &nbsp; $(\"#emergencyForm\")</span></p><p><span><span>		</span>&nbsp; &nbsp; <span>	</span>.height( $(this).height() - toolBarHeight - 30 )</span></p><p><span><span>		</span>}).resize();<span>	</span></span></p><p><span><span>	</span>});</span></p><p><span><span>	</span>/*layui.use end */</span></p><p><span>});</span></p>','javaweb','layui',1,14,0,1,0),
(10,1,'test1','resource/user/static/uploads/2017/10/20171006225356181.jpg','20201112 17:43:31','js前端实现模糊查询','对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。//字符串方法indexOfvar len = list.length;var arr = [];for(var i=0;i=0){        arr.push(list[i]);    }}return arr;//正则表达式var len = list.length;var arr = [];var reg = new RegExp(keyWord);for(var i=0;i<len;i++){    //如果字符串中不包含目标字符会返回-1    if(list[i].match(reg)){        arr.push(list[i]);    }}return arr;','<p>对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。</p><p><br></p><p>//字符串方法indexOf</p><p>var len = list.length;</p><p>var arr = [];</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].indexOf(keyWord)&gt;=0){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p><p>//正则表达式</p><p>var len = list.length;</p><p>var arr = [];</p><p>var reg = new RegExp(keyWord);</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].match(reg)){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p>',NULL,NULL,0,5,0,1,0),
(11,1,'test1','resource/user/static/uploads/2017/10/20171006225356181.jpg','20201112 18:44:40','js前端实现模糊查询','对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。//字符串方法indexOfvar len = list.length;var arr = [];for(var i=0;i    //如果字符串中不包含目标字符会返回-1    if(list[i].indexOf(keyWord)>=0){        arr.push(list[i]);    }}return arr;//正则表达式var len = list.length;var arr = [];var reg = new RegExp(keyWord);for(var i=0;i    //如果字符串中不包含目标字符会返回-1    if(list[i].match(reg)){        arr.push(list[i]);    }}return arr;','<p>对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。</p><p><br></p><p>//字符串方法indexOf</p><p>var len = list.length;</p><p>var arr = [];</p><p>for(var i=0;i<len;i++){< p=\"\"></len;i++){<></p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].indexOf(keyWord)&gt;=0){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p><p>//正则表达式</p><p>var len = list.length;</p><p>var arr = [];</p><p>var reg = new RegExp(keyWord);</p><p>for(var i=0;i<len;i++){< p=\"\"></len;i++){<></p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].match(reg)){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p>',NULL,NULL,0,12,0,1,0),
(12,1,'test1','resource/user/static/uploads/2017/10/20171006225356181.jpg','20201112 18:48:02','js前端实现模糊查询','js前端实现模糊查询对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。//字符串方法indexOfvar len = list.length;var arr = [];for(var i=0;i=0){        arr.push(list[i]);    }}return arr;//正则表达式var len = list.length;var arr = [];var reg = new RegExp(keyWord);for(var i=0;i<len;i++){    //如果字符串中不包含目标字符会返回-1    if(list[i].match(reg)){        arr.push(list[i]);    }}return arr;','<p>js前端实现模糊查询</p><p>对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。</p><p><br></p><p>//字符串方法indexOf</p><p>var len = list.length;</p><p>var arr = [];</p><p>for(var i=0;i<len;i++){< p=\"\"></len;i++){<></p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].indexOf(keyWord)&gt;=0){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p><p>//正则表达式</p><p>var len = list.length;</p><p>var arr = [];</p><p>var reg = new RegExp(keyWord);</p><p>for(var i=0;i<len;i++){< p=\"\"></len;i++){<></p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].match(reg)){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p>',NULL,NULL,0,2,0,1,0),
(13,1,'test1','resource/user/static/uploads/2017/10/20171006225356181.jpg','20201112 18:51:52','js前端实现模糊查询','js前端实现模糊查询对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。//字符串方法indexOfvar len = list.length;var arr = [];for(var i=0;i=0){        arr.push(list[i]);    }}return arr;//正则表达式var len = list.length;var arr = [];var reg = new RegExp(keyWord);for(var i=0;i<len;i++){    //如果字符串中不包含目标字符会返回-1    if(list[i].match(reg)){        arr.push(list[i]);    }}return arr;','<p>js前端实现模糊查询</p><p>对于模糊查询，一般都是传关键字给后端，由后端来做。但是有时候一些轻量级的列表前端来做可以减少ajax请求，在一定程度上提高用户体验。废话不多说，直接上代码。</p><p><br></p><p>//字符串方法indexOf</p><p>var len = list.length;</p><p>var arr = [];</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].indexOf(keyWord)&gt;=0){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p><p><br></p><p>//正则表达式</p><p>var len = list.length;</p><p>var arr = [];</p><p>var reg = new RegExp(keyWord);</p><p>for(var i=0;i&lt;len;i++){</p><p>&nbsp; &nbsp; //如果字符串中不包含目标字符会返回-1</p><p>&nbsp; &nbsp; if(list[i].match(reg)){</p><p>&nbsp; &nbsp; &nbsp; &nbsp; arr.push(list[i]);</p><p>&nbsp; &nbsp; }</p><p>}</p><p>return arr;</p>',NULL,NULL,0,3,0,1,0);

/*Table structure for table `blogcomment` */

DROP TABLE IF EXISTS `blogcomment`;

CREATE TABLE `blogcomment` (
  `comment_id` bigint(50) NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(30) DEFAULT NULL,
  `author_id` bigint(30) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `releaseDate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `comment_text` mediumtext NOT NULL,
  `state` int(1) DEFAULT '1' COMMENT '0被举报',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `blogcomment` */

insert  into `blogcomment`(`comment_id`,`blog_id`,`author_id`,`author`,`avatar`,`releaseDate`,`comment_text`,`state`) values 
(2,4,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201111 16:45','测试',1),
(3,4,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201111 16:45','再度测试',1),
(4,6,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201111 17:19','测试',1),
(5,6,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201111 17:19','测试',1),
(6,6,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201111 17:19','再来一次',1),
(7,6,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201111 17:29','测试是不是可以回显',1),
(8,4,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201111 19:25','test',1),
(9,4,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201111 19:28','count',1),
(10,4,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201111 19:32','test',1),
(11,6,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','20201112 00:07','测试',1),
(12,4,1,'测试一','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/115012345678.jpg','20201113 01:59','1',1),
(13,8,4,'谢胜荣','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/415083594696.jpg','20201113 16:52','这是一个评论',1);

/*Table structure for table `community` */

DROP TABLE IF EXISTS `community`;

CREATE TABLE `community` (
  `community_id` bigint(30) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) NOT NULL,
  `author` varchar(20) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `releasedate` varchar(255) DEFAULT NULL,
  `article_title` varbinary(255) DEFAULT NULL,
  `article_text` longtext NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `commentNum` int(10) NOT NULL DEFAULT '0',
  `views` int(10) NOT NULL DEFAULT '0',
  `degree` bigint(15) DEFAULT '0',
  `state` int(1) DEFAULT '1',
  PRIMARY KEY (`community_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `community` */

insert  into `community`(`community_id`,`author_id`,`author`,`avatar`,`releasedate`,`article_title`,`article_text`,`label`,`commentNum`,`views`,`degree`,`state`) values 
(1,1,'1','1','1',NULL,'	1',NULL,0,0,0,0),
(2,2,'test','avatar','20201027','title','Blog Text',NULL,0,0,0,1);

/*Table structure for table `communitycomment` */

DROP TABLE IF EXISTS `communitycomment`;

CREATE TABLE `communitycomment` (
  `comment_id` bigint(50) NOT NULL AUTO_INCREMENT,
  `topic_id` bigint(30) NOT NULL,
  `authorId` bigint(30) DEFAULT NULL,
  `author` varchar(20) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `releaseDate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `comment_text` mediumtext NOT NULL,
  `state` int(1) DEFAULT '1' COMMENT '1正常，0被举报',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `communitycomment` */

/*Table structure for table `label` */

DROP TABLE IF EXISTS `label`;

CREATE TABLE `label` (
  `labelID` int(10) NOT NULL AUTO_INCREMENT,
  `labelName` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `useNum` int(10) DEFAULT '0',
  PRIMARY KEY (`labelName`),
  KEY `labelID` (`labelID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `label` */

insert  into `label`(`labelID`,`labelName`,`useNum`) values 
(1,'java',0),
(2,'mysql',0),
(3,'spring',0);

/*Table structure for table `recommend` */

DROP TABLE IF EXISTS `recommend`;

CREATE TABLE `recommend` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `wordName` varchar(30) NOT NULL,
  `views` bigint(20) NOT NULL DEFAULT '0',
  `label` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `recommend` */

/*Table structure for table `soncomment` */

DROP TABLE IF EXISTS `soncomment`;

CREATE TABLE `soncomment` (
  `commentID` bigint(25) NOT NULL AUTO_INCREMENT,
  `articleType` int(1) DEFAULT '0' COMMENT '0博客，1话题',
  `fatherID` bigint(25) DEFAULT NULL COMMENT '被回复评论id',
  `articleID` bigint(30) DEFAULT NULL COMMENT '所属分类id',
  `authorID` bigint(30) DEFAULT NULL COMMENT '评论者id',
  `author` varchar(30) DEFAULT NULL COMMENT '评论者',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `commentText` text COMMENT '评论内容',
  `releaseDate` varchar(30) DEFAULT NULL,
  `state` int(1) DEFAULT '1',
  PRIMARY KEY (`commentID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `soncomment` */

insert  into `soncomment`(`commentID`,`articleType`,`fatherID`,`articleID`,`authorID`,`author`,`avatar`,`commentText`,`releaseDate`,`state`) values 
(10,0,1,4,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','测试二级评论','20201111 16:41',0),
(11,0,1,4,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','测试多条评论','20201111 16:42',1),
(12,0,3,4,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','测试你个头','20201111 16:45',0),
(13,0,5,6,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','???','20201111 17:19',1),
(14,0,4,6,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','???','20201111 17:19',1),
(15,0,6,6,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','这可以吗','20201111 17:19',1),
(16,0,6,6,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','再来一次呢','20201111 17:19',1),
(17,0,4,6,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','这个呢？','20201111 17:29',1),
(18,0,1,4,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','就这？','20201111 19:34',1),
(19,0,4,6,1,'test1','http://localhost:8080/MyBlog_war_exploded/resource/static/avatar/7.jpg','？','20201112 00:07',1),
(20,0,1,4,1,'','/MyBlog_war_exploded/resource/static/avatar/115012345678.jpg','这里是用户个人回复','20201113 01:46',1),
(21,0,1,4,1,'','/MyBlog_war_exploded/resource/static/avatar/115012345678.jpg','测试回复评论','20201113 01:55',1),
(22,0,12,NULL,NULL,NULL,NULL,NULL,NULL,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(20) DEFAULT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  `sex` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '男',
  `age` int(3) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `commentIf` int(1) NOT NULL DEFAULT '0' COMMENT '是否可以评论，非0禁言',
  `topicIf` int(1) NOT NULL DEFAULT '0',
  `userLevel` int(1) NOT NULL DEFAULT '1',
  `admin` int(1) NOT NULL DEFAULT '0' COMMENT '0用户，1管理，2超管',
  `lastLoginTime` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '最后登录时间',
  `blogNum` int(11) DEFAULT '0' COMMENT '博客数量',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_name`,`user_password`,`sex`,`age`,`address`,`avatar`,`phone`,`email`,`commentIf`,`topicIf`,`userLevel`,`admin`,`lastLoginTime`,`blogNum`) values 
(1,'测试一','123456','男',20,NULL,'/MyBlog_war_exploded/resource/static/avatar/115012345678.jpg','15012345678','123456789@qq.com',0,0,1,0,'20201113',2),
(2,'test2','123456','男',18,NULL,'/MyBlog_war_exploded/resource/static/avatar/7.jpg','15012345679',NULL,0,0,1,0,NULL,3),
(3,'test3','123456','男',19,NULL,'/MyBlog_war_exploded/resource/static/avatar/7.jpg','18312345678',NULL,0,0,1,0,NULL,4),
(4,'谢胜荣','123456','男',18,NULL,'/MyBlog_war_exploded/resource/static/avatar/415083594696.jpg','15083594696','2974112544@qq.com',0,0,1,2,'20201113',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
