package simple.test;

public class test {

public static void main(String[] args) {
	
    char c[] = "qazwsx".toCharArray();
	for(int i = 0;i<c.length;i++) {
		c[i] = (char)(c[i] ^ 'M');//将明文转换成密文
	}
	String string = new String(c, 0, c.length);
	System.out.println("密文：" + string);
	for(int i=0;i<c.length;i++) {
		c[i] = (char)(c[i] ^ 'M');//将密文还原为明文
	}
	String string1 = new String(c, 0, c.length);
	System.out.println("明文：" + "\n" + string1);


}
}