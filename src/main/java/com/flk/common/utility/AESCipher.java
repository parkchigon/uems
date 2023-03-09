package com.flk.common.utility;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class AESCipher {
    private final static String HEX = "0123456789ABCDEF";

    private final static String innerKey = "uappAPIMobileWeb";

    public static void main(String a[]){
    	
    	try {
    		System.out.println(encrypt("admin"));
    		System.out.println(decrypt("Q0FFQzVFNzY2NUFDQjM3NjVFRENCQTk1QjI5MzY5MjU="));
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }

    /**
     * 디폴트키를 이용하여 평문을 AES128 암호화 알고리즘으로 암호화한다 AES - Hex - Base 64
     * 
     * @param cleartext
     *            암호화대상 평문 문자열
     * @return 암호화된 문자열
     */

    public static String encrypt(String cleartext) throws Exception {
        return encrypt(innerKey, cleartext, true);
    }

    public static String encrypt(String cleartext, boolean padding) throws Exception {
        return encrypt(innerKey, cleartext, padding);
    }

    /**
     * 디폴트키를 이용하여 암호문을 AES128 암호화 알고리즘으로 복호화한다
     *
     * @param cleartext
     *            복호화대상 암호문 문자열
     * @return 복호화된 평문 문자열
     */
    public static String decrypt(String encrypted) throws Exception {
        return decrypt(innerKey, encrypted);
    }
    
    
    /**
     * 평문을 AES128 암호화 알고리즘으로 암호화한다
     *
     * @param key
     *            암호화키
     * @param cleartext
     *            암호화대상 평문 문자열
     * @return 암호화된 문자열 Base64 추가
     */
    public static String encrypt(String key, String cleartext, boolean padding) throws Exception {
        // byte[] rawKey = getRawKey(seed.getBytes());
        byte[] rawKey = key.getBytes();
        byte[] result = encrypt(rawKey, cleartext.getBytes());
        String hexString = toHex(result);
        // return toHex(result);
        return padding ? new String(Base64.encodeBase64(hexString.getBytes())) : new String(Base64.encodeBase64URLSafe(hexString.getBytes()));
    }

    /**
     * 암호문을 AES128 암호화 알고리즘으로 복호화한다
     *
     * @param key
     *            암호화키
     * @param cleartext
     *            복호화대상 암호문 문자열
     * @return 복호화된 평문 문자열
     */
    public static String decrypt(String key, String encrypted) throws Exception {
        // byte[] rawKey = getRawKey(seed.getBytes());
        byte[] rawKey = key.getBytes();
        String base64 = new String(Base64.decodeBase64(encrypted.getBytes()));
        byte[] enc = toByte(base64);
        byte[] result = decrypt(rawKey, enc);
        return new String(result);
    }

    /**
     * 평문을 AES128 암호화 알고리즘으로 암호화한다
     *
     * @param key
     *            암호화키 바이트 배열
     * @param cleartext
     *            암호화대상 평문 바이트 배열
     * @return 암호화된 문자열의 바이트 배열
     */
    private static byte[] encrypt(byte[] raw, byte[] clear) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted = cipher.doFinal(clear);
        return encrypted;
    }

    /**
     * 암호문을 AES128 암호화 알고리즘으로 복호화한다
     *
     * @param key
     *            암호화키 바이트 배열
     * @param cleartext
     *            복호화대상 암호문 바이트 배열
     * @return 복호화된 평문 문자열의 바이트 배열
     */
    private static byte[] decrypt(byte[] raw, byte[] encrypted) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] decrypted = cipher.doFinal(encrypted);
        return decrypted;
    }

    /**
     * 일반 문자열을 헥사문자열로 변환
     *
     * @param txt
     *            문자열
     * @return hex 문자열
     */
    public static String toHex(String txt) {
        return toHex(txt.getBytes());
    }

    /**
     * 헥사문자열을 일반 문자열로 변환
     *
     * @param hex
     *            문자열
     * @return txt 문자열
     */
    public static String fromHex(String hex) {
        return new String(toByte(hex));
    }

    /**
     * 문자열을 바이트 배열로 변환
     *
     * @param txt
     *            문자열
     * @return 바이트 배열
     */
    public static byte[] toByte(String hexString) {
        int len = hexString.length() / 2;
        byte[] result = new byte[len];
        for (int i = 0; i < len; i++)
            result[i] = Integer.valueOf(hexString.substring(2 * i, 2 * i + 2), 16).byteValue();
        return result;
    }

    /**
     * 바이트 배열을 문자열로 변환
     *
     * @param hex
     *            바이트 배열
     * @return 문자열
     */
    public static String toHex(byte[] buf) {
        if (buf == null)
            return "";
        StringBuffer result = new StringBuffer(2 * buf.length);
        for (int i = 0; i < buf.length; i++) {
            appendHex(result, buf[i]);
        }
        return result.toString();
    }

    /**
     * 바이트 데이터를 두개의 문자열로 변환하여 추가
     *
     * @param sb
     *            스트링버퍼
     * @param 1바이트 데이터
     */
    private static void appendHex(StringBuffer sb, byte b) {
        sb.append(HEX.charAt((b >> 4) & 0x0f)).append(HEX.charAt(b & 0x0f));
    }

    /**
     * MD5 해쉬값을 계산한다
     *
     * @param cleartext
     *            해쉬값을 구하기 위한 대상 문자열
     * @return MD5 해쉬값
     */
    public String md5(String cleartext) {
        try {
            // Create MD5 Hash
            MessageDigest digest = java.security.MessageDigest.getInstance("MD5");
            digest.update(cleartext.getBytes());
            byte messageDigest[] = digest.digest();

            // Create Hex String
            StringBuffer hexString = new StringBuffer();
            for (int i = 0; i < messageDigest.length; i++)
                hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
            return hexString.toString();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 입력된 keyByte로 initialVector를 생성한다.
     * 
     * @param keyBytes
     * @return
     * @throws NoSuchAlgorithmException
     */
    public static byte[] getInitialVector(byte[] keyBytes) throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        md5.reset();
        md5.update(keyBytes);
        byte[] initialVector = md5.digest();
        return initialVector;
    }

    /**
     * 입력된 initialVector로 key를 생성한다.
     * 
     * @param initialVector
     * @return
     * @throws NoSuchAlgorithmException
     */
    public static byte[] getKey(byte[] initialVector) throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        md5.reset();
        md5.update(initialVector);
        byte[] key = md5.digest();
        return key;
    }

    /**
     * 입력된 key와 initialVector로 value를 암호화 한다.
     * 
     * @param value
     * @param key
     * @param initialVetor
     * @return
     */
    public static byte[] encript(byte[] value, byte[] key, byte[] initialVetor) {
        byte[] encryptedText = null;
        try {
            Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
            SecretKeySpec sks = new SecretKeySpec(key, "AES");
            IvParameterSpec ips = new IvParameterSpec(initialVetor);
            c.init(Cipher.ENCRYPT_MODE, sks, ips);

            encryptedText = c.doFinal(value);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return encryptedText;
    }

}
