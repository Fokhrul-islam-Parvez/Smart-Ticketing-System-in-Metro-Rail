var images = [
  "Image/image1.jpg",
  "Image/image2.jpg",
  "Image/image3.jpg",
  "Image/image4.jpg",
  "Image/image5.jpg"
]

var imageHead = document.getElementById("image-container");
var i = 0;
setInterval(function() {
      imageHead.style.backgroundImage = "url(" + images[i] + ")";
      i = i + 1;
      if (i == images.length) {
      	i =  0;
      }
}, 5000);


var imageID=0;
function changeimage(every_seconds){
    //change the image
    if(!imageID){
        document.getElementById("image-container").src="Image/image1.jpg";
        imageID++;
    }
    else{if(imageID==1){
        document.getElementById("image-container").src="Image/image2.jpg";
        imageID++;
    }else{if(imageID==2){
        document.getElementById("image-container").src="Image/image3.jpg";
        imageID=0;
    }}}
    //call same function again for x of seconds
    setTimeout("changeimage("+every_seconds+")",((every_seconds)*1000));
}
