package simple.test;

/** 
 * 根据order对User排序 
*/   
public class testUser implements Comparable<testUser>{//此处无需实现Comparable接口  
	  private String name;  
	     private Integer order;  
	     public String getName() {  
	         return name;  
	     }  
	     public void setName(String name) {  
	         this.name = name;  
	     }  
	     public Integer getOrder() {  
	         return order;  
	     }  
	     public void setOrder(Integer order) {  
	         this.order = order;  
	     }  
	     public int compareTo(testUser arg0) {  
	         //return this.getOrder().compareTo(arg0.getOrder());  
	    	 return this.getName().compareTo(arg0.getName());
	     }  
 }  
