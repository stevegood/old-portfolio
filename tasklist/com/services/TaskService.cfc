<cfcomponent output="false">
	<cfset variables.TasksDAO = CreateObject('component','com.dao.TaskDAO').init() />
	
	<cffunction name="getTodayTasks" access="public" output="false" returntype="array">
		<cfargument name="showComplete" type="boolean" required="false" default="false"/>
		<cfscript>
		var local = {};
		local.tasksArray = ArrayNew(1);
		local.qTasks = variables.TasksDAO.getTodayTasks(arguments.showComplete);
		</cfscript>
		
		<cfloop query="local.qTasks">
			<cfscript>
			local.task = CreateObject('component','com.ValueObjects.Task').init(id,duedate,name,description,isComplete);
			ArrayAppend(local.tasksArray,local.task);
			</cfscript>
		</cfloop>
		
		<cfreturn local.tasksArray />
	</cffunction>

	<cffunction name="getTomorrowTasks" access="public" output="false" returntype="array">
		<cfargument name="showComplete" type="boolean" required="false" default="false"/>
		<cfscript>
		var local = {};
		local.tasksArray = ArrayNew(1);
		local.qTasks = variables.TasksDAO.getTomorrowTasks(arguments.showComplete);
		</cfscript>
		
		<cfloop query="local.qTasks">
			<cfscript>
			local.task = CreateObject('component','com.ValueObjects.Task').init(id,duedate,name,description,isComplete);
			ArrayAppend(local.tasksArray,local.task);
			</cfscript>
		</cfloop>
		
		<cfreturn local.tasksArray />
	</cffunction>

	<cffunction name="getComingSoonTasks" access="public" output="false" returntype="array">
		<cfargument name="showComplete" type="boolean" required="false" default="false"/>
		<cfscript>
		var local = {};
		local.tasksArray = ArrayNew(1);
		local.qTasks = variables.TasksDAO.getComingSoonTasks(arguments.showComplete);
		</cfscript>
		
		<cfloop query="local.qTasks">
			<cfscript>
			local.task = CreateObject('component','com.ValueObjects.Task').init(id,duedate,name,description,isComplete);
			ArrayAppend(local.tasksArray,local.task);
			</cfscript>
		</cfloop>
		
		<cfreturn local.tasksArray />
	</cffunction>
	
	<cffunction name="createTask" access="public" output="false" returntype="void">
		<cfargument name="duedate" required="true" type="date"/>
		<cfargument name="name" required="true" type="string"/>
		<cfargument name="description" required="true" type="string"/>
		<cfargument name="isComplete" required="true" type="boolean"/>
		
		<cfscript>
		variables.TasksDAO.createTask(ArgumentCollection = arguments);
		</cfscript>
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="updateTask" access="public" output="false" returntype="void">
		<cfargument name="id" required="true" type="numeric"/>
		<cfargument name="name" required="true" type="string"/>
		<cfargument name="description" required="true" type="string"/>
		<cfargument name="duedate" required="true" type="date"/>
		
		<cfscript>
		variables.TasksDAO.updateTask(ArgumentCollection = arguments);
		</cfscript>
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="deleteTask" access="public" output="false" returntype="void">
		<cfargument name="id" type="numeric" required="true"/>
		
		<cfscript>
		variables.TasksDAO.deleteTask(arguments.id);
		</cfscript>
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="updateTaskComplete" access="public" output="false" returntype="void">
		<cfargument name="id" type="numeric" required="true"/>
		<cfargument name="isComplete" type="boolean" required="true"/>
		
		<cfscript>
		variables.TasksDAO.updateTaskComplete(ArgumentCollection = arguments);
		</cfscript>
		
		<cfreturn />
	</cffunction>
</cfcomponent>