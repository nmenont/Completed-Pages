<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/Connections/PACER_WEB.asp" -->
<%

function RoundUp(a)
	RoundUp = int(a+(abs(fix(a)<>a)))
end Function



Dim rs
Dim rs_cmd
Dim rs_numRows

Set rs_cmd = Server.CreateObject ("ADODB.Command")
rs_cmd.ActiveConnection = MM_PACER_WEB_STRING
rs_cmd.CommandText = "SELECT * FROM pacerNews WHERE posted_date > DATEADD(month, -12, GETDATE()) ORDER BY posted_date DESC" 
rs_cmd.Prepared = true

Set rs = rs_cmd.Execute
rs_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 10
Repeat1__index = 0
rs_numRows = rs_numRows + Repeat1__numRows
%>
<%
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim rs_total
Dim rs_first
Dim rs_last

' set the record count
rs_total = rs.RecordCount

' set the number of rows displayed on this page
If (rs_numRows < 0) Then
  rs_numRows = rs_total
Elseif (rs_numRows = 0) Then
  rs_numRows = 1
End If

' set the first and last displayed record
rs_first = 1
rs_last  = rs_first + rs_numRows - 1

' if we have the correct record count, check the other stats
If (rs_total <> -1) Then
  If (rs_first > rs_total) Then
    rs_first = rs_total
  End If
  If (rs_last > rs_total) Then
    rs_last = rs_total
  End If
  If (rs_numRows > rs_total) Then
    rs_numRows = rs_total
  End If
End If
%>
<%
' *** Recordset Stats: if we don't know the record count, manually count them

If (rs_total = -1) Then

  ' count the total records by iterating through the recordset
  rs_total=0
  While (Not rs.EOF)
    rs_total = rs_total + 1
    rs.MoveNext
  Wend

  ' reset the cursor to the beginning
  If (rs.CursorType > 0) Then
    rs.MoveFirst
  Else
    rs.Requery
  End If

  ' set the number of rows displayed on this page
  If (rs_numRows < 0 Or rs_numRows > rs_total) Then
    rs_numRows = rs_total
  End If

  ' set the first and last displayed record
  rs_first = 1
  rs_last = rs_first + rs_numRows - 1
  
  If (rs_first > rs_total) Then
    rs_first = rs_total
  End If
  If (rs_last > rs_total) Then
    rs_last = rs_total
  End If

End If
%>
<%
Dim MM_paramName 
%>
<%
' *** Move To Record and Go To Record: declare variables

Dim MM_rs
Dim MM_rsCount
Dim MM_size
Dim MM_uniqueCol
Dim MM_offset
Dim MM_atTotal
Dim MM_paramIsDefined

Dim MM_param
Dim MM_index

Set MM_rs    = rs
MM_rsCount   = rs_total
MM_size      = rs_numRows
MM_uniqueCol = ""
MM_paramName = ""
MM_offset = 0
MM_atTotal = false
MM_paramIsDefined = false
If (MM_paramName <> "") Then
  MM_paramIsDefined = (Request.QueryString(MM_paramName) <> "")
End If
%>
<%
' *** Move To Record: handle 'index' or 'offset' parameter

if (Not MM_paramIsDefined And MM_rsCount <> 0) then

  ' use index parameter if defined, otherwise use offset parameter
  MM_param = Request.QueryString("index")
  If (MM_param = "") Then
    MM_param = Request.QueryString("offset")
  End If
  If (MM_param <> "") Then
    MM_offset = Int(MM_param)
  End If

  ' if we have a record count, check if we are past the end of the recordset
  If (MM_rsCount <> -1) Then
    If (MM_offset >= MM_rsCount Or MM_offset = -1) Then  ' past end or move last
      If ((MM_rsCount Mod MM_size) > 0) Then         ' last page not a full repeat region
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While ((Not MM_rs.EOF) And (MM_index < MM_offset Or MM_offset = -1))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
  If (MM_rs.EOF) Then 
    MM_offset = MM_index  ' set MM_offset to the last possible record
  End If

