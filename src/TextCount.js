exports.signalText = function(constant) {
  var out = constant("");
  document.addEventListener("input", function() {
    var box = document.getElementById('myBox');
    out.set(box.value);
  }, false);
  return function() {
    return out;
  };
};

exports.displayButtonText = function(str) {
  return function() {
    var button = document.getElementById('myButton');
    button.value = str;
  };
};
