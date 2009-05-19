<cfcomponent output="false">
	<cffunction name="getFeed" displayname="Get Feed" hint="Gets the RSS Feed specified and returns an array of feed objects" access="remote" output="false" returntype="Any">
		<cfargument name="feedURL" displayName="Feed URL" type="String" hint="the Feed URL" required="true" />
		
		<cfset var local = {} />
		
		<cfhttp url="#arguments.feedURL#" result="local.rss" method="get">
		
		<cfscript>
		local.rssStruct = {};
		local.rssStruct['rawFeed'] = local.rss.filecontent;
		local.rssStruct['display'] = '';
		</cfscript>
		
		<cfsavecontent variable="local.rssStruct.display">
			<cfinclude template="feedOutput.cfm">
		</cfsavecontent>
		
		<cfreturn local.rssStruct />
	</cffunction>
	
	<cffunction name="getItemHTML" access="remote" returntype="struct" output="false" hint="Returns the raw HTML of the url provided">
		<cfargument name="url" type="string" required="true" default=""/>
		
		<cfscript>
		var local = {};
		local.data['html'] = '';
		</cfscript>
		
		<cfhttp url="#arguments.url#" result="local.resultHTML" method="get" />
		
		<cfscript>
		local.data.html = REReplace(local.resultHTML.filecontent,'<script[^>]</script>','','ALL');
		local.data.html = Replace(local.data.html,'$([^>];','','ALL');
		</cfscript>
		
		<cfreturn local.data />
	</cffunction>
</cfcomponent>