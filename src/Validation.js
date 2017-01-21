exports.signalFormInput = function(constant) {
  var out = constant("");
  document.addEventListener("input", function() {
    var box = document.getElementById('myBox4');
    out.set(box.value);
  }, false);
  return function() {
    return out;
  };
};

exports.enableButton = function(bool) {
  return function() {
    var button = document.getElementById('myButton6');
    button.disabled = bool;
  };
};
