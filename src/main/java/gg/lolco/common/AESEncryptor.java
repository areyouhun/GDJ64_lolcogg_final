package gg.lolco.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.charset.Charset;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import org.springframework.stereotype.Component;

@Component
public class AESEncryptor {
	private static final String KEY_FILE_NAME = "dvc.gd";
	private static final String ALGORITHM = "AES";
	private static final String CHARSET = "UTF-8";
	
	private static SecretKey key;
	private String path;
	
	public AESEncryptor() {
		// Server path
		//this.path = System.getProperty("user.dir")+"/webapps/GDJ64_lolcogg_final/WEB-INF/"+KEY_FILE_NAME;
		
		// Local path
		 this.path = System.getProperty("user.dir") + "/" + KEY_FILE_NAME;
		
		loadKeyBy(this.path);
	}
	
	private void loadKeyBy(String filePath) {
		final File keyFile = new File(filePath);
		
		if (keyFile.exists()) {
			try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(keyFile))) {
				AESEncryptor.key = (SecretKey) ois.readObject();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			generateKeyBy(keyFile);
		}
	}
	
	private void generateKeyBy(File keyFile) {
		final SecureRandom secureRnd = new SecureRandom();
		KeyGenerator keyGen = null;
		
		try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(keyFile))) {
			keyGen = KeyGenerator.getInstance(ALGORITHM);
			keyGen.init(128, secureRnd);
			AESEncryptor.key = keyGen.generateKey();
			
			oos.writeObject(AESEncryptor.key);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
	
	public static String encrypt(String dataOriginal) throws Exception {
		Cipher cipher = Cipher.getInstance(ALGORITHM);
		cipher.init(Cipher.ENCRYPT_MODE, AESEncryptor.key);
		
		byte[] bytesOriginal = dataOriginal.getBytes(Charset.forName(CHARSET));
		byte[] bytesEncrypted = cipher.doFinal(bytesOriginal);
		return Base64.getEncoder().encodeToString(bytesEncrypted);
	}
	
	public static String decrypt(String dataEncrypted) throws Exception {
		Cipher cipher = Cipher.getInstance(ALGORITHM);
		cipher.init(Cipher.DECRYPT_MODE, AESEncryptor.key);
		
		byte[] bytesToBeDecrypted = Base64.getDecoder().decode(dataEncrypted.getBytes(Charset.forName("UTF-8")));
		byte[] bytesDecrypted = cipher.doFinal(bytesToBeDecrypted);
		return new String(bytesDecrypted);
	}
}