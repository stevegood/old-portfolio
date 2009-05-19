
<cfoutput>
	
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html>
	<head>
		<title>MYTODOLIST Template</title>
		
		<!-- Linked files. -->
		<link rel="stylesheet" type="text/css" href="./linked/styles.css"></link>
		<script type="text/javascript" src="./linked/jquery-1.2.6.min.js"></script>
		<script type="text/javascript" src="./linked/scripts.js"></script>
	</head>	
	<body>
	
		<!-- BEGIN: Site Container. -->
		<div id="site-container">
		
			<!-- BEGIN: Site Header. -->
			<div id="site-header">
				
				<h1>
					<a href="##">My ToDo List</a>
				</h1>
			
			</div>
			<!-- END: Site Header. -->
			
			
			<!-- BEGIN: Site Content. -->
			<div id="site-content">
			
				<!-- BEGIN: Main Task List. -->
				<ul id="main-task-list">
				
					<!-- BEGIN: Task List For Today. -->
					<li id="task-list-for-today">
					
						<h3>
							4
						</h3>
						
						<p class="add-new-task-top">
							<a href="##">Add New Task</a>
						</p>
						
						<ol class="task-list">
							<cfloop
								index="intI"
								from="1"
								to="4"
								step="1">
								
								<li>
									<div class="description">
										Please fix the navigation on the XYZ template. Right now
										all of the pop-up menus pop-up about 30 pixels below the
										root button.
									</div>
									
									<form class="tools">
										
										<label>
											<input type="checkbox" />
											Done
										</label>
										
										<a href="##" class="edit">Edit</a>
										
										<a href="##" class="delete">Delete</a>
										
										<br clear="all" />
										
										<div class="fix-clear">
											<br />
										</div>
										
									</form>								
								</li>								
								
							</cfloop>								
						</ol>						
						
						<p class="add-new-task-bottom">
							<a href="##">Add New Task</a>
						</p>
					
					</li>
					<!-- END: Task List For Today. -->
					
					<!-- BEGIN: Task List For Tomorrow. -->
					<li id="task-list-for-tomorrow">
					
						<h3>
							2
						</h3>
						
						<p class="add-new-task-top">
							<a href="##">Add New Task</a>
						</p>
						
						<ol class="task-list">
							<cfloop
								index="intI"
								from="1"
								to="2"
								step="1">
								
								<li>
									<div class="description">
										Please fix the navigation on the XYZ template. Right now
										all of the pop-up menus pop-up about 30 pixels below the
										root button.
									</div>
									
									<form class="tools">
										
										<label>
											<input type="checkbox" />
											Done
										</label>
										
										<a href="##" class="edit">Edit</a>
										
										<a href="##" class="delete">Delete</a>
										
										<br clear="all" />
										
										<div class="fix-clear">
											<br />
										</div>
										
									</form>								
								</li>								
								
							</cfloop>								
						</ol>						
						
						<p class="add-new-task-bottom">
							<a href="##">Add New Task</a>
						</p>
					
					</li>
					<!-- END: Task List For Tomorrow. -->
				
					<!-- BEGIN: Task List For Soon. -->
					<li id="task-list-for-soon">
					
						<h3>
							5
						</h3>
						
						<p class="add-new-task-top">
							<a href="##">Add New Task</a>
						</p>
						
						<ol class="task-list">
							<cfloop
								index="intI"
								from="1"
								to="5"
								step="1">
								
								<li>
									<div class="description">
										Please fix the navigation on the XYZ template. Right now
										all of the pop-up menus pop-up about 30 pixels below the
										root button.
									</div>
									
									<form class="tools">
										
										<label>
											<input type="checkbox" />
											Done
										</label>
										
										<a href="##" class="edit">Edit</a>
										
										<a href="##" class="delete">Delete</a>
										
										<br clear="all" />
										
										<div class="fix-clear">
											<br />
										</div>
										
									</form>								
								</li>								
								
							</cfloop>								
						</ol>						
						
						<p class="add-new-task-bottom">
							<a href="##">Add New Task</a>
						</p>
					
					</li>
					<!-- END: Task List For Soon. -->
					
				</ul>
				<!-- END: Main Task List. -->
				
				<br clear="all" />
				
				<div class="fix-clear">
					<br />
				</div>
				
				
				
				<br />
				<br />
				<br />
				<br />
				
				
				<h2>
					Add / Edit Task
				</h2>
				
				
				<div class="data-form-errors">
				
					<h3>
						Please review the following:
					</h3>
					
					<ul>
						<li>
							Please enter a valid due date.
						</li>
						<li>
							Please enter your task information.
						</li>
					</ul>
				
				</div>
				
				
				<form>
				
					<table cellspacing="0" class="data-form">
					<tr>
						<td class="label">
							Due Date:
						</td>
						<td class="input">
							<input type="text" class="medium" />
						</td>
					</tr>
					<tr>
						<td class="label">
							Task:
						</td>
						<td class="input">
							<textarea class="small"></textarea>
						</td>
					</tr>
					</table>
					
					<div class="data-form-buttons">
						<input type="submit" value="Save" />
						<a href="##" class="cancel">cancel</a>
						<a href="##" class="delete">delete</a>
					</div>
				
				</form>
				
			
			</div>
			<!-- END: Site Content. -->
			
			
			<!-- BEGIN: Site Footer. -->
			<div id="site-footer">
								
				<p>
					My Todo List &copy; #Year( Now() )#, All Rights Reserved
				</p>
				
				<p>
					<a href="http://www.epicenterconsulting.com" target="_blank">Epicenter Consulting</a>
				</p>
			
			</div>
		
		</div>	
		<!-- END: Site Container. -->
	
	</body>
	</html>
	
</cfoutput>
