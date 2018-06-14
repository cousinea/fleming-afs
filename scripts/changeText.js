// JavaScript Document


//Just toggles between 'More Detail' and 'Less Detail'
function changeText(foo){ 

var foo;

if (document.getElementById(foo).innerHTML == 'Less Detail')
{
	document.getElementById(foo).innerHTML = 'More Detail';
}
else {
	document.getElementById(foo).innerHTML = 'Less Detail';
}
}


//Toggles between the open and closed states of the slide effect
//see here: http://docs.jquery.com/Effects/slideToggle
function blindThis(d) {
	
	var d = "#"+d;
	$(d).slideToggle("slow");
	
}


//Switches between 'More Detail' and 'Less Detail' en masse.
function lessToMoreSwitch(){

  $(document).ready(function(){
    $("a:contains('Less Detail')").html("More Detail");
  });

}

//Switches between 'More Detail' and 'Less Detail' en masse.
function moreToLessSwitch(){

  $(document).ready(function(){
    $("a:contains('More Detail')").html("Less Detail");
  });

}


//Closes all opened divs. Note this is just looking for a div with an id that
//starts with a 'q' (the "div[id^='q']" query), so, if this starts behaving oddly, 
//it's probably because a div was added to the page that started with a q that
//wasn't intended to be slide-able.
function blindUpAll(){

  $(document).ready(function(){
							 
	var steve = $("div[id^='q']").slideUp("slow");
						 
  });

}


//Opens all closed divs. Note this is just looking for a div with an id that
//starts with a 'q' (the "div[id^='q']" query), so, if this starts behaving oddly, 
//it's probably because a div was added to the page that started with a q that
//wasn't intended to be slide-able.
function blindDownAll(){

  $(document).ready(function(){
							 
	var steve = $("div[id^='q']").slideDown("slow");
						 
  });

}


//Shut 'em up and change their texts.
function collapseAll() {

lessToMoreSwitch();
blindUpAll();

}

//Open 'em up and change their texts.
function expandAll() {

moreToLessSwitch();
blindDownAll();

}