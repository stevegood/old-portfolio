
<!--- Include header. --->
<cfinclude template="./includes/_header.cfm" />


<script type="text/javascript">

	// When the DOM loads, we need to initialize some of the page
	// elements to handle different events.
	$(
		function(){
			var jTasks = $( "#main-task-list ol.task-list li" );
			
			// Loop over each task item to initialize.
			jTasks.each(
				function( intI ){
					var jThis = $( this );
					var jForm = jThis.find( "form.tools" );
					var jCheckbox = jForm.find( "input:checkbox" );
					var jDelete = jForm.find( "a.delete" );
					
					// Hook up checkboxes to fade out.
					jCheckbox.click(
						function( objEvent ){
							// Check to see if it is checked.
							if (jCheckbox[ 0 ].checked){
							
								// The first thing we want to do is disable the checkbox.
								jCheckbox[ 0 ].disabled = true;
							
								// Make AJAX call to end the task.
								$.getJSON( 
									"./ajax_end_task.cfm",
									{
										id: 4
									},
									function( objResponse ){
										
										// Check to see if repsonse was successful.
										if (objResponse.SUCCESS){
											// Task was ended - remove from DOM.
											RemoveTaskFromDOM( jThis );
										} else {
											alert( "An unexpected error occurred - could not end task." );
										}										
									}
									);
							}
						}
						);
						
					// Hook up the delete links.
					jDelete
						.attr( "href", "javascript:void( 0 )" )
						.click(
							function( objEvent ){
								// Confirm that the user wants to delete.
								if (confirm( "Delete this task?" )){
							
									// Make AJAX call to end the task.
									$.getJSON( 
										"./ajax_delete_task.cfm",
										{
											id: 4
										},
										function( objResponse ){
											
											// Check to see if repsonse was successful.
											if (objResponse.SUCCESS){
												// Task was ended - remove from DOM.
												RemoveTaskFromDOM( jThis );
											} else {
												alert( "An unexpected error occurred - could not delete task." );
											}										
										}
										);
										
								}
							}
							)
					;
					
					// For IE 6, which doesn't recognize the HOVER selector
					// on list elements, we need to hook up a non-faded class
					// on the mouse overs.
					jThis.hover(
						function( objEvent ){
							jThis.addClass( "not-faded" );
						},
						function( objEvent ){
							jThis.removeClass( "not-faded" );
						}
						);
				}
				);
		}
		);
		
		
	// This removes the given task from the DOM.
	function RemoveTaskFromDOM( jTask ){
		jTask
			// First fade it out.
			.fadeTo( 
				500,
				.01									
				)
				
			// Then slide it up.
			.slideUp(
				250,
				function(){
					// Once the slide up is done, actually remove
					// the task from the DOM.
					jTask.remove();
					
					// Update the task headers.
					UpdateTaskHeaders();
				}
				)
		;
	}
	
	
	// Updates the header counts.
	function UpdateTaskHeaders(){
		var jTaskCategories = $( "#task-list-for-today, #task-list-for-tomorrow, #task-list-for-soon" );
		
		// Loop over categories.
		jTaskCategories.each(
			function( intI ){
				jThis = $( this );
				
				// Set category header text to the number of
				// tasks in the category.
				jThis.find( "h3" ).text(
					jThis.find( "ol.task-list li" ).length
					);
			}
			);
	}

</script>


<cfoutput>

	<!-- BEGIN: Main Task List. -->
	<ul id="main-task-list">
	
		<!-- BEGIN: Task List For Today. -->
		<li id="task-list-for-today">
		
			<h3>
				4
			</h3>
			
			<p class="add-new-task-top">
				<a href="edit_task.cfm">Add New Task</a>
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
							
							<a href="edit_task.cfm" class="edit">Edit</a>
							
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
				<a href="edit_task.cfm">Add New Task</a>
			</p>
		
		</li>
		<!-- END: Task List For Today. -->
		
		<!-- BEGIN: Task List For Tomorrow. -->
		<li id="task-list-for-tomorrow">
		
			<h3>
				2
			</h3>
			
			<p class="add-new-task-top">
				<a href="edit_task.cfm">Add New Task</a>
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
							
							<a href="edit_task.cfm" class="edit">Edit</a>
							
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
				<a href="edit_task.cfm">Add New Task</a>
			</p>
		
		</li>
		<!-- END: Task List For Tomorrow. -->
	
		<!-- BEGIN: Task List For Soon. -->
		<li id="task-list-for-soon">
		
			<h3>
				5
			</h3>
			
			<p class="add-new-task-top">
				<a href="edit_task.cfm">Add New Task</a>
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
							
							<a href="edit_task.cfm" class="edit">Edit</a>
							
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
				<a href="edit_task.cfm">Add New Task</a>
			</p>
		
		</li>
		<!-- END: Task List For Soon. -->
		
	</ul>
	<!-- END: Main Task List. -->
	
	<br clear="all" />
	
	<div class="fix-clear">
		<br />
	</div>

</cfoutput>

<!--- Include footer. --->
<cfinclude template="./includes/_footer.cfm" />