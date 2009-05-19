<cfcomponent output="false">
	<cfscript>
	THIS.name = "taskList_Steve_demo";
	THIS.ApplicationTimeout = CreateTimespan(0,0,15,0);
	THIS.mappings["/com"] = getDirectoryFromPath(getCurrentTemplatePath()) & '/com';
	</cfscript>
</cfcomponent>