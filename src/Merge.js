exports.signalButton2 = function(constant) {
  var out = constant("");
  var button2 = document.getElementById('myButton2');
  button2.addEventListener("click", function() {
    out.set(button2.value);
  }, false);
  return function() {
    return out;
  };
};

exports.signalLink = function(constant) {
  var out = constant("");
  var link = document.getElementById('myLink');
  link.addEventListener("click", function() {
    out.set(link.textContent);
  }, false);
  return function() {
    return out;
  };
};

exports.displayBoxValue = function(str) {
  return function() {
    var box = document.getElementById('myBox2');
    box.value = str;
  };
};
