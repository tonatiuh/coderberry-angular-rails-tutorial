@EpisodesCtrl = @app.controller 'EpisodesCtrl', ["$scope", "$http", ($scope, $http) ->
  $scope.episodes = []
  $scope.selectedEpisode = null

  $scope.showEpisode = (episode) ->
    $scope.selectedEpisode = episode
    loadVideo(episode)

  loadVideo = (episode) ->
    $("#player").flowplayer
      playlist: [[mp4: episode.video_url]]
      ratio: 9 / 14

  $scope.isSelected = (episode) ->
    'active' if $scope.selectedEpisode == episode

  loadEpisodes = ->
    $http.get("/api/screencasts.json").success((data, status, headers, config) ->
      angular.forEach data, (value) ->
        $scope.episodes.push value
    )

  loadEpisodes()
]
