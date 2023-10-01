
document.querySelector("#search-form").onsubmit = function(event) {
    event.preventDefault();

    //Get the user's input 
    let searchInput = document.querySelector("#search-id").value.trim();
    let limitInput = document.querySelector("#limit-id").value;

    //convert spaces and special characters 
    let convertedSearchInput = encodeURIComponent(searchInput);


    //prepare the endpoint
    let endpoint = "https://itunes.apple.com/search?term=" + convertedSearchInput + "&limit=" + limitInput;  

    console.log(endpoint); 

    //Make HTTP request via AJAX
   let httpRequest = new XMLHttpRequest();
   //Create a request (initialize) .open()
   //first arg: the method  (GET OR POST)
   // 2nd arg: the endpoint
   httpRequest.open("GET", endpoint);
   httpRequest.send();
   //don't wait around for response, set up an event handler
   //below function will run when iTunes sends back a response
   httpRequest.onreadystatechange = function() {
       console.log(httpRequest.readyState);
       console.log("we got a response!");
       //check that we got response
       if(httpRequest.readyState == 4){
           //check if response was successful
           if(httpRequest.status == 200){
               //log out response from iTunes
               console.log(httpRequest.responseText);
               // console.log(JSON.parse(httpRequest.responseText));
               displayResults(httpRequest.responseText);
           }
           else{ 
               alert("AJAX error!!"+ httpRequest.status );
               console.log(httpRequest.status);
           }
       }
   }
   console.log("moving on ....");

   // three different things happen when we send a request
   // makes sure its requested, read, and actually responce total 4 when loading is done

   //display the information
   function createPost(s) {
	song = s
 	alert("post creating for song "+ song.trackName)
 	
 	console.log("----------")
 	console.log(song.trackName);
 	console.log(song.artistName);
 	console.log(song.collectionName);
 	console.log(song.previewUrl);
 	console.log("----------")
	console.log("Hello i am here")
	
	var track = document.getElementById("track");
	var artist = document.getElementById("artist");
	var collection = document.getElementById("collection");
	var url = document.getElementById("url");
	var artUrl = document.getElementById("artUrl");
	
	track.value = song.trackName;
	artist.value = song.artistName;
	collection.value = song.collectionName;
	url.value = song.previewUrl;
	artUrl.value = song.artworkUrl100;
	var form = document.getElementById("post");
	
	
	console.log("----------")
 	console.log(track.value);
 	console.log(artist.value);
 	console.log(collection.value);
 	console.log(url.value);
 	console.log(artUrl.value);
 	console.log("----------")
	console.log("Hello i am here")
	

	
	form.submit();
 
}

}

function setClicked(i){
	var clicked = document.getElementById("clicked");
	clicked.value = i;
}

function displayResults(resultsString){ 
   //convert the JSON string to JS object
   let resultsJS = JSON.parse(resultsString);
   console.log(resultsJS);
   //clear the previous search results
   document.querySelector("tbody").replaceChildren();
	
   document.querySelector("#num-results").innerHTML = resultsJS.resultCount;
   for(let i = 0; i < resultsJS.results.length; i++){
       //creating the TR tag from html for each result
		
		trackid = "track" + i
		artistid = "artist" + i
		collectionid = "collection" + i
		urlid = "url" + i
		artUrlid = "artUrl" + i
       
      let htmlString =`
       <tr>
           <td>
           <form id="post" action="CreatePostServlet">
			
           <button onclick= "setClicked(i)" >
           <img src="${resultsJS.results[i].artworkUrl100}" width = "165px" height = "160px">
          	
           <input type="hidden" name="track" id="${trackid}" />
           <input type="hidden" name="artist" id="${artistid})" />
           <input type="hidden" name="collection" id="${collectionid}"/>
           <input type="hidden" name="url" id="${urlid}" />
           <input type="hidden" name="artUrl" id="${artUrlid}" />
           
           </button>
           <div class = "commentBox">
           		 <input type = "text" name = "comment" id = "comment" placeholder = "Comment..." style = "border-radius:5px" required/>
           </div>
          
           
           <input type="hidden" name="clicked" id = "clicked" required/>
           </form>
           </td>
           <td>${resultsJS.results[i].artistName}</td>
           <td>${resultsJS.results[i].trackName}</td>
           <td>${resultsJS.results[i].collectionName}</td>
           <td><audio src="${resultsJS.results[i].previewUrl}" controls></audio></td>
       </tr>
       `;
    document.querySelector("tbody").innerHTML += htmlString;
    
    var track = document.getElementById(trackid);
	//var artist = document.getElementById(artistid);
	var collection = document.getElementById(collectionid);
	var url = document.getElementById(urlid);
	var artUrl = document.getElementById(artUrlid);
    
    
    track.value = resultsJS.results[i].trackName;
    
	//artist.value = resultsJS.results[i].artistName;
	
	collection.value = resultsJS.results[i].collectionName;
	
	url.value = resultsJS.results[i].previewUrl;
	
	artUrl.value = resultsJS.results[i].artworkUrl100;
	
	console.log("----------")
 	console.log(track.value);
 	//console.log(artist.value);
 	console.log(collection.value);
 	console.log("----------")
	console.log("Hello i am here")
	
	
        
   }
   
   
   
}











 