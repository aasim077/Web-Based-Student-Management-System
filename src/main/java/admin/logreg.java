package admin;

import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;

public class logreg {
	String user, pass, email;

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPass() {
		///return encrypt();
		return pass;
	}

	/*
	 * public String encrypt() { String encryptedpassword = null; try {
	 * MessageDigest instance for MD5. MessageDigest m =
	 * MessageDigest.getInstance("MD5");
	 * 
	 * Add plain-text password bytes to digest using MD5 update() method.
	 * m.update(pass.getBytes());
	 * 
	 * Convert the hash value into bytes byte[] bytes = m.digest();
	 * 
	 * The bytes array has bytes in decimal form. Converting it into hexadecimal
	 * format. StringBuilder s = new StringBuilder(); for(int i=0; i< bytes.length
	 * ;i++) { s.append(Integer.toString((bytes[i] & 0xff) + 0x100,
	 * 16).substring(1)); }
	 * 
	 * Complete hashed password in hexadecimal format encryptedpassword =
	 * s.toString(); } catch (NoSuchAlgorithmException e) { e.printStackTrace(); }
	 * 
	 * Display the unencrypted and encrypted passwords.
	 * //System.out.println("Plain-text password: " + pass);
	 * //System.out.println("Encrypted password using MD5: " + encryptedpassword);
	 * return encryptedpassword; }
	 */
	public void setPass(String pass) {

		// this.pass = encrypt();
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("logreg [user=");
		builder.append(user);
		builder.append(", pass=");
		builder.append(pass);
		builder.append(", email=");
		builder.append(email);
		builder.append("]");
		return builder.toString();
	}

}
