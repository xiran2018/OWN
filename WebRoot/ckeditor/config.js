/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'zh-cn';
	config.toolbar = "Full";
	// config.uiColor = '#AADC6E';
    /*** 文件上传功能的配置-----------------------  
     */  
    config.filebrowserBrowseUrl = 'ckfinder/ckfinder.html';   
    config.filebrowserImageBrowseUrl = 'ckfinder/ckfinder.html?type=Images';  
    config.filebrowserFlashBrowseUrl = 'ckfinder/ckfinder.html?type=Flash';  
    config.filebrowserUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';  
    config.filebrowserImageUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';  
    config.filebrowserFlashUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';  
    //---------------------------文件上传功能的配置结束--------
};
