<div class="box span7 noMargin" onTablet="span8" onDesktop="span7">
    <div class="box-header">
        <h2><i class="halflings-icon list"></i><span class="break"></span>现场图集</h2>

        <div class="box-icon">
            <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
            <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
        </div>
    </div>

    <div class="box-content">
        <div id="this-carousel-id" class="carousel slide">
            <div class="carousel-inner">
                <div class="item active"><!-- class of active since it's the first item -->
                    <img src="${createLinkTo(dir: 'img/pics', file: '1.jpg')}" width="800" alt=""/>

                    <div class="carousel-caption">
                        <p>病房楼工程进度</p>
                    </div>
                </div>

                <div class="item">
                    <img src="${createLinkTo(dir: 'img/pics', file: '2.jpg')}" width="800" alt=""/>

                    <div class="carousel-caption">
                        <p>地下车库工程进度</p>
                    </div>
                </div>

                <div class="item">
                    <img src="${createLinkTo(dir: 'img/pics', file: '3.jpg')}" width="800" alt=""/>

                    <div class="carousel-caption">
                        <p>门诊楼工程进度</p>
                    </div>
                </div>

            </div><!-- /.carousel-inner -->
        <!--  Next and Previous controls below
        href values must reference the id for this carousel -->

            <a class="carousel-control left" href="#this-carousel-id" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#this-carousel-id" data-slide="next">&rsaquo;</a>
        </div><!-- /.carousel -->
    </div>
</div>
<r:script>
    $('.carousel').carousel();
</r:script>