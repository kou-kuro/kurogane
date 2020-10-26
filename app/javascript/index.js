
// window.addEventListener('load', function(){
  function index (){
 const event = document.getElementById("categories")
 event.addEventListener('mouseover', function(){
  event.setAttribute("style", "color:#FFBEDA;")
  })

 event.addEventListener('mouseout', function(){
   event.removeAttribute("style", "color:#FFBEDA;")
 })
 event.addEventListener('click', function(){
   console.log("click OK")
 })
}

window.addEventListener('load', function(){
  const event = document.getElementById("categories1")
  event.addEventListener('mouseover', function(){
   event.setAttribute("style", "color:#DB6400;")
   })
 
  event.addEventListener('mouseout', function(){
    event.removeAttribute("style", "color:#DB6400;")
  })
  event.addEventListener('click', function(){
    console.log("click OK")
  })
 })

 window.addEventListener('load', function(){
  const event = document.getElementById("categories2")
  event.addEventListener('mouseover', function(){
   event.setAttribute("style", "color:#BEDBBB;")
   })
 
  event.addEventListener('mouseout', function(){
    event.removeAttribute("style", "color:#BEDBBB;")
  })
  event.addEventListener('click', function(){
    console.log("click OK")
  })
 })

 window.addEventListener("mouseover", index);
