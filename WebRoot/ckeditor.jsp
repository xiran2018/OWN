<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>A Simple Page with CKEditor</title>
<script src="js/jquery-1.10.2.js"></script>
<!-- Make sure the path to CKEditor is correct. -->
<script src="./ckeditor/ckeditor.js"></script>
<script src="./ckeditor/assets/uilanguages/languages.js"></script>

<script src="./ckfinder/ckfinder.js"></script>

<SCRIPT type="text/javascript">
	$(function() {
		$("#test").click(function() {
			alert("dsljf");
			var editor_data = CKEDITOR.instances.editor1.getData();
			alert(editor_data);
			document.write(editor_data);
		});
	});
</SCRIPT>
</head>
<body>
	<form>
		<p>
			Available languages ( <span id="count"> </span> languages!): <br>
			<script>
				document
						.write('<select disabled="disabled" id="languages" onchange="createEditor( this.value );">');

				// Get the language list from the _languages.js file.
				for ( var i = 0; i < window.CKEDITOR_LANGS.length; i++) {
					document
							.write('<option value="' + window.CKEDITOR_LANGS[i].code + '">'
									+ window.CKEDITOR_LANGS[i].name
									+ '</option>');
				}

				document.write('</select>');
			</script>
			<br> <span style="color: #888888"> (You may see strange
				characters if your system does not support the selected language) </span>
		</p>
		<textarea id="editor1" name="editor1" rows="10" cols="80">
                
            </textarea>
		<script>
			// Replace the <textarea id="editor1"> with a CKEditor
			// instance, using default configuration.
			//CKEDITOR.replace('editor1', {
			//	uiColor : '#14B8C4',
			// Load the German interface.
			//	language: 'de'
			//});
			// Set the number of languages.
			document.getElementById('count').innerHTML = window.CKEDITOR_LANGS.length;

			var editor;

			function createEditor(languageCode) {
				if (editor)
					editor.destroy();

				// Replace the <textarea id="editor"> with an CKEditor
				// instance, using default configurations.
				editor = CKEDITOR.replace('editor1', {
					language : languageCode,
					uiColor : '#14B8C4',
					on : {
						instanceReady : function() {
							// Wait for the editor to be ready to set
							// the language combo.
							var languages = document
									.getElementById('languages');
							languages.value = this.langCode;
							languages.disabled = false;
						}
					}
				});
			}

			// At page startup, load the default language:
			createEditor('');
		</script>
	</form>

	<input type="button" value="click" id="test">

</body>
</html>
