package admin;

public class emailfnl {
String email,mobile;

@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("emailfnl [email=");
	builder.append(email);
	builder.append(", mobile=");
	builder.append(mobile);
	builder.append("]");
	return builder.toString();
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getMobile() {
	return mobile;
}

public void setMobile(String mobile) {
	this.mobile = mobile;
}

}
