<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'sprint.label', default: 'Sprint')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <script type='text/javascript' src='https://www.google.com/jsapi'></script>
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="http://canvg.googlecode.com/svn/trunk/rgbcolor.js"></script>
    <script type="text/javascript" src="http://canvg.googlecode.com/svn/trunk/canvg.js"></script>

    <script type='text/javascript'>

        google.load('visualization', '1', {'packages':['areachart']});
        google.setOnLoadCallback(drawChart);

        function drawChart() {
            var id = $("#TeamID").val()
            $.ajax({
                type: 'GET',
                dataType: 'JSON',
                contentType:"application/json",
                url: "../getJSON",
                data:"id="+id,
                success: function(response) {
                    var arr = jQuery.makeArray( response )
                    var data = new google.visualization.arrayToDataTable(arr);
                    var options = {
                        title: 'Chart'

                    };

                    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            })

        }
    </script>
    <script>
        function getImgData(chartContainer) {
            var chartArea = chartContainer.getElementsByTagName('iframe')[0].
                    contentDocument.getElementById('chartArea');
            var svg = chartArea.innerHTML;
            var doc = chartContainer.ownerDocument;
            var canvas = doc.createElement('canvas');
            canvas.setAttribute('width', chartArea.offsetWidth);
            canvas.setAttribute('height', chartArea.offsetHeight);


            canvas.setAttribute(
                    'style',
                    'position: absolute; ' +
                            'top: ' + (-chartArea.offsetHeight * 2) + 'px;' +
                            'left: ' + (-chartArea.offsetWidth * 2) + 'px;');
            doc.body.appendChild(canvas);
            canvg(canvas, svg);
            var imgData = canvas.toDataURL("image/png");
            canvas.parentNode.removeChild(canvas);
            return imgData;
        }

        function saveAsImg(chartContainer) {
            var imgData = getImgData(chartContainer);

            // Replacing the mime-type will force the browser to trigger a download
            // rather than displaying the image in the browser window.
            window.location = imgData.replace("image/png", "image/octet-stream");
        }

        function toImg(chartContainer, imgContainer) {
            var doc = chartContainer.ownerDocument;
            var img = doc.createElement('img');
            img.src = getImgData(chartContainer);

            while (imgContainer.firstChild) {
                imgContainer.removeChild(imgContainer.firstChild);
            }
            imgContainer.appendChild(img);
        }
    </script>


</head>

<body>
<a href="#show-sprint" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><button class="home" onclick="saveAsImg(document.getElementById('chart_div'));">Save as PNG Image</button>
            </li>
    </ul>
</div>
<br>

<div id="show-sprint" class="content scaffold-show" role="main" style="margin: auto">
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
    <g:field type="hidden" name="team.id" id='TeamID'  value="${id}"/>

</div>
</body>
</html>
