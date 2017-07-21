<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>You're Not Alone - Home</title>
<meta name="title" content="You're Not Alone. We're Here for You." />
<meta name="description" content="Send the message to students who are bullied that they are not alone. Hold an event in your community or start a classroom discussion. Support, hope and help and things that everyone can do." />
<!-- for Facebook -->          
<meta property="og:title" content="You're Not Alone. We're Here for You." />
<meta property="og:type" content="article" />
<meta property="og:image" content="http://www.pacer.org/bullying/yourenotalone/images/yna-fb.jpg" />
<meta property="og:url" content="http://www.pacer.org/bullying/yourenotalone/" />
<meta property="og:description" content="Send the message to students who are bullied that they are not alone. Hold an event in your community or start a classroom discussion. Support, hope and help and things that everyone can do." />

<link rel="image_src" href="http://www.pacer.org/bullying/images/nbpc-logo.png" />
<link rel="icon" href="http://www.pacer.org/bullying/favicon.ico" />
<link href="/bullying/css/bullying.css" rel="stylesheet" type="text/css" />
<link href="/bullying/wewillgen/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/bullying/css/scrolling.css"/>
<link rel="stylesheet" type="text/css" href="/php-sdk/fbwallfeed.css"/>
<link rel="stylesheet" type="text/css" href="/php-sdk/hashtagAggregator.css"/>
<link href="/js/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/js/LayerSlider/layerslider/css/layerslider.css" type="text/css" />

<!--#include virtual="/bullying/dynamic-head-items.html"-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
if (typeof jQuery == 'undefined')
{
    document.write(unescape("%3Cscript src='/js/jquery-1.7.2.min.js' type='text/javascript'%3E%3C/script%3E"));
}
</script>

<script type="text/javascript" src="/js/jquery.sticky.js"></script>
<script src="/js/colorbox/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="/js/LayerSlider/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="/js/LayerSlider/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#secondarynav").sticky({ topSpacing:0 });

		$('.dash').attr('aria-hidden','true');
		//----------more buttons----------
		$('.morebutton').click(function() {
		//$('.readmore').click(function() {	
			$(this).parent().parent().addClass('expanded');
		});
		$(document).bind('cbox_complete', function(){
		  $("#pledgeformh2").focus();
		});		
		//----------color box pop up window----------		
		$(".inline").colorbox({inline:true, width:"60%", opacity:.5, rel:'group1'});
		$(".toolkit-thumbs").colorbox({inline:true, width:"60%", opacity:.5, rel:'group2'});								
	 });//----------close ready function----------
</script>

<script type="text/javascript">
$(document).ready(function(){
		$('#layerslider').removeClass('loading');
		$('#layerslider').layerSlider({
			skin : 'noskin',
			skinsPath : '/js/LayerSlider/layerslider/skins/',
			//youtubePreview  : 'hqdefault.jpg',
			animateFirstLayer : false,
			navPrevNext : false,
			navStartStop : false,
			autoPlayVideos : false,
			autoPauseSlideshow : true,
			pauseOnHover : false,
			slideDelay : 5000,
			loops : 3
		});
		$(".group1").colorbox({rel:'group1'});
		$(".group2").colorbox({rel:'group2'});		
	});

</script>

<style type="text/css">
.loading ls-layer {
	display: none;
	padding: 5px;
}
#layerslider {
	width: 1024px;
	height: 371px;
}

#bottomContentWrapper {
	margin: 0 auto;
	width: 930px;
}

.bottomContent { padding: 10px 45px; }

#fbfeedheader {
	min-height: 40px;
	padding-bottom: 5px;
	margin-bottom: 5px;
	border-bottom: 1px soild #ccc;
}

#wwghashtagheader {
	position: relative;
	margin-bottom: 5px;
	min-height: 40px;
	padding-bottom: 5px;
}

#wwghashtagheader h2 {
	text-align: center;
	font-weight: bold;
	color: #772828;
	font-size: 1.2em;
	text-shadow: none;
}

#wwghashtagdata { margin-top: 5px; }

#extraSliderNav {
	width: 100%;
	text-align: center;
	padding: 10px;
}

#wwgtwitterhandle {
	position: absolute;
	right: 0px;
	bottom: -15px;
}

#wwginstagramhandle {
	position: absolute;
	left: 0px;
	bottom: -15px;
}

#topheroimage h1 {
	position: relative;
	left:20px;
	top:-120px;
	width: 400px;
	line-height: 1.1em;
	text-align:center;
	font-size:1.2em; 
	color:#000000;
	text-shadow:none;  	
}

#topheroimage .widebutton { position: absolute; }

.row-shadow #message {
	background-image: url('/bullying/wewillgen/images/shadow-bottom.png'), url('/bullying/wewillgen/images/shadow-top.png');
	background-repeat: repeat-x, repeat-x;
	background-position: 0px 50px, left top;
}

