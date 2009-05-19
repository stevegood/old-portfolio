
<!--- Include header. --->
<cfinclude template="./includes/_header.cfm" />


<script type="text/javascript">

	// When the DOM loads, we need to initialize some of the page
	// elements to handle different events.
	$(
		function(){
			jForm = $( "form.data-form" );
			jFormButtons = jForm.find( "div.data-form-buttons" );
			jCancel = jFormButtons.find( "a.cancel" );
			jDelete = jFormButtons.find( "a.delete" );
			
			// Hook up cancel to confirm.
			jCancel.click(
				function( objEvent ){
					if (confirm( "Leave form without saving?" )){
						return( true );
					} else {
						jCancel.blur();
						return( false );
					}
				}
				);
				
			// Hook up delete to confirm.
			jDelete.click(
				function( objEvent ){
					if (confirm( "Delete task?" )){
						return( true );
					} else {
						jDelete.blur();
						return( false );
					}
				}
				);
		}
		);

</script>


<cfoutput>

	<h2>
		Add / Edit Task
	</h2>
	
	
	<!--- Check to see if we should show errors. --->
	<cfif StructKeyExists( FORM, "show_errors" )>
	
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
		
	</cfif>
		
	
	<form 
		method="post"
		<cfif StructKeyExists( FORM, "show_errors" )>
			action="index.cfm"
		<cfelse>
			action="edit_task.cfm"
		</cfif>
		class="data-form">
	
		<input type="hidden" name="show_errors" value="1" />
	
		<table cellspacing="0" class="data-form">
		<tr>
			<td class="label">
				Due Date:
			</td>
			<td class="input">
				<input type="text" value="#DateFormat( (Now() + 1), "mmm d, yyyy" )#" class="medium" />
			</td>
		</tr>
		<tr>
			<td class="label">
				Task:
			</td>
			<td class="input">
				<textarea class="small">Update the TPS report template to include the new test specifications verbiage.</textarea>
			</td>
		</tr>
		</table>
		
		<div class="data-form-buttons">
			<input type="submit" value="Save" />
			<a href="index.cfm" class="cancel">cancel</a>
			<a href="index.cfm" class="delete">delete</a>
		</div>
	
	</form>

</cfoutput>

<!--- Include footer. --->
<cfinclude template="./includes/_footer.cfm" />