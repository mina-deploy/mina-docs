// ----------------------------------------------------------------------------
// Pretty print
// Modify <pre>s to add the right classes.
// ----------------------------------------------------------------------------

$(function() {
  $("pre").each(function() {
    var text = $(this).text();
    text = text.replace(/^[ \n\t]*|[ \n\t]*$/g, '');
    var line = text.match(/^(.*?)[$\n]/)[1];

    // Terminalify those that begin with `$ `.
    if (text[0] == '$') {
      $(this).addClass('terminal');
    }

    // Those that have `# foo.rb` as the first line, highlight.
    var m = line.match(/^# (.*\.([a-z]{2,3}))$/);
    if (m) {
      var rest = text.match(/\n((?:.|\n)*)$/m)[1];
      $(this).addClass('prettyprint');
      $(this).addClass('lang-'+m[2]);
      $(this).addClass('has-caption');
      $(this).html("<h5>"+m[1]+"</h5>" + rest);
    }
  });

  prettyPrint();
});
