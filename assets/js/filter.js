$(document).ready(function(){

  // ready Isotope for filtering posts on tags
  var $posts = $('.posts').isotope({
    itemSelector: '.post',
    layoutMode: 'vertical'
  });
  function filterPosts(tags) {
    $posts.isotope({filter: function() {
        return tags.every(x => $(this).data('tags').has(x));
    }});
  }

  // set of all tags (side effect: simplify subsequent tests)
  var tags = new Set($('.post')
    .map(function() {
      let tags = $(this).data('tags');
      $(this).data('tags', new Set(tags));
      return tags;
    })
    .get()
  ); // FIXME make this react to isotope, and make selectize react to this

  // prep url parameter "with" for Selectize initialization
  let queryParams = new URLSearchParams(window.location.search);
  let queryWith = queryParams.get('with');

  // initialize Selectize filter
  $('#selectize-tags').selectize({
    dropdownParent: 'body',
    placeholder: "posts tagged...",
    options: Array.from(
      tags.values(),
      x => {return {'text': x, 'value': x};}),
    items: tags.has(queryWith) ? [queryWith] : [],
  });

  // initial run of filterPosts
  var tagsControl = $('#selectize-tags')[0].selectize;
  filterPosts(tagsControl.items);

  // attatch filterPosts to selectize change
  tagsControl.on('change', function() {filterPosts(tagsControl.items)});

});

// there are item_add and other useful events
/// https://github.com/selectize/selectize.js/blob/master/docs/events.md

// try plugins, like the one giving an "x" to remove