<cfset theXML = XMLParse(local.rss.filecontent) />
<cfset rssTitle = theXML.rss.channel.title.XMLText />
<cfset rssURL = theXML.rss.channel.link.XMLText />

<cfoutput>
<div id="feedTitleBox" class="hidden notice">
	<a href="#rssURL#" target="_blank">#rssTitle#</a>
</div>

<cfloop from="1" to="#ArrayLen(theXML.rss.channel.item)#" index="i">
	<cfset title = theXML.rss.channel.item[i].title.XMLText />
	<cfset link = theXML.rss.channel.item[i].link.XMLText />
	<cfset description = theXML.rss.channel.item[i].description.XMLText />
	<cfset pubdate = DateFormat(theXML.rss.channel.item[i].pubDate.XMLText, 'mm/dd/yyyy h:mm:ss tt') />
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('##item#i#link').data('feedItem',{url:'#link#',target:'##item#i#View'});
		$('##item#i#link2').data('feedItem',$('##item#i#link').data('feedItem'));
		$('##closeBtn#i#').data('feedItem',$('##item#i#link').data('feedItem'));
	});
	</script>
	
	<div id="item#i#" class="success feedItem hidden">
		<h4><a id="item#i#link" class="itemLink" href="javascript:void(0);">#title#</a></h4>
		<div class="itemContent">
			#Left(description,255)#... (<a href="javascript:void(0);" id="item#i#link2" class="itemLink">read more</a>)
		</div>
		<div class="pubDate">
			Posted: #pubdate#
		</div>
		<div id="item#i#View" class="hidden itemView">
			<div>
				<img id="closeBtn#i#" class="closeIframe" src="/images/close.png" width="24" height="24" />
			</div>
		</div>
	</div>
</cfloop>
</cfoutput>