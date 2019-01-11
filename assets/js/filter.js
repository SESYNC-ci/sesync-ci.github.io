// ready Isotope for filtering posts on their tag set
var $posts = $('.posts').isotope({
  itemSelector: '.post',
  layoutMode: 'vertical'
});
$('.post').each(function() {
  var tagSet = new Set($(this).data('tags'));
  $(this).data('tagSet', tagSet);
});

// ready Selectize user input
$('#selectize-tags').selectize({
  dropdownParent: 'body',
  placeholder: "posts tagged...",
  options: []
});
var tagsControl = $('#selectize-tags')[0].selectize;

// update control options from result of filtering posts
function updateOptions() {
  var $postsLeft = $('.post:visible');
  var tagsLeft = new Set($postsLeft.map(function() {
    return $(this).data('tags');
  }).toArray());
  tagsControl.clearOptions();
  tagsControl.addOption(Array.from(
    tagsLeft.values(),
    x => ({'text': x, 'value': x})
  ));
}
$posts.on('arrangeComplete', updateOptions);
  
// function that Selectize will trigger to filter posts and set options
function filterPosts(tags) {
  $posts.isotope({filter: function() {
    return tags.every(x => $(this).data('tagSet').has(x));
  }});
}
tagsControl.on('change', function() {
  tagsControl.close();
  tagsControl.blur();
  filterPosts(tagsControl.items);
});

// initial run
var queryParams = new URLSearchParams(window.location.search);
var queryWith = queryParams.get('with');
updateOptions();
if (queryWith !== null) {
  tagsControl.addItem(queryWith, false);
}

// FIXME getting close on delete is requiring selectize mods