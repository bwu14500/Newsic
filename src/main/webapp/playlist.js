   	
   	
   	
   	
   	document.querySelector("#play-form").onsubmit = function(event){	
		event.preventDefault();

   		let htmlString=`
   		<form id = "playlistForm" action="AddToPlaylistServlet">
   	
   		<input type="hidden" name="nameid" id="nameid" required/>
		<input type="hidden" name="trackid" id="trackid" required />
         <input type="hidden" name="collectionid" id="collectionid" required/>
         <input type="hidden" name="urlid" id="urlid" required/>
         <input type="hidden" name="artUrlid" id="artUrlid" required/>
         <input type="hidden" name="commentid" id="commentid" required />
     
         </form>
         `;
   		document.querySelector("#hiddenForm").innerHTML += htmlString;
   		
   		var name = document.getElementById("nameid");
   		var track = document.getElementById("trackid");
   		var collection = document.getElementById("collectionid");
   		var url = document.getElementById("urlid");
   		var artUrl = document.getElementById("artUrlid");
   		var comment = document.getElementById("commentid");
   			
   		const queryString = window.location.search;
   		const urlParams = new URLSearchParams(queryString);
   		
   		name.value = urlParams.get('name');
  		track.value = urlParams.get('track');
   		collection.value = urlParams.get('collection');
   		url.value = urlParams.get('url');
   		artUrl.value = urlParams.get('artUrl');
   		comment.value = urlParams.get('comment');
   		
   		console.log(name.value);
   		console.log(track.value);
   		console.log(collection.value);
   		console.log(comment.value);
   		
   		console.log(name);
   		console.log(track);
   		console.log(collection);
   		console.log(comment);
   		
   		var form = document.getElementById("playlistForm");
   		form.submit();
   		
   		
  }
   		