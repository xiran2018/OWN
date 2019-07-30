<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>

<meta charset="UTF-8">
<!-- for HTML5 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Django Channels Example</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='//fonts.googleapis.com/css?family=Raleway:400,300,600,200'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="webIm/css/WebImChat.css">
<script type="text/javascript" src="webIm/js/cookieOpertate.js"></script>
<!-- 
  <script type="text/javascript" src="webIm/js/jquery-1.12.1.min.js"></script>  -->
<script type="text/javascript"
	src="webIm/js/reconnecting-websocket.min.js"></script>
<script type="text/javascript" src="webIm/js/WebImChat.js"></script>
</head>
<body>
	<div id="webim2" class="imjs-open">
		<div class="dingdongadpop" id="webim-show-edv-div"
			style="display:none">
			<a class="close" style="cursor:pointer"> x</a>
			<p>
				基础性能提升！ <br> 细节体验优化！ <br> 新增字体编辑功能！ <br>
			</p>
			<a class="view-detail" href="http://dingdong.ganji.com/tuiguang/"
				target="_blank">查看详情</a>
		</div>
		<div class="webim-body">
			<div class="webim-body-msg-count">
				<span style="display: none;" class="webim-msg-count"
					data-allnewmsg="0">0</span>
			</div>
			<div class="webim-body-comtent-header" style="display: block;">
				<div class="webim-icon-setting-tips" style="display:none">
					<a href="javascript:;">自动收起</a> <a class="imjs-unfold"
						href="javascript:;">保持展开</a>
				</div>
				<span class="webim-header-minibar"> <em
					class="webim-icon-setting" title="设置">&nbsp;</em> <em
					class="webim-icon-mini" title="最小化">&nbsp;</em> <em
					class="webim-icon-close" title="关闭">&nbsp;</em>
				</span> <em class="imjs-userstatus webim-username-online">&nbsp;</em> <em
					class="imjs-username"><strong><s:text
							name="www.webIm.SystemInfo"></s:text></strong></em>
			</div>
			<div id="imjs-lianxiren" class="webim-lianxiren">
				<!-- webim-comming-msg-->
				<!--<span class="imjs-allnewmsg-count">0</span>-->
				<span class="imjs-lianxiren-tip" style="display: inline;">
					<s:text 	name="www.webIm.LinkMan"></s:text>[<span
					class="fc-green">1</span>/<em class="imjs-lianxiren-count">2</em>]
				</span> <span class="imjs-newmsgcount-tip" style="display: none;">您有<em
					class="imjs-newmsg-count">1</em>条新消息
				</span> <span class="imjs-talk-tip" style="display:none"> <em
					class="imjs-username">于女士</em>-对话中
				</span>
			</div>
			<div class="webim-user-list" style="display: block;">
				<div>
					<div id="imjs-myfriends" class="webim-myfriends c-li">
						<s:text name="www.webIm.webIMMyFriends"></s:text>
					</div>
				</div>
				<div class="webim-username mCustomScrollbar _mCS_1"
					id="imjs-user-list" style="">
					<div id="imjs-main-contact-list">
						<div id="imjs-main-0-0_0_0_0" style="cursor:pointer"
							class="webim-system-info c-li c-li-open"
							data-username='<s:text name="www.webIm.SystemInfo"></s:text>'
							data-userstatus="1" data-postid="0_0_0_0" data-posttitle="">
							<s:text name="www.webIm.SystemInfo"></s:text>
							<em style="display: none;" class="webim-msg-count">0</em>
						</div>
						<div id="imjs-0" class="c-li" style="cursor: pointer;"
							data-username='<s:text name="www.webIm.adminUser"></s:text>'
							data-userstatus="0" data-postid="0"
							data-posttitle="管庄常营精装主卧,交通便利,可短租"
							data-posturl="http://bj.ganji.com/fang3/2484543170x.htm">
							<em title="删除" class="webim-close">&nbsp;</em> <a
								style="display:none" title="删除" class="webim-close-enter"> <s:text
									name="www.webIm.closeEnter"></s:text>
							</a> <em class="webim-status webim-username-offline">&nbsp;</em> <em
								class="webim-username-n"><s:text name="www.webIm.adminUser"></s:text></em>
							<em style="display:none" class="webim-msg-count"></em>
						</div>
						<div id="imjs-main-default" class="c-li"
							style="cursor:pointer;display:none">
							<em title="删除" class="webim-close">&nbsp;</em> <a
								style="display:none" title="删除" class="webim-close-enter"> <s:text
									name="www.webIm.closeEnter"></s:text>
							</a> <em class="webim-status">&nbsp;</em> <em
								class="webim-username-n"></em> <em style="display:none"
								class="webim-msg-count"></em>
						</div>
					</div>
					<div class="mCSB_scrollTools"
						style="position: absolute; display: none;">
						<a class="mCSB_buttonUp" oncontextmenu="return false;"></a>
						<div class="mCSB_draggerContainer">
							<div class="mCSB_dragger" style="position: absolute; top: 0px;"
								oncontextmenu="return false;">
								<div class="mCSB_dragger_bar" style="position:relative;"></div>
							</div>
							<div class="mCSB_draggerRail"></div>
						</div>
						<a class="mCSB_buttonDown" oncontextmenu="return false;"></a>
					</div>
				</div>
				<div class="webim-system-msg"></div>
			</div>
			<!--左侧聊天窗口-->
			<div class="webim-body-content imjs-body-content"
				style="display: block;">
				<div class="webim-body-comtent-talk-tips">
					&nbsp;&nbsp;
					<s:text name="www.webIm.webIMSource"></s:text>
					： <a style="" class="imjs-link" target="_blank" title=" "> </a> <a></a>
				</div>
				<div id="imjs-body-content-talk"
					class="webim-body-content-talk mCustomScrollbar _mCS_2 webim-body-content-talk-h">
					<div class="mCustomScrollBox mCS-light" id="mCSB_2"
						style="position:relative; height:100%; overflow:hidden; max-width:100%;overflow: scroll;">
						<div class="mCSB_container mCS_no_scrollbar"
							style="position:relative; top:0;">
							<div class="imjs-msg-list">
								<div class="textalign-left imjs-msg-default">
									<div class="webim-body-comtent-msg-left imjs-msg-content">
										content<s>&nbsp;</s>
									</div>
									<span class="webim-times imjs-msg-time">time</span>
								</div>
								<div class="textalign-right imjs-msg-default">
									<div class="webim-body-comtent-msg-right imjs-msg-content">
										content<s>&nbsp;</s>
									</div>
									<span class="webim-times imjs-msg-time">time</span>
								</div>
								<div class="textalign-left" id="msg_96497935581">
									<div class="webim-body-comtent-msg-left imjs-msg-content">
										<div id="msgcontent2_96497935581">
											<span id="msgcontent_96497935581"></span>

											<s:text name="www.webIm.SystemInfo"></s:text>
										</div>
										<s>&nbsp;</s>
									</div>
									<span class="webim-times imjs-msg-time">15:20</span>
								</div>
							</div>
							<div id="imjs-msg-mao"></div>
						</div>
						<div class="mCSB_scrollTools"
							style="position: absolute; display: none;">
							<a class="mCSB_buttonUp" oncontextmenu="return false;"></a>
							<div class="mCSB_draggerContainer">
								<div class="mCSB_dragger" style="position: absolute; top: 0px;"
									oncontextmenu="return false;">
									<div class="mCSB_dragger_bar" style="position:relative;"></div>
								</div>
								<div class="mCSB_draggerRail"></div>
							</div>
							<a class="mCSB_buttonDown" oncontextmenu="return false;"></a>
						</div>
					</div>
				</div>
				<div class="imjs-left-bottom" style="display: block;">
					<div class="webim-body-content-tools">
						<a class="icon-history" style="display:none;"
							href="http://www.ganji.com/vip/my_message_list.php"
							target="_blank">聊天记录</a> <span class="icon-emotions" title="选择表情">&nbsp;</span>
						<span class="icon-quicktalk" title="快捷回复">&nbsp;</span>
						<!--<span class="icon-images" title="发送图片">&nbsp;</span>-->
						<!--表情开始 -->

						<!--表情结束 -->
						<div class="webim-quick-submit" style="display:none;">
							<a href="javascript:void(0)">您好，房子还在吗？</a> <a
								href="javascript:void(0)">我先看看，然后联系你</a> <a
								href="javascript:void(0)">您好，现在有点事情，等下认真回复您~</a> <a
								href="javascript:void(0)">您好，价格还能再优惠些吗？</a> <a
								href="javascript:void(0)">您好，图片是真实的吗？</a> <span
								class="webim-quick-submit-arrow">&nbsp;</span>
						</div>
						<div id="imjs-emotion" class="ePanel" style="display:none">
							<div class="ePdefault"
								style="left: 3px; right: auto;display: none;">
								<img
									src="http://sta.ganjistatic1.com/src/tool/webim/image/emotions/79.gif">
								<span>强</span>
							</div>
							<ul node-type="hotFace" class="eDefault">
								<div class="ePanelarea page1" style="display:block">
									<li><a emotionid="0" href="javascript:;">
											<div class="icon eDefault_0" emotionid="0"></div>
									</a></li>
									<li><a emotionid="1" href="javascript:;">
											<div class="icon eDefault_1" emotionid="1"></div>
									</a></li>
									<li><a emotionid="2" href="javascript:;">
											<div class="icon eDefault_2" emotionid="2"></div>
									</a></li>
									<li><a emotionid="3" href="javascript:;">
											<div class="icon eDefault_3" emotionid="3"></div>
									</a></li>
									<li><a emotionid="4" href="javascript:;">
											<div class="icon eDefault_4" emotionid="4"></div>
									</a></li>
									<li><a emotionid="5" href="javascript:;">
											<div class="icon eDefault_5" emotionid="5"></div>
									</a></li>
									<li><a emotionid="6" href="javascript:;">
											<div class="icon eDefault_6" emotionid="6"></div>
									</a></li>
									<li><a emotionid="7" href="javascript:;">
											<div class="icon eDefault_7" emotionid="7"></div>
									</a></li>
									<li><a emotionid="8" href="javascript:;">
											<div class="icon eDefault_8" emotionid="8"></div>
									</a></li>
									<li><a emotionid="9" href="javascript:;">
											<div class="icon eDefault_9" emotionid="9"></div>
									</a></li>
									<li><a emotionid="10" href="javascript:;">
											<div class="icon eDefault_10" emotionid="10"></div>
									</a></li>
									<li><a emotionid="11" href="javascript:;">
											<div class="icon eDefault_11" emotionid="11"></div>
									</a></li>
									<li><a emotionid="12" href="javascript:;">
											<div class="icon eDefault_12" emotionid="12"></div>
									</a></li>
									<li><a emotionid="13" href="javascript:;">
											<div class="icon eDefault_13" emotionid="13"></div>
									</a></li>
									<li><a emotionid="14" href="javascript:;">
											<div class="icon eDefault_14" emotionid="14"></div>
									</a></li>
									<li><a emotionid="15" href="javascript:;">
											<div class="icon eDefault_15" emotionid="15"></div>
									</a></li>
									<li><a emotionid="16" href="javascript:;">
											<div class="icon eDefault_16" emotionid="16"></div>
									</a></li>
									<li><a emotionid="17" href="javascript:;">
											<div class="icon eDefault_17" emotionid="17"></div>
									</a></li>
									<li><a emotionid="18" href="javascript:;">
											<div class="icon eDefault_18" emotionid="18"></div>
									</a></li>
									<li><a emotionid="19" href="javascript:;">
											<div class="icon eDefault_19" emotionid="19"></div>
									</a></li>
									<li><a emotionid="20" href="javascript:;">
											<div class="icon eDefault_20" emotionid="20"></div>
									</a></li>
									<li><a emotionid="21" href="javascript:;">
											<div class="icon eDefault_21" emotionid="21"></div>
									</a></li>
									<li><a emotionid="22" href="javascript:;">
											<div class="icon eDefault_22" emotionid="22"></div>
									</a></li>
									<li><a emotionid="23" href="javascript:;">
											<div class="icon eDefault_23" emotionid="23"></div>
									</a></li>
									<li><a emotionid="24" href="javascript:;">
											<div class="icon eDefault_24" emotionid="24"></div>
									</a></li>
									<li><a emotionid="25" href="javascript:;">
											<div class="icon eDefault_25" emotionid="25"></div>
									</a></li>
									<li><a emotionid="26" href="javascript:;">
											<div class="icon eDefault_26" emotionid="26"></div>
									</a></li>
									<li><a emotionid="27" href="javascript:;">
											<div class="icon eDefault_27" emotionid="27"></div>
									</a></li>
									<li><a emotionid="28" href="javascript:;">
											<div class="icon eDefault_28" emotionid="28"></div>
									</a></li>
									<li><a emotionid="29" href="javascript:;">
											<div class="icon eDefault_29" emotionid="29"></div>
									</a></li>
									<li><a emotionid="30" href="javascript:;">
											<div class="icon eDefault_30" emotionid="30"></div>
									</a></li>
									<li><a emotionid="31" href="javascript:;">
											<div class="icon eDefault_31" emotionid="31"></div>
									</a></li>
									<li><a emotionid="32" href="javascript:;">
											<div class="icon eDefault_32" emotionid="32"></div>
									</a></li>
									<li><a emotionid="33" href="javascript:;">
											<div class="icon eDefault_33" emotionid="33"></div>
									</a></li>
									<li><a emotionid="34" href="javascript:;">
											<div class="icon eDefault_34" emotionid="34"></div>
									</a></li>
									<li><a emotionid="35" href="javascript:;">
											<div class="icon eDefault_35" emotionid="35"></div>
									</a></li>
									<li><a emotionid="36" href="javascript:;">
											<div class="icon eDefault_36" emotionid="36"></div>
									</a></li>
									<li><a emotionid="37" href="javascript:;">
											<div class="icon eDefault_37" emotionid="37"></div>
									</a></li>
									<li><a emotionid="38" href="javascript:;">
											<div class="icon eDefault_38" emotionid="38"></div>
									</a></li>
									<li><a emotionid="39" href="javascript:;">
											<div class="icon eDefault_39" emotionid="39"></div>
									</a></li>
									<li><a emotionid="40" href="javascript:;">
											<div class="icon eDefault_40" emotionid="40"></div>
									</a></li>
									<li><a emotionid="41" href="javascript:;">
											<div class="icon eDefault_41" emotionid="41"></div>
									</a></li>
									<li><a emotionid="42" href="javascript:;">
											<div class="icon eDefault_42" emotionid="42"></div>
									</a></li>
									<li><a emotionid="43" href="javascript:;">
											<div class="icon eDefault_43" emotionid="43"></div>
									</a></li>
									<li><a emotionid="44" href="javascript:;">
											<div class="icon eDefault_44" emotionid="44"></div>
									</a></li>
									<li><a emotionid="45" href="javascript:;">
											<div class="icon eDefault_45" emotionid="45"></div>
									</a></li>
									<li><a emotionid="46" href="javascript:;">
											<div class="icon eDefault_46" emotionid="46"></div>
									</a></li>
									<li><a emotionid="47" href="javascript:;">
											<div class="icon eDefault_47" emotionid="47"></div>
									</a></li>
									<li><a emotionid="48" href="javascript:;">
											<div class="icon eDefault_48" emotionid="48"></div>
									</a></li>
									<li><a emotionid="49" href="javascript:;">
											<div class="icon eDefault_49" emotionid="49"></div>
									</a></li>
									<li><a emotionid="50" href="javascript:;">
											<div class="icon eDefault_50" emotionid="50"></div>
									</a></li>
									<li><a emotionid="51" href="javascript:;">
											<div class="icon eDefault_51" emotionid="51"></div>
									</a></li>
									<li><a emotionid="52" href="javascript:;">
											<div class="icon eDefault_52" emotionid="52"></div>
									</a></li>
									<li><a emotionid="53" href="javascript:;">
											<div class="icon eDefault_53" emotionid="53"></div>
									</a></li>
									<li><a emotionid="54" href="javascript:;">
											<div class="icon eDefault_54" emotionid="54"></div>
									</a></li>
									<li><a emotionid="55" href="javascript:;">
											<div class="icon eDefault_55" emotionid="55"></div>
									</a></li>
									<li><a emotionid="56" href="javascript:;">
											<div class="icon eDefault_56" emotionid="56"></div>
									</a></li>
									<li><a emotionid="57" href="javascript:;">
											<div class="icon eDefault_57" emotionid="57"></div>
									</a></li>
									<li><a emotionid="58" href="javascript:;">
											<div class="icon eDefault_58" emotionid="58"></div>
									</a></li>
									<li><a emotionid="59" href="javascript:;">
											<div class="icon eDefault_59" emotionid="59"></div>
									</a></li>
									<li><a emotionid="60" href="javascript:;">
											<div class="icon eDefault_60" emotionid="60"></div>
									</a></li>
									<li><a emotionid="61" href="javascript:;">
											<div class="icon eDefault_61" emotionid="61"></div>
									</a></li>
									<li><a emotionid="62" href="javascript:;">
											<div class="icon eDefault_62" emotionid="62"></div>
									</a></li>
									<li><a emotionid="63" href="javascript:;">
											<div class="icon eDefault_63" emotionid="63"></div>
									</a></li>
									<li><a emotionid="64" href="javascript:;">
											<div class="icon eDefault_64" emotionid="64"></div>
									</a></li>
									<li><a emotionid="65" href="javascript:;">
											<div class="icon eDefault_65" emotionid="65"></div>
									</a></li>
									<li><a emotionid="66" href="javascript:;">
											<div class="icon eDefault_66" emotionid="66"></div>
									</a></li>
									<li><a emotionid="67" href="javascript:;">
											<div class="icon eDefault_67" emotionid="67"></div>
									</a></li>
									<li><a emotionid="68" href="javascript:;">
											<div class="icon eDefault_68" emotionid="68"></div>
									</a></li>
									<li><a emotionid="69" href="javascript:;">
											<div class="icon eDefault_69" emotionid="69"></div>
									</a></li>
									<li><a emotionid="70" href="javascript:;">
											<div class="icon eDefault_70" emotionid="70"></div>
									</a></li>
									<li><a emotionid="71" href="javascript:;">
											<div class="icon eDefault_71" emotionid="71"></div>
									</a></li>
								</div>
								<div class="ePanelarea page2">
									<li><a emotionid="72" href="javascript:;">
											<div class="icon eDefault_72" emotionid="72"></div>
									</a></li>
									<li><a emotionid="73" href="javascript:;">
											<div class="icon eDefault_73" emotionid="73"></div>
									</a></li>
									<li><a emotionid="74" href="javascript:;">
											<div class="icon eDefault_74" emotionid="74"></div>
									</a></li>
									<li><a emotionid="75" href="javascript:;">
											<div class="icon eDefault_75" emotionid="75"></div>
									</a></li>
									<li><a emotionid="76" href="javascript:;">
											<div class="icon eDefault_76" emotionid="76"></div>
									</a></li>
									<li><a emotionid="77" href="javascript:;">
											<div class="icon eDefault_77" emotionid="77"></div>
									</a></li>
									<li><a emotionid="78" href="javascript:;">
											<div class="icon eDefault_78" emotionid="78"></div>
									</a></li>
									<li><a emotionid="79" href="javascript:;">
											<div class="icon eDefault_79" emotionid="79"></div>
									</a></li>
									<li><a emotionid="80" href="javascript:;">
											<div class="icon eDefault_80" emotionid="80"></div>
									</a></li>
									<li><a emotionid="81" href="javascript:;">
											<div class="icon eDefault_81" emotionid="81"></div>
									</a></li>
									<li><a emotionid="82" href="javascript:;">
											<div class="icon eDefault_82" emotionid="82"></div>
									</a></li>
									<li><a emotionid="83" href="javascript:;">
											<div class="icon eDefault_83" emotionid="83"></div>
									</a></li>
									<li><a emotionid="84" href="javascript:;">
											<div class="icon eDefault_84" emotionid="84"></div>
									</a></li>
									<li><a emotionid="85" href="javascript:;">
											<div class="icon eDefault_85" emotionid="85"></div>
									</a></li>
									<li><a emotionid="86" href="javascript:;">
											<div class="icon eDefault_86" emotionid="86"></div>
									</a></li>
									<li><a emotionid="87" href="javascript:;">
											<div class="icon eDefault_87" emotionid="87"></div>
									</a></li>
									<li><a emotionid="88" href="javascript:;">
											<div class="icon eDefault_88" emotionid="88"></div>
									</a></li>
									<li><a emotionid="89" href="javascript:;">
											<div class="icon eDefault_89" emotionid="89"></div>
									</a></li>
									<li>
										<!--<a emotionid="90"><div class="icon eDefault_90" emotionid="90"></div></a>-->
									</li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</div>
							</ul>
							<div class="ePanelt">
								<ul class="detail-more-link-tabs">
									<li class="link-tabs"><span class="fr"> <a
											class="prevEmotions left-arrow-no" title="上一页"
											href="javascript:void(0);">&nbsp;</a> <a
											class="nextEmotions right-arrow" title="下一页"
											href="javascript:void(0);">&nbsp;</a>
									</span> <span style="display:none;"><a class="normal">默认表情</a></span>
									</li>
								</ul>
							</div>
							<div class="eArr"></div>
						</div>
					</div>
					<div class="webim-body-content-textarea">
						<textarea id="imjs-textarea" rows="" cols="" name=""
							class="webim-textarea"
							placeholder='<s:text name="www.webIm.textareaTips"></s:text>...'></textarea>
					</div>
				</div>
				<!-- left-bottom end-->
				<div class="webim-body-comtent-footer">
					<a class="webim-body-comtent-submit" style="display: block;"><s:text
							name="www.webIm.comtentSubmit"></s:text></a> <a target="_blank"
						href="http://dingdong.ganji.com/computer.html"> <s:text
							name="www.webIm.webImUseTips"></s:text> &gt;&gt;
					</a>
					<div id="imjs-empty-tip" class="webim-body-footer-tips"
						style="display:none">
						<s>&nbsp;</s>
						<s:text name="www.webIm.emptyTips"></s:text>
					</div>
					<div id="imjs-selectuser-tip" class="webim-body-footer-tips"
						style="display:none">
						<s>&nbsp;</s>
						<s:text name="www.webIm.selectuserTips"></s:text>
					</div>
				</div>
				<!--客户端下载提示-->
				<div id="imjs-download-guide-page" class="webim-body-client-co3"
					style="display:none">
					<a id="imjs-close-download-guide"
						class="webim-body-client-co-close"></a>
					<p class="webim-body-client-co3-p2">
						请使用快捷键 <span class="webim-body-client-co3-cj">Ctrl+J</span> 打开下载界面
					</p>
					<p class="webim-body-client-co3-p3">
						<span class="webim-body-client-co3-p3-s1">dingdong_3.4.5_web.exe</span>
						<span class="webim-body-client-co3-p3-s2"> <span>在文件夹中显示</span>
							&nbsp;&nbsp;&nbsp;&nbsp; <span>从列表中移除</span>
						</span> <b>选择<span class="webim-body-client-co-i">赶集叮咚</span>进行安装喔！
						</b>
					</p>
					<p class="webim-body-client-co3-p4">
						<a id="imjs-use-webim">客户端正在安装，先用网页版聊聊！</a>
					</p>
				</div>
				<!--客户端下载提示 end-->
				<!--客户端安装引导-->
				<div id="imjs-client-guide-page" class="webim-body-client-co2"
					style="display:none">
					<a id="imjs-close-client-guide" class="webim-body-client-co-close"></a>
					使用 <span class="webim-body-client-co2-i">叮咚客户端</span> 沟通，聊天记录可保存， <br>
					随时查阅，响应更及时，沟通更顺畅！ <br> <br>
					<p>
						<b>是否使用？</b>
					</p>
					<p class="webim-body-client-co2-btn">
						<a id="imjs-download-accept" href="javascript:void(0)"
							class="webim-body-client-co2-btn-y">立即体验</a> <a
							id="imjs-download-deny" href="javascript:void(0)"
							class="webim-body-client-co2-btn-n">继续使用网页版</a>
					</p>
				</div>
				<!--客户端安装引导 end-->
			</div>
			<!--左侧聊天窗口 end -->
			<!--默认引导页面-->
			<div id="imjs-default-guide-page"
				class="imjs-guide-page webim-body-content" style="display: none;">
				<div class="webim-body-client">
					<div class="webim-body-client-co1">
						嗨，这是 <span style="font-size:14px;color:#7aaf23">叮咚网页版</span> <br>
						您点击页面中“ <span class="client-im">&nbsp;</span> ”按钮， <br>
						即可发起对话，及时与发布者沟通。 <br> 对方不在线也可以留言哦。 <br> 赶紧试一试吧， <span
							style="color:#7aaf23">在线聊更靠谱！</span>
					</div>
				</div>
				<div class="webim-body-comtent-footer">
					<a target="_blank" href="http://dingdong.ganji.com/computer.html">
						<s:text name="www.webIm.webImUseTips"></s:text>&gt;&gt;
					</a>
				</div>
			</div>
			<!--默认引导页面-->
		</div>
		<div id="imjs-temp-tag" style="display:none">查看</div>
	</div>

</body>
</html>