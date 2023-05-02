package admin;


public class cb {
	private int semester,year; 
	private String branchid;
	private String bname;
	private String courseid;
	private String cname;
	private String s1,s2,s3,s4,s5;
	
	
	
	public String getS1() {
		return s1;
	}
	public void setS1(String s1) {
		this.s1 = s1;
	}
	public String getS2() {
		return s2;
	}
	public void setS2(String s2) {
		this.s2 = s2;
	}
	public String getS3() {
		return s3;
	}
	public void setS3(String s3) {
		this.s3 = s3;
	}
	public String getS4() {
		return s4;
	}
	public void setS4(String s4) {
		this.s4 = s4;
	}
	public String getS5() {
		return s5;
	}
	public void setS5(String s5) {
		this.s5 = s5;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getBranchid() {
		return branchid;
	}
	public void setBranchid(String branchid) {
		this.branchid = branchid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("cb [semester=");
		builder.append(semester);
		builder.append(", year=");
		builder.append(year);
		builder.append(", branchid=");
		builder.append(branchid);
		builder.append(", bname=");
		builder.append(bname);
		builder.append(", courseid=");
		builder.append(courseid);
		builder.append(", cname=");
		builder.append(cname);
		builder.append(", s1=");
		builder.append(s1);
		builder.append(", s2=");
		builder.append(s2);
		builder.append(", s3=");
		builder.append(s3);
		builder.append(", s4=");
		builder.append(s4);
		builder.append(", s5=");
		builder.append(s5);
		builder.append("]");
		return builder.toString();
	}
	
}
