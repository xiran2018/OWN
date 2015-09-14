
function showAjaxContent(){
var obj=document.getElementById("navigation");
var liObj=obj.getElementsByTagName("li");
var length=liObj.length;
var currentLiObj;
for(var i=0;i<length;i++){
   currentLiObj=liObj[i];
   if(currentLiObj.parentNode!=obj){continue;}
   //鐒跺悗寰幆娣诲姞浜嬩欢
   currentLiObj.onclick=function(){
    if(this.className.indexOf("show")<0){
     this.className+=" show";
    }
    clearStyle(this);
   } 
}
function clearStyle(obj){
   for(var i=0;i<length;i++){
    currentLiObj=liObj[i];
    if(obj!=currentLiObj){
     currentLiObj.className=currentLiObj.className.replace("show","");
    }
   }
}
}
showAjaxContent();
