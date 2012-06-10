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
      // Strip a first line that's only $
      var html = text.replace(/^\$*\n/, "");
      // Highlight the commands
      var html = html.replace(/((?:^|\n)(?:\$ |~)[^\n]+)$/mg, "<strong>$1</strong>");
      // Comments
      var html = html.replace(/((?:^|\n)#[^\n]*)$/mg, "<em>$1</em>");
      $(this).html(html);
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