End If
%>
<%
' *** Move To Record: if we dont know the record count, check the display range

If (MM_rsCount = -1) Then

  ' walk to the end of the display range for this page
  MM_index = MM_offset
  While (Not MM_rs.EOF And (MM_size < 0 Or MM_index < MM_offset + MM_size))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend

  ' if we walked off the end of the recordset, set MM_rsCount and MM_size
  If (MM_rs.EOF) Then
    MM_rsCount = MM_index
    If (MM_size < 0 Or MM_size > MM_rsCount) Then
      MM_size = MM_rsCount
    End If
  End If

  ' if we walked off the end, set the offset based on page size
  If (MM_rs.EOF And Not MM_paramIsDefined) Then
    If (MM_offset > MM_rsCount - MM_size Or MM_offset = -1) Then
      If ((MM_rsCount Mod MM_size) > 0) Then
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' reset the cursor to the beginning
  If (MM_rs.CursorType > 0) Then
    MM_rs.MoveFirst
  Else
    MM_rs.Requery
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While (Not MM_rs.EOF And MM_index < MM_offset)
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
End If
%>
<%
' *** Move To Record: update recordset stats

' set the first and last displayed record
rs_first = MM_offset + 1
rs_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (rs_first > MM_rsCount) Then
    rs_first = MM_rsCount
  End If
  If (rs_last > MM_rsCount) Then
    rs_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
<%
' *** Go To Record and Move To Record: create strings for maintaining URL and Form parameters

Dim MM_keepNone
Dim MM_keepURL
Dim MM_keepForm
Dim MM_keepBoth

Dim MM_removeList
Dim MM_item
Dim MM_nextItem

' create the list of parameters which should not be maintained
MM_removeList = "&index="
If (MM_paramName <> "") Then
  MM_removeList = MM_removeList & "&" & MM_paramName & "="
End If

MM_keepURL=""
MM_keepForm=""
MM_keepBoth=""
MM_keepNone=""

' add the URL parameters to the MM_keepURL string
For Each MM_item In Request.QueryString
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepURL = MM_keepURL & MM_nextItem & Server.URLencode(Request.QueryString(MM_item))
  End If
Next

' add the Form variables to the MM_keepForm string
For Each MM_item In Request.Form
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepForm = MM_keepForm & MM_nextItem & Server.URLencode(Request.Form(MM_item))
  End If
Next

' create the Form + URL string and remove the intial '&' from each of the strings
MM_keepBoth = MM_keepURL & MM_keepForm
If (MM_keepBoth <> "") Then 
  MM_keepBoth = Right(MM_keepBoth, Len(MM_keepBoth) - 1)
End If
If (MM_keepURL <> "")  Then
  MM_keepURL  = Right(MM_keepURL, Len(MM_keepURL) - 1)
End If
If (MM_keepForm <> "") Then
  MM_keepForm = Right(MM_keepForm, Len(MM_keepForm) - 1)
End If

' a utility function used for adding additional parameters to these strings
Function MM_joinChar(firstItem)
  If (firstItem <> "") Then
    MM_joinChar = "&"
  Else
    MM_joinChar = ""
  End If
End Function
%>
<%
' *** Move To Record: set the strings for the first, last, next, and previous links

Dim MM_keepMove
Dim MM_moveParam
Dim MM_moveFirst
Dim MM_moveLast
Dim MM_moveNext
Dim MM_movePrev

Dim MM_urlStr
Dim MM_paramList
Dim MM_paramIndex
Dim MM_nextParam

MM_keepMove = MM_keepBoth
MM_moveParam = "index"

