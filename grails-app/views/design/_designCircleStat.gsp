
<div class="span2" onTablet="span4" onDesktop="span2">
    <div class="circleStatsItemBox">
        <div class="header">${category.name}</div>
        <span class="percent">百分之</span>

        <div class="circleStat">
            <input type="text" value="${category.completion}" class="whiteCircle"/>
        </div>
        <div class="footer">
            <span class="count">
                <span class="number">${category.completionNum}</span>
                <span class="unit">张</span>
            </span>
            <span class="sep">/</span>
            <span class="value">
                <span class="number">${category.totalNum}</span>
                <span class="unit">张</span>
            </span>
        </div>
    </div>
</div>


