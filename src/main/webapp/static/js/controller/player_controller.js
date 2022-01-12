'use strict';
 
angular.module('myApp').controller('PlayerController', ['$scope', 'PlayerService', function($scope, PlayerService) {
    var self = this;
    self.user={id:null,name:'',position:'',description:'', ppg:null};
    self.users=[];
 
    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;
 
 
    fetchAllPlayers();
 
    function fetchAllPlayers(){
        PlayerService.fetchAllUPlayers()
            .then(
            function(d) {
                self.players = d;
            },
            function(errResponse){
                console.error('Error while fetching Players');
            }
        );
    }
 
    function createPlayer(player){
        PlayerService.createPlayer(player)
            .then(
            fetchAllPlayers,
            function(errResponse){
                console.error('Error while creating Player');
            }
        );
    }
 
    function updatePlayer(player, id){
        PlayerService.updatePlayer(player, id)
            .then(
            fetchAllPlayers,
            function(errResponse){
                console.error('Error while updating Player');
            }
        );
    }
 
    function deletePlayer(id){
        PlayerService.deletePlayer(id)
            .then(
            fetchAllPlayers,
            function(errResponse){
                console.error('Error while deleting Player');
            }
        );
    }
 
    function submit() {
        if(self.player.id===null){
            console.log('Saving New Player', self.player);
            createPlayer(self.player);
        }else{
            updatePlayer(self.player, self.player.id);
            console.log('Player updated with id ', self.player.id);
        }
        reset();
    }
 
    function edit(id){
        console.log('id to be edited', id);
        for(var i = 0; i < self.players.length; i++){
            if(self.players[i].id === id) {
                self.player = angular.copy(self.players[i]);
                break;
            }
        }
    }
 
    function remove(id){
        console.log('id to be deleted', id);
        if(self.player.id === id) {//clean form if the user to be deleted is shown there.
            reset();
        }
        deletePlayer(id);
    }
 
 
    function reset(){
        self.player={id:null,name:'',position:'',description:'', ppg:null};
        $scope.myForm.$setPristine(); //reset Form
    }
 
}]);