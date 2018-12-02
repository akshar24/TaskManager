package TaskManager;

import java.util.LinkedList;

import sun.security.util.Password;

public class ValidateUserRegistration {
	private User user;
	private  LinkedList<String> errors;
	private String[] passwords;
	public ValidateUserRegistration(User user, String password,  String repassword) {
		this.user = user;
		this.passwords = new String[] {password, repassword};
		errors = new LinkedList<>();
	}
	public LinkedList<String> errors(){
		return errors;
	}
	private boolean validatePassword() {
		if(!passwords[0].equals(passwords[1])) {
			errors.add("Password and Repassword Mush Match");
			return false;
		}else {
			boolean result = false;
			String password = passwords[0];
			if(password.length()  < 8) {	
				errors.add("Password must be atleast 8 characters long");
				return result;
			}
			boolean hasUpper = false, hasLower = false , hasNumeric = false;
			for(int i = 0; i < password.length();i++) {
				char c1 = password.charAt(i);
				int c = (int)c1;
				if (c >= 65 && c <= 90){
					hasUpper = true;
				}else if(c >= 97 && c <= 122) {
					hasLower  = true;
				}else if(c >= 48 && c <= 57) {
					hasNumeric = true;
				}else {
					errors.add("Unwanted Character Found in Password");
					return false;
				}
			}
			if(!hasUpper) {
				errors.add("Password must have atleast one UpperCase Character");
				return false;
			}
			if(!hasLower) {
				errors.add("Password must have atleast one LowerCase Character");
				return false;
			}
			if(!hasNumeric) {
				errors.add("Password must contain atleast one numeric value");
				return false;
			}
			return true;
			
		}
	}
	private boolean ValidatePhone() {
		String phone = user.getWorkPhone();
		if(phone.length() != 10) {
			errors.add("WorkPhone must be 10 digits long");
			return false;
		}else {
			for(int i = 0; i < phone.length(); i++) {
				char c= phone.charAt(i);
				if(c < 48 || c > 57) {
					errors.add("Work Phone must contain only numerical digits");
					return false;
				}
			}
			return true;
		}
	}
	public void clean() {
		user = null;
		errors = null;
		passwords = null;
	}
	public boolean validationResult() {
		boolean result1 = validatePassword();
		boolean result2 = ValidatePhone();
		if(result1 && result2) {
			return true;
		}else {
			return false;
		}
	}
}
