exports.signalInput = function(constant) {
  var out = constant("");
  document.addEventListener("input", function() {
    var box = document.getElementById('myBox3');
    out.set(box.value);
  }, false);
  return function() {
    return out;
  };
};

exports.signalClick = function(constant) {
  var out = constant(null);
  var button3 = document.getElementById('myButton3');
  button3.addEventListener("click", function() {
    out.set(null);
  }, false);
  return function() {
    return out;
  };
};

exports.displayInput = function(str) {
  return function() {
    var label = document.getElementById('myLabel');
    label.textContent = str;
  };
};
