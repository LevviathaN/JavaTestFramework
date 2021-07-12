$(document).ready(function(){

        /*getting the proper link to log file*/
 		var documentLocation = document.location.pathname;
        var reportsFolder = documentLocation.substring(documentLocation.indexOf('/'), documentLocation.lastIndexOf('/')) + "/Logs/";

        /*getting the collections of categories for further processing*/
 		var rawLinks = $(".category-list>.category>a");
 		var rawCategories = $('#category-toggle>li>a');

       /* var categoriesRemove = $("ul#category-collection>li");
        var flag = true;

        categoriesRemove.each(function() {
            if (flag) {
                flag = false;
                continue;
            }

            $(this).remove();
        }); */


 		/*turn log links categories in the links to the log files*/
 		rawLinks.each(function() {
 			$(this).attr({
 				'href': reportsFolder + $(this).text(),
 				'target':'_blank'
 			});

        /*setting a new name for the log link*/
 			$(this).text('Log file link');
 		});

 		/*remove excessive categories in "Categories" dropdown*/
 		rawCategories.each(function() {
 			if ($(this).text() === "") {
 				$(this).parent().remove();
 			}
 		});

 		/*assign icons to category labels on each separate test*/
 			$('.category-list>span.category>span:contains("Browser")').parent().prepend('<i class="material-icons category-labels">language</i>');

 		/*assign icons to categories in "Category" dropdown*/
 			$('#category-toggle>li>a:contains("Tag")').prepend('<i class="material-icons category-labels">title</i>');
 		 			$('#category-toggle>li>a:contains("Browser")').prepend('<i class="material-icons category-labels">language</i>');

 		/*controlling the log links style*/
 			$('.category-list>span.category>a').parent().addClass('transparent').prepend('<i class="material-icons category-labels">link</i>');

 		/*remove excessive categories on the "Categories" and "Dashboard" tab*/
 			$('#category-collection>li.category>div.category-heading>span.category-name>a:contains("Logs")').parents('li').remove();
 			$('#category-collection>li.category>div.category-heading>span.category-name>a:contains("null")').parents('li').remove();
 			$('#category-collection>li.category>div.category-heading>span.category-name>a:contains("com.aventstack.extentreports")').parents('li').remove();
 			$('.card-panel>table>tbody>tr>td>a:contains(".log")').parents('tr').remove();
 			$('.card-panel>table>tbody>tr>td:contains("null")').parents('tr').remove();
 			$('.card-panel>table>tbody>tr>td:contains("com.aventstack.extentreports")').parents('tr').remove();

         /*Add Logos*/
             $('div.test-heading>span.test-name').addClass("test-name-list");
             $('div.test-heading>span.test-time').addClass("test-time-list");
             $('div.test-heading>span.test-status').addClass("test-status-list");

 	        var logo;
    	    logo = $('td.step-details>img.BrowserLogo');
    	    logo.each(function() {
    	    $(this).parents('div.view>div.subview-left>div.view-summary>ul.test-collection>li[bdd=false]').children().prepend(this);
    	    });

 	        $('div.test-content>img').remove();
 	        $('div.test-content>div.test-steps>table.bordered>tbody>tr:first-child').remove();
            });

