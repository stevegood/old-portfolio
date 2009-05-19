<cfcomponent displayname="Task Facade" hint="Allows remote access to task objects" output="false">
	<cfset variables.taskService = CreateObject('component','com.services.TaskService') />

	<cffunction name="getTodayTasks" displayname="Get Today Tasks" hint="Returns array of task structs" access="remote" output="false" returntype="Any">
		<cfargument name="showComplete" type="boolean" required="false" default="false"/>
		
		<cfscript>
		var local = {};
		local.taskArray = variables.taskService.getTodayTasks(arguments.showComplete);
		local.taskArrayMod = ArrayNew(1);
		</cfscript>
		
		<cfif ArrayLen(local.taskArray) GT 0>
			<cfloop array="#local.taskArray#" index="local.i">
				<cfscript>
				local.task = {};
				local.task['id'] = local.i.getID();
				local.task['name'] = local.i.getName();
				local.task['description'] = local.i.getDescription();
				local.task['dueDate'] = DateFormat(local.i.getDueDate(),'m/d/yyyy');
				local.task['isComplete'] = local.i.getIsComplete();
				ArrayAppend(local.taskArrayMod,local.task);
				</cfscript>
			</cfloop>
		</cfif>
		
		<cfreturn local.taskArrayMod />
	</cffunction>

	<cffunction name="getTomorrowTasks" displayname="Get Tomorrow Tasks" hint="Returns array of tasks" access="remote" output="false" returntype="Any">
		<cfargument name="showComplete" type="boolean" required="false" default="false"/>
		
		<cfscript>
		var local = {};
		local.taskArray = variables.taskService.getTomorrowTasks(arguments.showComplete);
		local.taskArrayMod = ArrayNew(1);
		</cfscript>
		
		<cfif ArrayLen(local.taskArray) GT 0>
			<cfloop array="#local.taskArray#" index="local.i">
				<cfscript>
				local.task = {};
				local.task['id'] = local.i.getID();
				local.task['name'] = local.i.getName();
				local.task['description'] = local.i.getDescription();
				local.task['dueDate'] = DateFormat(local.i.getDueDate(),'m/d/yyyy');
				local.task['isComplete'] = local.i.getIsComplete();
				ArrayAppend(local.taskArrayMod,local.task);
				</cfscript>
			</cfloop>
		</cfif>
		
		<cfreturn local.taskArrayMod />
	</cffunction>

	<cffunction name="getComingSoonTasks" displayname="Get Coming Soon Tasks" hint="Returns an array of task structs" access="remote" output="false" returntype="array">
		<cfargument name="showComplete" type="boolean" required="false" default="false"/>
		
		<cfscript>
		var local = {};
		local.taskArray = variables.taskService.getComingSoonTasks(arguments.showComplete);
		local.taskArrayMod = ArrayNew(1);
		</cfscript>
		
		<cfif ArrayLen(local.taskArray) GT 0>
			<cfloop array="#local.taskArray#" index="local.i">
				<cfscript>
				local.task = {};
				local.task['id'] = local.i.getID();
				local.task['name'] = local.i.getName();
				local.task['description'] = local.i.getDescription();
				local.task['dueDate'] = DateFormat(local.i.getDueDate(),'m/d/yyyy');
				local.task['isComplete'] = local.i.getIsComplete();
				ArrayAppend(local.taskArrayMod,local.task);
				</cfscript>
			</cfloop>
		</cfif>
		
		<cfreturn local.taskArrayMod />
	</cffunction>
	
	<cffunction name="createTask" access="remote" output="false" returntype="boolean">
		<cfargument name="duedate" required="true" type="date"/>
		<cfargument name="name" required="true" type="string"/>
		<cfargument name="description" required="true" type="string"/>
		<cfargument name="isComplete" required="false" type="boolean" default="false"/>
		
		<cfset variables.taskService.createTask(ArgumentCollection = arguments) />
		
		<cfreturn true />
	</cffunction>
	
	<cffunction name="updateTask" access="remote" output="false" returntype="boolean">
		<cfargument name="id" required="true" type="numeric"/>
		<cfargument name="name" required="true" type="string"/>
		<cfargument name="description" required="true" type="string"/>
		<cfargument name="duedate" required="true" type="date"/>
		
		<cfscript>
		variables.taskService.updateTask(ArgumentCollection = arguments);
		</cfscript>
		
		<cfreturn true />
	</cffunction>
	
	<cffunction name="deleteTask" access="remote" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true"/>
		
		<cfscript>
		variables.taskService.deleteTask(arguments.id);
		</cfscript>
		
		<cfreturn true />
	</cffunction>
	
	<cffunction name="updateTaskComplete" access="remote" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true"/>
		<cfargument name="isComplete" type="boolean" required="true"/>
		
		<cfscript>
		variables.taskService.updateTaskComplete(ArgumentCollection = arguments);
		</cfscript>
		
		<cfreturn true />
	</cffunction>
</cfcomponent>