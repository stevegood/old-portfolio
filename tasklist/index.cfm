<!--- header --->
<cfinclude template="includes/header.cfm" />


<div id="main" class="container">
	<div class="today-column container span-7">
		<div class="column-header">
			<span>Today and Older</span> (<a href="javascript:void(0);" class="add-new-task">new task</a>)<br />
			Show Completed Tasks<input id="showTodayComplete" type="checkbox"/>
		</div>
		<div id="today-tasks"></div>
	</div>
	<div class="tomorrow-column container span-7">
		<div class="column-header">
			<span>Tomorrow</span> (<a href="javascript:void(0);" class="add-new-task">new task</a>)<br />
			Show Completed Tasks<input id="showTomorrowComplete" type="checkbox"/>
		</div>
		<div id="tomorrow-tasks"></div>
	</div>
	<div class="future-column container span-7">
		<div class="column-header">
			<span>Sometime Soon</span> (<a href="javascript:void(0);" class="add-new-task">new task</a>)<br />
			Show Completed Tasks<input id="showComingSoonComplete" type="checkbox"/>
		</div>
		<div id="coming-soon-tasks"></div>
	</div>
</div>

<div id="task-editor" class="jqmWindow hidden">
	<div class="editor-title-bar"><span id="task-editor-type"></span> Task</div>
	<div class="editor-form">
		<input id="editor-task-id" type="hidden"/>
		<table>
			<tr>
				<th>Name:</th>
				<td>
					<input id="editor-task-name" type="text"/>
				</td>
			</tr>
			<tr>
				<th>Description:</th>
				<td>
					<textarea id="editor-task-description"></textarea>
				</td>
			</tr>
			<tr>
				<th>Due Date</th>
				<td>
					<input id="editor-task-duedate" type="text"/>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input id="editor-task-save-button" type="button" value="Save"/>
					<input class="jqmClose" type="button" value="Cancel"/>
				</td>
			</tr>
		</table>
	</div>
</div>

<!--- footer --->
<cfinclude template="includes/footer.cfm" />