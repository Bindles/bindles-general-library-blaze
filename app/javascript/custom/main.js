  //LOG
  var l=console.log.bind(console)

    // OLD | Add a custom alias for document.getElementById
  // gei = function(id) {
  //   return document.getElementById(id);
  // };


  // Add custom aliases for various document methods
  document.ge = {
    id: function (id) {
      return document.getElementById(id);
    },
    qs: function (selector) {
      return document.querySelector(selector);
    },
    qsa: function (selector) {
      return document.querySelectorAll(selector);
    },
    ce: function (tagName) {
      return document.createElement(tagName);
    },
    cn: function (className) {
      return document.getElementsByClassName(className);
    },
    tn: function (tagName) {
      return document.getElementsByTagName(tagName);
    },
  };



// Shorthand alias for common event listeners
function on(eventType, target, callback) {
  target.addEventListener(eventType, callback);
}

// Shorthand alias for click event
function click(target, callback) {
  on('click', target, callback);
}

// Shorthand alias for load event
function load(callback) {
  on('load', window, callback);
}

// Example usage replacing usual code
var myButton = document.getElementById('myButtonId');
click(myButton, function() {
  console.log('Button clicked!');
});
// Instead of myButton.addEventListener('click', function() {...});

// Example usage for custom event
var customElement = document.getElementById('customElementId');
on('customEvent', customElement, function() {
  console.log('Custom event triggered on customElement');
});
// Instead of customElement.addEventListener('customEvent', function() {...});




  // Now you can use the aliases
  var element = document.ge.id("yourElementId");
  element.innerHTML = "Hello, using ge.id!";

  var selectedElement = document.ge.qs(".someClass");
  l(selectedElement);

  var allElements = document.ge.qsa(".someClass");
  l(allElements);

  var newElement = document.ge.ce("div");
  newElement.innerHTML = "New Element";
  document.body.appendChild(newElement);

  var elementsByClass = document.ge.cn("someClass");
  l(elementsByClass);

  var elementsByTagName = document.ge.tn("div");
  l(elementsByTagName);

  //OLD Now you can use document.gei instead of document.getElementById
  // var element = gei("yourElementId");
  // element.innerHTML = "Hello, Custom Alias!";
