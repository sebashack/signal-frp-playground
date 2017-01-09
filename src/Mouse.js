exports.displayText = function(str) {
  return function() {
    var text = document.getElementById('myText');
    text.textContent = str;
  };
};
