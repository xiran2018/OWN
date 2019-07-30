<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html>
	<head>
		
	</head>
	<body>
		<div style="padding: 10px">
             <center>
	             <div > 
				      <A  id="languagelistdiv" class="listdiv" href="javascript:void(0)">
				      	<button class="sel_button"> 
				      	 语言管理
				      	</button>
				      </A>
				      
				      <UL id="goods" class="goods rightclass"  style="margin: 7px;">
				        <LI>
				        <A href="jqladmin/storemange/storemanage.jsp">
				        	<button class="second_button"> 
				        	添加语言
				        	</button>
				        </A>
				        </LI>
				        <LI>
				        <A href="javascript:void(0)">
				        	<button class="second_button"> 
				        	语言管理
				        	</button>
				        </A>
				        </LI>
				      </UL>      
			    </div>
			    
			    <div > 
                      <A  id="shiplistdiv" class="listdiv" href="javascript:void(0)">
                        <button class="sel_button"> 
                                                            货运管理
                        </button>
                      </A>
                      
                      <UL id="" class="goods rightclass"  style="margin: 7px;">
                        <LI>
                        <A href="jqladmin/storemange/shippingadd.jsp">
                            <button class="second_button"> 
                                                            添加货运
                            </button>
                        </A>
                        </LI>
                        <LI>
                        <A href="jqladmin/storemange/shippingmanage.jsp">
                            <button class="second_button"> 
                                                            货运管理
                            </button>
                        </A>
                        </LI>
                        <LI>
                        <A href="jqladmin/storemange/shippingCountryAdd.jsp">
                            <button class="second_button"> 
                                                            添加货运国家
                            </button>
                        </A>
                        </LI>
                        <LI>
                        <A href="jqladmin/storemange/shippingCountryManage.jsp">
                            <button class="second_button"> 
                                                            货运国家管理
                            </button>
                        </A>
                        </LI>
                         <LI>
                        <A href="jqladmin/storemange/shippingtemplate.jsp">
                            <button class="second_button"> 
                                                            添加运费模板
                            </button>
                        </A>
                        </LI>
                        <LI>
                        <A href="jqladmin/storemange/shippingtemplateMange.jsp">
                            <button class="second_button"> 
                                                              运费模板管理
                            </button>
                        </A>
                        </LI>
                      </UL>      
                </div>
                
                <div > 
                      <A  id="currencydiv" class="listdiv" href="javascript:void(0)">
                        <button class="sel_button"> 
                                                            货币管理
                        </button>
                      </A>
                      
                      <UL id="" class="goods rightclass"  style="margin: 7px;">
                        <LI>
                        <A href="cm/currency_showAll">
                            <button class="second_button"> 
                                                            货币列表
                            </button>
                        </A>
                        <A href="jqladmin/currency/insert.jsp">
                            <button class="second_button"> 
                                                            货币添加
                            </button>
                        </A>
                        </LI>
                      </UL>      
                </div>
                
                <div > 
                      <A  id="homeinfodiv" class="listdiv" href="javascript:void(0)">
                        <button class="sel_button"> 
                                                            首页信息管理
                        </button>
                      </A>
                      
                      <UL id="" class="goods rightclass"  style="margin: 7px;">
                        	<LI>
	                        <A href="jqladmin/storemange/sotreFooterManage.jsp">
	                            <button class="second_button"> 
	                                                            页脚信息
	                            </button>
	                        </A>
	                        </LI>
	                        <LI>
	                        <A href="jqladmin/storemange/sotrehomeinfo.jsp">
	                            <button class="second_button"> 
	                                                            首页信息
	                            </button>
	                        </A>
                        	</LI>
                        </UL>
                    </div>
           
                
                   <div> 
                 
                      <A  id="homeimagediv" class="listdiv" href="javascript:void(0)">
                        <button class="sel_button"> 
                                                            首页图片管理
                        </button>
                      </A>
                      
                      <UL id="" class="goods rightclass"  style="margin: 7px;">
                        <LI>
                        <A href="cm/foregroundimage_showAll">
                            <button class="second_button"> 
                                                            首页图片
                            </button>
                        </A>
                        <A href="jqladmin/foregroundimage/insert.jsp">
                            <button class="second_button"> 
                                                            图片添加
                            </button>
                        </A>
                      
                        </LI>
                      </UL>      
                </div>
                <div> 
                      <A  id="emailinfodiv" class="listdiv" href="javascript:void(0)">
                        <button class="sel_button"> 
                              	邮件信息管理
                        </button>
                      </A>
                      
                      <UL id="" class="goods rightclass"  style="margin: 7px;">
                        <LI>
                        <A href="emailManager.action">
                            <button class="second_button"> 
                                                                              发送邮件信息
                            </button>
                        </A>
                        </LI>
                      </UL>      
                </div>
            </center>
		</div>
	</body>
</html>