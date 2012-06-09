$(function () {
  var urlPrefix = $("#proscribe-js").attr('src').match(/^(.*)\/[^.]+.js[\?0-9]*/)[1];

  $("h4").each(function() {
    var $this = $(this);

    // Find the next p
    var $p    = $this.find('+ p');
    if (!$p.length) { $p = $this; }

    var $pre = $p.find('+ pre');
    if (!$pre.length) { return; }

    // Build it
    var $el   = $("<section class='literate'>");
    $this.before($el);

    // Move them
    $el.append($pre);
    $el.append($this);
    $el.append($p);
  });

  $("pre").each(function() {
    var $this = $(this);
    $this.addClass('prettyprint');

    // Filename
    var r = /\[(.*?)\s*\((.*?)\)\]\n*/;
    var m = $this.text().match(r);
    if (m) {
      var file = m[1];
      var type = m[2];
      $this.addClass('lang-'+type);

      if (file.length) {
        $this.addClass('has-caption');
        $this.prepend($("<h5 class='caption'>").text(file));
      }

      $this.html($this.html().replace(r, ''));
    }

    // Terminal
    if ($this.text().match(/^\s*([a-zA-Z_~\/]*)\$ /)) {
      $this.addClass('terminal');
      $this.removeClass('prettyprint');
      $this.html($this.html().replace(/([a-zA-Z_~\/]*\$ )(.*?)[\r\n$]/g, "<strong><em>$1</em>$2</strong>\n"));
    }
  });

  function searchToPages(dict) {
    // {"0":4, "1":5} -- this is a pair of `page_id` => `result_score`.

    list = _.map(dict, function(val, key) { return [key, val]; }); // {a:2} => [[a,2]] (pageid => score)
    list = _.sortBy(list, function(a) { return -1 * a[1]; });
    ids  = _.map(list, function(a) { return parseInt(a[0]); }); // Basically Hash#keys, now an array of page_id's
    return _.map(ids, function(id) { return PageIndex[id] });
  }
  
  function search(keyword) {
      var words = keyword.toLowerCase().split(' ');

      var results = {};
      _.each(words, function(word) {
        results = SearchIndex[word];
      });

      return searchToPages(results);
  }

  window.search = search;

  $("#search input").live('keyup', function(e) {
    if (e.keyCode == 13) {
      var $a = $("#search .results > .active a");
      if ($a.length) {
        window.location = $a.attr('href');
        return false;
      };
    }
    if ((e.keyCode == 40) || (e.keyCode == 38)) { // DOWN and UP
      var dir = e.keyCode == 40 ? 'next' : 'prev';

      var links  = $("#search .results li");
      var active = $("#search .results .active");
      var next   = active[dir]();

      if (active.length && next.length) {
        active.removeClass('active');
        next.addClass('active');
      }

      return false;
    }

    var template = _.template(
      "<li>" + 
        "<a href='<%= url %>'>" +
          "<strong>" + 
            "<%= title %> <span><%= type %></span>" +
          "</strong>" +
          "<span>" +
          "<% if (parent) { %>" + 
            "<%= parent.title %> &rsaquo; <%= title %>" +
          "<% } %>" +
          "</span>" +
        "</a>" +
      "</li>");
    var keyword = $(this).val();
    results = search(keyword); // Array of {title: __, url: __}

    var $el = $("#search .results");
    $el.show();
    $el.html('');


    // Limit results
    results = results.slice(0, 12);

    _.each(results, function(page) {
      // Build the options for the tempalte
      o = _.extend({}, page);

      _.each(keyword.split(' '), function(word) {
        console.log("Replacing ", word, " in ", o.title);
        o.title = o.title.replace(new RegExp(word, 'i'), function (n) {
          return "<em class='highlight'>" + n + "</em>";
        });
      });

      o.url = urlPrefix + page.url;
      o.parent = PageIndex[page.parent];

      $el.append(template(o));
    });

    $el.find(':first-child').addClass('active');
  });

  $("#search .results li").live('hover', function() {
    var $results = $(this).closest('ul');
    $results.find('.active').removeClass('active');
    $(this).addClass('active');
  });

  $("#search .results").live('mouseout', function() {
    var $results = $(this);
    $results.find('.active').removeClass('active');
    $results.find('>:first-child').addClass('active');
  });


  $("body").live('click', function() {
    $("#search .results").hide();
  });

  prettyPrint();
});
