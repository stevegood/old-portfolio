
<cftry>

	<cfparam name="URL.id" type="numeric" />
	
	<!--- Create a default response repsonse. --->
	<cfset objAJAXResponse = {
		Success = true,
		ID = URL.id
		} />
		
		
		
		
		
	<!--- PROCESS HERE. --->	
	
		
		
		
		
	
	<!--- Catch any errors. --->
	<cfcatch>
		
		<!--- Create a default response when error happens. --->
		<cfset objAJAXResponse = {
			Success = false,
			ID = 0
			} />
	
	</cfcatch>	
</cftry>


<!--- Searialize response. --->
<cfset strJSON = SerializeJSON( objAJAXResponse ) />

<!--- Create a binary for streaming. --->
<cfset binJSON = ToBinary( ToBase64( strJSON ) ) />

<!--- Return AJAX repsonse. --->
<cfheader
	name="content-length"
	value="#ArrayLen( binJSON )#"
	/>
	
<!--- Stream binary data. --->
<cfcontent
	type="text/plain"
	variable="#binJSON#"
	/>