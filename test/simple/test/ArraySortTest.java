package simple.test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ArraySortTest {

public static void main(String[] args) {
		
	testUser user1 = new testUser();  
    user1.setName("Черный");  
    user1.setOrder(1);  
    
    testUser user2 = new testUser();  
    user2.setName("Белый");   
    user2.setOrder(2);  
    
    
	testUser user3 = new testUser();  
    user3.setName("Красный");  
    user3.setOrder(1); 
    
	testUser user4 = new testUser();  
    user4.setName("Синий");  
    user4.setOrder(1); 
    
	testUser user5 = new testUser();  
    user5.setName("Черный");  
    user5.setOrder(1); 
    
	testUser user6 = new testUser();  
    user6.setName("Бордовый");  
    user6.setOrder(1); 
    
	testUser user7 = new testUser();  
    user7.setName("Арбузный");  
    user7.setOrder(1); 
    
    
    
    List<testUser> list = new ArrayList<testUser>();  
    //此处add user2再add user1  
    list.add(user2);  
    list.add(user1);  
    list.add(user3);  
    list.add(user4); 
    list.add(user5);  
    list.add(user6); 
    list.add(user7);  
    list.add(user5); 
    
    Collections.sort(list);  
    for(testUser u : list){  
        System.out.println(u.getName());  
    }  
}
}