function updateCharts() {

    /* -- [ report filters ] -- */
    $('#step-filters span.text-darken-4').hide();
    $('#step-filters span.pink-text').hide();
    $('#step-filters span.red-text').click(function () {
        $('.subview-right ul li').not('.fail').hide();
    });
    $('#step-filters span.green-text').click(function () {
        $('.subview-right ul li').not('.pass').hide();
    });
    $('#step-filters span.orange-text').click(function () {
        $('.subview-right ul li').not('.warning').hide();
    });
    $("#step-filters span[status='clear']").click(function () {
        $('.subview-right ul li').css('display', 'list-item');
    });

    /* -- [ changing the test with 'warning' statuses to have 'pass' statuses ] -- */
    $("#test-collection>li.warning>div>span.warning").text('pass').removeClass('warning').addClass('pass');
    $("#test-collection>li.warning").removeClass('warning').addClass('pass').attr("status", "pass");


    /* -- [ hide the existing doughnut chart ] -- */
    $('.chart-box ul.doughnut-legend').hide();


    /* -- [ options defined by Extent reports for charts ] -- */
    var options = {
        segmentShowStroke: false,
        percentageInnerCutout: 55,
        animationSteps: 1,
        legendTemplate: '<ul class=\'<%=name.toLowerCase()%>-legend right\'><% for (var i=0; i<segments.length; i++) {%><li><%if(segments[i].label && segments[i].value){%><span style=\'background-color:<%=segments[i].fillColor%>\'></span><%=segments[i].label%><%}%></li><%}%></ul>'
    };

    /* -- [ calculate count of passes fails, skips and warnings for PARENT tests ] -- */
    var passesCnt = $('#test-collection li.test.displayed.has-leaf.pass').length;
    var failsCnt = $('#test-collection li.test.displayed.has-leaf.fail').length;
    var warningCnt = $('#test-collection li.test.displayed.has-leaf.warning').length;
    var skipsCnt = $('#test-collection li.test.displayed.has-leaf.skip').length;


    /* -- [ updating the displayed value of counts of tests ] -- */
    $('#charts-row div.card-panel.nm-v:first div.block.text-small:first span.strong:first').html(passesCnt);
    $('#charts-row div.card-panel.nm-v:first div.block.text-small:eq(1) span.strong:first').html(failsCnt);
    $('#charts-row div.card-panel.nm-v:first div.block.text-small:eq(1) span.strong:first + span').html(skipsCnt);

    /* -- [ data array for parent doughnut ] -- */
    var data = [
        {value: passesCnt, color: '#00af00', highlight: '#32bf32', label: 'Pass'},
        {value: failsCnt, color: '#F7464A', highlight: '#FF5A5E', label: 'Fail'},
        {value: statusGroup.fatalParent, color: '#8b0000', highlight: '#a23232', label: 'Fatal'},
        {value: statusGroup.errorParent, color: '#ff6347', highlight: '#ff826b', label: 'Error'},
        {value: warningCnt, color: '#FDB45C', highlight: '#FFC870', label: 'Warning'},
        {value: skipsCnt, color: '#ff8c00', highlight: '#b0ff00', label: 'Skip'}
    ];

    /* -- [ updating the chart ] -- */
    var ctx = $("#parent-analysis").get(0).getContext("2d");
    var myNewChart = new Chart(ctx).Doughnut(data, options);
    drawLegend(myNewChart, 'parent-analysis');
}
/*---[ update the "Tests" chart on page load ]---*/
$(document).ready(updateCharts());

/* -- [ calculate count of passes fails and skips for CHILD tests ] -- */
var passChild = $('div.test-content ul.collapsible.node-list[data-collapsible=accordion] li.node.level-1.leaf.pass[status=pass]').length;
var failChild = $('div.test-content ul.collapsible.node-list[data-collapsible=accordion] li.node.level-1.leaf.fail').length;
var skipChild = $('div.test-content ul.collapsible.node-list[data-collapsible=accordion] li.node.level-1.leaf.skip').length;
var warningChild = $('div.test-content ul.collapsible.node-list[data-collapsible=accordion] li.node.level-1.leaf.warning').length;

/* -- [ correction in child pass count ] -- */
var sauceLabsStepsCount = $("li.test div.node-name:contains('SauceLabs Information')").length;
passChild = passChild - sauceLabsStepsCount;

/* -- [ updating the displayed value of counts of tests ] -- */
$('#charts-row div.card-panel.nm-v:eq(1) div.block.text-small:first span.strong:first').html(passChild);
$('#charts-row div.card-panel.nm-v:eq(1) div.block.text-small:eq(1) span.strong:first').html(failChild);
$('#charts-row div.card-panel.nm-v:eq(1) div.block.text-small:eq(1) span.strong:first + span').html(skipChild + warningChild);

/* -- [ data array for child doughnut ] -- */
var dataChild = [
    {value: passChild, color: '#00af00', highlight: '#32bf32', label: 'Pass'},
    {value: failChild, color: '#F7464A', highlight: '#FF5A5E', label: 'Fail'},
    {value: skipChild, color: '#1e90ff', highlight: '#4aa6ff', label: 'Skip'},
    {value: warningChild, color: '#FDB45C', highlight: '#FFC870', label: 'Warning'},
];

/* -- [ updating the chart ] -- */
var childCtx = $("#child-analysis").get(0).getContext("2d");
var stepChart = new Chart(childCtx).Doughnut(dataChild, options);
drawLegend(stepChart, 'child-analysis');

