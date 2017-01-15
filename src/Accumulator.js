exports.signalAddButton = function(constant) {
  var out = constant(0);
  var button4 = document.getElementById('myButton4');
  button4.addEventListener("click", function() {
    out.set(1);
  }, false);
  return function() {
    return out;
  };
};

exports.signalSubtractButton = function(constant) {
  var out = constant(0);
  var button5 = document.getElementById('myButton5');
  button5.addEventListener("click", function() {
    out.set(-1);
  }, false);
  return function() {
    return out;
  };
};

exports.displayAccumValue = function(n) {
  return function() {
    var label = document.getElementById('myLabel2');
    var newVal = window.parseInt(label.textContent, 10) + n;
    label.textContent = newVal;
  };
};
