<script type="text/javascript" src="${createLinkTo(dir: 'js', file: 'RGraph.hprogress.js')}"></script>

<g:javascript>

    CreateCharts = function () {
        var data = [59.65, 22.96, 7.98, 5.27, 4.09];
        var progress1 = new RGraph.HProgress("${canvasId}", data, 100);
        progress1.Set('colors', ['Gradient(#ccf:blue)', 'Gradient(#fcc:#fcc:red)', 'Gradient(white:white:yellow)', 'gradient(white:white:white:green)', 'Gradient(white:white:white:white:gray)']);
        progress1.Set('key', ['评标', '开标', '参建单位', '设计', '其他']);
        progress1.Set('key.colors', ['blue', 'red', 'yellow', 'green', 'gray']);
        progress1.Set('tooltips', ['开标', '评标', '', '', '']);
        //progress1.Set('units.post', '%');
        progress1.Set('tickmarks.zerostart', true);
        progress1.Set('bevel', true);
        progress1.Set('labels.specific', ['张三','李四','张三','李四','张三']);
        progress1.Set('adjustable',true);
        progress1.Draw();
    }
    if (!RGraph.isOld()) {
        CreateCharts();
    } else {
        $(CreateCharts);
    }
</g:javascript>

<canvas id="${canvasId}" height="80" width="320" style="cursor: default;">[No canvas support]</canvas>
