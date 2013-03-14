<g:javascript>
    CreateCharts = function () {
        var vprogress1 = new RGraph.VProgress('cvs1', [30.455, 13, 42], 100);
        vprogress1.Set('margin', 5);

        if (!RGraph.isOld()) {
            vprogress1.Set('tooltips', [function () {
                return 'John';
            }, 'id:fred', 'Pete']);
        }

        vprogress1.Set('tooltips.effect', 'fade');
        vprogress1.Set('tickmarks', true);
        vprogress1.Set('tickmarks.inner', true);
        vprogress1.Set('tickmarks.color', '#333');
        vprogress1.Set('key', ['Richard', 'Fred', 'Bob']);
        vprogress1.Set('key.position.x', vprogress1.canvas.width - 90);
        vprogress1.Set('tickmarks.zerostart', true);
        vprogress1.Set('scale.decimals', 1);
        vprogress1.Set('gutter.right', 130);
        //vprogress1.Set('gutter.top', 50);
        vprogress1.Draw();

        var data = [8, 56, 25];
        var vprogress2 = new RGraph.VProgress('cvs2', data, 100);
        vprogress2.Set('colors', ['#ddd', 'gradient(#eef:red)', 'Gradient(white:yellow)']);
        vprogress2.Set('tickmarks.zerostart', true);
        vprogress2.Set('tickmarks.inner', true);
        vprogress2.Set('margin', 5);
        vprogress2.Set('tooltips', [null, 'John', 'Fred']);
        vprogress2.Set('strokestyle.inner', 'rgba(0,0,0,0)');
        vprogress2.Set('gutter.right', 30);
        vprogress2.Set('bevel', true);
        vprogress2.Draw();

        var vprogress3 = new RGraph.VProgress('cvs3', 8.6, 10);
        vprogress3.Set('colors', [RGraph.LinearGradient(vprogress3, 0, 25, 0, 425, 'white', 'red')]);
        vprogress3.Set('adjustable', true);
        vprogress3.Set('scale.decimals', 1);
        vprogress3.Set('gutter.right', 35);
        vprogress3.Draw();
    };

//    if (!RGraph.isOld()) {
//        CreateCharts();
//    } else {
//        window.onload = CreateCharts;
//    }
    $(CreateCharts);
</g:javascript>

<canvas id="cvs1" width="195" height="200">[No canvas support]</canvas>
%{--<canvas id="cvs2" width="95" height="400">[No canvas support]</canvas>--}%
%{--<canvas id="cvs3" width="95" height="400">[No canvas support]</canvas>--}%
<div id="fred" style="display: none">Fred</div>


