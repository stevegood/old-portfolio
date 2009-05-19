<cfscript>
// create the facade object
facade = CreateObject('component','facades.TaskFacade');

//facade.createTask(now(),'New task 6','Creating a task through the TaskFacade',false);
</cfscript>

<cfdump var="#facade.getTodayTasks(true)#">
<cfdump var="#facade.getTomorrowTasks(true)#">
<cfdump var="#facade.getComingSoonTasks(true)#">