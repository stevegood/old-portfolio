var defaultRSSURL = 'http://www.lanctr.com/gospot/member.rss';
var currentRSSURL = defaultRSSURL;

$(document).ready(function(){	
	$('#RSSInput').val(currentRSSURL);
	getRSSFeed();
	
	$('#addRSSBtn').click(function(){
		$('#RSSInput').val(currentRSSURL);
		openRSSForm();
	});
	$('#RSSSetBtn').click(function(){
		if (isURL($('#RSSInput').val())){
			currentRSSURL = $('#RSSInput').val();
			closeRSSForm();
			getRSSFeed();
		} else {
			var msg = 'The URL entered is not valid, please verify the URL and try again.';
			var errorDiv = '<div class="error">' + msg + '</div>';
			$('#header').append(errorDiv);
		}
	});
	$('#RSSReset').click(function(){
		resetRSSURL();
		closeRSSForm();
		getRSSFeed();
	});
	$('#CancelBtn').click(function(){
		closeRSSForm();
	});
	$("#RSSInput").keydown(function(e){
		if (e.keyCode == 13) {
			$("#RSSSetBtn").click();
		}
	});
	$('.itemLink').live('click',function(){
		var url = $(this).data('feedItem').url;
		var target = $(this).data('feedItem').target;
		$('.itemView').animate({height:'hide',opacity:'hide'},750, null, function(){
			$('iframe').remove();
			var iframe = '<iframe src="' + url + '" height="100%" width="100%"></iframe>';
			$(target).append(iframe);
			$(target).animate({height:'show',opacity:'show'},750, null, function(){
				
			});
		});
	});
	$('.closeIframe').live('click',function(){
		var target = $(this).data('feedItem').target;
		$(target).animate({height:'hide',opacity:'hide'},750, null, function(){
			$('iframe').remove();
		});
	});
});

function getFeedItem(url,target){
	
}
function resetRSSURL(){
	currentRSSURL = defaultRSSURL;
	$('#RSSInput').val(currentRSSURL);
}
function openRSSForm(){
	$('#RSSForm').animate({height:'show',opacity:'show'},750);
}
function closeRSSForm(){
	$('#RSSForm').animate({height:'hide',opacity:'hide'},750, null, function(){
		$('.error').animate({height:'hide',opacity:'hide'},250, null, function(){
			$(this).remove();
		});
	});
}
function getRSSFeed(){
	$('#main').animate({opacity: 'hide'},500,null,function(){
		$('#main').animate({opacity: 'show'},500);
		$('#main').html('<div class="container loadingAnimation"><img src="/images/ajax-loader.gif" class="loadingAnimation" /></div>');
		var rssURL = $('#RSSInput').val();
		$.getJSON(
			'/rssreader/com/lanctr/services/FeedService.cfc',
			{method: 'getFeed', returnformat: 'json', feedURL: rssURL},
			function(result){
				$('#main').html(result.display);
				$('#feedTitleBox').animate({height: 'show', opacity: 'show'},500,null,function(){
					$('.feedItem').animate({height: 'show', opacity: 'show'},1000);
				});
			}
		);
	});
		
}

// borrowed from http://www.eggheadcafe.com/community/aspnet/3/81341/isurl.aspx
function isURL(argvalue) {

  if (argvalue.indexOf(" ") != -1)
    return false;
  else if (argvalue.indexOf("http://") == -1)
    return false;
  else if (argvalue == "http://")
    return false;
  else if (argvalue.indexOf("http://") > 0)
    return false;

  argvalue = argvalue.substring(7, argvalue.length);
  if (argvalue.indexOf(".") == -1)
    return false;
  else if (argvalue.indexOf(".") == 0)
    return false;
  else if (argvalue.charAt(argvalue.length - 1) == ".")
    return false;

  if (argvalue.indexOf("/") != -1) {
    argvalue = argvalue.substring(0, argvalue.indexOf("/"));
    if (argvalue.charAt(argvalue.length - 1) == ".")
      return false;
  }

  if (argvalue.indexOf(":") != -1) {
    if (argvalue.indexOf(":") == (argvalue.length - 1))
      return false;
    else if (argvalue.charAt(argvalue.indexOf(":") + 1) == ".")
      return false;
    argvalue = argvalue.substring(0, argvalue.indexOf(":"));
    if (argvalue.charAt(argvalue.length - 1) == ".")
      return false;
  }

  return true;
}