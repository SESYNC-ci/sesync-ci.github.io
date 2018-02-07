var api = "https://api.github.com/repos/sesync-ci/";
function getDescription() {
  var tag = this;
  var prefix = tag.tagName == 'DIV' ? "\u2014 " : "";
  jQuery.getJSON(
    api + tag.id + "?callback=?",
    function(json) {
      tag.appendChild(
        document.createTextNode(prefix + json.data.description)
      );
    }
  );
}
jQuery(document).ready(function() {
  jQuery(".lessons").map(getDescription);
});