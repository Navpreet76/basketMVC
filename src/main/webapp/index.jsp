<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<head>
<link href="<c:url value="/static/css/app.css" />" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> 
<style>
	.container{
		width: 100%;
	}
	  .wrapper {
    background-color: whitesmoke;
    list-style-type: none;
    padding: 20px;
    border-radius: 3px;
  }
  .header {
  	background-image: linear-gradient(to right, yellow, rgba(255,0,0,1));
  }
  .link-row	{
  display: flex;
  justify-content: flex-end;
  }
  .link-row ul li{
  	display: inline;
  	padding: 5px;
  	margin-right: 10px;
  }
  .link-row ul li a{
  	text-decoration: none;
  	color: white;
  }
  .form-row {
    display: flex;
    justify-content: flex-end;
    padding: .5em;
  }
  .form-row > label {
    padding: .5em 1em .5em 0;
    flex: 1;
  }
  .form-row > input {
    flex: 2;
  }
  .form-row > input,
  .form-row > button {
    padding: .5em;
  }
  .form-row > button {
   background: gray;
   color: white;
   border: 0;
   width: 200px;
  }
</style>

</head>
<div class="container">
	<div class="header">
		<div class="row">
			<div class="link-row">
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">Final</a></li>
					<li><a href="#">View</a></li>
				
				
				</ul>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-6">
			<h3>Database of Legendary NBA Players</h3>
			<h4>Please Add your selection</h4>
		</div>
		<div class="col-6">
			<form action="form_process" method="GET">
				<ul class="wrapper">
					<li class="form-row">
						<label for="name">Player Name</label>
						<input type="text" name="playername">
					</li>
					<li class="form-row">
						<label for="position">Position</label>
						<input type="text" name="position">
					</li>
					<li class="form-row">
						<label for="description">Description</label>
						<input type="text" name="description">
					</li>
					<li class="form-row">
						<label for="ppg">Points Per Game</label>
						<input type="number" name="ppg">
					</li>
					<li class="form-row">
						<button type="submit">Submit</button>
					</li>
				</ul>
			</form>
		</div>
	</div>
</div>

</body>
</html>
