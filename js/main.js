$(document).ready(function(){
	loadHome();
	
	$(document).bind('home',function(){
		loadHome();
	});
	$(document).bind('sites',function(){
		loadSites();
	});
	$(document).bind('samples',function(){
		loadSamplecode();
	});
	$(document).bind('demos',function(){
		loadDemos();
	});
	$(document).bind('presentations',function(){
		loadPresentations();
	});
	$(document).bind('contact',function(){
		loadContact();
	});
	$(document).bind('blog',function(){
		var blog_url = 'http://lanctr.com/';
		window.open(blog_url);
		return false;
	});
});

function onNavClick(target){
	$(document).trigger(target);
}

function loadHome(){
	$.getJSON(
		'/views/main/home.cfc',
		{
			method: 'default',
			returnFormat: 'json'
		},
		function(result){
			$('#main').html(result.display);
		}
	);
}
function loadSites(){
	$('#main').html('Coming soon...');
}
function loadSamplecode(){
	$('#main').html('Coming soon...');
}
function loadDemos(){
	$.getJSON(
		'/views/demos/DemosFacade.cfc',
		{
			method: 'default',
			returnFormat: 'json'
		},
		function(result){
			$('#main').html(result.display);
		}
	);
}
function loadPresentations(){
	$('#main').html('Coming soon...');
}
function loadContact(){
	$('#main').html('Coming soon...');
}