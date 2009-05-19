<html>
	<head>
		<title>Steve Good's Portfolio</title>
		
		<!--- Scripts --->
		<script src="/js/jquery-1.3.2.min.js" type="text/javascript"></script>
		<script src="/js/jquery-ui-1.7.custom.min.js" type="text/javascript"></script>
		<script src="/js/main.js" type="text/javascript"></script>
		<script src="/js/AC_OETags.js" language="javascript"></script>
		<!--  BEGIN Browser History required section -->
		<script src="history/history.js" language="javascript"></script>
		<!--  END Browser History required section -->
		<script language="JavaScript" type="text/javascript">
		<!--
		// -----------------------------------------------------------------------------
		// Globals
		// Major version of Flash required
		var requiredMajorVersion = 9;
		// Minor version of Flash required
		var requiredMinorVersion = 0;
		// Minor version of Flash required
		var requiredRevision = 124;
		// -----------------------------------------------------------------------------
		// -->
		</script>
		
		
		<!--- CSS --->
		<!-- Framework CSS -->
		<link rel="stylesheet" href="/css/blueprint/screen.css" type="text/css" media="screen, projection">
		<link rel="stylesheet" href="/css/blueprint/print.css" type="text/css" media="print">
	 	<!--[if IE]><link rel="stylesheet" href="/css/blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->
		<!-- Import fancy-type plugin for the sample page. -->
		<link rel="stylesheet" href="/css/blueprint/plugins/fancy-type/screen.css" type="text/css" media="screen, projection">
		<link rel="stylesheet" href="/css/black-tie/jquery-ui-1.7.custom.css" media="screen, projection" />
		<link rel="stylesheet" href="/css/main.css" media="screen, projection">
	</head>
	<body>
	
	<div id="header" class="container">
		<script language="JavaScript" type="text/javascript">
		<!--
		// Version check for the Flash Player that has the ability to start Player Product Install (6.0r65)
		var hasProductInstall = DetectFlashVer(6, 0, 65);
		
		// Version check based upon the values defined in globals
		var hasRequestedVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);
		
		if ( hasProductInstall && !hasRequestedVersion ) {
			// DO NOT MODIFY THE FOLLOWING FOUR LINES
			// Location visited after installation is complete if installation is required
			var MMPlayerType = (isIE == true) ? "ActiveX" : "PlugIn";
			var MMredirectURL = window.location;
		    document.title = document.title.slice(0, 47) + " - Flash Player Installation";
		    var MMdoctitle = document.title;
		
			AC_FL_RunContent(
				"src", "/swf/playerProductInstall",
				"FlashVars", "MMredirectURL="+MMredirectURL+'&MMplayerType='+MMPlayerType+'&MMdoctitle='+MMdoctitle+"",
				"width", "950",
				"height", "75",
				"align", "middle",
				"id", "portfolioHeader",
				"quality", "high",
				"bgcolor", "#000000",
				"name", "portfolioHeader",
				"allowScriptAccess","sameDomain",
				"type", "application/x-shockwave-flash",
				"pluginspage", "http://www.adobe.com/go/getflashplayer"
			);
		} else if (hasRequestedVersion) {
			// if we've detected an acceptable version
			// embed the Flash Content SWF when all tests are passed
			AC_FL_RunContent(
					"src", "/swf/portfolioHeader",
					"width", "950",
					"height", "75",
					"align", "middle",
					"id", "portfolioHeader",
					"quality", "high",
					"bgcolor", "#000000",
					"name", "portfolioHeader",
					"allowScriptAccess","sameDomain",
					"type", "application/x-shockwave-flash",
					"pluginspage", "http://www.adobe.com/go/getflashplayer"
			);
		  } else {  // flash is too old or we can't detect the plugin
		    var alternateContent = 'Alternate HTML content should be placed here. '
		  	+ 'This content requires the Adobe Flash Player. '
		   	+ '<a href=http://www.adobe.com/go/getflash/>Get Flash</a>';
		    document.write(alternateContent);  // insert non-flash content
		  }
		// -->
		</script>
		<noscript>
		  	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
					id="portfolioHeader" width="950" height="75"
					codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
					<param name="movie" value="/swf/portfolioHeader.swf" />
					<param name="quality" value="high" />
					<param name="bgcolor" value="#000000" />
					<param name="allowScriptAccess" value="sameDomain" />
					<embed src="/swf/portfolioHeader.swf" quality="high" bgcolor="#000000"
						width="950" height="75" name="portfolioHeader" align="middle"
						play="true"
						loop="false"
						quality="high"
						allowScriptAccess="sameDomain"
						type="application/x-shockwave-flash"
						pluginspage="http://www.adobe.com/go/getflashplayer">
					</embed>
			</object>
		</noscript>
	</div>
	<!--- <div id="nav" class="container">
		<ul>
			<li><a href="javascript:void(0);" id="nav_home" class="navLink navselected">home</a></li>
			<li><a href="http://lanctr.com/" id="nav_blog" target="_blank" class="navLink">blog</a></li>
			<li><a href="javascript:void(0);" id="nav_sites" class="navLink">sites</a></li>
			<li><a href="javascript:void(0);" id="nav_samplecode" class="navLink">sample code</a></li>
			<li><a href="javascript:void(0);" id="nav_demos" class="navLink">demos</a></li>
			<li><a href="javascript:void(0);" id="nav_presentations" class="navLink">presentations</a></li>
			<li><a href="javascript:void(0);" id="nav_contact" class="navLink">contact</a></li>
		</ul>
	</div> --->