/* -- [ update ] -- */
var testsCnt = $('#test-collection li.test.displayed').length;
$('#charts-row + div.row:first div.panel-lead:first').html(testsCnt);

/*AGQA-951*/
function addExpandCollapseAllButtons(color){
		$(".subview-right .test-desc").after("<div style='padding: 3px; text-align: center; border-radius: 4px; border: 1px solid " + color + "; cursor: pointer; position: relative; top: -25px;' class='right' id='expand-all'>EXPAND ALL</div>");
		$(".subview-right .test-desc").after("<div style='padding: 3px; text-align: center; border-radius: 4px; border: 1px solid " + color + "; cursor: pointer; position: relative; top: -25px; display: none;' class='right' id='collapse-all'>COLLAPSE ALL</div>");

		$("#expand-all").click(function(){
			$("#expand-all").hide();
			$("#collapse-all").show();
			$('.subview-right ul li').addClass('active');
			$('.subview-right ul li .collapsible-header').addClass('active');
		    $('.subview-right ul li .collapsible-body').show();
		});

		$("#collapse-all").click(function(){
			$("#collapse-all").hide();
			$("#expand-all").show();
			$('.subview-right ul li').removeClass('active');
			$('.subview-right ul li .collapsible-header').removeClass('active');
			$('.subview-right ul li .collapsible-body').hide();
		});
	}
function fixControlButtonsPosition(top, right){
		var filtersCurrentPosition = $("#step-filters").position();
		$("#step-filters").css({
			"position":"fixed",
			"left": filtersCurrentPosition.left,
			"top":filtersCurrentPosition.top
		});
		$("#expand-all, #collapse-all").css({
			"position":"fixed",
			"right": right,
			"top":top
		});
	}

$(document).ready(function(){

		/*default to 'white' since default theme is dark*/
		var color = 'white';
		addExpandCollapseAllButtons(color);
		var expandCollapseAllCurrentTopPosition = $("#expand-all").position().top;
		var expandCollapseAllCurrentRightPosition = $(window).width() - $("#expand-all").position().left - $("#expand-all").width();
		$("#test-collection>li").click(function(){
			addExpandCollapseAllButtons(color);
			fixControlButtonsPosition(expandCollapseAllCurrentTopPosition, expandCollapseAllCurrentRightPosition);
		});
		fixControlButtonsPosition(expandCollapseAllCurrentTopPosition, expandCollapseAllCurrentRightPosition);
		$("#theme-selector").click(function(){
			/*change the color*/
			(color == 'white') ? color = 'black' : color = 'white';
			$("#collapse-all").css("border", "1px solid " + color);
			$("#expand-all").css("border", "1px solid " + color);
		});
});

/* -- [ category-action ] -- */
$('#category-toggle>li>a').click(function () {
 	    var sheetOrTagName = $(this),
 		name = sheetOrTagName.text(),
 		filter = $('#test-collection>li.test').find('.category'),
 		selectedCategory = $('div.current-category');

        /*highlight the selected category in the dropdown*/
 		$('#category-toggle>li').css("background-color", "#222");
        sheetOrTagName.parent('li').css('background-color', '#4E4E4E');

        /*remove the label of the category that has been selected before*/
        selectedCategory.remove();

        /*append current category label*/
            if(!sheetOrTagName.parent('li').hasClass('clear')) {

                var fixedName;

                    if (name.includes("library_books")) {
                        fixedName = name.slice(13, name.length);
                    }

                     else if (name.includes("title")) {
                        fixedName = name.slice(5, name.length);
                     }

                     else {
                        fixedName = name.slice(8, name.length);
                     }

                $('#controls').children('div.controls').append('<div class="chip transparent current-category" style="color:#039be5;">Selected category: <span style="color:#bbb;">' + fixedName + '</span></div>');
            }

        /*display only the tests, which fall under selected category*/
 			if (sheetOrTagName.attr('clear') === 'true'){
             	$('.test').addClass('displayed').removeClass('hide');
            }

 			else {
 				filter.each(function() {
 					if ($(this).text() === name) {
 					    $(this).parents('.test').removeClass('hide').addClass('displayed');
 					}
 			    });
 		    }

        /*open the first test from the selected category after selecting it*/
 		$('.test.displayed').first().click();

 		/*update charts to display only an info on tests that fall under selected category*/
 		if ($('#enable-dashboard').hasClass('pink-text')) {
         	updateCharts();
        }
});