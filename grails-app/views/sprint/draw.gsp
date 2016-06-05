<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'sprint.label', default: 'Sprint')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <script type='text/javascript' src='https://www.google.com/jsapi'></script>
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

    <script type='text/javascript'>

        google.load('visualization', '1', {'packages':['areachart']});
        google.setOnLoadCallback(drawChart);

        function drawChart() {
              $.ajax({
                type: 'GET',
                dataType: 'JSON',
                contentType:"application/json",
                url: "../getJSON",
                data:"id=1",
                success: function(response) {
                    var arr = jQuery.makeArray( response )
                    var data = new google.visualization.arrayToDataTable(arr);
                    var options = {
                        title: 'Chart'


                    };

                    var chart =  new google.visualization.ImageLineChart(document.getElementById('visualization')).
                            draw(data, null);
                }
            })

        }
    </script>
</head>

<body>
<a href="#show-sprint" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<br>

<div id="show-sprint" class="content scaffold-show" role="main" style="margin: auto">
    <div id="chart_div" style="width: 900px; height: 500px;"></div>

</div>
</body>
</html>
