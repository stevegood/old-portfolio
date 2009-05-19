<cfcomponent displayname="Task" hint="Task Object" output="false">
	
	<cfscript>
	variables.id = 0;
	variables.dudate = now();
	variables.name = '';
	variables.description = '';
	variables.isComplete = false;
	</cfscript>
	
	<cffunction name="init" access="public" output="false" returntype="Task">
		<cfargument name="id" required="true" type="numeric"/>
		<cfargument name="duedate" required="true" type="date"/>
		<cfargument name="name" required="true" type="string"/>
		<cfargument name="description" required="true" type="string"/>
		<cfargument name="isComplete" required="true" type="boolean"/>
		
		<cfscript>
		setID(arguments.id);
		setDuedate(arguments.duedate);
		setName(arguments.name);
		setDescription(arguments.description);
		setIsComplete(arguments.isComplete);
		</cfscript>
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getId" access="public" output="false" returntype="any">
		<cfreturn variables.id />
	</cffunction>

	<cffunction name="setId" access="public" output="false" returntype="void">
		<cfargument name="id" type="any" required="true" />
		<cfset variables.id = arguments.id />
		<cfreturn />
	</cffunction>

	<cffunction name="getDuedate" access="public" output="false" returntype="date">
		<cfreturn variables.duedate />
	</cffunction>

	<cffunction name="setDuedate" access="public" output="false" returntype="void">
		<cfargument name="duedate" type="date" required="true" />
		<cfset variables.duedate = arguments.duedate />
		<cfreturn />
	</cffunction>

	<cffunction name="getName" access="public" output="false" returntype="string">
		<cfreturn variables.name />
	</cffunction>

	<cffunction name="setName" access="public" output="false" returntype="void">
		<cfargument name="name" type="string" required="true" />
		<cfset variables.name = arguments.name />
		<cfreturn />
	</cffunction>

	<cffunction name="getDescription" access="public" output="false" returntype="string">
		<cfreturn variables.description />
	</cffunction>

	<cffunction name="setDescription" access="public" output="false" returntype="void">
		<cfargument name="description" type="string" required="true" />
		<cfset variables.description = arguments.description />
		<cfreturn />
	</cffunction>

	<cffunction name="getIsComplete" access="public" output="false" returntype="boolean">
		<cfreturn variables.isComplete />
	</cffunction>

	<cffunction name="setIsComplete" access="public" output="false" returntype="void">
		<cfargument name="isComplete" type="boolean" required="true" />
		<cfset variables.isComplete = arguments.isComplete />
		<cfreturn />
	</cffunction>
</cfcomponent>