<cfcomponent extends="com.lanctr.baseObjects.facade" output="false">
	<cffunction name="default" access="remote" returntype="struct" output="false" hint="">
		<cfscript>
		var local = {};
		local['data'] = {};
		local.data['display'] = '';
		local.id = CreateUUID();
		local.qDemos = getQDemos();
		</cfscript>
		
		<cfsavecontent variable="local.data.display">
			<cfinclude template="index.cfm">
		</cfsavecontent>
		
		<cfreturn local.data />
	</cffunction>
	
	<cffunction name="getQDemos" access="private" returntype="query" output="false" hint="">
		<cfset var local = {} />
		<cfquery datasource="#application.ds#" name="local.pull_demos">
		SELECT id, name, description, url, addedDate
		FROM demos
		ORDER BY name ASC
		</cfquery>
		
		<cfreturn local.pull_demos />
	</cffunction>
</cfcomponent>