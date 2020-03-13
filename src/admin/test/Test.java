package admin.test;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class Test {
     //String[] a= reduceFee.split("+");

    public static void main(String args[]) {
        String abc= "-24";
        String[] ab= abc.split("-");
//        for(int i=0;i<ab.length;i++){
//            System.out.println(i);
//            System.out.println(ab[1]);
//        }

        BigDecimal a1 = new BigDecimal(ab[1]);
        BigDecimal b1 = new BigDecimal(Double.toString(0.145678));
        BigDecimal result = a1.multiply(b1);// 相乘结果
        System.out.println(result);

        DecimalFormat df = new DecimalFormat("0.00");
        String e = df.format(result); // 此处可以用上面b/c/d任意一种
        System.out.println(e);



        double  f1   =  result.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();
        System.out.println(f1);

        Double real = 0.145678 * Double.parseDouble(ab[1]);
        real = (double) Math.round(real*100) / 100;
        String realstr = "-"+real;
        System.out.println(realstr);

    }
}