#pledgebutton {
	border-radius: 5px;
	color: #343263;
	font-size: 1.3em;
	font-weight: bold;
	min-height: 2em;
}

#pledgebutton:disabled {
	color: #ccc;
	background-color: #eee;
}

#pledgemessage { display: none; }

#flyerbutton {
	display: inline-block;
	text-decoration: none;
	text-align: left;
	width: 140px;
}
.inrow-button {
	width:300px;
	height:185px;
	background-color:#C85024;
	color:#fff;
	text-align:center;
	line-height:1.5;
	padding-top:10px;
	border-radius:7px;
}
.inrow-button p {
	color:#fff;	
	padding-top:10px;		
}
.inrow-button a {
	font-size:1.3em;
	color:#fff;
}
.inrow-button a:hover {
	color:rgba(255,255,255,0.50)
}
#gallery {
	text-align:center;
}
#gallery img {
	margin: 0px 4px 4px;
	box-shadow: 2px 2px 3px #333;
}
.justifiedlist li p {
	padding-left:45px;	
}
.justifiedlist li.sponsor-dash {
	width:5px;
	height:200px;
	position:absolute;
	background:url(/bullying/images/styles/verticledots.jpg) top repeat-y;
}
.sponsor-box {
	width:620px;
	height:230px;
	background-color:#fff;
	color:#C85024;
	text-align:center;
	padding-top:20px;
	border-radius:7px;	
}

.expanded #readmore {
	display:none;
}

#secondarynav ul {
	width:700px;
}
	
a.continuereading {
	background:url(/bullying/images/styles/whitearrow.png) no-repeat right;
}
a.continuereading:hover {
	color: rgba(255,255,255,.5);
	background:url(/bullying/images/styles/whitearrowhover.png) no-repeat right;
}	

#toolkit-order-btn {
	width: 170px;
	text-align: center;
	margin:20px auto;
	background-color:#c85024;
	border-radius: 7px;
	padding: 5px 0;
}
	
#toolkit-order-btn a {	
	color: #fff;
}
	
#toolkit-order-btn a:hover {	
	color:rgba(255,255,255,0.50);
}	
</style>
</head>

<body>

<a id="skiptocontent" href="#maincontent">Skip to main content</a>

<div class="container">

<!--#include virtual="/bullying/dynamic-header.html"--> 
<!--#include virtual="/bullying/topnav.html"-->

<div class="content"> <a href="#" id="youre-not-alone" class="contentrow-anchor" aria-hidden="true"></a>


  <!--<%'----------------------------------- START LAYER SLIDER -------------------------------------- %>-->
  <div id="layerslider" class="loading">
    <div id="banner1" class="ls-layer" rel="slidedirection: left;">
     	<img src="/bullying/yourenotalone/images/yna-banner1.jpg" alt="" width="1024" height="371" class="ls-bg" rel="delayIn: 0;"/>
    </div>
    
    <div id="banner2" class="ls-layer" rel="slidedirection: left;"> 
    	<img src="/bullying/yourenotalone/images/yna-banner2.jpg" alt="" width="1024" height="371" class="ls-bg" rel="delayIn: 0;"/> 
    </div>
    
    <div id="banner3" class="ls-layer" rel="slidedirection: left;">
    	<img src="/bullying/yourenotalone/images/yna-banner3.jpg" alt="" width="1024" height="371" class="ls-bg" rel="delayIn: 0;"/>
    </div>   

  </div>
  
	<div id="secondarynav" style="border-top:solid 1px #ccc" class="whitenav" role="navigation"> <a href="/bullying/"><img id="navlogo" src="/bullying/images/styles/navLogo.png" width="40" height="40" alt="NBPC Homepage" /></a>
		<ul class="justifiedlist">
			<li id="spynav-1"><a href="#youre-not-alone">PACER's You're Not Alone&reg;</a></li>
			<li class="dash"></li>
			<li id="spynav-3"><a href="/bullying/yourenotalone/event-toolkit.asp">Event Toolkit</a></li>
			<li class="dash"></li>
			<li id="spynav-4"><a href="#be-there">Ways to Be There</a></li>
		</ul>
	</div>


<!--*********************************   Together Against Bullying   *********************************-->

