<cfcomponent hint="Task DAO" output="false">
	
	<cfset variables.DataXML = ExpandPath('/tasklist') & '/includes/Tasks.xml' />
	
	<cffunction name="init" access="public" output="false" returntype="TaskDAO">
		<cfif NOT isDefined('variables.taskQuery')>
			<cfset buildQuery() />
		</cfif>
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getTodayTasks" access="public" output="false" returntype="query">
		<cfargument name="showComplete" type="boolean" required="false" default="false"/>
		<cfset var local = {} />		
		<cfquery dbtype="query" name="local.taskQuery">
		SELECT *
		FROM variables.taskQuery
		WHERE duedate <= #CreateODBCDate(now())#
		<cfif arguments.showComplete>
			AND (isComplete = 'true' OR isComplete = 'false')
		<cfelse>
			AND isComplete = 'false'	
		</cfif>
		ORDER BY duedate ASC
		</cfquery>
		<cfreturn local.taskQuery />
	</cffunction>

	<cffunction name="getTomorrowTasks" access="public" output="false" returntype="query">
		<cfargument name="showComplete" type="boolean" required="false" default="false"/>
		<cfset var local = {} />
		<cfquery dbtype="query" name="local.taskQuery">
		SELECT *
		FROM variables.taskQuery
		WHERE duedate = #CreateODBCDate(DateAdd('d',1,now()))#
		<cfif arguments.showComplete>
			AND (isComplete = 'true' OR isComplete = 'false')
		<cfelse>
			AND isComplete = 'false'	
		</cfif>
		ORDER BY duedate ASC
		</cfquery>
		<cfreturn local.taskQuery />
	</cffunction>

	<cffunction name="getComingSoonTasks" access="public" output="false" returntype="query">
		<cfargument name="showComplete" type="boolean" required="false" default="false"/>
		<cfset var local = {} />
		<cfquery dbtype="query" name="local.taskQuery">
		SELECT *
		FROM variables.taskQuery
		WHERE duedate > #CreateODBCDate(DateAdd('d',1,now()))#
		<cfif arguments.showComplete>
			AND (isComplete = 'true' OR isComplete = 'false')
		<cfelse>
			AND isComplete = 'false'	
		</cfif>
		ORDER BY duedate ASC
		</cfquery>
		<cfreturn local.taskQuery />
	</cffunction>
	
	<cffunction name="createTask" access="public" output="false" returntype="void">
		<cfargument name="duedate" required="true" type="date"/>
		<cfargument name="name" required="true" type="string"/>
		<cfargument name="description" required="true" type="string"/>
		<cfargument name="isComplete" required="true" type="boolean"/>
		
		<cfset var local = {} />
		
		<cfquery dbtype="query" name="local.taskid">
		SELECT id
		FROM variables.taskQuery
		ORDER BY id ASC
		</cfquery>
		
		<cfif local.taskid.RecordCount GT 0>
			<cfset local.nextTaskID = local.taskid.id[local.taskid.RecordCount] + 1 />
		<cfelse>
			<cfset local.nextTaskID = 1 />
		</cfif>
		
		<cfscript>
		QueryAddRow(variables.taskQuery);
		QuerySetCell(variables.taskQuery,'id', local.nextTaskID);
		QuerySetCell(variables.taskQuery,'name',arguments.name);
		QuerySetCell(variables.taskQuery,'description',arguments.description);
		QuerySetCell(variables.taskQuery,'duedate',CreateODBCDate(arguments.duedate));
		QuerySetCell(variables.taskQuery,'isComplete',arguments.isComplete);
		saveQueryToXML();
		</cfscript>
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="updateTask" access="public" output="false" returntype="void">
		<cfargument name="id" required="true" type="numeric"/>
		<cfargument name="name" required="true" type="string"/>
		<cfargument name="description" required="true" type="string"/>
		<cfargument name="duedate" required="true" type="date"/>
		
		<cfscript>
		var local = {};
		local.theXML = readXML();
		</cfscript>
		
		<cfxml variable="local.theXML">
		<TaskList>
			<cfloop from="1" to="#ArrayLen(local.theXML.TaskList.task)#" index="local.i">
				<cfif local.theXML.TaskList.task[local.i].id.XMLText NEQ arguments.id>
					<task>
						<cfoutput>
						<id>#local.theXML.TaskList.task[local.i].id.XMLText#</id>
						<name>#local.theXML.TaskList.task[local.i].name.XMLText#</name>
						<description>#local.theXML.TaskList.task[local.i].description.XMLText#</description>
						<duedate>#local.theXML.TaskList.task[local.i].duedate.XMLText#</duedate>
						<isComplete>#local.theXML.TaskList.task[local.i].isComplete.XMLText#</isComplete>
						</cfoutput>
					</task>
				<cfelse>
					<cfset local.isComplete = local.theXML.TaskList.task[local.i].isComplete.XMLText />
				</cfif>
			</cfloop>
			
			<task>
				<cfoutput>
				<id>#arguments.id#</id>
				<name>#arguments.name#</name>
				<description>#arguments.description#</description>
				<duedate>#DateFormat(arguments.duedate,'mm-dd-yyyy')#</duedate>
				<isComplete>#local.isComplete#</isComplete>
				</cfoutput>
			</task>
			
		</TaskList>
		</cfxml>
		
		<cfset buildQuery(local.theXML) />
		<cfset saveQueryToXML() />
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="deleteTask" access="public" output="false" returntype="void">
		<cfargument name="id" type="numeric" required="true"/>
		
		<cfscript>
		var local = {};
		local.theXML = readXML();
		</cfscript>
		
		<cfxml variable="local.theXML">
		<TaskList>
			<cfloop from="1" to="#ArrayLen(local.theXML.TaskList.task)#" index="local.i">
				<cfif local.theXML.TaskList.task[local.i].id.XMLText NEQ arguments.id>
					<task>
						<cfoutput>
						<id>#local.theXML.TaskList.task[local.i].id.XMLText#</id>
						<name>#local.theXML.TaskList.task[local.i].name.XMLText#</name>
						<description>#local.theXML.TaskList.task[local.i].description.XMLText#</description>
						<duedate>#local.theXML.TaskList.task[local.i].duedate.XMLText#</duedate>
						<isComplete>#local.theXML.TaskList.task[local.i].isComplete.XMLText#</isComplete>
						</cfoutput>
					</task>
				</cfif>
			</cfloop>
		</TaskList>
		</cfxml>
		
		<cfset buildQuery(local.theXML) />
		<cfset saveQueryToXML() />
		
		<cfset saveQueryToXML() />
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="updateTaskComplete" access="public" output="false" returntype="void">
		<cfargument name="id" type="numeric" required="true"/>
		<cfargument name="isComplete" type="boolean" required="true"/>
		
		<cfscript>
		var local = {};
		local.theXML = readXML();
		</cfscript>
		
		<cfxml variable="local.theXML">
		<TaskList>
			<cfloop from="1" to="#ArrayLen(local.theXML.TaskList.task)#" index="local.i">
				<cfif local.theXML.TaskList.task[local.i].id.XMLText NEQ arguments.id>
					<task>
						<cfoutput>
						<id>#local.theXML.TaskList.task[local.i].id.XMLText#</id>
						<name>#local.theXML.TaskList.task[local.i].name.XMLText#</name>
						<description>#local.theXML.TaskList.task[local.i].description.XMLText#</description>
						<duedate>#local.theXML.TaskList.task[local.i].duedate.XMLText#</duedate>
						<isComplete>#local.theXML.TaskList.task[local.i].isComplete.XMLText#</isComplete>
						</cfoutput>
					</task>
				<cfelse>
					<cfset local.index = local.i />
				</cfif>
			</cfloop>
			
			<task>
				<cfoutput>
				<id>#local.theXML.TaskList.task[local.index].id.XMLText#</id>
				<name>#local.theXML.TaskList.task[local.index].name.XMLText#</name>
				<description>#local.theXML.TaskList.task[local.index].description.XMLText#</description>
				<duedate>#local.theXML.TaskList.task[local.index].duedate.XMLText#</duedate>
				<isComplete>#arguments.isComplete#</isComplete>
				</cfoutput>
			</task>
			
		</TaskList>
		</cfxml>
		
		<cfset buildQuery(local.theXML) />
		<cfset saveQueryToXML() />
		
		<cfset saveQueryToXML() />
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="readXML" access="private" output="false" returntype="xml">
		<cfset var local = {} />
		<cfif NOT FileExists(variables.DataXML)>
			
			<cfxml variable="local.XMLFileOutput">
			<TaskList>
			</TaskList>
			</cfxml>
			
			<cffile action="write" file="#variables.DataXML#" output="#local.XMLFileOutput#"/>
		</cfif>
		<cffile action="read" file="#variables.DataXML#" variable="local.xmlFile"/>
		<cfset local.theXML = XMLParse(local.xmlFile) />
		<cfreturn local.theXML />
	</cffunction>
	
	<cffunction name="buildQuery" access="private" output="false" returntype="void">
		<cfargument name="theXML" type="xml" required="false" default="<void/>"/>
		<cfscript>
		var local = {};
		if (!StructKeyExists(XMLParse(arguments.theXML), 'TaskList')){
			local.theXML = readXML();
		} else {
			local.theXML = XMLParse(arguments.theXML);
		}
		variables.taskQuery = QueryNew('id,name,description,duedate,isComplete');
		</cfscript>
		
		<cfif StructKeyExists(local.theXML, 'TaskList') AND StructKeyExists(local.theXML.TaskList, 'task') AND ArrayLen(local.theXML.TaskList.task) GT 0>
			<cfloop from="1" to="#ArrayLen(local.theXML.TaskList.task)#" index="local.i">
				<cfscript>
				QueryAddRow(variables.taskQuery);
				QuerySetCell(variables.taskQuery,'id', local.theXML.TaskList.task[local.i].id.XMLText);
				QuerySetCell(variables.taskQuery,'name',local.theXML.TaskList.task[local.i].name.XMLText);
				QuerySetCell(variables.taskQuery,'description',local.theXML.TaskList.task[local.i].description.XMLText);
				QuerySetCell(variables.taskQuery,'duedate',local.theXML.TaskList.task[local.i].duedate.XMLText);
				QuerySetCell(variables.taskQuery,'isComplete',local.theXML.TaskList.task[local.i].isComplete.XMLText);
				</cfscript>
			</cfloop>
		</cfif>
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="saveQueryToXML" access="private" output="false" returntype="void">
		<cfset var local = {} />
		
		<cfquery dbtype="query" name="local.taskQuery">
		SELECT *
		FROM variables.taskQuery
		ORDER BY id
		</cfquery>
		
		<cfxml variable="local.theXML">
		<TaskList>
			<cfoutput query="local.taskQuery">
			<task>
				<id>#id#</id>
				<name>#name#</name>
				<description>#description#</description>
				<duedate>#DateFormat(duedate,'mm-dd-yyyy')#</duedate>
				<isComplete>#isComplete#</isComplete>
			</task>
			</cfoutput>
		</TaskList>
		</cfxml>
		
		<cffile action="write" file="#variables.DataXML#" output="#local.theXML#" />
		
		<cfreturn />
	</cffunction>
</cfcomponent>