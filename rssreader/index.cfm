<html>
	<head>
		<title>RSS Reader</title>
		<!--- Scripts --->
		<script src="/js/jquery-1.3.2.min.js" type="text/javascript"></script>
		<script src="/js/jquery-ui-1.7.custom.min.js" type="text/javascript"></script>
		<script src="/js/jquery.validate.min.js" type="text/javascript"></script>
		
		<script src="/rssreader/js/main.js" type="text/javascript"></script>
		
		<!--- CSS --->
		<!-- Framework CSS -->
		<link rel="stylesheet" href="/css/blueprint/screen.css" type="text/css" media="screen, projection">
		<link rel="stylesheet" href="/css/blueprint/print.css" type="text/css" media="print">
	 	<!--[if IE]><link rel="stylesheet" href="/css/blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->
		<link rel="stylesheet" href="/css/black-tie/jquery-ui-1.7.custom.css" media="screen, projection" />
		<link rel="stylesheet" href="/rssreader/css/main.css" media="screen, projection" />
		
	</head>
	<body>
		<div id="header" class="container">
			<span id="addRSSBtn">Change RSS Feed</span>
			<br/>
			<span id="RSSForm" class="hidden">
				<img id="CancelBtn" src="/images/close.png" width="24" height="24" />
				<input id="RSSInput" type="text">
				<input id="RSSSetBtn" type="button" value="Set">
				<input id="RSSReset" type="button" value="Default">
			</span>
		</div>
		<div id="main" class="container">
		</div>
	</body>
</html>