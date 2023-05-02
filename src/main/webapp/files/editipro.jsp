<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<% 
String pid= request.getParameter("roll");
System.out.println("roll="+pid);
int id=Integer.parseInt(pid);
Connection con =null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");

	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projfinal", "root", "root");
	String sql="Select * id from person where id="+id;

//	String sql="select *from person";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	if(rs.next()){
		%>
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		</head>
		<body>
		    <form name="form">
		  <input type=hidden name=id id=id value=<%=rs.getString(1) %>>
		  Name<input type="text" id=name name=name value=<%=rs.getString(2) %>>
		 <br>Mobile<input type="text" id=mobile name=mobile value=<%=rs.getString(5)%>>
		 <br>Email<input type="text" id=email name=email value=<%=rs.getString(4) %>>
		  <br>D.O.B:<input type="date" id=date value=<%=rs.getString(3) %> required>
		 <br>Address:<textarea id=address name=address value=required<%=rs.getString(6) %>></textarea>
		 <br>Country:<select id=country name=country>               </select>
		 <br>City:<select id=city name=city>                        </select>
		 <br>Way of Contact: Email<input type=checkbox name=ways id=email value=email<%=("yes".equals(rs.getString(10)) ? "checked": "") %> > checked>
		                 Phone<input type=checkbox name=ways id=phone value=phone <%=("yes".equals(rs.getString(11)) ? "checked": "") %> >
		                 Fax<input type=checkbox name=ways id=fax value =fax <%=("yes".equals(rs.getString(12)) ? "checked": "") %> >
		  <br>Contact Time: Morning<input type=radio name=time value=morning <%=("yes".equals(rs.getString(9)) ? "checked": "") %>  checked>
		                       Afternoon <input type=radio name=time value=afternoon <%=("yes".equals(rs.getString(9)) ? "checked": "") %>  >
		                           Evening <input type=radio name=time value=evening <%=("yes".equals(rs.getString(9)) ? "checked": "") %> > 
		     <br>Cars:<select name=car id=car size=3></select> 
		       <button id=save>SAVE</button>
		          <div id=result></div>
		              </form>
		
		
		
		
	<%	
		
	//if completed	
	}
	
}
catch(Exception ex){
	
}
%>
</body>
<script type="text/javascript" src="jquery/jquery-3.6.0.min.js"></script>-->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<script type="text/javascript">
 $(function(){
	 $("#mobile").blur(function(){
		   var m =new Object();
		   m.mobile=$("#mobile").val();
		   var strm=JSON.stringify(m);
		   console.log(strm);
		   console.log("SENDING TO SERVER");
		   $.ajax({
			   url:"mobilefnl.jsp",
			   type:"post",
               data:strm,
               processData:"false",
               contentType:"application/json",
               success:function(res){
            	   if(res.status="failed"){
            		  // $("#mobile").css("background-color", "#ff5722");
            		   $("#mobile").html(res.message);
         			  console.log("WARNING"+res.message);

            	   }
            	   else{
            		   console.log("message status"+res.message+res.status);

            	   }
            	 	
            	   
               },
               
               error:function(txt){
            	
            	   console.log("Error "+txt);
               }
			   
			   
			   
		   });
		  
		  
		 
	 });
	 
	   	$("#email").blur(function(){
    		var e=new Object();
    		e.email=$("#email").val();
    		 var stre=JSON.stringify(e);
             console.log(stre);
             console.log("sending");
    		$.ajax({
    			url:"email.jsp",
    			type:"Post",
    			 "data":stre,
            	  "processData":false,
            	  "contentType":"application/json",
            	    "success":function(res){
            	    	 
            		 
            		  if(res.status=="failed"){
            			//  $("#email").css("background-color", "#ff5722");
            			  $("#email").html(res.message);
            			 // alert(res.message);
            			 // $("#em").html(res.message);
            			  console.log("WARNING"+res.message);
            		  }
            			 
            		
            	  },
            		  "error":function(txt){
            			  console.log("Error "+txt);
            		  }
    			
    		});
    		
    	});
	   	
$("#country").focus(function(){

	var obj =new Object();
	//obj.cid=$("#country option:selected").val();

	var strc=JSON.stringify(obj);
    
	console.log(strc);
    console.log("sending");
    
    $.ajax({
    	url:"countryfnl.jsp",
		type:"Post",
		data:strc,
    	processData:false,
    	contentType:"application/json",
    	success:function(res){
            if(res.status=="success"){
            	   var list="";
         		  for(var i=0;i<res.data.length;i++){
         			  list+="<option value="+res.data[i].id+">"+res.data[i].name+"</option>";
         		  }
         		
         		  $("#country").html(list);
         		  
         		  }
         		  console.log(res.data);
         		  console.log(list);
         		  }
    
    
            	
            	
    ,
    	error:function(txt){
			  console.log("Error "+txt);
	
    	}
    		
    });
});

	
	
$("#city").focus(function(){
     var oa = new Object();
     oa.cid=$("#country option:selected").val();
     
     var strm = JSON.stringify(oa);
     console.log(strm);
     $.ajax({
    	  url:"cityfnl.jsp",
    	  type:"Post",
    	  "processingData":false,
       	  "contentType":"application/json",
			 "data":strm,
			 "success":function(res){
				 if(res.status=="success"){
					var list="";
					for(var i=0;i<res.data.length;i++){
						list+="<option value="+res.data[i].cityid+">"+res.data[i].cityname+"</option>";
					}
					//put data in html in city tags
					$("#city").html(list);
		 }
		    	 console.log(res.data);
				 console.log(list);
			 },
			 "error":function(txt){
   			  console.log("Error "+txt.message+txt.status);

			 }
    	 
    	 
    	 
    	 
    	 
    	 
     });
     
     console.log("in city");
     
     
 
     
      });
    
    
    
    $("#car").focus(function(){
    	console.log("sending");
    	
    	$.ajax({
    		
    		url:"car.jsp",
    	    type:"post",
    	    processDATA:false,
    	    contentType:"application/json",
    	    success:function(res){
    	    	
    	    	  if(res.status=="success"){
    	              var option="";
    	             
    	    		  for(var i=0;i<res.data.length;i++){
    	    			  option+="<optgroup value="+res.data[i].catid+" label="+res.data[i].catname+">";
    	    			 for(var j=0;j<res.data[i].jca.length;j++){
    	    			  option+="<option value="+res.data[i].jca[j].carid+">"+res.data[i].jca[j].carname+"</option>";
    	    		  }
    	    			 option+="</optgroup>";
    	    		  }
    	    		
    	    		  $("#car").html(option);
    	    		  
    	    		  }  console.log(res.data);
    	    		     console.log(option);
    	    	
    	   	
    	    },
    	    error:function(res){
    	    	
  			  console.log("Error "+res.status+res.message);

    	    	
    	    	
    	    }
    		
    		
    		
    		
    	});
    	
    	
    });
    $("#date").datepicker({
    	timepicker:false,
    dateFormat:"dd-MM-yyyy hh:mm:ss",
    maxDate: 0,
    minDate: "01-01-95",
    	
    	
    	
    });
    
    
    
    
    
    
    
    
    
    //date
    $("#save").on('click',function(){
    	alert("save loading");

    	var obj = new Object();
    	obj.name=$("#name").val();
    	obj.address=$("#address").val(); 
    	          // input is a tag not a ID
    	obj.time=$("input[name=time]:checked").val(); //radio button 
    	obj.mobile=$("#mobile").val();
    	obj.email=$("#email").val();
    	obj.country=$("#country option:selected").val();
    	obj.city=$("#city option:selected").val();
    	obj.dob=new Date($('#date').val());
    	alert("9");
    	var w=[];
    	$.each($("input[name=ways]"),function(){
    		if($(this).prop("checked")){
    			w.push($(this).val());
    		  ///  var y ="yes";
    		   // w.push(y);
    		}
    		else{
    			var a= "no";
    			w.push(a);
    		}
    	});
    	obj.ways=w;alert("9");
    	var c=[];
    	
    	$.each($('select[name="car"] option:selected'),function(){
    		 c.push($(this).val());
    	});
    	obj.car=c;
    	alert("10");
    	var str =JSON.stringify(obj);
    	alert("11");
    	console.log(str);
    	alert("12");
    	$.ajax({
    		"url":"projfinal.jsp",
    	    "type":"POST",
    		"processData":false,
    		"contentType":"application/json",
    	    "data":str,
            success:function(res){
    			alert(res.status);
    	    	alert("13");

				$("#result").innerhtml("Data Saved"+res.message);

    			
    		},
    		errror:function(txt){
    	    	alert("14");

				$("#result").html(errorText);
		    	alert("15");

    		}
    	});
    	
    
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
});
    
    
    
    
    
    
    
    
    
    
});	   	

	   	
	   	
	   	
	   	
	   	
	   	
	   	
	   	
	   	
	   	
	   	
	   	
	   	
	   	
	   	
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 







</script>















 
</html>










