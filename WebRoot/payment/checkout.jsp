<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>


<!-- header以下布局 -->
<link href="common/css/secondstyle.css" rel="stylesheet" type="text/css" />

<!--商品分类侧边栏 -->
<link href="common/css/secondsider.css" rel="stylesheet" type="text/css" />

<!--支付布局 -->
<link href="payment/css/checkout.css" rel="stylesheet" type="text/css" />

<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css" /> 

<!--去小数点等-->
<script type="text/javascript" src="js/math.js"></script>

<script type="text/javascript">
	//about order info
	var orderInfo=<s:property value="orderShowJsonString"  escape="false" />;
	orderInfo = eval('(' + orderInfo + ')');
</script>


</head>

<body>
	<div style="display: none">
        <%@ include file="../common/language/multiLanguage.jsp" %>
	</div>
	<div id="header">
        <%@ include file="../common/header/headermenu.jsp" %>
		<%@ include file="../common/header/secondheader.jsp"%>

	</div>


	<!--！！！！！！！！！！！！！！！！！！！ 之下的代码是你需要真正使用的！！！！！！！！！！！！！！！！！！-->
	<div id="second-category-menu">

		<div id="lagout-three">
			<div class="container fn-clear">
  

				<div class="aside">
				  <div class="panel">
				    <div class="panel-heading fn-clear">
				      <h3 class="panel-title"><s:text name="www.order.orderTotal"></s:text></h3>
				      <a href="javascript:location.reload();" class="i-icon i-icon-refresh refresh-price" id="j-refresh-price" seed="panelHeading-jRefreshPrice" smartracker="on"></a>
				      <span class="fn-hide refresh-price-tip" data-widget-cid="widget-11">
				      	Refresh Price
				      </span>
				      <em class="order-total-amount"></em>
				    </div>
				
				    
				    <dl class="order-info">
				      <dt><s:text name="www.order.orderSummary"></s:text></dt>
				      <dd>
				            <span class="order-item-l"><span class="order-no-title">
				            	<s:text name="www.order.orderNO"></s:text>.</span> 
				            	<span class="order-no" data-tradeno=""></span>
				            </span>
				            <span class="order-item-l order-item-title" title=""></span>
				            <span class="order-item-r"></span>
				      </dd>
				              
				    </dl>
				
				  </div>
				
				  <div class="panel secure-payment">
				    <a class="i-icon i-icon-sign-verisign" href="http://www.999own.ru/common/footer/payment.jsp?id=68" target="_blank" seed="panel-iIcon" smartracker="on"></a>
				    <a class="i-icon i-icon-sign-pci" href="http://www.999own.ru/common/footer/payment.jsp?id=68"  target="_blank"  seed="panel-iIconT1" smartracker="on"></a>
				    <a class="i-icon i-icon-sign-visa" href="http://www.999own.ru/common/footer/payment.jsp?id=68"  target="_blank"  seed="panel-iIconT2" smartracker="on"></a>
				    <a class="i-icon i-icon-sign-mastercard" href="http://www.999own.ru/common/footer/payment.jsp?id=68"  target="_blank"  seed="panel-iIconT3" smartracker="on"></a>
				  </div>
				
				  <div class="panel buyer-protection">
				      <i class="i-icon i-icon-buyer-protection fn-left"></i>
				      
				      <h3><s:text name="www.checkout.buyerProtection"></s:text></h3>
				      <p>
					        <i class="i-icon i-icon-checklist fn-left"></i>
					        <strong><s:text name="www.confirmOrder.fullRefund"></s:text></strong> 
					        <s:text name="www.confirmOrder.notReceiveOrder"></s:text>
				      </p>
				      <p>
					        <i class="i-icon i-icon-checklist fn-left"></i>
					        <strong><s:text name="www.confirmOrder.refundORKeep"></s:text></strong> 
					        <s:text name="www.confirmOrder.itemNotAsDescribed"></s:text>
				      </p>
				   </div>
				</div>

				<div class="checkout-counter">
					<div class="panel">
					    
					    <div class="channel-container" id="j-channel-container">
					
									<div class="channel-group channel-active ">
									  <div class="payment-total">
										  <span class="o-money">
										  	<s:text name="www.order.paymentTotal"></s:text> 
										  	<em class="order-total-amount"></em>
										  </span>
										  <span class="g-money"></span>
									  </div>
									  <div class="channel-group-header fn-hide">
									          <h2 class="channel-group-title">
									          	<s:text name="www.order.paymentNotice"></s:text> 
									          </h2>
									
										      <div class="more-payments-preview">
										        <div class="i-bank i-bank-visa"><span></span></div>
										        <div class="i-bank i-bank-mastercard"><span></span></div>
										        <div class="i-bank i-bank-maestro"><span></span></div>
										        <div class="i-bank i-bank-boleto"><span></span></div>
										        <div class="i-bank i-bank-qiwi"><span></span></div>
										        <div class="i-bank i-bank-webmoney"><span></span></div>
										        <div class="i-bank i-bank-westernunion"><span></span></div>
										        and more...
										        <div class="i-mask"></div>
										      </div>
									   </div>
									
									  <div class="channel-group-body">
									  	<div class="checkoutSuccess">
									  		<s:text name="www.checkout.checkoutSuccess"></s:text> 
									  	</div>
									    <ul class="channel-tab" id="j-channel-tab">
									      <li data-channel-name="MIXEDCARD" class="fn-hide j-channel-item channel-active">
										        <div class="i-bank i-paypal">
										        	<span>
														<img src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" align="left" style="margin-right:7px;margin-top: 2px;">
										        	</span>
										        </div>
										      	<a href="javascript:void(0)" seed="channel-mixedcard">MIXEDCARD</a>
									      </li>
									      <li data-channel-name="BOLETO" class="fn-hide j-channel-item">
										        <div class="i-bank i-bank-boleto"><span></span></div>
										      	<a href="javascript:void(0)" seed="channel-boleto">BOLETO</a>
										        <i class="i-icon i-icon-brazil"></i>
									      </li>
									      <li data-channel-name="TEF" class="fn-hide j-channel-item">
										        <div class="i-bank i-bank-tef">
												    <div class="i-bank i-bank-itau"><span></span></div>
												    <div class="i-bank i-bank-bradesco"><span></span></div>
												    <div class="i-bank i-bank-brasil"><span></span></div>
												    <div class="i-bank i-bank-banrisul"><span></span></div>
												    <div class="i-bank i-bank-hsbc-small"><span></span></div>
										  		 </div>
										      	 <a href="javascript:void(0)" seed="channel-tef">TEF</a>
										         <i class="i-icon i-icon-brazil"></i>
									       </li>
										   <li class="more-payments-trigger fn-hide">
											    <a href="javascript:void(0)" seed="more-payments" id="j-other-list">
											      <strong>More Payment Methods ...</strong>
											    </a>
										  </li>
									</ul>
									
									    
									                      
									<form class="channel-panel  fn-hide" id="j-channel-mixedcard" data-enable-to-pay="true" data-button-text="Pay Now" novalidate="novalidate" data-widget-cid="widget-2">
									  <div class="i-form">
									    <div class="i-notice i-notice-gray i-notice-discount fn-hide">
										  <i class="i-notice-icon i-iconfont i-iconfont-discount"></i>
										  <p></p>
										</div>
									    
									
										<div class="i-currency-notice fn-hide">
										  <i class="i-iconfont i-iconfont-switch-currency i-currency-icon"></i>
										  <div class="i-currency-notice-content">
										          <p>Your order will be processed in <span class="j-display-currency"></span> (<span class="j-display-amount"></span>).</p>
										      <p class="subinfo">VISA,MasterCard,Maestro can only support <span class="j-display-currency"></span>.</p>
										  </div>
										</div>
									
									    <div class="i-row">
									                                                                              
									      <div class="i-col">
									        <label class="i-label">Card type</label>
									        <ul class="mixedcard-types" id="j-card-types" data-default="$paymentViewModel.defaultCardBrand">
									                    <li>
									            <label class="i-selected">
									              <input type="radio" name="cardType" value="VISA" seed="cardType-VISA" data-errormessage="You must select a card type." data-widget-cid="widget-3">
									              <i class="i-bank i-bank-visa"><span></span></i>
									              <i class="i-iconfont i-iconfont-selected"></i>
									            </label>
									            <em>VISA</em>
									          </li>
									                    <li>
									            <label class="i-selected">
									              <input type="radio" name="cardType" value="MASTERCARD" seed="cardType-MasterCard" data-widget-cid="widget-3">
									              <i class="i-bank i-bank-mastercard"><span></span></i>
									              <i class="i-iconfont i-iconfont-selected"></i>
									            </label>
									            <em>MasterCard</em>
									          </li>
									                    <li>
									            <label class="i-selected">
									              <input type="radio" name="cardType" value="MAESTRO" seed="cardType-Maestro" data-widget-cid="widget-3">
									              <i class="i-bank i-bank-maestro"><span></span></i>
									              <i class="i-iconfont i-iconfont-selected"></i>
									            </label>
									            <em>Maestro</em>
									          </li>
									                  </ul>
									      </div>
									
									      <div class="i-col">
									        <label class="i-label">Card number</label>
									        <input type="text" name="cardNo" class="i-input i-input-large credit-input" id="j-card-number" maxlength="30" data-errormessage="The card number you have entered is invalid." data-errormessage-required="Please enter your card number." data-widget-cid="widget-4" seed="iCol-jCardNumber" smartracker="on">
									      </div>
									    </div>
									
									    <div class="i-row">
									      <div class="i-col">
									        <label class="i-label">Expiration date</label>
									
									                                                                                                <input type="text" name="expiryMonth" class="i-input i-input-expirydate" maxlength="2" placeholder="MM" data-errormessage="Month should be 01~12, and be 2 digits." data-errormessage-required="Expiration date can not be empty." data-errormessage-valid-date="Expiration date is invalid." data-widget-cid="widget-5" seed="iCol-expiryMonth" smartracker="on">
									
									        <div class="i-date-separtor">/</div>
									
									                                                                                                                <input type="text" name="expiryYear" class="i-input i-input-expirydate" maxlength="2" placeholder="YY" data-errormessage="Year should be 2 digits." data-errormessage-required="Expiration date can not be empty." data-errormessage-min="Expiration date is invalid." data-errormessage-max="Expiration date is invalid." data-widget-cid="widget-6" seed="iCol-expiryYear" smartracker="on">
									      </div>
									
									      <div class="i-col">
									        <label class="i-label">Security code</label>
									        <input type="text" name="cvv2" class="i-input i-input-short" maxlength="3" data-errormessage="The security code you have entered is invalid." data-errormessage-required="Please enter the security code." data-widget-cid="widget-7" seed="iCol-cvv2" smartracker="on">
									        <a id="j-cvv2-trigger" href="javascript:void(0);" tabindex="-1" seed="iCol-jCvv2Trigger" smartracker="on">What is this?</a>
									        <div id="j-cvv2-tooltip" class="i-tooltip-cvv2 fn-hide" data-widget-cid="widget-1">
									          <i class="i-icon i-icon-cvv2 fn-left"></i>
									          For MasterCard or VISA, it’s the last three digits in the signature area on the back of your card.        </div>
									      </div>
									    </div>
									
									    <div class="i-row">
									      <label class="i-label">Cardholder name</label>
									      <div class="i-col">
									        <input type="text" name="firstName" class="i-input" maxlength="128" placeholder="First name" data-errormessage="Please enter your Cardholder name." data-widget-cid="widget-8" seed="iCol-firstName" smartracker="on">
									      </div>
									      <div class="i-col">
									        <input type="text" name="lastName" class="i-input" maxlength="128" placeholder="Last name" data-errormessage="Please enter your Cardholder name." data-widget-cid="widget-9" seed="iCol-lastName" smartracker="on">
									      </div>
									    </div>
									
									      </div>
									
									  <div class="note fn-hide">
									    <h3>Note</h3>
									    <ul>
									      <li>Your payment is secured with VeriSign SSL encryption, the highest commercially available encryption technology. Please be assured that your credit/debit card details will not be exposed.</li>
									      <li>Import duties, taxes and other customs related charges are not included. Buyers bear all responsibility for all extra charges incurred (if any).</li>
									    </ul>
									  </div>
									<input type="hidden" name="sidKey" value="c59f773b4a8ec054c731218d8aa865060d7031f0">
								</form>
									          
								<form class="channel-panel fn-hide" id="j-channel-boleto" data-enable-to-pay="true" data-button-text="Continue" novalidate="novalidate" data-widget-cid="widget-12">
									  <div class="i-form">
									    <div class="i-notice i-notice-gray i-notice-discount fn-hide">
									  <i class="i-notice-icon i-iconfont i-iconfont-discount"></i>
									  <p></p>
									</div>
									
									    
									
									<div class="i-currency-notice fn-hide">
									  <i class="i-iconfont i-iconfont-switch-currency i-currency-icon"></i>
									  <div class="i-currency-notice-content">
									          <p>Your order will be processed in <span class="j-display-currency"></span> (<span class="j-display-amount"></span>).</p>
									      <p class="subinfo">Boleto Bancario can only support <span class="j-display-currency"></span>.</p>
									      </div>
									</div>
									
									    <div class="i-row">
									      <label class="i-label">CPF</label>
									      <input type="text" name="cpf" class="i-input" maxlength="20" seed="boleto-cpf" data-errormessage-required="Insira o seu CPF. Somente números." data-errormessage="CPF inválido. Insira um número válido de CPF. Somente números." data-widget-cid="widget-13">
									      <i class="i-iconfont i-iconfont-lock"></i>
									      <p class="i-message">Insira o seu CPF para a criação do Boleto Bancário.</p>
									    </div>
									  </div>
									  <p class="payment-note">Você receberá um documento com as informações de transferência após clicar em Pague Agora.</p>
									  <div class="note fn-hide">
									    <h3>Note</h3>
									    <ul>
									      <li>O boleto bancário pode ser pago em agências bancárias, através de seu Internet Banking ou em casas lotéricas.</li>
									      <li>De acordo com a regulamentação do Banco Central do Brasil, o limite mensal de pagamentos por CPF é de US$ 3.000 (três mil dólares americanos).</li>
									      <li>Se o pagamento não for efetuado no prazo de 3 dias seus pedidos serão cancelados.</li>
									      <li>Em 7 dias úteis, após o pagamento, o status do seu pedido deverá mudar para "O pedido foi pago". Caso o status do pedido pago não seja o indicado, contate o atendimento ao consumidor do AliExpress.</li>
									    </ul>
									  </div>
									<input type="hidden" name="sidKey" value="c59f773b4a8ec054c731218d8aa865060d7031f0">
								</form>
									          
								<form class="channel-panel fn-hide" id="j-channel-tef" data-enable-to-pay="true" data-button-text="Pay Now" novalidate="novalidate" data-widget-cid="widget-14">
									  <div class="i-form">
									    <div class="i-notice i-notice-gray i-notice-discount fn-hide">
									  <i class="i-notice-icon i-iconfont i-iconfont-discount"></i>
									  <p></p>
									</div>
									    
									
									<div class="i-currency-notice fn-hide">
									  <i class="i-iconfont i-iconfont-switch-currency i-currency-icon"></i>
									  <div class="i-currency-notice-content">
									          <p>Your order will be processed in <span class="j-display-currency"></span> (<span class="j-display-amount"></span>).</p>
									      <p class="subinfo">Transferencia Bancaria can only support <span class="j-display-currency"></span>.</p>
									      </div>
									</div>
									
									    <div class="i-row">
									      <label class="i-label">Transferência Eletrônica</label>
									      <ul class="tef-payment-types">
									        <li>
									          <label class="i-selected">
									            <input type="radio" name="paymentType" value="itau" data-errormessage="Favor selecionar o seu banco." seed="iSelected-paymentType" smartracker="on" data-widget-cid="widget-15">
									            <div class="i-bank i-bank-itau"><span></span></div>
									            <em>Banco Itaú</em>
									            <i class="i-iconfont i-iconfont-selected"></i>
									          </label>
									        </li>
									        <li>
									          <label class="i-selected">
									            <input type="radio" name="paymentType" value="bradesco" seed="iSelected-paymentTypeT1" smartracker="on" data-widget-cid="widget-15">
									            <div class="i-bank i-bank-bradesco"><span></span></div>
									            <em>Banco Bradesco</em>
									            <i class="i-iconfont i-iconfont-selected"></i>
									          </label>
									        </li>
									        <li>
									          <label class="i-selected">
									            <input type="radio" name="paymentType" value="bancodobrasil" seed="iSelected-paymentTypeT2" smartracker="on" data-widget-cid="widget-15">
									            <div class="i-bank i-bank-brasil"><span></span></div>
									            <em>Banco do Brasil</em>
									            <i class="i-iconfont i-iconfont-selected"></i>
									          </label>
									        </li>
									        <li>
									          <label class="i-selected">
									            <input type="radio" name="paymentType" value="banrisul" seed="iSelected-paymentTypeT3" smartracker="on" data-widget-cid="widget-15">
									            <div class="i-bank i-bank-banrisul"><span></span></div>
									            <em>Banco Banrisul</em>
									            <i class="i-iconfont i-iconfont-selected"></i>
									          </label>
									        </li>
									        <li>
									          <label class="i-selected">
									            <input type="radio" name="paymentType" value="hsbc" seed="iSelected-paymentTypeT4" smartracker="on" data-widget-cid="widget-15">
									            <div class="i-bank i-bank-hsbc-small"><span></span></div>
									            <em>Banco HSBC</em>
									            <i class="i-iconfont i-iconfont-selected"></i>
									          </label>
									        </li>
									      </ul>
									    </div>
									    <div class="i-row">
									      <label class="i-label">CPF</label>
									      <input type="text" name="cpf" class="i-input" maxlength="20" seed="tef-cpf" data-errormessage-required="Favor adicionar o seu CPF." data-errormessage="CPF invalido, favor incluir um número valido de CPF." data-widget-cid="widget-16">
									      <i class="i-iconfont i-iconfont-lock"></i>
									    </div>
									  </div>
									  <p class="payment-note">Você será redirecionado à página do seu banco para finalizar o pagamento.</p>
									  <div class="note fn-hide">
									    <h3>Note</h3>
									    <ul>
									      <li>Após escolher o banco para pagamento, você será redirecionado para a página (Internet Banking) do seu banco para efetivação do pagamento;</li>
									      <li>Após o pagamento ser concluído, você será redirecionado novamente para o AliExpress;</li>
									      <li>Por favor, não feche a janela imediatamente;</li>
									      <li>Há um limite de pagamentos no valor de US$ 3.000 (três mil dólares dos Estados Unidos) por CPF por mês, de acordo com a regulamentação do Banco Central do Brasil.</li>
									      <li>A taxa de IOF pode ser cobrada pelo governo brasileiro.</li>
									    </ul>
									  </div>
									<input type="hidden" name="sidKey" value="c59f773b4a8ec054c731218d8aa865060d7031f0">
								</form>
				            </div>
						</div>
				    </div>
					
				    <div class="pay my order fn-hide">
				      <p class="i-message i-message-warn sys-error fn-hide"></p>
				      <button type="submit" id="j-paynow" class="i-button" seed="pay-jPaynow" smartracker="on">
				      		<s:text name="www.order.pay"></s:text>
				      </button>
				    </div>
					
					  <div id="j-note" class="note" style=" display: none; ">
					    <h3><s:text name="www.order.note"></s:text></h3>
					    <ul>
					      <li>
					      	<s:text name="www.order.noteText"></s:text>
					       </li>
					    </ul>
					  </div>
					
					    
					</div>
				    <p>
				    	<a href="#" id="j-cancel-payment" seed="checkoutCounter-jCancelPayment" smartracker="on">
				    		&lt; <s:text name="www.payment.returnHome"></s:text>
				    	</a>
				    </p>
                 </div>
			</div>
		</div><!-- end of lagout-three -->
	</div>


	<div style="clear:both"></div>
<!-- ----------------------------------------------------------------------------------- -->
            <div id="footer">
                <%@ include file="../common/header/footer.jsp" %>
             
            </div>
<!-- ----------------------------------------------------------------------------------- -->
<!-- ------------------------------和本网页相关--------------------------------------- -->
<script type="text/javascript" src="common/js/product.price.js"></script>  <!-- 包含货币符号 -->
<script type="text/javascript" src="payment/js/payment.js"></script>
<script type="text/javascript" src="payment/js/checkout.js"></script>

<!-- ------------------------------和本网页相关--------------------------------------- -->
</body>
</html>
