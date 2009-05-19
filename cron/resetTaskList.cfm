<cfxml variable="theXML">
<?xml version="1.0" encoding="UTF-8"?>
<TaskList>
<!--- Today --->
	<task>
		<id>9</id>
		<name>Buy Milk</name>
		<description>Need to buy milk. Beer and cereal in the morning just isn't cutting it anymore...</description>
		<duedate><cfoutput>#DateFormat(now(),'mm-dd-yyyy')#</cfoutput></duedate>
		<isComplete>false</isComplete>
	</task>
<!--- Tomorrow --->	
	<task>
		<id>10</id>
		<name>Mow the lawn</name>
		<description>While mowing the lawn see if you can find the car also.  How did the grass get this long!?</description>
		<duedate><cfoutput>#DateFormat(DateAdd('d',1,now()),'mm-dd-yyyy')#</cfoutput></duedate>
		<isComplete>false</isComplete>
	</task>
<!--- Day after tomorrow --->	
	<task>
		<id>11</id>
		<name>Feed the cat</name>
		<description>The cat has been looking pretty skinny lately, might be time to feed him again this month.</description>
		<duedate><cfoutput>#DateFormat(DateAdd('d',2,now()),'mm-dd-yyyy')#</cfoutput></duedate>
		<isComplete>false</isComplete>
	</task>
<!--- Two days after tomorrow --->
	<task>
		<id>12</id>
		<name>Get a haircut</name>
		<description>Need to get a haircut if for no other reason than to get rid of the singed hair smell.  Side note, need to buy new Grill and propane tanks.</description>
		<duedate><cfoutput>#DateFormat(DateAdd('d',3,now()),'mm-dd-yyyy')#</cfoutput></duedate>
		<isComplete>false</isComplete>
	</task>
	
</TaskList>
</cfxml>

<cfset DataXML = ExpandPath('/tasklist') & '/includes/Tasks.xml' />
<cffile action="write" file="#DataXML#" output="#theXML#" nameconflict="true" />