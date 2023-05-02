<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>School of Research & Technology</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style>
		b {
    font-size: xxx-large;
}
strong, b {
    color: #fff;
    font-weight: bold;
}
		</style>
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<!-- <a href="index.html" class="logo"><strong> Rabecca Fatima</strong></a> -->
					<nav id="nav">
					 <div class="w3-bar w3-black">
    <a href="AddNewStudent.jsp"class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'London')">Add New Student</a>
      <a href="CourseBranch.jsp"class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'London')">Add New Course</a>
      <a href="branch.jsp"class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'London')">Add New Branch</a>
  
       <a href="adminLogin.html" class="w3-bar-item w3-button tablink" onclick="openCity(event,'Paris')">Insert New Result  </a> 
        
      <a href="DisplayStudents.jsp" class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo')">Registered Students  </a> 
       <a href="adminLogin.html" class="w3-bar-item w3-button tablink" onclick="openCity(event,'Tokyo1')">All Student Result  </a> 
        <a href="adminLogin.html" class="w3-bar-item w3-button tablink">Logout</a>
  </div>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
				<header>
					<b><%@include file="usercheck.jsp"%></b>
</header>
					<div class="flex ">

						
					</div>

				</div>
			</section>
						
					


		<!-- Three -->
			<section id="three" class="wrapper align-center">
				<div class="inner">
					<div class="flex flex-2">
						<!--  <article>
							<div class="image round">
								<img src="apj sir1.png" alt="Pic 01" />
							</div>
							<header>
								<h3>Dr. A.P.J. Abdul Kalam</h3>
							</header>
							<p>A.P.J. Abdul Kalam, in full Avul Pakir Jainulabdeen Abdul Kalam, (born October 15, 1931, Rameswaram, India—died July 27, 2015, Shillong), Indian scientist and politician who played a leading role in the development of India's missile and nuclear weapons programs. He was president of India from 2002 to 2007.</p>
							
						</article>-->
						<article>
							<div class="image round">
								<img src="peoples.jpeg" alt="Pic 02" />
							</div>
							<header>
								<h3>About Our College</h3>
							</header>
							<p>School of Research & Technology, engineering college of People’s University, is amongst the Top 10 Engineering Colleges of Madhya Pradesh (MP) and the best Engineering Colleges of Bhopal. Established in 2007-08, SORT is recognized/approved by All India Council of Technical Education (AICTE), and also has an ISO Certification. With a vision to create a quality learning environment, SORT has swiftly ascended to the position of Top Engineering College in MP. We are committed to provide world-class, highly-compatible, well-groomed, skilled technocrats to meet the global need. We believe in nurturing our future engineers in such a manner that they develop their personalities along with enhancing the values of teamwork and efforts. We provide diverse curricula to our students to enhance their imagination, talent, creativity, and skills. Young engineers are the entrepreneurs of the future, we provide them appropriate environment of research and technology to thrive their quest of innovation. We are establishing high standards in the different fields of Engineering by providing exceptional technical education and upholding the ethical and professional standards.</p>
							
						</article>
					</div>
				</div>
			</section>


		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
 <hr class="new1">
<center><h1>All Right Reserved @ Rabecca Fatima :: 2022-2025</h1></center> 
	</body>
</html>