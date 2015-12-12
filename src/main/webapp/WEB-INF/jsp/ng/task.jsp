<%@ include file="/WEB-INF/include.jsp"%>
		
		<ng-view />
		<script type="text/ng-template" id="todomvc-index.html">
			<section id="todoapp">
				<header id="header">
					<h1>todos</h1>
					<form id="todo-form" ng-submit="addTodo()">
						<input id="new-todo" placeholder="What needs to be done?" ng-model="newTodo" ng-disabled="saving" autofocus>
					</form>
				</header>
				<section id="main" ng-show="todos.length" ng-cloak>
					<input id="toggle-all" type="checkbox" ng-model="allChecked" ng-click="markAll(allChecked)">
					<label for="toggle-all">Mark all as complete</label>
					<ul id="todo-list">
						<li ng-repeat="todo in todos | filter:statusFilter track by $index" ng-class="{completed: todo.done, editing: todo == editedTodo}">
							<div class="view">
								<input class="toggle" type="checkbox" ng-model="todo.done" ng-change="toggleCompleted(todo)">
								<label ng-dblclick="editTodo(todo)">{{todo.name}}</label>
								<button class="destroy" ng-click="removeTodo(todo)"></button>
							</div>
							<form ng-submit="saveEdits(todo, 'submit')">
								<input class="edit" ng-trim="false" ng-model="todo.name" todo-escape="revertEdits(todo)" ng-blur="saveEdits(todo, 'blur')" todo-focus="todo == editedTodo">
							</form>
						</li>
					</ul>
				</section>
				<footer id="footer" ng-show="todos.length" ng-cloak>
					<span id="todo-count"><strong>{{remainingCount}}</strong>
						<ng-pluralize count="remainingCount" when="{ one: 'item left', other: 'items left' }"></ng-pluralize>
					</span>
					<ul id="filters">
						<li>
							<a ng-class="{selected: status == ''} " href="#/">All</a>
						</li>
						<li>
							<a ng-class="{selected: status == 'active'}" href="#/active">Active</a>
						</li>
						<li>
							<a ng-class="{selected: status == 'completed'}" href="#/completed">Completed</a>
						</li>
					</ul>
					<button id="clear-completed" ng-click="clearCompletedTodos()" ng-show="completedCount">Clear completed</button>
				</footer>
			</section>
			
		</script>
		
		
<div class="modal fade" role="dialog" id="complete_task">
  <div class="modal-dialog">
  
	
	<form method="post"  action="${ completeUrl }" role="form">
	<div class="modal-content">
        
		<input type="hidden" name="taskId"  id="hiddenTaskId" value="" />
		<div class="modal-header">
			<h3>Add New Task</h3>
		</div>
		<div class="modal-body">

		
    		<fieldset>
    		
    			<legend>Task</legend>
   
      			        
	     			<div class="form-group ${status.error ? 'has-error' : ''}">
	      				<label for="note" class="control-label">Notes</label>
    					<textarea  name="notes"  class="form-control medium" ></textarea>
    					
    	     		</div>
				
    
    
      			
    		</fieldset>
		
		</div>
	
		<div class="modal-footer">
			<input type="submit" name="submit" value="Complete Task" class="btn btn-success" />
			<a class="btn btn-primary" data-dismiss="modal">Cancel</a>
		</div>
		</div>
	</form>
	</div>
</div>

