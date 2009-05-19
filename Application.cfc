<cfcomponent output="false">
	<cfscript>
	THIS.name = "portfolio";
	</cfscript>
	
	<cffunction name="onApplicationStart">
		<cfset application.ds = "portfolio" />
	</cffunction>

	<cffunction name="onRequestStart">
		<cfif isDefined('url.reinit') AND url.reinit IS "1979">
			<cfset onApplicationStart() />
		</cfif>
		
		<!--- <cfinclude template="/views/includes/header.cfm" /> --->
	</cffunction>
	
	<cffunction name="onRequestEnd">
		<!--- <cfinclude template="/views/includes/footer.cfm" /> --->
	</cffunction>
</cfcomponent>