<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>  
<head>  
 <title>First jQuery Example</title>  
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">  
 </script>  
 <script type="text/javascript" language="javascript">  
 $(document).ready(function() {  
 $("p").css("background-color", "cyan");  
 });  
 </script>  
 </head>  
<body>  
<p>The first paragraph is selected.</p>  
<p>The second paragraph is selected.</p>  
<p>The third paragraph is selected.</p>  
</body>  
</html>  