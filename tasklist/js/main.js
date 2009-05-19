var taskFacade = 'facades/TaskFacade.cfc';

$(document).ready(function(){
	$('#task-editor').jqm({modal: true});
	$('#editor-task-duedate').datepicker();
	
	// get all tasks
	getAllTasks();
	
	// refresh tasks when show complete check boxes are clicked
	$('#showTodayComplete').click(function(){
		getTasks('#showTodayComplete','getTodayTasks','#today-tasks');
	});
	
	$('#showTomorrowComplete').click(function(){
		getTasks('#showTomorrowComplete','getTomorrowTasks','#tomorrow-tasks');
	});
	
	$('#showComingSoonComplete').click(function(){
		getTasks('#showComingSoonComplete','getComingSoonTasks','#coming-soon-tasks');
	});
	
	$('.edit-link').live('click',function(){
		var task = $(this).parent().data('task');
		editTask(task);
	});
	
	$('.delete-link').live('click',function(){
		var task = $(this).parent().data('task');
		deleteTask(task);
	});
	
	$('.taskCompleteCBox').live('click',function(){
		var task = $(this).parent().data('task');
		var isComplete = false;
		if ($(this).attr('checked')){
			isComplete = true;
		}
		updateTaskComplete(task, isComplete);
	});
	
	$('#editor-task-save-button').click(function(){
		doTaskSave();
	});
	
	$('a.add-new-task').click(function(){
		newTask();
	});
});

function getTasks(cboxTarget,methodName,resultTarget){
	var showCompleteTasks = false;
	if( $(cboxTarget + ':checked').attr('checked')){
		showCompleteTasks =  true
	};
	
	$.getJSON(
		taskFacade,
		{
			method: methodName,
			showComplete: showCompleteTasks,
			returnFormat: 'json'
		},
		function(result){
			buildHTML(result,resultTarget);
		}
	);
};

function getAllTasks(){
	getTasks('#showTodayComplete','getTodayTasks','#today-tasks');
	getTasks('#showTomorrowComplete','getTomorrowTasks','#tomorrow-tasks');
	getTasks('#showComingSoonComplete','getComingSoonTasks','#coming-soon-tasks');
};

function buildHTML(result,target){
	var html = '';
	
	// build the HTML
	for (var i = 0; i < result.length; i++){
		var idStr = 'task-' + result[i].id;
		var checkedStr = '';
		if(result[i].isComplete){
			checkedStr = 'checked=checked '
		};
		html += '<div class="task ui-state-highlight" id="' + idStr + '">';
		html += '<div class="task-name">' + result[i].name + '</div>';
		html += '<div class="task-description">' + result[i].description + '</div>';
		html += '<div class="task-due">Due: ' + result[i].dueDate + '</div>';
		html += '<div class="task-links">';
		html += '<input class="taskCompleteCBox" type="checkbox"' + checkedStr + '/>Complete | ';
		html += '<a href="javascript:void(0);" class="edit-link">edit</a> | <a href="javascript:void(0);" class="delete-link">delete</a>';
		html += '</div>';
		html += '</div>';
	}
	
	$(target).html(html);
	
	// attach the data to the HTML
	for (var i = 0; i < result.length; i++){
		var idSelector = '#task-' + result[i].id;
		$(idSelector + ' .task-links').data('task',result[i]);
	}
};

function newTask(){
	$('#task-editor-type').text('New');
	$('#editor-task-id').val(null);
	$('#editor-task-name').val(null);
	$('#editor-task-description').text(null);
	$('#editor-task-duedate').val(null);
	$('#task-editor').jqmShow();
};

function editTask(task){
	$('#task-editor-type').text('Edit');
	$('#editor-task-id').val(task.id);
	$('#editor-task-name').val(task.name);
	$('#editor-task-description').val(task.description);
	$('#editor-task-duedate').val(task.dueDate);
	$('#task-editor').jqmShow();
};

function doTaskSave(){
	if ($('#task-editor-type').text() == 'Edit'){
		var arguments = {
			method: 'updateTask',
			returnFormat: 'json',
			id: $('#editor-task-id').val(),
			name: $('#editor-task-name').val(),
			description: $('#editor-task-description').val(),
			duedate: $('#editor-task-duedate').val()
		};
	} else {
		var arguments = {
			method: 'createTask',
			returnFormat: 'json',
			name: $('#editor-task-name').val(),
			description: $('#editor-task-description').val(),
			duedate: $('#editor-task-duedate').val()
		};
	}
	$.getJSON(
		taskFacade,
		arguments,
		function(){
			$('#task-editor').jqmHide();
			$('#task-editor-type').text(null);
			$('#editor-task-id').val(null);
			$('#editor-task-name').val(null);
			$('#editor-task-description').val(null);
			$('#editor-task-duedate').val(null);
			getAllTasks();
		}
	);
};

function deleteTask(task){
	var answer = confirm('Are you sure you want to permanantly delete this task?');
	if (answer){
		$.getJSON(
			taskFacade,
			{
				method: 'deleteTask',
				id: task.id,
				returnFormat: 'json'
			},
			function(){
				getAllTasks();
				alert('task deleted!');
			}
		);
	}
};

function updateTaskComplete(task,isComplete){
	$.getJSON(
		taskFacade,
		{
			method: 'updateTaskComplete',
			id: task.id,
			isComplete: isComplete,
			returnFormat: 'json'
		},
		function(){
			getAllTasks();
		}
	);
};