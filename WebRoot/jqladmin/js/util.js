function refresh(obj) 
{
        obj.src = "imageServlet?"+Math.random();
        //obj.src="${pageContext.request.contextPath}/imageServlet?"+Math.random();
}