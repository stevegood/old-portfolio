<cfcomponent hint="home facade" extends="com.lanctr.baseObjects.facade" output="false">
	<cffunction name="default" access="remote" output="false" returntype="Any">
		<cfscript>
		var local = {};
		local['data'] = {};
		local.data['display'] = '';
		</cfscript>
		
		<cfsavecontent variable="local.data.display">
			<cfinclude template="index.cfm" />
		</cfsavecontent>
		
		<cfreturn local.data />
	</cffunction>
</cfcomponent>