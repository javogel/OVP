// $( document ).ready(function() {
//
//
//
//     if ( $( "#video-show-div" ).length ) {
//
//       // 2. This code loads the IFrame Player API code asynchronously.
//           var tag = document.createElement('script');
//           var youtube_id = String($('.temp_information').attr('data'))
//
//
//
//
//           tag.src = "https://www.youtube.com/iframe_api";
//           var firstScriptTag = document.getElementsByTagName('script')[0];
//           firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
//
//
//           //  3. This function creates an <iframe> (and YouTube player)
//           //  after the API code downloads.
//           var player;
//           function onYouTubeIframeAPIReady() {
//             player = new YT.Player('player', {
//               height: '100%',
//               width: '100%',
//               videoId: youtube_id,
//               playerVars: {'controls': 1, 'iv_load_policy':3, 'color': 'white', 'showinfo':0, 'modestbranding':1},
//               events: {
//                 'onReady': onPlayerReady,
//                 'onStateChange': onPlayerStateChange
//               }
//             });
//           }
//
//
//           // # // 4. The API will call this function when the video player is ready.
//           function onPlayerReady(event) {
//               event.target.playVideo();
//               $(".video-main").fitVids();
//           }
//
//
//
//           var done = false;
//           function onPlayerStateChange(event) {
//             if (event.data == YT.PlayerState.PLAYING && !done) {
//               setTimeout(stopVideo, 6000);
//               done = true;
//             }
//           }
//           function stopVideo() {
//             player.stopVideo();
//           }
//
//
//
//     }
//
// })
