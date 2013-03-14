
<div class="gantt">
</div>
<script type="text/javascript">

    $(function () {

        "use strict";
        // TODO send json tasks data from server and replace the demo data
        $(".gantt").gantt({
            source:[
                {
                    name:"设计管理",
                    desc:"Analysis",
                    values:[
                        {
                            from:"/Date(1320192000000)/",
                            to:"/Date(1322401600000)/",
                            label:"Requirement Gathering",
                            customClass:"ganttRed"
                        }
                    ]
                },
                {
                    name:" ",
                    desc:"Scoping",
                    values:[
                        {
                            from:"/Date(1322611200000)/",
                            to:"/Date(1323302400000)/",
                            label:"Scoping",
                            customClass:"ganttRed"
                        }
                    ]
                },
                {
                    name:"投资管理",
                    desc:"Development",
                    values:[
                        {
                            from:"/Date(1323802400000)/",
                            to:"/Date(1325685200000)/",
                            label:"Development",
                            customClass:"ganttGreen"
                        }
                    ]
                },
                {
                    name:" ",
                    desc:"Showcasing",
                    values:[
                        {
                            from:"/Date(1325685200000)/",
                            to:"/Date(1325695200000)/",
                            label:"Showcasing",
                            customClass:"ganttBlue"
                        }
                    ]
                },
                {
                    name:"成本管理",
                    desc:"Development",
                    values:[
                        {
                            from:"/Date(1326785200000)/",
                            to:"/Date(1325785200000)/",
                            label:"Development",
                            customClass:"ganttGreen"
                        }
                    ]
                },
                {
                    name:" ",
                    desc:"Showcasing",
                    values:[
                        {
                            from:"/Date(1328785200000)/",
                            to:"/Date(1328905200000)/",
                            label:"Showcasing",
                            customClass:"ganttBlue"
                        }
                    ]
                },
                {
                    name:"采购管理",
                    desc:"Training",
                    values:[
                        {
                            from:"/Date(1330011200000)/",
                            to:"/Date(1336611200000)/",
                            label:"Training",
                            customClass:"ganttOrange"
                        }
                    ]
                },
                {
                    name:" ",
                    desc:"Deployment",
                    values:[
                        {
                            from:"/Date(1336611200000)/",
                            to:"/Date(1338711200000)/",
                            label:"Deployment",
                            customClass:"ganttOrange"
                        }
                    ]
                },
                {
                    name:" ",
                    desc:"Warranty Period",
                    values:[
                        {
                            from:"/Date(1336611200000)/",
                            to:"/Date(1349711200000)/",
                            label:"Warranty Period",
                            customClass:"ganttOrange"
                        }
                    ]
                },
                {
                    name:" ",
                    desc:"Warranty Period",
                    values:[
                        {
                            from:"/Date(1336611200000)/",
                            to:"/Date(1349711200000)/",
                            label:"Warranty Period",
                            customClass:"ganttOrange"
                        }
                    ]
                },
                {
                    name:" ",
                    desc:"Warranty Period",
                    values:[
                        {
                            from:"/Date(1336611200000)/",
                            to:"/Date(1349711200000)/",
                            label:"Warranty Period",
                            customClass:"ganttOrange"
                        }
                    ]
                }

            ],
            navigate:"scroll",
            scale:"weeks",
            maxScale:"months",
            minScale:"days",
            itemsPerPage:10,
            onItemClick:function (data) {
                alert("Item clicked - show some details");
            },
            onAddClick:function (dt, rowId) {
                alert("Empty space clicked - add an item!");
            },
            onRender:function () {
                if (window.console && typeof console.log === "function") {
                    console.log("chart rendered");
                }
            }
        });

        $(".gantt").popover({
            selector:".bar",
            title:"I'm a popover",
            content:"And I'm the content of said popover."
        });

    });

</script>