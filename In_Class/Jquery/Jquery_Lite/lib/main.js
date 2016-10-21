const DNC = require('./dom_node_collection.js');

Window.prototype.$l = function (selector) {
  let argument;
  if (typeof selector === 'string') {
    argument = Array.from(document.querySelectorAll(selector))
  } else if (typeof selector === 'object') {
    argument = [selector]
  }
  return new DNC(argument)
};