' if the page has a repeated region, remove 'offset' from the maintained parameters
If (MM_size > 1) Then
  MM_moveParam = "offset"
  If (MM_keepMove <> "") Then
    MM_paramList = Split(MM_keepMove, "&")
    MM_keepMove = ""
    For MM_paramIndex = 0 To UBound(MM_paramList)
      MM_nextParam = Left(MM_paramList(MM_paramIndex), InStr(MM_paramList(MM_paramIndex),"=") - 1)
      If (StrComp(MM_nextParam,MM_moveParam,1) <> 0) Then
        MM_keepMove = MM_keepMove & "&" & MM_paramList(MM_paramIndex)
      End If
    Next
    If (MM_keepMove <> "") Then
      MM_keepMove = Right(MM_keepMove, Len(MM_keepMove) - 1)
    End If
  End If
End If

' set the strings for the move to links
If (MM_keepMove <> "") Then 
  MM_keepMove = Server.HTMLEncode(MM_keepMove) & "&"
End If

MM_urlStr = Request.ServerVariables("URL") & "?" & MM_keepMove & MM_moveParam & "="

MM_moveFirst = MM_urlStr & "0"
MM_moveLast  = MM_urlStr & "-1"
MM_moveNext  = MM_urlStr & CStr(MM_offset + MM_size)
If (MM_offset - MM_size < 0) Then
  MM_movePrev = MM_urlStr & "0"
Else
  MM_movePrev = MM_urlStr & CStr(MM_offset - MM_size)
End If
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="Read the latest bullying articles, legislation for disability acts and many more parent support and child development articles related to PACER. Also, follow us on twitter at #PACERCenter
" />
<meta name="keywords" content="bullying articles, disability act news, anti bullying news, children with disabibilities, special needs children, teen bullying, parent programs, parents of disabled child, child development, blind deaf autistic children education programs, pacer center, pacer org
" />
<title>PACER Center related News, Events about Bullying, Disability Acts and more</title>
<link rel="shortcut icon" href="http://www.pacer.org/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/css/stylenewsevents.css" media="screen, projection" />
<link rel="stylesheet" type="text/css" href="/css/print.css" media="print" />
<script type="text/javascript" src="/css/menu.js"></script>
<script type="text/javascript">
<!--
function wopen(url, name, w, h)
{
// Fudge factors for window decoration space.
 // In my tests these work well on all platforms & browsers.
w += 32;
h += 96;
 var win = window.open(url,
 name, 
 'width=' + w + ', height=' + h + ', ' +
 'location=no, menubar=no, ' +
 'status=no, toolbar=no, scrollbars=yes, resizable=yes');
 win.resizeTo(w, h);
 win.focus();
}
// -->
</script>
</head>