<div id="stand-together" class="contentrow row-orange row-shadow" style="height: 275px"> <a href="#" id="stand-together" class="contentrow-anchor" aria-hidden="true"></a>			
	<div class="addthis_sharing_toolbox"></div><div class="sharethis" style="float:right; width:3em;">Share:</div>
			<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-53729684589714e1" async="async"></script>	
	
		<div class="singlecolumn" style="clear:right">
			<h2 style="font-size:30px">Unite Together Against Bullying</h2>
			<p style="font-size:17px;">Creating communities that are together against bullying—and united to provide kindness, support and hope for those who have experienced bullying, through conversation, education and inspiration. <span class="expanded" id="readmore">Read more >>></span> 
			<!--<a href="" class="readmore">Read more >>></a></p> -->
			<p>PACER&rsquo;s You&rsquo;re Not Alone&reg; gives students, adults and communities ideas how they can help so that:</p>
			<ul>
				<li>No student ever feels that they are all alone</li>
				<li>Everyone has ideas on how they can provide support, kindness and hope to those that are bullied</li>
			</ul>

			<p>Students who are bullied often report that they feel like:</p>
			<ul>
				<li>no one understands what they are going through,</li>
				<li>no matter what they do, the bullying will never stop, and</li>
				<li>that they feel like no one cares, that they are all alone.</li>
			</ul>
			<p>Think about how it must feel for someone being bullied, when everyone around you looks the other way, ignores you, and maybe even sides with the person who is hurting you. Think about how it would be to think that there is no way to change what is happening to you. When you’re the one being bullied, it's hard to believe in yourself, it's hard to see that life will ever be any different. That's a lonely place to be.</p>
			<p>Imagine how all that can be different. Imagine if those that witness bullying, whether it’s another student, a parent, an educator, or community member sent the powerful message that they are there for those who are being bullied. Imagine that reach out and provide kindness, support and hope. Imagine during those times when someone experiences the pain of being bullied that knew that they are not alone. You can be that person and you can also encourage others to be there. Together we can unite against bullying, share the common message, that all students have the right to feel safe and included. Together, we can change what has happened to so many for so long.</p>	
			
<div class="morebutton" id="intromessagebutton">	<div></div></div>			

		</div>		
</div>	

<!--*********************************   Toolkits   *********************************-->

<div id="toolkits" class="contentrow row-white red spyitem"> <a href="#" id="toolkits" class="contentrow-anchor" aria-hidden="true"></a>	
	<div class="singlecolumn">
		<h2 style="font-size:30px">Order the Community Event Toolkit</h2>
		<p>Activities, information, and giveaways for holding a public event at school or in the community. This toolkit, <strong>which sells for $75</strong>, provides adults or students with everything needed to bring awareness of how everyone can play a role in preventing bullying in their school or community. This is a creative way to educate and inspired students, adults and community members that support, kindness and hope are something everyone can give!</p>		
		<div id="toolkit-order-btn">
			<a href="/bullying/yourenotalone/event-toolkit.asp">ORDER THE TOOLKIT</a>
		</div>
		<div style="width:430px; margin: 0 auto;">	
			<a href="/bullying/yourenotalone/images/ynaEventTable.jpg"><img src="/bullying/yourenotalone/images/ynaEventTable.jpg" width="430" height="400" alt=""/>
		</div>	  
	</div>			
</div>				
			
<!--*********************************   Ways to Be There   *********************************-->			
			
<div id="be-there" class="contentrow row-bluewhite row-shadow"> <a href="#" id="be-there" class="contentrow-anchor" aria-hidden="true"></a>
	<div class="singlecolumn">
		<h2 style="font-size:30px; line-height: 40px">Learn Ways to "Be There"</h2>
		<p>Ideas on how adults, community members and young people can send the powerful message to students who are experiencing bullying or who are vulnerable to hurt or harm that that &quot;we’re here for you.&quot;</p>
		<p>Note: Printed copies of “Ways to Be There” are available in the school and event toolkits.</p>
	</div>

		<ul class="justifiedlist imagethumblist threecollist" style="text-align:center">
			<li style="min-height:350px;"> <img src="/bullying/yourenotalone/images/asAnAdult.png" width="150" height="150" alt=""/>
				<h3>As an Adult</h3>
				<p>Listening, giving advice, and being supportive are important steps in addressing bullying.</p>
				<p><a href="/bullying/yourenotalone/bethere-adult.asp" class="continuereading">continue reading<span class="extralinktext">about we will reach out, being them up</span></a></p>
			</li>
			<li class="dash"></li>
			<li style="min-height:350px;"> <img src="/bullying/yourenotalone/images/asATeen.png" width="150" height="150" alt=""/>
				<h3>As a Kid or Teen</h3>
				<p>Bullying--it's an issue affecting your peers--and you can be the solution.</p>
				<p><a href="/bullying/yourenotalone/bethere-kid.asp" class="continuereading">continue reading<span class="extralinktext">about we will reach out, turn a 180</span></a></p>
			</li>
			<li class="dash"></li>
			<li style="min-height:350px;"> <img src="/bullying/yourenotalone/images/asACommunity.png" width="150" height="150" alt=""/>
				<h3>In the Community</h3>
				<p>Everyone deserves to be safe at school, online, and where they live.</p>
				<p><a href="/bullying/yourenotalone/bethere-community.asp" class="continuereading">continue reading<span class="extralinktext">about we will reach out, turn a 180</span></a></p>
			</li>
		</ul>
</div>

	<br class="clearfloat" />
	
	<!-- end .content --> 
</div>
<!--#include virtual="/bullying/yourenotalone/footer.html"--> 
<!-- end .container -->
</div>
</body>
</html>
