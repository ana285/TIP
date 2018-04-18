package data;


import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Encrypt{
	public static String generateHash(String input) {
		StringBuilder hash = new StringBuilder();

		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-1");
			byte[] hashedBytes = sha.digest(input.getBytes());
			char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f' };
			for (int idx = 0; idx < hashedBytes.length; ++idx) {
				byte b = hashedBytes[idx];
				hash.append(digits[(b & 0xf0) >> 4]);
				hash.append(digits[b & 0x0f]);
			}
		} catch (NoSuchAlgorithmException e) {
			// handle error here.
		}

		return hash.toString();
	}
}

//public class Encrypt
//{
//    private byte[] key;
//
//    private static final String ALGORITHM = "AES";
//
//    public Encrypt()
//    {
//        this.key = "MZygpewJsCpRrfOr".getBytes(StandardCharsets.UTF_8);
//    }
//
//    /**
//     * Encrypts the given plain text
//     *
//     * @param plainText The plain text to encrypt
//     */
//    public byte[] encrypt(byte[] plainText) throws Exception
//    {
//        SecretKeySpec secretKey = new SecretKeySpec(key, ALGORITHM);
//        Cipher cipher = Cipher.getInstance(ALGORITHM);
//        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
//
//        return cipher.doFinal(plainText);
//    }
//
//    /**
//     * Decrypts the given byte array
//     *
//     * @param cipherText The data to decrypt
//     */
//    public byte[] decrypt(byte[] cipherText) throws Exception
//    {
//        SecretKeySpec secretKey = new SecretKeySpec(key, ALGORITHM);
//        Cipher cipher = Cipher.getInstance(ALGORITHM);
//        cipher.init(Cipher.DECRYPT_MODE, secretKey);
//
//        return cipher.doFinal(cipherText);
//    }
//}



//byte[] encryptionKey = "MZygpewJsCpRrfOr".getBytes(StandardCharsets.UTF_8);
//byte[] plainText = "Hello world!".getBytes(StandardCharsets.UTF_8);
//AdvancedEncryptionStandard advancedEncryptionStandard = new AdvancedEncryptionStandard(
//        encryptionKey);
//byte[] cipherText = advancedEncryptionStandard.encrypt(plainText);
//byte[] decryptedCipherText = advancedEncryptionStandard.decrypt(cipherText);
//
//System.out.println(new String(plainText));
//System.out.println(new String(cipherText));
//System.out.println(new String(decryptedCipherText));




//import javax.crypto.Cipher;
//import javax.crypto.spec.IvParameterSpec;
//import javax.crypto.spec.SecretKeySpec;
//
//import org.apache.commons.codec.binary.Base64;
//
//public class Encrypt {
//    public static String encrypt(String key, String initVector, String value) {
//        try {
//            IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
//            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
//
//            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
//            cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
//
//            byte[] encrypted = cipher.doFinal(value.getBytes());
//            System.out.println("encrypted string: "
//                    + Base64.encodeBase64String(encrypted));
//
//            return Base64.encodeBase64String(encrypted);
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//
//        return null;
//    }
//
//    public static String decrypt(String key, String initVector, String encrypted) {
//        try {
//            IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
//            SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
//
//            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
//            cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
//
//            byte[] original = cipher.doFinal(Base64.decodeBase64(encrypted));
//
//            return new String(original);
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//
//        return null;
//    }
//    
////    public static void main(String[] args) {
////        String key = "Bar12345Bar12345"; // 128 bit key
////        String initVector = "RandomInitVector"; // 16 bytes IV
////
////        System.out.println(decrypt(key, initVector,
////                encrypt(key, initVector, "Hello World")));
////    }
//}