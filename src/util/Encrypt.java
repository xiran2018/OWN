// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Encrypt.java

package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encrypt
{

	public Encrypt()
	{
	}

	public static String StringActiveCode(String strSrc, String encName)
	{
		return SHAEncrypt(strSrc, encName);
	}

	public static String StringEncrypt(String strSrc, String encName)
	{
		return SHAEncrypt(strSrc, encName);
	}

	public static String SHAEncrypt(String strSrc, String encName)
	{
		MessageDigest md = null;
		String strDes = null;
		byte bt[] = strSrc.getBytes();
		try
		{
			if (encName == null || encName.equals(""))
				encName = "SHA-256";
			md = MessageDigest.getInstance(encName);
			md.update(bt);
			strDes = bytes2Hex(md.digest());
		}
		catch (NoSuchAlgorithmException e)
		{
			return null;
		}
		return strDes;
	}

	public static String bytes2Hex(byte bts[])
	{
		String des = "";
		String tmp = null;
		for (int i = 0; i < bts.length; i++)
		{
			tmp = Integer.toHexString(bts[i] & 0xff);
			if (tmp.length() == 1)
				des = (new StringBuilder(String.valueOf(des))).append("0").toString();
			des = (new StringBuilder(String.valueOf(des))).append(tmp).toString();
		}

		return des;
	}
}
