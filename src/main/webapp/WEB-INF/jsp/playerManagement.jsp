<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>AngularJS $http Example</title>  
    <style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
 
    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body data-ng-app="myApp" class="ng-cloak">
      <div class="generic-container" data-ng-controller="PlayerController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Player Registration Form </span></div>
              <div class="formcontainer">
                  <form data-ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" data-ng-model="ctrl.player.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="name">Name</label>
                              <div class="col-md-7">
                                  <input type="text" data-ng-model="ctrl.player.name" id="name" class="name form-control input-sm" placeholder="Enter your name" required data-ng-minlength="3"/>
                                  <div class="has-error" data-ng-show="myForm.$dirty">
                                      <span data-ng-show="myForm.name.$error.required">This is a required field</span>
                                      <span data-ng-show="myForm.name.$error.minlength">Minimum length required is 3</span>
                                      <span data-ng-show="myForm.name.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="position">Position</label>
                              <div class="col-md-7">
                                  <input type="text" data-ng-model="ctrl.player.position" id="position" class="form-control input-sm" placeholder="Enter player position. [This field is validation free]"/>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="description">Description</label>
                              <div class="col-md-7">
                                  <input type="text" data-ng-model="ctrl.player.description" id="description" class="description form-control input-sm" placeholder="Enter player description" required/>
                                  <div class="has-error" data-ng-show="myForm.$dirty">
                                      <span data-ng-show="myForm.description.$error.required">This is a required field</span>
                                      <span data-ng-show="myForm.description.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.player.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" data-ng-disabled="myForm.$invalid">
                              <button type="button" data-ng-click="ctrl.reset()" class="btn btn-warning btn-sm" data-ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Players </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>ID.</th>
                              <th>Name</th>
                              <th>Position</th>
                              <th>Description</th>
                              <th>PPG</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr data-ng-repeat="p in ctrl.players">
                              <td><span data-ng-bind="p.id"></span></td>
                              <td><span data-ng-bind="p.name"></span></td>
                              <td><span data-ng-bind="p.position"></span></td>
                              <td><span data-ng-bind="p.description"></span></td>
                              <td><span data-ng-bind="p.ppg"></span></td>
                              <td>
                              <button type="button" data-ng-click="ctrl.edit(p.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" data-ng-click="ctrl.remove(p.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
       
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/user_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
  </body>
</html>