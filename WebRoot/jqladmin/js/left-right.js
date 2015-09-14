var status = 1;

function switchSysBar(){
	var switchPoint=document.getElementById("switchPoint");
	var side=document.getElementById("side");
	var content=document.getElementById("content");
     if (1 == window.status){
		  window.status = 0;
		  //alert(switchPoint);

          switchPoint.style.backgroundImage = 'url(images/left.gif)';
          side.style.display="none";
          content.style.marginLeft=0;
     }
     else{
		  window.status = 1;
          switchPoint.style.backgroundImage = 'url(images/right.gif)'; 
          content.style.marginLeft=200;
          side.style.display="";
     }
}
function switchSysBar1(){
	var switchPoint=document.getElementById("switchPoint1");
	var frmTitle=document.getElementById("rightSide");
	var content=document.getElementById("content");
     if (1 == window.status){
		  window.status = 0;
		  //alert(switchPoint);

          switchPoint.style.backgroundImage = 'url(images/right.gif)';
          frmTitle.style.display="none";
          content.style.marginRight=0;
     }
     else{
		  window.status = 1;
          switchPoint.style.backgroundImage = 'url(images/left.gif)'; 
          content.style.marginRight=200;
          frmTitle.style.display="";
     }
}