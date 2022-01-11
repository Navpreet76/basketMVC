<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Player CRUD operations</title>
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> 
 <style>
 	input.ng-invalid.ng-touched, textarea.ng-invalid.ng-touched {
	border: 2px solid red;
	}
	form{
		background: aquamarine;
		padding: 2rem;
		width: 80%;
	}
	form input, textarea{
		width: 400px;
		margin-bottom: 15px;
	}
 </style>
 <script type="text/javascript">
	   	 var app = angular.module("mainApp", []);
	   	 
	   	 app.controller('CRUDController', function($scope) {
	   		 $scope.PlayerModel = {
	   				 Id: 0,
	   				 Name: '',
	   				 Position: '',
	   				 Salary: 0,
	   				 Description: '',
	   			};
	   		 $scope.PlayerList = [];
	   		 $scope.AddData = function() {
	   			 var _player = {
	   					 Id: $scope.PlayerList.length + 1,
	   					 Name: $scope.PlayerModel.Name,
	   					 Position: $scope.PlayerModel.Position,
	   					 Salary: $scope.PlayerModel.Salary,
	   					 Description: $scope.PlayerModel.Description
	   			 };
	   			 $scope.PlayerList.push(_player);
	   			 ClearModel();
	   		 }
	   		 
	   		 $scope.DeleteData = function(player){
	   			 var _index = $scope.PlayerList.indexOf(player);
	   			 $scope.PlayerList.splice(_index, 1);
	   		 }
	   		 
	   		 $scope.BindSelectedData = function(player){
	   			 $scope.PlayerModel.Id = player.Id;
	   			 $scope.PlayerModel.Name = player.Name;
	   			 $scope.PlayerModel.Position = player.Position;
	   			 $scope.PlayerModel.Salary = player.Salary;
	   		 }
	   		 
	   		 $scope.UpdateData = function () {
	   			 $.grep($scope.PlayerList, function(e) {
	   				 if(e.Id == $scope.PlayerModel.Id) {
	   					 e.Name = $scope.PlayerModel.Name;
	   					 e.Position = $scope.PlayerModel.Position;
	   					 e.Salary = $scope.PlayerModel.Salary;
	   				 }
	   			 });
	   			 ClearModel();
	   		 }
	   		 
	   		 function ClearModel(){
	   			 $scope.PlayerModel.Id = 0;
	   			 $scope.PlayerModel.Name = '';
	   			 $scope.PlayerModel.Position = '';
	   			 $scope.PlayerModel.Salary = 0;
	   		 }
	   	 });
	   
</script>
</head>
<body>
	<div data-ng-app="mainApp" data-ng-controller="CRUDController">
		<table>
			<tr>
				<td>PlayerId:</td>
				<td><span>{{PlayerModel.Id}}</span></td>
			</tr>
			<tr>
				<td>Name:</td>
				<td><input type="text" data-ng-model="PlayerModel.Name" /></td>
			</tr>
			<tr>
				<td>Position:</td>
				<td><input type="text" data-ng-model="PlayerModel.Position" /></td>
			</tr>
			<tr>
				<td>Salary:</td>
				<td><input type="number" data-ng-model="PlayerModel.Salary" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" value = "Save Data"  data-ng-click="AddData()" /></td>
				<td><input type="button" value = "Update Data"  data-ng-click="UpdateData()" /></td>
			</tr>
	   </table>
	   <table>
	   	<thead>	
	   		<th>Id</th>
	   		<th>Name</th>
	   		<th>Position</th>
	   		<th>Salary</th>
	   		<th>Description</th>
	   </thead>
	   <tr data-ng-repeat="Player in PlayerList" data-ng-click="BindSelectedData(Player)">
	   		<td>{{ Player.Id }}</td>
	   		<td>{{ Player.Name }}</td>
	   		<td>{{ Player.Position }}</td>
	   		<td>{{ Player.Salary }}</td>
	   		<td>{{ Player.Description }}</td>
	   		<td><input type="button" value="Delete" data-ng-click="DeleteData(Player)" /></td>
	   
	   </tr>
	   
	   </table>
	   {{player}}
	   <div class="content">
	   		<form name="playerForm" novalidate>
	   			<input type="text" placeholder="name" name="name" data-ng-model="PlayerModel.Name" data-ng-required="true" />
	   			<input type="text" placeholder="position" name="position" data-ng-model="PlayerModel.Position" data-ng-required="true" />
	   			<input type="text" placeholder="Salary" name="salary" data-ng-model="PlayerModel.Salary" data-ng-required="true" />
	   			<textarea placeholder="Description" name="description" data-ng-model="PlayerModel.Description" data-ng-required="true"></textarea>
	   			<input type="submit" value="Submit" data-ng-click="AddData()" />
	   		</form>
	   </div>
	 </div>
</body>
</html>