<body>
<div id="skiptocontent"> <a href="#maincontent">Skip to main content</a> </div>
<div id="wrapper">
 <div id="main">
 <div id="header">
 <div> <!--#include virtual="/googleSearchBox.htm"--> 
 <!-- Contains Contact Pacer | Donate | Google search bar | Social media --> 
 <a href="/"><img src="/images/pacerLogo.gif" alt="PACER Center Logo: Champions for Children with Disabilities" class="logoImg" /></a> </div>
 <!--#include virtual="/dynamicheader.htm"--> 
 </div>
 <div id="maincontent">
 <div id="pagetoporange">
 <div class="printemail">
 <p> <img src="../css/printicon.gif" width="15" height="14" alt="" /><a href="javascript:window.print()">Print page</a> </p>
 </div>
 <div id="breadcrumb"> <a href="/" title="PACER's home page">Home</a> / News &amp; Events
 <h1 class="nounderline"><a name="maincontent">News &amp; Events</a></h1>
 </div>
 </div>
 
 <!--BEGIN CONTENT-->
 
 <table id="newsworkshops" width="100%">
 <tr>
 <td style="border-right: solid 3px #eee;">
 <table id="topcontent" width="100%"><tr><td>
 
 <!-- Legend Table Info -->
 
 <div style="width:340px; margin:5px;" id="legend">
  <table width="340">
  <caption>
  <strong>News Color Codes </strong>
  </caption>
  <tr>
  <td><div class="screenReaderText">Orange Border</div>
  <div class="smallBox media">&nbsp;</div></td>
  <td> PACER Media Coverage / Featured Articles </td>
  </tr><tr>
  <td><div class="screenReaderText">Green Border</div>
  <div class="smallBox related">&nbsp;</div></td>
  <td> Related News Event </td>
  </tr><tr>
  <td><div class="screenReaderText">Blue Border</div>
  <div class="smallBox web">&nbsp;</div></td>
  <td> PACER.org Website feature </td>
  </tr>
  </table>
 </div>
 
 <!-- END LEGEND TABLE -->
 
 </td><td>
 
 
 
 <div class="fltrt" style="width:375px;">
  <table border="0" cellpadding="5" align="right" class="datasetnav">
  <tr>
  <td align="right" colspan="4"><strong>Page <%=cInt(rs_last / 10)%> of <%=RoundUp(rs_total / 10)%>
	</strong></td></tr>
    <tr>
    <td><% If MM_offset <> 0 Then %>
        <a href="<%=MM_moveFirst%>">First</a>
        <% Else %>
        <span style="color:#ccc">First</span>
        <% End If ' end MM_offset <> 0 %></td>
    <td><% If MM_offset <> 0 Then %>
        <a href="<%=MM_movePrev%>">Previous</a>
        <% Else %>
        <span style="color:#ccc">Previous</span>
        <% End If ' end MM_offset <> 0 %></td>
    <td><% If Not MM_atTotal Then %>
        <a href="<%=MM_moveNext%>">Next</a>
        <% Else %>
        <span style="color:#ccc">Next</span>
        <% End If ' end Not MM_atTotal %></td>
    <td><% If Not MM_atTotal Then %>
        <a href="<%=MM_moveLast%>">Last</a>
        <% Else %>
        <span style="color:#ccc">Last</span>
        <% End If ' end Not MM_atTotal %></td>
  </tr></table>
  <div style="text-align:right; padding-top:20px; clear:right">
  <a href="/about/pressroom.asp">Visit the Pressroom for the Latest Press Releases</a>
  </div>
  </div>
 </td></tr></table>
 

 </td>
  <td style="background:#eee; border-left:solid 3px #eee"><img src="images/news-workshops.jpg" width="100%" alt="" /></td> 
 </tr>
 <tr>
 <td style="border-right: solid 3px #eee;">
 
 
 <!--BEGIN CONTENT--> 
 




<div id="newsitems">
  <% 
While ((Repeat1__numRows <> 0) AND (NOT rs.EOF)) 
%>


<h3 class="<%=(rs.Fields.Item("type").Value)%>" id="nw<%=(rs.Fields.Item("ID").Value)%>"><%=(rs.Fields.Item("heading").Value)%></h3>
<%If Len(rs.Fields.Item("story_image").Value) > 0 Then%>
	<img src="<%=rs.Fields.Item("story_image").Value%>" width="200" alt="" class="fltrt" style="margin-bottom:10px;" />
<%End If%>
<p class="date">Posted: <%=FormatDateTime(rs.Fields.Item("posted_date").Value, 2)%></p>
<%
  If Len(rs.Fields.Item("long_blurb").Value) > 0 Then
	Response.Write(rs.Fields.Item("long_blurb").Value)
  ElseIf Len(rs.Fields.Item("blurb").Value) > 0 Then
    Response.Write(rs.Fields.Item("blurb").Value)
  End If
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  rs.MoveNext()
Wend
%>
</div>



<table border="0" class="datasetnav" style="margin:10px auto">
  <tr><td colspan="4" align="center">Page <%=cInt(rs_last / 10)%> of <%=RoundUp(rs_total / 10)%>
