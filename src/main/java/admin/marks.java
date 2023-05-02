package admin;

public class marks {
private float m1,m2,m3,m4,m5;
private int id,mid;
private String roll;

public int getMid() {
	return mid;
}

public void setMid(int mid) {
	this.mid = mid;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getRoll() {
	return roll;
}

public void setRoll(String roll) {
	this.roll = roll;
}

public float getM1() {
	return m1;
}

public void setM1(float m1) {
	this.m1 = m1;
}

public float getM2() {
	return m2;
}

public void setM2(float m2) {
	this.m2 = m2;
}

public float getM3() {
	return m3;
}

public void setM3(float m3) {
	this.m3 = m3;
}

public float getM4() {
	return m4;
}

public void setM4(float m4) {
	this.m4 = m4;
}

public float getM5() {
	return m5;
}

public void setM5(float m5) {
	this.m5 = m5;
}

@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("marks [m1=");
	builder.append(m1);
	builder.append(", m2=");
	builder.append(m2);
	builder.append(", m3=");
	builder.append(m3);
	builder.append(", m4=");
	builder.append(m4);
	builder.append(", m5=");
	builder.append(m5);
	builder.append(", id=");
	builder.append(id);
	builder.append(", mid=");
	builder.append(mid);
	builder.append(", roll=");
	builder.append(roll);
	builder.append("]");
	return builder.toString();
}

}
