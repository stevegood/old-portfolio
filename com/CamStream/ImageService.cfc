<cfcomponent output="false">
	
	<cfset variables.imagePath = '/var/img/CamStream/' />
	<cfset variables.imageName = 'CamStream' />
	<cfset variables.imageFormat = 'jpg' />
	<cfset variables.archiveImages = false />
	<cfset variables.archivePath = variables.imagePath & 'CamStreamArchive/' />

	<cffunction name="saveImage" access="remote" output="false" returntype="Any">
		<cfargument name="imageBytes" type="binary" required="true" />
		
		<cfset var local = {} />
		
		<cfif NOT DirectoryExists(Left(variables.imagePath,Len(variables.imagePath)-1))>
			<cfdirectory action="create" directory="#Left(variables.imagePath,Len(variables.imagePath)-1)#" />
		</cfif>
		
		<cfif variables.archiveImages>
			<cfif NOT DirectoryExists(Left(variables.archivePath,Len(variables.archivePath)-1))>
				<cfdirectory action="create" directory="#Left(variables.archivePath,Len(variables.archivePath)-1)#" />
			</cfif>
			<cfif FileExists(variables.imagePath & variables.imageName & '.' & variables.imageFormat)>
				<cffile action="rename"
						source="#variables.imagePath##variables.imageName#.#variables.imageFormat#"
						destination="#variables.archivePath##variables.imageName##DateFormat(Now(),'m-d-yyyy')#-#TimeFormat(now(),'H-mm-ss')#.#variables.imageFormat#" />
			</cfif>
		</cfif>
		
		<cfimage action="write"
				source="#arguments.imageBytes#"
				destination="#variables.imagePath##variables.imageName#.#variables.imageFormat#"
				overwrite="true" />
		
		<cfreturn />
	</cffunction>

	<cffunction name="getImage" access="remote" output="false" returntype="struct">
		
		<cfset var local = {} />
		<cfif FileExists(variables.imagePath & variables.imageName & '.' & variables.imageFormat)>
			<cfimage action="read" source="#variables.imagePath##variables.imageName#.#variables.imageFormat#" name="local.theImage" />
		</cfif>
		
		<cfscript>
		local.imageStruct = {};
		if (FileExists(variables.imagePath & variables.imageName & '.' & variables.imageFormat)){
			local.imageStruct['height'] = local.theImage.height;
			local.imageStruct['width'] = local.theImage.width;
			local.imageStruct['name'] = variables.imageName & '.' & variables.imageFormat;
			local.imageStruct['imagePath'] = variables.imagePath;
			local.imageStruct['format'] = variables.imageFormat;
			local.imageStruct['data'] = ImageGetBlob(local.theImage);
		}
		</cfscript>
		
		<cfreturn local.imageStruct />
	</cffunction>
	
	<cffunction name="getImageView" access="remote" output="false" returntype="struct">
		<cfscript>
		var local = {};
		local.result = {};
		local.result['timestamp'] = Now();
		local.result['requestid'] = hash(CreateUUID() & local.result.timestamp);
		local.result['content'] = '';
		local.result['image'] = {};
		local.result.image['height'] = 0;
		local.result.image['width'] = 0;
		local.result.image['name'] = '';
		</cfscript>
		
		<cfif FileExists(variables.imagePath & variables.imageName & '.' & variables.imageFormat)>
			<cfimage action="read" source="#variables.imagePath##variables.imageName#.#variables.imageFormat#" name="local.theImage" />
			<cfscript>
			local.result.image.height = local.theImage.height;
			local.result.image.width = local.theImage.width;
			local.result.image.name = variables.imageName & '.' & variables.imageFormat;
			</cfscript>
			
			<cfsavecontent variable="local.result.content">
				<cfimage action="writeToBrowser" source="#local.theImage#" height="#local.result.image.height#" width="#local.result.image.height#" alt="#local.result.image.name#"/>
			</cfsavecontent>
		</cfif>
		
		<cfreturn local.result />
	</cffunction>
</cfcomponent>