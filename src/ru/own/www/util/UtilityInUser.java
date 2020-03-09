package ru.own.www.util;

public class UtilityInUser {
    public static String generateToken(String password) {
        char c[] = password.toCharArray();
        for(int i = 0;i<c.length;i++) {
            c[i] = (char)(c[i] ^ 'M');//将明文转换成密文
        }
        String token = new String(c, 0, c.length);
//        System.out.println("密文：" + token);
        return  token;
    }
}
