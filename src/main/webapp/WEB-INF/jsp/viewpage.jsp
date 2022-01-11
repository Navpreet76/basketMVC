<!DOCTYPE html>
<html data-ng-app="demoApp">
<head>
<meta charset="ISO-8859-1">
<title>Angular JS</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script>
<link href="../webapp/css/main.css" rel="stylesheet">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script>
var app = angular.module("demoApp", []);

app.controller("demoCtrl", function($scope) {
 $scope.team = "Chicago Bulls";
 $scope.coach = "Phil Jackson";
 $scope.player1 = 'Ron Harper';
 $scope.player2 = 'Michael Jordan';
 $scope.player3 = "Luke Longley";
 $scope.player4 = "Scottie Pippen";
 $scope.player5 = "Dennis Rodman";
 $scope.starters = ["Ron Harper", "Michael Jordan", "Scottie Pippen", "Luke Longley", "Dennis Rodman"];
 $scope.bench = ["Steve Kerr", "Toni Kukoc", "Jason Caffey", "Bison Dele", "Randy Brown", "Jud Buechler"];
 
});
</script>
</head>
<body>
<div class="row">
<div class="col">
	<span>column 1</span>
</div>
	<div class="col">
 		<div data-ng-controller="demoCtrl" class="player-table">
        	<table border="1">
        		<tr>
            		<th>Team</th>
            		<th>Coach</th>
            		<th>Starting Players</th>
            		<th>Bench Players</th>
            	</tr>
            	<tr>
            		<td data-ng-bind="team"></td>
            		<td data-ng-bind="coach"></td>
            		<td>
            			<ul>
            				<li data-ng-repeat="x in starters">{{x}}</li>
            		
            			</ul>
            		</td>
            		<td>
            			<ul>
            				<li data-ng-repeat="y in bench">{{y}}</li>
            		
            			</ul>
            		</td>
            	</tr>
        	</table>
       </div>
   	</div>
 </div>
</body>
</html>