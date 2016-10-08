package simple.test;

public class test {

public static void main(String[] args) {
	
//	String aString="productImage/2. ���\\B001ŵ����\2016.10.05-2/90083(1).jpg";
//	String test=aString;
//	test=aString.replaceAll("\\\\", "/");
	
	String tempName="xxx (11ss).jpg";
	
	int j=0,imageSort=0;
	//����ͼƬ��λ�ã���������е�ֵ��ȷ�������·�(12),��λ��Ϊ12
	int tempStart=tempName.lastIndexOf("("); //��ȡ���������ڵ�λ��
	int tempEnd=tempName.lastIndexOf(")"); //��ȡ���������ڵ�λ��
	//�ȶ���Ʒ������Ƿ���ȣ���Ϊ�Ƿ���ͬһ����Ʒ������
	if((tempStart!=-1)&&(tempEnd!=-1)&&(tempEnd>=tempStart))
	{//˵�������ţ����Ϊ-1˵��û������
		
		 String sortString=tempName.substring(tempStart+1,tempEnd);//��ȡ������֮����ļ�����
		 try {
			 imageSort=Integer.parseInt(sortString);
		} catch (Exception e) {
			// TODO: handle exception
			imageSort=0;
		}
	}
	
	System.out.println(imageSort);
}
}