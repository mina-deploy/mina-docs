module Mmdoc
  module AnalyticsHelpers
    # <%= google_analytics('UA-28347981-1') %>
    def google_analytics(id)
      %{<script>
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', #{id.to_json}]);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
      </script>}.gsub(/\n\s*/, '')
    end
  end
end
