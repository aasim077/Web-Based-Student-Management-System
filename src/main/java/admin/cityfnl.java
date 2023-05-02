package admin;

public class cityfnl {
int id,cid;
String cityname;
@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("cityfnl [id=");
	builder.append(id);
	builder.append(", cid=");
	builder.append(cid);
	builder.append(", cityname=");
	builder.append(cityname);
	builder.append("]");
	return builder.toString();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public String getCityname() {
	return cityname;
}
public void setCityname(String cityname) {
	this.cityname = cityname;
}
}
