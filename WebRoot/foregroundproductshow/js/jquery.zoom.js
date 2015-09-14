/*!
	Zoom 1.7.13
	license: MIT
	http://www.jacklmoore.com/zoom
*/
(function ($) {
	var defaults = {
		targetShowFlag:false,				//是否在原有图像区域显示，如果不是，需要重新生成一个显示放大图片的区域
		markSizeFlag:true,				//是否显示mark图标
		markSize : [200, 100],			//放大镜宽高
		zoomSize : [400, 400],			//需要放大的区域宽高
		url: false,
		callback: false,
		target: false,
		duration: 120,
		on: 'mouseover-outerShow', // other options: grab, click, toggle,mouseover-outerShow,mouseover
		touch: true, // enables a touch fallback
		onZoomIn: false,
		onZoomOut: false,
		magnify: 1
	};

	// Core Zoom Logic, independent of event listeners.
	$.zoom = function(target, source, img, magnify,settings) {
		var targetHeight,
			targetWidth,
			sourceHeight,
			sourceWidth,
			xRatio,
			yRatio,
			offset,
			position = $(target).css('position'),
			$source = $(source);

		// The parent element needs positioning so that the zoomed element can be correctly positioned within.
		target.style.position = /(absolute|fixed)/.test(position) ? position : 'relative';
		target.style.overflow = 'hidden';

		img.style.width = img.style.height = '';

		$(img)
			.addClass('zoomImg')
			.css({
				position: 'absolute',
				top: 0,
				left: 0,
				opacity: 0,
				width: img.width * magnify,
				height: img.height * magnify,
				border: 'none',
				maxWidth: 'none',
				maxHeight: 'none'
			})
			.appendTo(target);

		return {
			init: function() {
			
				//console.log("in the init;in the init;in the init;in the init;");
				targetWidth = $(target).outerWidth();
				targetHeight = $(target).outerHeight();

				if (source === target) {
					sourceWidth = targetWidth;
					sourceHeight = targetHeight;
				} else {
					sourceWidth = $source.outerWidth();
					sourceHeight = $source.outerHeight();
				}

				xRatio = (img.width - targetWidth) / sourceWidth;
				yRatio = (img.height - targetHeight) / sourceHeight;

				offset = $source.offset();
				
				//把opacity的数值从0变为1
				$(img).stop().fadeTo($.support.opacity ? settings.duration : 0, 1, $.isFunction(settings.onZoomIn) ? settings.onZoomIn.call(img) : false);
			},
			mark: function(e) {
				//reference simpleZoom.js
				var markBox = $(source);
				var markBoxSize = [markBox.width(), markBox.height(), markBox.offset().left, markBox.offset().top];
				var markSize = settings.markSize;
				
				var zoomSize = settings.zoomSize;
				
				if(e!=undefined )
				{//主要是针对点击等的事件对刚加入的mark进行定位
					var l = e.pageX-markBoxSize[2]-(markSize[0]/2);
					var t = e.pageY-markBoxSize[3]-(markSize[1]/2);
					if(l < 0){
						l = 0;
					}else if(l > show_w){
						l = show_w;
					}
					if(t < 0){
						t = 0;
					}else if(t > show_h){
						t = show_h;
					}
				}
				var mark_ele = "<i class='mark'></i>";
				var mark_css = {position:"absolute", top:t+"px", left:l+"px", width:markSize[0]+"px", height:markSize[1]+"px", backgroundColor:"#000", opacity:.5, filter:"alpha(opacity=50)",  display:"", cursor:"move"};
				
				var show_w = markBoxSize[0]-markSize[0];
				var show_h = markBoxSize[1]-markSize[1];
				
				//created mark element and add cascading style sheets
				var zoomBox = $(target);
				if(target!=source)
				{
					zoomBox.css({width:zoomSize[0]+"px", height:zoomSize[1]+"px"});
				}
				markBox.append(mark_ele);
				$(".mark").css(mark_css);

				markBox.mouseover(function(){
					$(".mark").show();
					zoomBox.show();
				}).mouseout(function(){
					$(".mark").hide();
					if(!settings.targetShowFlag)
					{
						zoomBox.hide();
					}
					
				}).mousemove(function(e){
					var l = e.pageX-markBoxSize[2]-(markSize[0]/2);
					var t = e.pageY-markBoxSize[3]-(markSize[1]/2);
					if(l < 0){
						l = 0;
					}else if(l > show_w){
						l = show_w;
					}
					if(t < 0){
						t = 0;
					}else if(t > show_h){
						t = show_h;
					}

					$(".mark").css({left:l+"px", top:t+"px"});
					
					//以下三行是移动放大图片位置的代码
					//var z_x = -(l/show_w)*(zoomImg[0]-zoomSize[0]);
					//var z_y = -(t/show_h)*(zoomImg[1]-zoomSize[1]);
					//zoom_img.css({left:z_x+"px", top:z_y+"px"});
				});
			},
			move: function (e) {
				
			
				var left = (e.pageX - offset.left),
					top = (e.pageY - offset.top);

				top = Math.max(Math.min(top, sourceHeight), 0);
				left = Math.max(Math.min(left, sourceWidth), 0);

				img.style.left = (left * -xRatio) + 'px';
				img.style.top = (top * -yRatio) + 'px';
			}
		};
	};
	
	$.fn.mui_zoom = function (options) {
		//$(this).zoom(options);
		
		mui_settings = $.extend({}, defaults, options || {});
		/*if(mui_settings.targetShowFlag)
		{//如果是在img自己的上层div展示则需要用这个 */
				$(this).mouseenter (function(){
					//console.log("enter enter enter enter enter enter enter enter ");
					$(this).zoom(options);
				}).mouseleave(function(){
					//console.log("out out out out out out out out out out out out ");
					$(this).trigger('zoom.destroy');
					
				})
		/*}
		else
		{
			
		}*/

	};

	$.fn.zoom = function (options) {
		return this.each(function () {
			var
			settings = $.extend({}, defaults, options || {});
			
			 if(settings.targetShowFlag)
			 {
			 			//target will display the zoomed image
				target = settings.target || this;
			 }
			 else
			 {
				html="<div id='mui_zoomdiv' class='zoomdiv' style='width: 400px; height: 400px; display: block;'></div>";
				$(this).append(html);
				target=document.getElementById("mui_zoomdiv");
			 }

			
			
			//source will provide zoom location info (thumbnail)
			var source = this,
			$source = $(source),
			img = document.createElement('img'),
			$img = $(img),
			mousemove = 'mousemove.zoom',
			clicked = false,
			touched = false,
		    $urlElement;

			// If a url wasn't specified, look for an image element.
			if (!settings.url) {
				$urlElement = $source.find('img');
				if ($urlElement[0]) {
					settings.url = $urlElement.data('src') || $urlElement.attr('src');
				}
				if (!settings.url) {
					return;
				}
			}

			(function(){
				var position = target.style.position;
				var overflow = target.style.overflow;

				$source.one('zoom.destroy', function(){
					$source.off(".zoom");
					target.style.position = position;
					target.style.overflow = overflow;
					$img.remove();
					if(settings.markSizeFlag)
					{//remove mark if exist
						$(".mark").remove();
					}
					if(!settings.targetShowFlag)
					{//remove mui_zoomdiv if exist
						$("#mui_zoomdiv").remove();
					}
				});
				
			}());

			img.onload = function () {
			
				//console.log("in img.onload");
				var zoom = $.zoom(target, source, img, settings.magnify,settings);

				function start(e) {
					//console.log("start start start start start start start start start start ");
					zoom.init();
					zoom.move(e);

					// Skip the fade-in for IE8 and lower since it chokes on fading-in
					// and changing position based on mousemovement at the same time.
					$img.stop()
					.fadeTo($.support.opacity ? settings.duration : 0, 1, $.isFunction(settings.onZoomIn) ? settings.onZoomIn.call(img) : false);
				}
				
				function addMark(e){
				
					zoom.mark(e);//add mark to the div containing img
				}

				function stop() {
					$img.stop()
					.fadeTo(settings.duration, 0, $.isFunction(settings.onZoomOut) ? settings.onZoomOut.call(img) : false);
				}

				// Mouse events
				if (settings.on === 'grab') {
					$source
						.on('mousedown.zoom',
							function (e) {
								if (e.which === 1) {
									$(document).one('mouseup.zoom',
										function () {
											stop();

											$(document).off(mousemove, zoom.move);
										}
									);

									if(settings.markSizeFlag)
									{//add by jql
										addMark(e);
									}
									
									start(e);

									$(document).on(mousemove, zoom.move);

									e.preventDefault();
								}
							}
						);
				} else if (settings.on === 'click') {
					$source.on('click.zoom',
						function (e) {
							if (clicked) {
								// bubble the event up to the document to trigger the unbind.
								return;
							} else {
								clicked = true;
								if(settings.markSizeFlag)
								{//add by jql
										addMark(e);
								}
								start(e);
								$(document).on(mousemove, zoom.move);
								$(document).one('click.zoom',
									function () {
										stop();
										clicked = false;
										$(document).off(mousemove, zoom.move);
									}
								);
								return false;
							}
						}
					);
				} else if (settings.on === 'toggle') {
					$source.on('click.zoom',
						function (e) {
							if (clicked) {
								stop();
							} else {
									
									if(settings.markSizeFlag)
									{//add by jql
										addMark();
									}
								start(e);
							}
							clicked = !clicked;
						}
					);
				} else if (settings.on === 'mouseover') {
					
					if(settings.markSizeFlag)
					{//add by jql
						zoom.mark();
					}
					zoom.init(); // Preemptively call init because IE7 will fire the mousemove handler before the hover handler.

					$source.on(mousemove, zoom.move);
				}else if (settings.on === 'mouseover-outerShow') {
					
					if(settings.markSizeFlag)
					{//add by jql
						zoom.mark();
					}
					
					zoom.init(); // Preemptively call init because IE7 will fire the mousemove handler before the hover handler.
					$source.on(mousemove, zoom.move);  //modify by jql
				}

				// Touch fallback
				if (settings.touch) {
					$source
						.on('touchstart.zoom', function (e) {
							e.preventDefault();
							if (touched) {
								touched = false;
								stop();
							} else {
								touched = true;
								start( e.originalEvent.touches[0] || e.originalEvent.changedTouches[0] );
							}
						})
						.on('touchmove.zoom', function (e) {
							e.preventDefault();
							zoom.move( e.originalEvent.touches[0] || e.originalEvent.changedTouches[0] );
						});
				}
				
				if ($.isFunction(settings.callback)) {
					settings.callback.call(img);
				}
			};
			
			//console.log(" after +++++++++++++++++++++++++++++++++++in img.onload");
			img.src = settings.url;
		});
	};

	$.fn.zoom.defaults = defaults;
}(window.jQuery));