</td></tr>
<tr>
    <td><% If MM_offset <> 0 Then %>
        <a href="<%=MM_moveFirst%>">First</a>
        <% Else %>
        <span style="color:#ccc">First</span>
        <% End If ' end MM_offset <> 0 %></td>
    <td><% If MM_offset <> 0 Then %>
        <a href="<%=MM_movePrev%>">Previous</a>
        <% Else %>
        <span style="color:#ccc">Previous</span>
        <% End If ' end MM_offset <> 0 %></td>
    <td><% If Not MM_atTotal Then %>
        <a href="<%=MM_moveNext%>">Next</a>
        <% Else %>
        <span style="color:#ccc">Next</span>
        <% End If ' end Not MM_atTotal %></td>
    <td><% If Not MM_atTotal Then %>
        <a href="<%=MM_moveLast%>">Last</a>
        <% Else %>
        <span style="color:#ccc">Last</span>
        <% End If ' end Not MM_atTotal %></td>
  </tr>
</table>









 
 <!-- ##################################################### END OF CURRENT NEWSLINES ##################################################################################################################### -->
</td> 
 <td style="width:300px; border-left: solid 3px #eee;"><%
		Dim ConStr, rsWorkshop, conn, sql, i
	
		ConStr = "Provider=SQLOLEDB.1;Data Source=PACER2; Initial Catalog=PACER_WEB;Network=DBMSSOCN; User Id=test;Password=test"
		sql = "SELECT * FROM Workshops WHERE workshop_date >= getdate() AND workshop_workshop = 'yes' ORDER BY workshop_date"
		Set conn = Server.CreateObject("ADODB.Connection")
		conn.open ConStr
		set rsWorkshop = conn.execute(sql)
		%>
 <h2 style="margin-bottom: .5em; padding-bottom: 0;">Upcoming Workshops</h2>
 <table cellpadding="0" cellspacing="0">
  <%
		i=0
		rsWorkshop.movefirst
		do until i=9
			if not rsWorkshop.eof then
				if isnull(rsWorkshop("workshop_closed")) or rsWorkshop("workshop_closed") = "" then
				%>
					<tr>
						<td width="2%"><p style="padding: 0; margin: 0;"> <strong><%=rsWorkshop("workshop_date")%></strong> </p></td>
						<td>
							<%if rsWorkshop("workshop_link") <> "" then%>
								<p><strong><a href="<%=rsWorkshop("workshop_link")%>"><%=rsWorkshop("workshop_name")%></a></strong>
							<%else%>
								<p><strong><a href="/forms/workshops.asp?wksp=<%=rsWorkshop("workshop_id")%>"><%=rsWorkshop("workshop_name")%></a></strong>
							<%end if%>
							<%if rsWorkshop("workshop_flyer") <> "" then%>
								(<a href="../workshops/flyer/<%=rsWorkshop("workshop_flyer")%>">see flyer</a> <img src="../images/pdficon_small.gif" width="15" height="15" alt="pdf icon" />)
							<%end if%>
							<br />
							<%=rsWorkshop("workshop_time")%><br />
							<em><%=rsWorkshop("workshop_location")%></em> </p>
						</td>
					</tr>
				<%
					
				end if
			rsWorkshop.movenext
			end if
			i=i+1
		loop
		%>
 </table>
 <p class="topborder" style="padding-top: 1em;"> <a href="../workshops/">View more workshops</a> </p>
 <div style="font-size:16px; padding-top:10px; margin-top:10px; border-top:1px solid #666">
			<!--#include virtual="/sidebar-items/survey-monkey.asp" -->
			</div>
 </td>
 </tr>
 </table>
 
 </div>
 
 <!--END CONTENT--> 
 
 </div>
 
 <!--#include virtual="/footer.htm"--> 
 
</div>

<%
rsWorkshop.Close()
Set rsWorkshop = Nothing

rs.Close()
Set rs = Nothing
%>


</body>
</html>