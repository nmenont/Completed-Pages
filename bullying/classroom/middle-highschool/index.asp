<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Elementary Toolkits - National Bullying Prevention Center</title>
<!--<meta name="description" content="Free, downloadable toolkits designed for students adn community members to hold events, raise awareness and share information about bullying prevention. 
" />-->

<link rel="icon" href="http://www.pacer.org/bullying/favicon.ico" />
<link href="/bullying/css/bullying.css" rel="stylesheet" type="text/css" />
<!--#include virtual="/bullying/dynamic-head-items.html"--></head>

<body class="twocol">
<div class="container">
<a id="skiptocontent" href="#maincontent">Skip to main content</a>
 
  <!--#include virtual="/bullying/dynamic-header.html"--> 
  <!--#include virtual="/bullying/topnav.html"--> 
  
  <script type="text/javascript">
	var navId="none";
	if (document.getElementById(navId)){
		document.getElementById(navId).className = document.getElementById(navId).className+" active";
	}
</script>
  <div class="breadcrumb"> <a href="/bullying/">Home</a> / <a href="/bullying/resources/">Classroom</a> /</div>
  
  <!-- ######################### NAVIGATION ################################# -->
  <div class="sidebar1"> 
  <!--#include virtual="/bullying/classroom/nav.html"--> 
  <script type="text/javascript">
	// ID and SubId to be Orange
	var currId="mid";	
	var showTree = "mid-sub";
	var showTree2 = "none";
	if (document.getElementById(currId)){
document.getElementById(currId).className = "active";
	}
	var subTrees = document.getElementsByTagName("ul");
	for (var i = 0; i < subTrees.length; i++) {
		if (subTrees[i].className == "submenu") {
			if (subTrees[i].id != showTree && subTrees[i].id != showTree2) {
				subTrees[i].className = "submenuhidden";
			}
		}
	}
</script> 
</div>
  <!-- ###################### END Navigation ############################## -->
  
  <div class="content"> 
  <h1 id="maincontent">Middle and High School Toolkits</h1>
  <ul>
  <img class="fltrt" src="/bullying/classroom/images/high-school-circle.jpg" width="330" height="330" alt=""/>
  <li><a href="/bullying/classroom/middle-highschool/mh-starting-the-discussion.asp">Middle and High School School, Starting the Discussion</a>
    <p>Comprehensive five lesson classroom toolkit. Whether you have just a few minutes or you can devote 15 to 30 minutes a day to this important issue, you�ll find everything you need�relevant education, downloadable materials and interesting activities.</p>  
    </li>
  <li><a href="/bullying/classroom/middle-highschool/mh-video-discussion.asp">Middle and High School School, Video and Discussion Questions</a>
    <p><em>Teen Talk on Cyberbullying</em> is a five-minute video designed to provide authentic insight and perspective from peers on issues related to cyberbullying. Watch the video with students and follow up with suggested discussion questions.</p>  
    </li>
    <li><a href="/bullying/pledge/#hold-a-pledge-event">Hold a Pledge Signing Event</a>
		<p>Take the online <a href="/bullying/pledge/#hold-a-pledge-event" >&ldquo;Together Against Bullying&rdquo;</a> pledge or set up a table at your school where students can sign paper copies of the pledge.  </p> 
  </li>
   <li><a href="/bullying/classroom/middle-highschool/student/index.asp">Student Created Toolkits</a>
      <p>Age appropriate resources created by students that are designed for students. These activities express viewpoints that are shown through the mediums of art, music, and videos, which are supplemented with classroom discussion questions.</p> 
  </li>

  <li><a href="/bullying/classroom/middle-highschool/bullies-bystanders.asp">Bullies and Bystanders</a>
    <p>View these two beautifully crafted videos �Bullies and Bystanders: What Teens Say and What Experts Say,� created by BeSmartBeWell that provide insight into how peers can play a powerful role in addressing and preventing bullying.</p> 
  </li>
  <li><a href="/bullying/resources/sites-for-kids-and-teens.asp#teens">Teens Against Bullying Website</a>
    <p>Created with teens for teens, this audience relevant website is a place for middle and high school students to find ways to address bullying, to take action, to be heard, and to own an important social cause.</p>
  </li>
  
  </ul>
  <br class="clearfloat" />
  
  <!-- end .content --></div>
  <!--#include virtual="/bullying/footer.html"--> 
  <!-- end .container --></div>
</body>
</html>
