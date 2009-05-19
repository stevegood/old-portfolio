
<cfcomponent
	output="false"
	hint="I define the application and application event listeners.">

	<!--- Define application settings. --->
	<cfset THIS.Name = "MyTodoList {#Hash( GetCurrentTemplatePath() )#}" />
	<cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 0, 15, 0 ) />
	
	<!--- Define request settings. --->
	<cfsetting
		showdebugoutput="false"
		/>
			
</cfcomponent>