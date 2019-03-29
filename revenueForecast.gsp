<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ page import="com.prolifics.ppmweb.constant.Constants" %>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<meta name="layout" content="main" />
		<title><g:message code="com.prolifics.ppmweb.pmo.revenueForecast"/></title>
		
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		
		<style type="text/css">
		
			.customer{
				white-space: nowrap !important;
			    overflow: hidden;
			    text-overflow: ellipsis;
			}
			.custSection{
				padding: 10px !important;
				border: 1px solid #CCC;
				border-radius: 3px;
				max-height: 200px;
			}
			.optionList{
				overflow:auto;
			}
			.option{
				-webkit-user-select: none;  /* Chrome all / Safari all */
				-moz-user-select: none;    /* Firefox all */
				-ms-user-select: none;      /* IE 10+ */
				user-select: none;
			}
			.option:hover{
				background-color: #39f;
    			color: white;
			}
			.selected{
				background-color: #dce5f8;
			}
			.cbox{
				margin: 0px !important;
			}
		
			#customers{
				border:1px solid #CCC; 
				padding:5px; 
				background-color:#f4f4f4;
			}
			.error{
				background-color: #F2DEDE !important;
			}
			#revenueForeCastDiv table.table-bordered{
			    border:1px solid black; 
			}
			#revenueForeCastDiv{
				overflow-x: auto;
			}
			.dimSummary {
				background-color:#D4E7FB;
			}
			.topSummary {
				background-color:#F5D5A7;
			}
			.pui-require .multiSelectOptions label:first-child::after {
				content:'' !important;
			}
			.fa-caret-right,.fa-caret-down { 
				cursor: pointer; 
				color: #428bca;
			}
			.editForecast{
				border-radius : 3px !important;
			}
			#forcastTbl{
				width : auto !important;
			}
			.popover-content {
    			padding:4px 6px !important;
   			}
   			
   			.selMon{
   				background-color: #f2f8ef;
   			}
   			.totalCol{
   				background-color: #ffffe6;
   			}
   			.arrow_box {
				position: relative;
				background: #88b7d5;
				border: 4px solid #bdbdbd;
			}
			
			.arrow_box:after,.arrow_box:before {
				bottom: 100%;
				left: 30%;
				border: solid transparent;
				content: " ";
				height: 0;
				width: 0;
				position: absolute;
				pointer-events: none;
			}
			
			.arrow_box:after {
				border-color: rgba(136, 183, 213, 0);
				border-bottom-color: #9e9e9e;
				border-width: 8px;
				margin-left: -94px;
			}
			
			.arrow_box:before {
				border-color: rgba(194, 225, 245, 0);
				border-bottom-color: #bdbdbd;
				border-width: 14px;
				margin-left: -100px;
			}
			 
			body{
			    width:100%;
			    overflow-x:hidden;
			}
			
			.shrinkText{
				white-space: nowrap !important;
			    overflow: hidden;
			    text-overflow: ellipsis;
			    max-width:200px;
			}

			#cancelReq{
				position: fixed;
				top: 58%;
				left: 48%;
				font-family: 'Roboto', sans-serif;
			}
			.popoverInfo {
				position: absolute;
			  	top: 0;
				left: 0;
				z-index: 1010;
				display: none;
				max-width: 600px;
				padding: 1px;
				text-align: left;
				white-space: normal;
				background-color: #ffffff;
				border: 1px solid #ccc;
				border: 1px solid rgba(0, 0, 0, 0.2);
				border-radius: 6px;
				box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
				background-clip: padding-box;
				-webkit-border-radius: 6px;
				-moz-border-radius: 6px;
				-webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
				-moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
				-webkit-background-clip: padding-box;
				-moz-background-clip: padding;
			}
		</style>
		<style type='text/css' id='dynamic' /></style>
	</head>
	<body>
		<div class="body">
			<pui:menu type="page" appCode="PPM" context="" objectType="" title="Revenue Forecasts" />
			<div class="clearfix" style="height:20px;"></div>
			<div class="foreaCastFilters">
				<div class="clearfix"></div>
				<div class="panel-group">
					<div class="panel panel-default">
					  	<div class="panel-heading">
					   		<h4 class="panel-title">
						        <a data-toggle="collapse" href="#collapse1">
						        	<span class=" pull-right filterline fa fa-chevron-circle-up"></span>
						        	<g:message code="com.prolifics.ppmweb.pmo.resourceUtilization.searchFilt"/>
						        </a>
					    	</h4>
					   	</div>
					   	<div id="collapse1" class="panel-collapse in" style="height: auto;">
					   		<div class="panel-body no-padding">
								<div class="forecastFilters col-md-12">
									<div class="selectForecast" style="margin-top: 10px;">
										<button type="submit" class="btn btn-primary " id="back" style="display:none"><i class="fa fa-arrow-left"></i> Go Back</button>
										<span class="selForecastSpan clear">
											<input type="radio" value="view" id="viewForecastRadio" class="selForecast" name="selForecat" checked />View Forecasts&nbsp;
											<input type="radio" class="selForecast" id="newForecastRadio" value="new" name="selForecat"  />New Forecasts
										</span>
									</div>
										<div id="newForecastFilters">
											<div id="filtersearch" style="padding-top:1%;">	
												<div class="clearfix col-md-12" style="height:10px;"></div>
												<div class="col-lg-12 col-md-12 col-sm-12 no-padding">
													<div class="col-md-4">														
														<div class="form-group pui-require">
															<label class="col-md-4 no-padding">Business Unit</label>
															<span class="col-xs-1 bold">:</span>					
															<div class="col-md-7 no-padding">
																<g:select id="newForecastBU" name="newForecastBU" from="${busUnits}"  noSelection="${['': '<< Please Select >>']}" optionKey="id" optionValue="name" class="col-xs-12 pui-input-require " autocomplete="on"/>
																 
															</div>
														</div>
													</div> 
													<div class="col-md-4">														
														<div class="form-group pui-require">
															<label class="col-md-4 no-padding">Customer</label>
															<span class="col-xs-1 bold">:</span>					
															<div class="col-md-7 no-padding">
																<span class="col-xs-12 pui-input pui-require no-padding"> 
																		<a href="javascript:void(0)" id="newForecastCUS" onClick="showCustomers('newForecast')" name="newForecastCUS">
																			<div id='customers'>
																				<i class="fa fa-user-plus"></i> 
																			 	<span id="newForecastCUSText" class="cusText">Select Customers</span>
																				<input type="hidden" name="customers" id="customers" />
																			</div>
																		</a>
																</span> 
															</div>
														</div>
													</div>
													<div class="col-md-4">														
														<div class="form-group pui-require">
															<label class="col-md-4 no-padding ">Country</label>
															<span class="col-xs-1 bold">:</span>					
															<div class="col-md-7 no-padding">  
																	<g:select id="newForecastCON" name="newForecastCON" from="${countries}" optionKey="id" optionValue="countryName" multiple="multiple" class="mdd col-xs-12 pui-input pui-require" />
															</div>
														</div>
													</div>
													<div class="clearfix col-md-12" style="height:10px;"></div>
													</div>
													
													<div class="col-lg-12 col-md-12 col-sm-12 no-padding">
													<div class="col-md-4">														
														<div class="form-group">
															<label class="col-md-4 no-padding">From</label>
															<span class="col-xs-1 bold">:</span>					
															<div class="col-md-7 no-padding">
																<span class="col-md-12 no-padding"><g:textField name="from" id="newForecastFrom" class="col-xs-12 pui-input monthRep"/></span>
															</div>
														</div>
													</div>
													<div class="col-md-4">														
														<div class="form-group">
															<label class="col-md-4 no-padding">Duration</label>
															<span class="col-xs-1 bold">:</span>					
															<div class="col-md-7 no-padding">
																<g:select id="newForecastDuration" name="newForecastDuration" class="col-md-12" value="" from="${[1: 1, 2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7, 8: 8, 9: 9, 10: 10, 11: 11, 12: 12]}" optionKey="key" optionValue="value" />
															</div>
														</div>
													</div>
												</div>
											
												<div class="col-md-12 form-group text-center">
													<div class="clearfix col-md-12" style="height:20px;"></div>
													<button type="submit" id="subNewForcastBtn" class="btn btn-primary "><em class="puicon-search"></em> Search </button>		
												</div>
											</div>
										</div>
										<div id="viewForecastFilters">
											<div id="filtersearch" style="padding-top:1%;">	
												<div class="clearfix col-md-12" style="height:10px;"></div>
												<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="col-md-3 col-sm-6 col-xs-12 no-padding"">														
														<div class="form-group pui-require">
															<label class="col-md-5 no-padding">Dimension 1</label>
															<span class="col-xs-1 bold">:</span>					
															<div class="col-md-5 no-padding">
																<select id="dim1" class="col-xs-12 col-md-12 pui-input dimension">
																	<option value="BU">Business Unit</option>
																	<option value="CUS">Customer</option>
																	<option value="CON">Country</option>
																</select>
																 
															</div>
														</div>
													</div>
													<div class="col-md-3 col-sm-6 col-xs-12 no-padding">														
														<div class="form-group pui-require">
															<label class="col-md-4 no-padding filterTypeName">Business Unit</label>
															<span class="col-xs-1 bold">:</span>					
															<div class="col-md-5 no-padding dimension1"> 
																	<g:select id="dim1_BU" name="dim1_BU" from="${busUnits}" optionKey="id" optionValue="name" class="mdd col-xs-12 pui-input-require " multiple="multiple" autocomplete="on"/>
																	<a href="javascript:void(0)" id="dim1_CUS" onClick="showCustomers('oldForecast')" name="dim1_CUS">
																		<div id='customers'>
																			<i class="fa fa-user-plus"></i> 
																		 	<span id="dim1_CUSText" class="cusText">Select Customers</span>
																			<input type="hidden" name="customers" id="customers" />
																		</div>
																	</a>
																	<g:select id="dim1_CON" name="dim1_CON" from="${countries}" optionKey="id" optionValue="countryName" multiple="multiple" class="mdd col-xs-12 pui-input pui-require" />
															</div>
														</div>
													</div>
													<div class="col-md-3 col-sm-6 col-xs-12 no-padding">														
														<div class="form-group pui-require">
															<label class="col-md-5 no-padding">Dimension 2</label>
															<span class="col-xs-1 bold">:</span>					
															<div class="col-md-5 no-padding">
																<select id="dim2" class="col-xs-12 col-md-12 pui-input">
																	<option value="BU" style="display:none;">Business Unit</option>
																	<option value="CUS">Customer</option>
																	<option value="CON" selected="selected">Country</option>
																</select>
																 
															</div>
														</div>
													</div>
													<div class="col-md-3 col-sm-6 col-xs-12 no-padding">														
														<div class="form-group pui-require">
															<label class="col-md-4 no-padding filterTypeNameDim2">Country</label>
															<span class="col-xs-1 bold">:</span>					
															<div class="col-md-5 no-padding dimension2"> 
																	<g:select id="dim2_BU" name="dim2_BU" from="${busUnits}" optionKey="id" optionValue="name" class="mdd col-xs-12 pui-input-require " multiple="multiple" autocomplete="on"/>
																	<a href="javascript:void(0)" id="dim2_CUS" onClick="showCustomers('oldForecast')" name="dim2_CUS">
																		<div id='customers'>
																			<i class="fa fa-user-plus"></i> 
																		 	<span id="dim2_CUSText"  class="cusText">Select Customers</span>
																			<input type="hidden" name="customers" id="customers" />
																		</div>
																	</a>
																	<g:select id="dim2_CON" name="dim2_CON" from="${countries}" optionKey="id" optionValue="countryName" multiple="multiple" class="mdd col-xs-12 pui-input pui-require" />
															</div>
														</div>
													</div>
													<div class="clearfix col-md-12" style="height:10px;"></div>
													</div>
													
													<div class="col-lg-12 col-md-12 col-sm-12">
													<div class="col-md-3 col-sm-6 col-xs-12 no-padding">														
														<div class="form-group">
															<label class="col-md-5 no-padding">From</label>
															<span class="col-xs-1 bold">:</span>					
															<div class="col-md-5 no-padding">
																<span class="col-md-12 no-padding"><g:textField name="from" id="from" class="col-xs-12 pui-input monthRep"/></span>
															</div>
														</div>
													</div>
													<div class="col-md-3 col-sm-6 col-xs-12 no-padding">														
														<div class="form-group">
															<label class="col-md-4 no-padding">Duration</label>
															<span class="col-xs-1 bold">:</span>					
															<div class="col-md-5 no-padding">
																<g:select id="duration" name="duration" class="col-md-12" value="" from="${[1: 1, 2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7, 8: 8, 9: 9, 10: 10, 11: 11, 12: 12]}" optionKey="key" optionValue="value" />
															</div>
														</div>
													</div>
												</div>
											
												<div class="col-md-12 form-group text-center">
													<div class="clearfix col-md-12" style="height:20px;"></div>
													<button type="submit" id="subBtn" class="btn btn-primary "><em class="puicon-search"></em> Search </button>		
												</div>
											</div>
										</div>
								</div>
							</div>
						</div>
			   		</div>
			   		<div class="clearfix" style="height: 6px;"></div>
			   		<div id = "noDataMsg" class = "alert alert-danger" style = "display:none;"></div>
			   		
			   		<div id="forecastDiv" style="display:none;">
				   		<div class="col-md-12" style="padding-bottom:10px;"><span id="export"><export:formats formats="['excel']" action="export" controller="pmo" params="[title : 'Revenue ForeCast']"/></span></div>
						<div class="col-md-12" id="revenueForeCastDiv"></div>
					</div>
					<div id="projectForecastDiv"></div>
					<div id="revenueNewForeCastDiv" style="overflow-x:auto;"></div>
					<div class="clearfix" style="height: 40px;"></div>		
					<div class="col-sm-12 btns clear" >
						<div class="form-group" style="text-align: center;">
							<button id="save" type="submit" class="btn pui-primary btn-sm" ><em class="puicon-floppy19 "></em>Save</button>
							<button id="cancel" class="btn pui-primary btn-sm" ><em class="puicon-x"></em>Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		 
		<g:each var="toolTipInfo" in="${toolTipInfos}">
			<div style="display: none" id="popover-content-${toolTipInfo.lkupName}">${toolTipInfo.description}</div>
		</g:each>
		<div id="newForecastDlg" style = "display:none; min-height:50px">No data found for the selection.<br>Do you want to add new forecasts?</div>
		<div class="clear" id="custDlg">
			   			<div class="col-md-12">
			   				<div class="col-md-12 no-padding searchDiv">
			   					<div class="col-md-6">
			   						<label class="col-md-2">Search </label>
			   						<label class="col-md-1">:</label>
			   						<input type="text" class="col-md-6 search pui-input" placeholder="minimum 3 characters" title="Search"/>
			   					</div>
			   					<div class="clearfix" style="height:40px"></div>
			   				</div>
			   				<div class="col-md-12 no-padding section ">
			   					<div class="clearfix" style="height:20px"></div>
			   					<div class="col-md-12" style="height:20px">
			   						<div class="col-md-12">
			   							<input type="checkbox" class="selectAll selections" id="selectAllSel"/>
					   					<label class="col-md-11 no-padding"> Selected items : </label>
					   				</div>
				   				</div>
				   				<div class="col-md-12 custSection" style="overflow:auto">
				   					<div class="col-md-12" id="noSelDiv">None Selected</div>
				   					<div id="selectedList" ></div>
				   				</div>
			   				</div>
			   				<div class="col-md-12 no-padding section clear">
			   					<div class="clearfix" style="height:20px"></div>
			   					<div class="col-md-12" style="height:20px">
			   						<div class="col-md-12">
					   					<input type="checkbox" class="selectAll" id="selectAllBUCust"/>
					   					<label class="col-md-11 no-padding"> Customers of Selected BU </label>
					   				</div>
				   				</div>
				   				<div class="col-md-12 custSection optionList" id="BUCustList"></div>
			   				</div>
			   				
			   				<div class="col-md-12 no-padding section">
			   					<div class="clearfix" style="height:20px"></div>
			   					<div class="col-md-12" style="height:20px">
			   						<div class="col-md-12">
					   					<input type="checkbox" class="selectAll" id="selectAllCust"/>
						   				<label class="col-md-11 no-padding"> All Customers </label>
						   			</div>
				   				</div>
				   				<div class="col-md-12 custSection optionList" id="allCustList"></div>
				   			</div>
			   			</div>
			   		</div>
			
			<div id="chkBxTpl" class="clear">
				   		<span class="__CLASS__ option tpl">
	   						<input type="checkbox" id="__ID__" class="cbox" for="__TYPE__" name="__NAME__"/>
	   						<span class="col-md-11 customer" for="__TYPE__" style="overflow-wrap: anywhere;" title="__NAME__">__NAME__</span>
	   					</span>
			</div>		
			   		
		<script type="text/javascript">
			var buVal, cusVal, conVal, fromDtVal, durationVal;
			var dim1, dim1val, dim2, dim2val, fromDt, duration, fromDate, isDialog = false;
			var editSelections = {}, viewFilters = {};
			var allDimensions = ["BU","CUS","CON"];
			var nextAction = null;
			var xhr;
			var buCustomers, resRevenueForecast;
			var customers = $.parseJSON("${customers.encodeAsHTML()}");
			var customerCount = customers.length;
			var selCustomers = [], custDlgViewTyp = 'oldForecast';
			var buCustomersCount = 0;
			$(document).ready(function(){ 
				 
				var customerHtml = '<div class="col-md-12" id="noCustDiv">No Customers found</div>';
				$.each(customers, function(idx, item){
					itemTpl = $("#chkBxTpl").html();
					itemTpl = itemTpl.replace(/__ID__/g, item.id);
					itemTpl = itemTpl.replace(/__NAME__/g, item.name);
					itemTpl = itemTpl.replace(/__TYPE__/g, 'customer');
					itemTpl = itemTpl.replace(/__CLASS__/g, 'col-md-3 col-sm-3');
					itemTpl = itemTpl.replace(/tpl/g, '');
					
					customerHtml += itemTpl;
				});
				
				$("#allCustList").html(customerHtml);

				if(customers.length > 0){
					$("#noCustDiv").hide();
				}

				$("#custDlg").removeClass("clear");
				var dlgWidth = $(window).width()*0.8;

				$("#custDlg").dialog({
					title: 'Select Customers',
					autoOpen: false,
					draggable: false,
					width: dlgWidth,
					modal: true,
					resizable: false,
					beforeClose: function( event, ui ) {
						triggerSelectedCustomers();
						$("input.search").val('').keyup(); 
					}
					
				});
 
				
				exportStyles();
				var expUrl =  $('.menuButton .excel').attr('href');
				$('.menuButton .excel').attr('href',expUrl+'&key='+${key})
				$("select.mdd").multiSelect({oneOrMoreSelected: '*', selectAllText: '<< ALL >>', noneSelected: '<< Please Select >>'});
				$('.selForecast').change(function() { 
					if($(this).val() == 'view') {
						$('#newForecastFilters').hide();
						$('#viewForecastFilters').show();
						$('#forecastDiv').show();
						$('#revenueForeCastDiv').show();
						$('#revenueNewForeCastDiv').hide();
						$(".btns").addClass('clear');
					} else if($(this).val() == 'new') {
						$('#newForecastFilters').show();
						$('#viewForecastFilters').hide();
						$('#forecastDiv').hide();
						custDlgViewTyp = 'newForecast';
						$('#revenueForeCastDiv').hide();
						$('#revenueNewForeCastDiv').show();
						if (!$('#revenueNewForeCastDiv').is(':empty'))
							$(".btns").removeClass('clear');
					}
				}); 
				$('#dim1').val('BU');
				$('#dim2').val('CON'); 
				$('#newForecastFilters').hide();
				$("[id$='_BU'],[id$='_CUS'],[id$='_CON']").hide();
				$('#viewForecastRadio').prop('checked',true);
				$("#dim1_"+$("#dim1").val()).show();
				$("#dim2_"+$("#dim2").val()).show();

				$("#from,#newForecastFrom").MonthPicker({
					Button			: false, 
					MonthFormat		: 'M-yy',
					SelectedMonth	: 0
				});	
				$(".monthRep").keypress(function(e){
					e.preventDefault();
				}); 
				$("select.dimension").change(function(){
					var id = $(this).attr('id')+'_'+$(this).val(); 
					$(this).closest('div').find('a#'+id).show();
					$(this).closest('div').find('a#'+id).removeClass('error');
					$('a#'+id).find('div#customers').removeClass('error');
					$(this).closest('div').find('a').not('#'+id).hide();
					id = 'dim2';
					var dim2Opts = [];
					dim2Opts.push({key:'BU',value:'<option value="BU">Business Unit</option>'});
					dim2Opts.push({key:'CUS',value:'<option value="CUS">Customer</option>'});
					dim2Opts.push({key:'CON',value:'<option value="CON">Country</option>'});
					var options = '';	
					$('#dim2').empty();		 
					$(dim2Opts).each(function(k,val) { 
						if($('#dim1').val() == val.key)
							return true;
						$('#dim2').append(val.value);
					});
					$('.filterTypeName').html($('#dim1 option:selected').text());
					$("#dim2").find("option:not(:disabled):eq(0)").prop('selected','selected');
					$('#dim2').change();  
				});
				$('#dim2').change(function() {
					$("#pageMessage").hide();
					var id = $(this).attr('id')+'_'+$(this).val(); 
					$('.dimension2').find('a#'+id).show();
					if(id == 'dim2_CUS'){
						$('.dimension2').find('a#'+id+' div#customers').removeClass('error');
						$('input#selectAllSel').click();
						$('.cusText').text('Select Customer');
					} else{
						$('.dimension2').find('a#'+id).removeClass('error');
						$('input.selectAll[name="'+id+'"]').prop('checked',true).click();
					}
					
					$('.dimension2').find('a').not('#'+id).hide();
					$('.filterTypeNameDim2').html($('#dim2 option:selected').text());
				});
				$('#dim1').change(function() {
					$("#pageMessage").hide();
					var id = $(this).attr('id')+'_'+$(this).val();  
					$('.dimension1').find('a#'+id).show();
					$('.dimension1 input.selectAll').prop('checked',true).click();
					
					if(id == 'dim1_CUS'){
						$('.dimension1').find('a#'+id+' div#customers').removeClass('error');
						$('input#selectAllSel').click();
						$('.cusText').text('Select Customer');
					}
					else{
						$('.dimension1').find('a#'+id).removeClass('error');
					}
					
					$('.dimension1').find('a').not('#'+id).hide();
				});
				
				 $(document).on('click', function(e) {   
			    	if($(e.target).closest('i.summaryTip').length == 0 && $(e.target).closest('div.popoverInfo').length == 0){  
						 $('.popoverInfo').removeClass('in');  
			    		 $('.popoverInfo').remove();
			    	} 
				});

				$("#subBtn").click(function(){
					$("div#stickyNt").addClass('clear');
					$("#revenueForeCastDiv").css('overflow-x', 'auto');
					dim1 = $("#dim1").val();
					if(dim1!="CUS"){
							dim1val = $("#dim1_"+dim1).selectedValuesString();
					}else{
							dim1val = selCustomers.join(",");
						}	
					dim2 = $("#dim2").val();

					if(dim2 !="CUS"){
							dim2val = $("#dim2_"+dim2).selectedValuesString();
					}else{
							dim2val = selCustomers.join(",");			
					}
					fromDt = $("#from").val();
					duration = $("#duration").val();
					
					fromDate = $.datepicker.formatDate('yy-mm-dd', getGlobalDateObj("01-".concat(fromDt)));
					
					var hasError = false;

					$("#dim1_"+dim1+",#dim2_"+dim2+",#dim1_"+dim1+" #customers, #dim2_"+dim2+" #customers").removeClass("error");
					$("#pageMessage").hide();
					$("#noDataMsg").hide();

					if(dim1val == ''){
						hasError = true;
						if(dim1!="CUS")
							$("#dim1_"+dim1).addClass("error");
						else
							$("#dim1_"+dim1+" #customers").addClass("error");
					}

					if(dim2val == ''){
						hasError = true;
						if(dim2!="CUS")
							$("#dim2_"+dim2).addClass("error");
						else
							$("#dim2_"+dim2+" #customers").addClass("error");
					}
					
					if(hasError){
						$("#pageMessage").html('<strong><em class="icon" data-icon="⚠"></em></strong><span id="pageMessageText" class="message">Please select valid values for highlighted fields</span>');
						$("#pageMessage").addClass('alert-danger').removeClass('alert-success').show();
					} else{
						$("#cancenDiv").remove();
						$('#spinner').append('<div class="text-center" id="cancenDiv"><div class="form-group"><div class="clearfix" style="height:5px;"></div><button type="button" id="cancelReq" class="btn btn-primary">Cancel Request</button></div></div>');
						$('#spinner').show();
						viewFilters = {};
						viewFilters['dim1'] = dim1;
						viewFilters['dim1_'+dim1] = dim1val;
						viewFilters['dim2'] = dim2;
						viewFilters['dim2_'+dim2] = dim2val;
						viewFilters['from'] = fromDt;
						viewFilters['duration'] = duration;
						
						xhr = $.ajax('<g:createLink controller="pmo" action="getRevenueForecasts"/>', {
			    			dataType:"json",
			    			data: {dimension1: dim1, dimension1_val: dim1val, dimension2: dim2, dimension2_val: dim2val, month: fromDate, duration: duration,type:"viewForecast",key:'${key}'},
			    			type: "POST",
			    			async: "false",
						    success: function(response) {
									$('#spinner').hide();
									if(response.length > 0) {
										renderForeCastData(response); 
									}
									else {
										$("#revenueForeCastDiv").html('');
										$('#forecastDiv').hide();
										$('#revenueForeCastDiv').hide();
										confirmAddForecasts();
									}
									$(".btns").addClass('clear');
			    			},
			    			error: function (xhr, status, error) { 
			    				$('#spinner').hide();
			    		    }
						}); 
					}
				});
			});
			
			$(document).on('click','#cancelReq',function() {
		        if(xhr && xhr.readyState != 4){
		            xhr.abort();
		        }
		        $("#spinner").hide();
			});
			
			$(document).on('click','.option span', function(e) {   
			    	var chkBx = $(e.target).closest('span.option').find('input');

					$(chkBx).click();
				});
			
			$(document).on('click','.cbox', function(e) {
			
				  var id = $(this).attr('id');
				  var itemTpl = $("#chkBxTpl").html();
				  var name = $(this).attr('name');
					
				  if ($(this).is(":checked")) {
				    $(this).closest('span.option').addClass('selected');

				    if ($(this).attr('for') != 'prospect') {
				      var inputs = $("input[id='" + id + "']").not("[for='prospect']");
				      $.each(inputs, function(idx, elem) {
				        $(elem).prop('checked', 'checked');
				        $(elem).closest('span.option').addClass('selected');
				      });
				    }

				    if (!$(this).closest('span.option').hasClass('selections')) {
				      itemTpl = itemTpl.replace(/__ID__/g, id + '" checked="checked');
				      itemTpl = itemTpl.replace(/__NAME__/g, name);
				      itemTpl = itemTpl.replace(/__TYPE__/g, $(this).attr('for'));
				      itemTpl = itemTpl.replace(/__CLASS__/g, 'col-md-3 col-sm-3 selections selected');
				      itemTpl = itemTpl.replace(/tpl/g, '');

				      $("#selectedList").append(itemTpl);
				      $("#noSelDiv").hide();
				      $("#selectAllSel").prop('checked', 'checked');
				    }
				  } else {
				
				    $(this).closest('span.option').removeClass('selected');

				    $('input.cbox[id="' + id + '"][for="' + $(this).attr('for') + '"]').prop('checked', '').closest('span.option').removeClass('selected');

				    if ($(this).attr('for') != 'prospect') {
				      var inputs = $("input[id='" + id + "']").not("[for='prospect']");
				      $.each(inputs, function(idx, elem) {
				        $(elem).prop('checked', '');
				        $(elem).closest('span.option').removeClass('selected');
				      });
				    }
				    $("#selectedList").find('.cbox[id="' + id + '"]').closest('.option').remove();

				    if ($("#selectedList").find('.option').length == 0) {
				      $("#noSelDiv").show();
				      $("#selectAllSel").prop('checked', '');
				    }
				  }

				  checkCount($(this).attr('for'));
			});
			
			function triggerSelectedCustomers() { 
					var customerArr = []; 
					var customerList = $("#allCustList input.cbox[for='customer']:checked");
 					var buCustomerList = $("#BUCustList input.cbox[for='bucustomer']:checked");
 					
 					$.each(buCustomerList, function(idx, elem){
							if(customerArr.indexOf($(elem).attr('id')) == -1)
								customerArr.push($(elem).attr('id'));
						});
						
					$.each(customerList, function(idx, elem){
						if(customerArr.indexOf($(elem).attr('id')) == -1)
							customerArr.push($(elem).attr('id'));
					});
					var custDim = '';
					
					if(custDlgViewTyp != 'newForecast'){
						if($('#dim1').val() == 'CUS')
							custDim = 'dim1_CUS';
						else if($('#dim2').val() == 'CUS')
							custDim = 'dim2_CUS';
						else
							custDim = '';
					} else{
						custDim = 'newForecastCUS';
					}
					
					selCustomers = $.unique(customerArr);

					if(custDim.indexOf('CUS') > -1){
						if(selCustomers.length > 0)
							$("#"+custDim+" span[id= '"+custDim+"Text']").text(selCustomers.length+' selected');
						else
							$("#"+custDim+"Text").text('Select Customer');
					}
			}
				
			function confirmAddForecasts(){
				$("#newForecastDlg").dialog({
					autoOpen: false,
					resizeable: false,
					modal: true,
					width: 400,
					buttons: {
				     	"Yes": function () {
				     		addNewForecasts();
				     		$(this).dialog("close");
				    	 },
				        "No": function () {
				     		$(this).dialog("close");
				     	}
			   	 	}
				});
				$("#newForecastDlg").dialog('open').css('min-height', '50px');
				$("#newForecastDlg").siblings(".ui-dialog-titlebar").hide();
			}
			
			function addNewForecasts(){
				editSelections = {};
				editSelections[dim1] = dim1val;
				editSelections[dim2] = dim2val;
				isDialog = false;
				custDlgViewTyp = 'newForecast';
				setNewForecastFilters('new');
			}
			
			function setNewForecastFilters(type){
				var dim3 = $(allDimensions).not([dim1,dim2])[0];
				editSelections[dim3] = -1;
				editSelections['From'] = fromDt;
				editSelections['Duration'] = duration;
				
				$("#newForecastRadio").prop('checked',true).change();
				$("#revenueNewForeCastDiv").html('');
				$("#pageMessage, .selForecastSpan, #noDataMsg").hide();
				$(".btns").addClass('clear');
				$("#back").show();
				
				$.each(editSelections, function(elem, val){
					val = (val == -1) ? "" : val;
					switch(elem){
						case "BU"	:
								val = type == 'new' ? '' : val
								$("#newForecastBU").val(val);
								break;
						case "CUS"	:
								$('input#selectAllSel').click();
								if(val.length > 0){
									$.each(val.split(","), function(idx, v){
										$("#allCustList").find('span input#'+v).click();
									});
									triggerSelectedCustomers();
								}
								break;
						case "CON"	:
								$('input.selectAll[name="newForecastCON"]').prop('checked',true).click();
								$.each(val.split(","), function(idx, v){
									$('input[name="newForecastCON"][value="'+v+'"]').click();
								});
								break;
						default		:
								$("#newForecast"+elem).val(val);
								break;
					}
				});
				
				$("#subNewForcastBtn").click();
			}
			
			 
			function renderForeCastData(data) {
				var content = '';
				var body = '';
				var headerBlock = '';
				var header1 = '';
				var header2 = '';
				var colCnt = 0;
				var curDate = new Date();	
				var curMonth=curDate.getMonth()+1;								
				if(curMonth < 9)		
					curMonth=	'0'+curMonth;	
				else
					curMonth=	curMonth;
				var curYear=curDate.getFullYear();	
				var monArr = {'01':'Jan', '02':'Feb', '03':'Mar', '04':'Apr', '05':'May', '06':'Jun', '07':'Jul', '08':'Aug', '09':'Sep', '10':'Oct', '11':'Nov', '12':'Dec'};
				var thKeyArr = '';
				
				content = '<table class="table table-bordered table-striped" id="forcastTbl"><thead>'; 
				content += '<tr>';
				headerBlock = '<th style="background-color:#f4f4f4;min-width:400px" rowspan="3">'+$("#dim1").find('option:selected').text()+' / '+$("#dim2").find('option:selected').text()+'</th>';
				header1 = '';
				header2 = '';  
				
				var info = '<i id="__FOR__" data-toggle="popoverInfo" data-container="body" data-placement="top" type="button" data-html="true" style="float: right;font-size: 12px;cursor: pointer;" class="fa fa-info-circle summaryTip"></i>';
				 
				$.each(data[2], function(thKey, thVal) {
					 
					
					if(thKey != 'id' && thKey != 'isEdit' && thKey != 'count' && thKey != 'lvl_2_id' && thKey != 'lvl_2' && thKey != 'lvl_1_id' && thKey != 'lvl_1' && thKey != 'lvl' && thKey.indexOf('_df') != -1) {
						  thKeyArr = thKey.split('_'); 		
						  if(thKeyArr[0] != 'total')		 
						  	thKey = $.datepicker.formatDate('dd-M-yy',getGlobalDateObj(thKeyArr[2] + '-' +  monArr[thKeyArr[1]] + '-' + thKeyArr[0]));
						  else
						  		thKey = '    Total';
						  headerBlock += '<th style="color:#2e88c5;" colspan="4">' + thKey.substring(3) + '</th>';	
						  header1 += '<th style="min-width:120px;background-color: #ecebeb !important;" colspan="2">'+info.replace(/__FOR__/g,"ForecastToolTip")+'Forecasts</th>'
						  			+'<th style="min-width:120px;background-color: #ecebeb !important;" colspan="2">'+info.replace(/__FOR__/g,"RevenueToolTip")+'Revenue</th>';							
						  header2 += '<th style="min-width:120px">Account</th>'
						 			+'<th style="min-width:126px">Project</th>'
						 			+'<th style="min-width:120px">Planned</th>'
						 			+'<th style="min-width:120px">Recognized</th>';
						colCnt++;
					}
				});
				header1 += '</tr>';
				header2 += '</tr>';  
				headerBlock += '</tr>';
				content += headerBlock;
				content += '<tr>'; 
				content += header1+header2; 
				content += '</thead><tbody>';
				var tdClass, editBtn, tdLink;
				 
				 $.each(data, function(idx, tdValue) {  
				 	 if(tdValue.id == '-2' || tdValue.id == '-3') {
					 	return true;
					 } 
					 tdClass = '';
					 
					 if(tdValue.lvl == 1) { 
						 tdClass = 'class="dimSummary"';
					 } else if(tdValue.lvl == 0) {
						 tdClass = 'class="topSummary"';
					 } 
					 editBtn = '';
					 if(tdValue.isEdit){
					 	editBtn = '<div title="Edit" style="display:inline-block;height: 19px;vertical-align: middle;" class="editForecast ui-pg-button ui-pg-div"><span class="ui-icon ui-icon-pencil"></span></div>';
					 }
					if(tdValue.lvl == 0 ) {
						body += '<tr  class="sumHeader">';  
						body += '<td><span class="expandAll" title="Expand All"><i class="fa fa fa-caret-right"></i></span>&nbsp;<span class="collapseAll" title="Collapse All" style="display:none;"><i class="fa fa fa-caret-down"></i></span>&nbsp;'+tdValue.lvl_1+'</td>';
					 
					} else if(tdValue.lvl == 1) {
						body += '<tr class="header" id="'+tdValue.lvl_1_id+'" level="dim1">';  
						body += '<td><span title = "Expand" class="toggle"><i class="fa fa-caret-right"></i></span>&nbsp;'+tdValue.lvl_1+editBtn+'</td>';
					
					} else {
						body += '<tr id="'+tdValue.lvl_1_id+'_'+tdValue.lvl_2_id+'" level="dim2" style="display:none;">';  
						body += '<td style="text-align:right;">'+tdValue.lvl_2+'  '+editBtn+'</td>';
					}
					 $.each(tdValue, function(k, v) { 
						 var val = $.formatNumber(parseFloat(parseFloat(v)), {format:",##0"});
						 if(k != 'id' && k != 'isEdit' && k != 'count' && k != 'lvl_2_id' && k != 'lvl_2' && k != 'lvl_1_id' && k != 'lvl_1' && k != 'lvl' ) {3
						 	 tdLink = '';
						 	 if(k.indexOf('pf') > -1 && tdValue.lvl == 2)
						 		 tdLink +='<a id="'+tdValue.lvl_1_id+'_'+tdValue.lvl_2_id+'_'+k+'" dt = "'+k+'" href="javascript:void(0)" onclick="getProjectForecasts(this)">';
							 body += '<td '+tdClass+'><div style="text-align:left;float:left;">$</div><div style="text-align:right;">'+tdLink+''+val+'</a></div></td>';
						 }
					 });
					  
					body += '</tr>';
				});	
				content += body;
				content += '</tbody></table>';
				$('#revenueForeCastDiv').html(content); 
				$('#forecastDiv').show();
				$('#revenueForeCastDiv').show();
				
				$("[data-toggle=popoverInfo]").popover({ 
			    	 animation	: true,	    
			    	 html		: true,	    
			    	 template: '<div class="popoverInfo" role="tooltip"><div class="arrow"></div><div class="popover-content"></div></div>',
			    	 content	: function() {    
			    	 	$('.popoverInfo').removeClass('in');
			    	 	$('.popoverInfo').remove();
						var id = $(this).attr('id');  			
						return $('#popover-content-' + id).text();
		   			}
				});
				
		}
		 
		$('#subNewForcastBtn').click(function() {
			var isModified = ($("input.editHrs.isDirty").length > 0);
			
			if(isModified){
				checkModifications(this);
			} else{
				var hasNewError = false;
				buVal = $('#newForecastBU').val();
				cusVal = selCustomers.join(",");
				
				if(cusVal == ''){
					hasNewError = true;
					$("#newForecastCUS div#customers").addClass("error");
				} else {
					$("#newForecastCUS div#customers").removeClass("error");	
				}
				
				conVal = $("#newForecastCON").selectedValuesString();
				if(conVal == ''){
					hasNewError = true;
					$("#newForecastCON").addClass("error");
				} else {
					$("#newForecastCON").removeClass("error");	
				}
				
				if(buVal == ''){
					hasNewError = true;
					$("#newForecastBU").addClass("error");
				} else {
					$("#newForecastBU").removeClass("error");	
				}
				
				fromDtVal = $("#newForecastFrom").val();
						
				durationVal = $("#newForecastDuration").val();
						
				if(hasNewError){
					$("#pageMessage").html('<strong><em class="icon" data-icon="⚠"></em></strong><span id="pageMessageText" class="message">Please select valid values for highlighted fields</span>');
					$("#pageMessage").addClass('alert-danger').removeClass('alert-success').show();
				} else{
					$("#pageMessage").hide();
					getNewForeCastData();
				}
			}
		});
		
		function getNewForeCastData(){
				var fromDateVal = $.datepicker.formatDate('yy-mm-dd', getGlobalDateObj("01-".concat(fromDtVal)));
				$("#cancenDiv").remove();
				$('#spinner').append('<div class="text-center" id="cancenDiv"><div class="form-group"><div class="clearfix" style="height:5px;"></div><button type="button" id="cancelReq" class="btn btn-primary">Cancel Request</button></div></div>');
				$('#spinner').show();
				xhr = $.ajax('<g:createLink controller="pmo" action="getRevenueForecasts"/>', {
	    			dataType:"json",
	    			data: {bu: buVal, countries: conVal,customers:cusVal, month: fromDateVal, duration: durationVal,type:"newForecast"},
	    			type: "POST",
	    			async: "false",
				    success: function(response) {
				  	    												
							$('#spinner').hide();
							if(response.length > 0){
								renderNewForeCastData(response);
								$(".btns").removeClass('clear');
							}
							else 
								renderEmptyData('revenueNewForeCastDiv');
	    			},
	    			error: function (xhr, status, error) { 
	    				$('#spinner').hide();
	    		    }
				}); 
		}
		
		function renderNewForeCastData(data) {
				var content = '';
				var body = '';
				var headerBlock = '';
				var header = '';
				var header1 = '';
				var colCnt = 0;
				var curDate = new Date();	
				var curMonth=curDate.getMonth()+1;
				var curMonFirstDay = new Date(curDate.setDate(0));								
				if(curMonth < 9)		
					curMonth=	'0'+curMonth;	
				else
					curMonth=	curMonth;
				var info = '<i id="__FOR__" data-toggle="popoverInfo" data-container="body" data-placement="top" type="button" data-html="true" style="float: right;font-size: 12px;cursor: pointer;" class="fa fa-info-circle summaryTip"></i>';
				var curYear=curDate.getFullYear();	
				var monArr = {'01':'Jan', '02':'Feb', '03':'Mar', '04':'Apr', '05':'May', '06':'Jun', '07':'Jul', '08':'Aug', '09':'Sep', '10':'Oct', '11':'Nov', '12':'Dec'};
				var thKeyArr = '';
				content = '<table class="table table-bordered table-striped" id="forcastTbl"><tbody>'; 
				content += '<tr>';
				headerBlock = '<td  class= "center bold" style="background-color:#f4f4f4;" colspan="2" rowspan="2">Revenue Forecasts For '+$('#newForecastBU option:selected').text()+'</td>';
				header = '<td class="center" style="background-color:#f4f4f4;font-weight:bold;min-width:250px">Customer</td><td class="center" style="background-color:#f4f4f4;font-weight:bold;">Country</td>';
				header1 = ''; 
				$.each(data[0], function(thKey, thVal) {
					if(thKey != 'id' && thKey != 'count' && thKey != 'lvl'  && thKey != 'dept_id' && thKey != 'dept' && thKey != 'customer_id' && thKey != 'customer' && thKey != 'country_id' && thKey != 'country' && thKey.indexOf('_df') != -1) {
						  thKeyArr = thKey.split('_'); 				 
						  thKey = $.datepicker.formatDate('dd-M-yy',getGlobalDateObj(thKeyArr[2] + '-' +  monArr[thKeyArr[1]] + '-' + thKeyArr[0]));
						  headerBlock += '<td style="background-color:#f4f4f4;" colspan="4" class="center bold">' + thKey.substring(3) + '</td>';
						   header1 += '<th style="min-width:120px;background-color: #ecebeb !important;" colspan="2" class="center">'+info.replace(/__FOR__/g,"ForecastToolTip")+'Forecasts</th>'
						  			+'<th style="min-width:120px;background-color: #ecebeb !important;" colspan="2" class="center">'+info.replace(/__FOR__/g,"RevenueToolTip")+'Revenue</th>';								
						   header += '<td style="background-color:#f4f4f4;min-width:120px" class="center bold">Forecast</td>'
						 			+'<td style="background-color:#f4f4f4;min-width:126px" class="center bold">Project</td>'
						 			+'<td style="background-color:#f4f4f4;min-width:120px" class="center bold">Planned</td>'
						 			+'<td style="background-color:#f4f4f4;min-width:120px" class="center bold">Recognized</td>';
						colCnt++;
					}
				});
				header1 += '</tr>';
				header += '</tr>';  
				headerBlock += '</tr>';
				content += headerBlock;
				content += '<tr>'; 
				content += header1+header; 
				 var tdClass;
				 var buRowSpan;
				 var cusRowSpan;
				 $.each(data, function(tdKey, tdValue) { 
					 tdClass = '';
					 if(tdValue.lvl == 1) { 
						 tdClass = 'class="dimSummary"';
					 } else if(tdValue.lvl == 0) {
						 tdClass = 'class="topSummary"';
					 } 
					if(tdValue.lvl == 0 ) {
						body += '<tr  class="sumHeader">'; 
						body += '<td><span class="expandAll" title="Expand All"><i class="fa fa fa-caret-right"></i></span>&nbsp;<span class="collapseAll" title="Collapse All" style="display:none;"><i class="fa fa fa-caret-down"></i></span>&nbsp;Summary</td>';
						body += '<td>&nbsp;</td>';
					} else if(tdValue.lvl == 1) {
						body += '<tr class="header">'; 
						body += '<td><span class="toggle"><i class="fa fa fa-caret-right"></i></span>&nbsp;'+tdValue.customer+'</td>';
						body += '<td>Summary</td>';
					} else {
						body += '<tr style="display:none;">'; 
						body += '<td>'+tdValue.customer+'</td>';
						body += '<td>'+tdValue.country+'</td>';
					}
					 $.each(tdValue, function(k, v) {
						var val = parseFloat(v).toLocaleString();
						if(k != 'id' && k != 'lvl' && k != 'count' && k != 'dept_id' && k != 'dept' && k != 'customer_id' && k != 'customer' && k != 'country_id' && k != 'country') {
							var temp = '';
							v = $.formatNumber(parseFloat(parseFloat(v)), {format:",##0"});
							
							if(k.indexOf('df') > -1 && tdValue.lvl == 2){
								var dt = k.split('_');
								dt = dt[0]+"-"+dt[1]+"-"+dt[2];
								var date = new Date(dt);
								var key = dt+'_'+tdValue.lvl_1_id+'_'+tdValue.lvl_2_id;
	
								if(date >= curMonFirstDay)
									temp += '<input class="editHrs" maxlength = "8" month = "'+dt+'" deptId = "'+tdValue.dept_id+'" countryId = "'+tdValue.country_id+'" customerId = "'+tdValue.customer_id+'"  type="text" preval = "'+v+'" value = "'+v+'"></td>';
								else
									temp += v;
							} else{
								 temp += v;
							}
							body += '<td '+tdClass+'><div style="text-align:left;float:left;">$</div><div class="col-md-10 no-padding" style="text-align:right;float:right;">'+temp+'</div></td>';
						 }
					 });
					  
					body += '</tr>';
				});	
				content += body;
				content += '<tbody></table>';
				$('#revenueNewForeCastDiv').html(content).show();
				$(".editHrs").on('focus', function(){
                      var val = $.parseNumber($(this).val());
                      $(this).val(val);
                }).on('blur', function(){
                	$(this).val($.formatNumber(parseFloat($.parseNumber($(this).val())), {format:",##0"}));
                }).keypress(function(e){
					if(isNaN(parseInt(e.key)) && $.inArray(e.keyCode,[8,9,46,37,39]) == -1 && $.inArray(e.charCode,[46]) == -1){
                    	e.preventDefault();
                    }
                    
                    if(e.key == '.' && ($(this).val().indexOf('.') != -1 || $(this).val() == '')){
						e.preventDefault();
					}
						
                    if(e.keyCode == 13){
                    	$(this).blur();
                    }
				});
				$(".editHrs").on('change', function(){
					var preVal = parseFloat($.parseNumber($(this).attr('preval')));
					var val = parseFloat($.parseNumber($(this).val())); 
					if(preVal != val)
						$(this).addClass('isDirty');
					else
						$(this).removeClass('isDirty');
				});
				
				if(nextAction != null){
					$(nextAction).click();
					nextAction = null;
				}
				
				$("[data-toggle=popoverInfo]").popover({
					container: 'body',
			    	 animation	: true,	    
			    	 html		: true,	    
			    	 template: '<div class="popoverInfo" role="tooltip"><div class="arrow"></div><div class="popover-content"></div></div>',
			    	 content	: function() {    
			    	 	$('.popoverInfo').removeClass('in');
			    	 	$('.popoverInfo').remove();
						var id = $(this).attr('id');  			
						return $('#popover-content-' + id).text();
		   			}
				});
		}
		
		$("input.search").keyup(function(){
					var searchStr = $(this).val().trim().toLowerCase();
					if(searchStr.length >= 3){
						var options = $(".option").not('.tpl');

						$.each(options, function(idx, elem){
							var optionName = $(elem).text().trim().toLowerCase();
							if(optionName.indexOf(searchStr) == -1){
								$(elem).hide();
							} else{
								$(elem).show();
							}
						});
					} else{
						$(".option").show();
					}
					
					if($("#BUCustList").find('input:visible').length == 0){
						$("#noBuCustDiv").show();
					}else{
						$("#noBuCustDiv").hide();
					}
					
					if($("#allCustList").find('input:visible').length == 0){
						$("#noCustDiv").show();
					}else{
						$("#noCustDiv").hide();
					}
				});
				
				$(".selectAll").click(function(){
					var isChecked = $(this).is(":checked");
					var $this = $(this);

					if(isChecked){
						var inputs = $(this).closest('div.section').find('input[type="checkbox"]').not(":checked");
						
						$.each(inputs, function(idx, elem){
							var id = $(elem).attr('id');
							
							$(elem).prop('checked','checked');
					    	$(elem).closest('span.option').addClass('selected');
					    	
					    	if($(elem).attr('for') != 'prospect'){
					    		var inputs = $("input[id='"+id+"']").not("[for='prospect']");
						    	$.each(inputs, function(idx, elem2){
					    			$(elem2).prop('checked','checked');
					    			$(elem2).closest('span.option').addClass('selected');
					    		});
					    	}
					    	
					    	if(!$this.hasClass('selections')){
					    		var itemTpl = $("#chkBxTpl").html();
					    		
					    		itemTpl = itemTpl.replace(/__ID__/g, id+'" checked="checked');
								itemTpl = itemTpl.replace(/__NAME__/g, $(elem).attr('name'));
								itemTpl = itemTpl.replace(/__TYPE__/g, $(elem).attr('for'));
								itemTpl = itemTpl.replace(/__CLASS__/g, 'col-md-3 col-sm-3 selections selected');
								itemTpl = itemTpl.replace(/tpl/g, '');
								
								$("#selectedList").append(itemTpl);
								$("#noSelDiv").hide();
								$("#selectAllSel").prop('checked','checked');
							}
						});
					} else{
						var inputs = $(this).closest('div.section').find('input:checked');
						$.each(inputs, function(idx, elem){
							var id = $(elem).attr('id');
						
							$(elem).prop('checked','');
				    		$(elem).closest('span.option').removeClass('selected');
				    		
				    		if($(this).attr('for') != 'prospect'){
				    			var inputs = $("input[id='"+id+"']").not("[for='prospect']");
						    	$.each(inputs, function(idx, elem2){
					    			$(elem2).prop('checked','');
					    			$(elem2).closest('span.option').removeClass('selected');
					    		});
					    	}
					    	
					    	$("#selectedList").find('.cbox[id="'+id+'"]').closest('.option').remove();
					    	$('input.cbox[id="'+id+'"]').prop('checked','').closest('span.option').removeClass('selected');
						});
					}
					
					if($("#selectedList").find('.option').length == 0){
			    		$("#noSelDiv").show();
			    		$("#selectAllSel").prop('checked','');
				    }
			
					checkCount('bucustomer');
					checkCount('customer');
				});
		
			$("#save").click(function(){
				$("#pageMessage, #noDataMsg").hide();
				saveObj = [];
				$.each($("input.editHrs.isDirty"), function(idx,input){
					var v = {};
					v['deptId'] = $(input).attr('deptid');
					v['countryId'] = $(input).attr('countryid');
					v['customerId'] = $(input).attr('customerid');
					v['month'] = $(input).attr('month');
					v['forecastVal'] = parseFloat($.parseNumber($(input).val()));
					saveObj.push(v) 
				});

				if(saveObj.length > 0){
					$("#cancenDiv").remove();
					$("#spinner").show();
					$.ajax('<g:createLink controller="pmo" action="saveRevenueForecasts"/>',{
						dataType	: 'json',
						async		: false,
						data		: {saveObj:JSON.stringify(saveObj)},
						success		: function(response){
											$("#spinner").hide();
											if(response.status == 'Success'){
												$("#pageMessage").removeClass('alert-danger').addClass('alert-success');
												$("#pageMessage").html('<span id="pageMessageText" class="message"><strong><em class="icon-check"></em></strong>Data Saved Successfully</span>');
												isDialog = true;
												getNewForeCastData();
												$.each(viewFilters, function(key, val){
													switch(val){
														case "BU" : viewFilters[''+key+'_'+val] = buVal; break;
														case "CUS": viewFilters[''+key+'_'+val] = cusVal; break;
														case "CON": viewFilters[''+key+'_'+val] = conVal; break;
													}
													viewFilters['from'] = fromDtVal;
													viewFilters['duration'] = durationVal;
												});
											}else{
												$("html, body").animate({ scrollTop: 0 }, "slow");
												$("#pageMessage").removeClass('alert-success').addClass('alert-danger');
												$("#pageMessage").html('<strong><em class="icon" data-icon="⚠"></em></strong><span id="pageMessageText" class="message">Saving failed due to some error. Please try again</span>');
											}
											$("#pageMessage").show();
											setTimeout(function(){
												$("#pageMessage").hide();
											},5000);
										},
						error		: function(){
											$("#spinner").hide();
											$("html, body").animate({ scrollTop: 0 }, "slow");
											$("#pageMessage").removeClass('alert-success').addClass('alert-danger');
											$("#pageMessage").html('<strong><em class="icon" data-icon="⚠"></em></strong><span id="pageMessageText" class="message">Saving failed due to some error. Please try again</span>');
											$("#pageMessage").show();
										}
					});
				} else{
					$("#pageMessage").html('<strong><em class="icon" data-icon="⚠"></em></strong><span id="pageMessageText" class="message">No modifications to save</span>');
					$("#pageMessage").addClass('alert-danger').removeClass('alert-success').show();	
					setTimeout(function(){
						$("#pageMessage").hide();
					},5000);				
				}
			});
		
		function renderEmptyData(id) {
			var content = '';
			content = '<table class="table table-bordered table-striped" id="forcastEmptyTbl"><tr><td class="center"> No Data Found</td></tr></table>';
			$('#'+id).html(content);  
		}
		
		$("#cancel").click(function(){
			$("#pageMessage").hide();
			$.each($("input.editHrs.isDirty"), function(idx,input){
				$(input).val($(input).attr('preval'));
				$(input).removeClass('isDirty');
			});				
		});
		
		function checkExpColAll() {
			var	exp = 0,col = 0;
			$('span.toggle').each(function() {
				if($(this).find('i').hasClass('fa-caret-right'))
					col++;
				else if($(this).find('i').hasClass('fa-caret-down'))
					exp++;
			});
			if(exp > 0) {
				$('span.collapseAll').show();
				$('span.expandAll').hide();	
			} else {
				$('span.collapseAll').hide();
				$('span.expandAll').show()
			}
			 
			
		}
		
		$('body').on('click', 'span.toggle', function(){   
			$(this).closest('tr.header').nextUntil('tr.header').slideToggle(100);
			$(this).find('i').toggleClass('fa-caret-right fa-caret-down');
			if($(this).find('i').hasClass('fa-caret-right')) 
				$(this).find('i').attr('title', 'Expand');
			else
				$(this).find('i').attr('title', 'Collapse');
			checkExpColAll();
		});
		
		$('body').on('click', 'span.expandAll', function(){ 
			$("tr.header i.fa-caret-right").trigger('click'); 
			$('span.collapseAll').show();
			$('span.expandAll').hide();	
			
		});
		$('body').on('click', 'span.collapseAll', function(){   
			$("tr.header i.fa-caret-down").trigger('click'); 
			$('span.collapseAll').hide();
			$('span.expandAll').show();
		});
		
		$('body').on('click', '.editForecast', function(){   
			var tr = $(this).closest('tr');
			var idArr = $(tr).attr("id").split('_');
			editSelections = {};
			
			if($(tr).attr("level") == 'dim1'){
				editSelections[dim1] = idArr[0];
				editSelections[dim2] = dim2val;
			} else{
				editSelections[dim1] = idArr[0];
				editSelections[dim2] = idArr[1];
			}
			isDialog = true;
			setNewForecastFilters('edit');
		});
		
		$('body').on('click', '#back', function(){
			var isModified = ($("input.editHrs.isDirty").length > 0);
			
			if(isModified){
				checkModifications(this);
			} else{
				$("#viewForecastRadio").prop('checked',true).change();
				$("#back, #pageMessage, #noDataMsg").hide();
				$(".selForecastSpan").show();
				$("#revenueNewForeCastDiv").html('');
				$(".error").removeClass('error')
				custDlgViewTyp = 'oldForecast';
				$('input#selectAllSel').click();
				$("#newForecastCUSText").text('Select Customer');
				$.each(viewFilters, function(id, val){
					var elem = $('#'+id);
					if($(elem).hasClass("multiSelect")){
						$('input.selectAll[name="'+id+'"]').prop('checked',true).click();
						$.each(val.split(","), function(idx, v){
							$('input[name="'+id+'"][value="'+v+'"]').click();
						});
					} else if(id.indexOf('_CUS') > -1){
						$.each(val.split(","), function(idx, v){
							$("#allCustList").find('span input#'+v).click();
						});
						
					} else{
						$(elem).val(val).change();
					}
				});
				triggerSelectedCustomers();
				
				if(isDialog)
					$("#subBtn").click();
			}
			$("#newForecastBU").val("");
		});
		
		function checkModifications(obj){
			$("<div id='confirmBox'>Do you want to save changes?</div>").dialog({
		        modal: true, title: 'Confirmation', zIndex: 10000, autoOpen: true,
		        width: 'auto', resizable: false,
		        open: function () {},
		        buttons: [
			            {
			               text: "Yes",
			               "id": 'Yes',
			               click: function() {
			               			nextAction = obj;
									$("#save").click();
	               			 		$(this).dialog("close");
			               }
			            },
			            {
			               text: "No",
			               "id": 'No',
			               click: function() { 
			               			$("#pageMessage").hide();
									$.each($("input.editHrs.isDirty"), function(idx,input){
										$(input).val($(input).attr('preval'));
										$(input).removeClass('isDirty');
									});	
									$(obj).click();
			                  		$(this).dialog("close"); 
			                  		return false;
			               }
			            }
			          ],
				close: function (event, ui) {
									
				}
			});
		}
		
		function getProjectForecasts(thisObj){
			$("#cancenDiv").remove();
			$('#spinner').append('<div class="text-center" id="cancenDiv"><div class="form-group"><div class="clearfix" style="height:5px;"></div><button type="button" id="cancelReq" class="btn btn-primary">Cancel Request</button></div></div>');
			$("#spinner").show();
			$("#noDataMsg").hide();
			$('div#stickyNt').remove();
			var block = thisObj.id;
			block = block.split("_");
			var dim1Val = block[0];
			var dim2Val = block[1];
		
			xhr = $.ajax('<g:createLink controller="pmo" action="getProjectForecasts"/>', {
	    			dataType:"json",
	    			data: {dim1: dim1,dim1Val: dim1Val,dim2:dim2, dim2Val: dim2Val, fromDt: fromDate,duration:duration},
	    			type: "POST",
	    			async: "false",
				    success: function(response) {
				  	    $("#spinner").hide();												
						if(response.length > 0){
							renderProjectForecasts(response, thisObj);
						} else{
							$("#noDataMsg").html('<strong><em class="icon" data-icon="⚠"></em></strong><span id="noDataTxt" class="message">No Project Level Forecasts Found</span>');
							$("#noDataMsg").show();
							setTimeout(function(){
								$("#noDataMsg").hide();
							},5000);
						}
	    			},
	    			error: function (xhr, status, error) { 
	    				$('#spinner').hide();
	    		    }
				}); 
		}
		
		function renderProjectForecasts(data, block){
			var monArr = {'01':'Jan', '02':'Feb', '03':'Mar', '04':'Apr', '05':'May', '06':'Jun', '07':'Jul', '08':'Aug', '09':'Sep', '10':'Oct', '11':'Nov', '12':'Dec'};
			var content = '';
			var colCnt = 0;
			var totBgCls = '';
			var headerBlock = '';
			var header = '';
			var selMonthId = $(block).attr('dt');
			
			content = '<div id="stickyNt" class="arrow_box" style="position: absolute; background: #FFFFFF none repeat scroll 0% 0%; border: 3px solid #b7b7b7; padding: 3px; z-index: 1;">';
			content += '<div class="col-md-12 no-padding"><button type="button" class="closeSticky ui-dialog-titlebar-close" onclick="closeRes()" style="float: right; padding: 1px;"></button><div class="clearfix"></div></div>';
			content += '<div style = "width : 800px; overflow:auto; max-height: 500px;"><table class="table table-bordered table-striped"><tbody>';
			content += '<tr>';
			
			headerBlock = '<td style="background-color:#f4f4f4;" colspan="2" class="shrinkText">&nbsp;</td>';
			header = '<td style="background-color:#f4f4f4;" class="shrinkText center bold">Project Name</td>'
					 +'<td style="background-color:#f4f4f4;" class="shrinkText center bold">Customer</td>';   	
			$.each(data[0], function(thKey, thVal) {
				if(thKey.indexOf('total') == -1 && thKey != 'id' && thKey != 'count' && thKey != 'lvl_2_id' && thKey != 'lvl_2' && thKey != 'lvl_1_id' && thKey != 'lvl_1' && thKey != 'lvl' && thKey.indexOf('_pf') != -1) {
					  thKeyArr = thKey.split('_'); 				 
					  thKey = $.datepicker.formatDate('dd-M-yy',getGlobalDateObj(thKeyArr[2] + '-' +  monArr[thKeyArr[1]] + '-' + thKeyArr[0]));
					  headerBlock += '<td style="background-color:#f4f4f4;" colspan="3" class="center bold">' + thKey.substring(3) + '</td>';								
					  header += '<td style="background-color:#f4f4f4;min-width:110px" class="center bold">Prj Forecast</td>'
					  			+'<td style="background-color:#f4f4f4;min-width:110px" class="center bold">Planned</td>'
					  			+'<td style="background-color:#f4f4f4;min-width:110px" class="center bold">Recognized</td>';
					  colCnt++;
				}
			});
			
			headerBlock += '<td style="background-color:#f4f4f4;" colspan="3" class="center bold">Total</td>';								
			header += '<td style="background-color:#f4f4f4;min-width:110px" class="center bold">Prj Forecast</td>'
					  +'<td style="background-color:#f4f4f4;min-width:110px" class="center bold">Planned</td>'
					  +'<td style="background-color:#f4f4f4;min-width:110px" class="center bold">Recognized</td>';
			header += '</tr>';  
			headerBlock += '</tr>';
			content += headerBlock;
			content += '<tr>'; 
			content += header; 
			
			$.each(data, function(idx, tdVal) { 
				$.each(tdVal, function(key, val) { 
			 		if(key != 'project_id') {
						if(key == 'proj_name') {
							content += '<td class="shrinkText" style="text-align:left;" title ="'+val+'">'+val+'</td>';	
						} else if(key == 'customer'){
							content += '<td class="shrinkText" style="text-align:left;" title ="'+val+'">'+val+'</td>';	
						} else{
							var totalColor = '';
							var selMOnColor = '';
							
							if(key == selMonthId){
								selMOnColor = 'class = "selMon"';
							}
							
							if(key == 'total_pf' || key == 'total_pl' || key == 'total_rr'){
								totalColor = 'class = "totalCol"';
							}
							
							var v = $.formatNumber(parseFloat(parseFloat(val)), {format:",##0"});
						    content += '<td '+totalColor+' '+selMOnColor+ '><div style="text-align:left; float:left;">$</div><div style="text-align:right;">'+v+'</div></td>';
						}
					}
			 	});
			 	content +=  '</tr>';
			});			
	
			content += '<tbody></table></div></div>';
			
			$("div#projectForecastDiv").html(content);

			$("#revenueForeCastDiv").css('overflow-x', 'hidden');
			
			setPopover(block);
		}
		
		
		
		function setPopover(block) {
			var pos = $(block).closest('td').position();
			var tdIdx = $(block).closest('td').index();
			var totTds = $(block).closest('tr').children("td").length;
			var arrowLeft;
			var stickyNtLeft;
			
			if(pos.left < 200){
				arrowLeft='20%';
				stickyNtLeft=0;
			} else if(pos.left > 700){
				arrowLeft='100%';
				stickyNtLeft = 720;
			} else{
				 arrowLeft='50%';
				 stickyNtLeft='240';
			}
			
			$("#dynamic").text(".arrow_box:after,.arrow_box:before {left:"+arrowLeft+";}");

			$('div#stickyNt')
			.css({
                      top: pos.top + 27,
                      left: pos.left - stickyNtLeft,
                      position: 'absolute',                        
                  }).insertAfter($(block));
			return true;		
		}
		
		function closeRes() {
			$('div#stickyNt').remove();
			$("#revenueForeCastDiv").css('overflow-x', 'auto');
			return false;
		}
		$(function(){
		  $('#revenueForeCastDiv,#revenueNewForeCastDiv').on('scroll', function() { 
		     	 $('.popoverInfo').removeClass('in');  
			     $('.popoverInfo').remove(); 
		  });
		});
		function fnExcelReport(){
				var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
				tab_text = tab_text + '<head><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';
				tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
				tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
				tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
				tab_text = "<table border='2px'><tr bgcolor='#87AFC6'>";
 
			    var textRange; var j=0;
			    tab = document.getElementById('exportForcastTbl'); // id of table
			
			    for(j = 0 ; j < tab.rows.length ; j++) {     
			        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
			        //tab_text=tab_text+"</tr>";
			    }
			
			    tab_text=tab_text+"</table>";
			    tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
			    tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
			    tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params
			    tab_text= tab_text.replace(/<select[^>]*>|<\/select>/gi, "");
			    
			    var ua = window.navigator.userAgent;
			    var msie = ua.indexOf("MSIE "); 
			
			    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)){
			        txtArea1.document.open("txt/html","replace");
			        txtArea1.document.write(tab_text);
			        txtArea1.document.close();
			        txtArea1.focus(); 
			        sa=txtArea1.document.execCommand("SaveAs",true,"Forecast.xls");
			    } else{                 //other browser not tested on IE 11
			        sa = window.open('data:application/vnd.ms-excel;charset=utf-8,' + encodeURIComponent(tab_text));
			    }
			    
			    return (sa);
			} 
			
			function showCustomers(custDlgViewTyp){
				var buCustomerHtml = '<div class="col-md-12" id="noBuCustDiv">No Customers found for selected Business Unit</div>';
				var itemTpl;

				if($("#newForecastBU").val()!="")
					var BUIds = $("#newForecastBU").val();
				else
					var BUIds = $("#dim1_BU").selectedValuesString();

				if(BUIds.length > 0 || custDlgViewTyp == 'newForecast'){
					BUIds = (BUIds == '') ? 0 : BUIds;
					$('#spinner').show();
						
					$.ajax('<g:createLink controller="pmo" action="getBUCustomers"/>',{
						dataType:"json",
		    			data: {buIds : BUIds},
		    			type: "POST",
		    			async: "false",
					    success: function(response) {
					    	buCustomers = response;
					    	buCustomersCount = response.length;
					    	$.each(buCustomers, function(idx, item){
								itemTpl = $("#chkBxTpl").html();
								itemTpl = itemTpl.replace(/__ID__/g, item.id);
								itemTpl = itemTpl.replace(/__NAME__/g, item.name);
								itemTpl = itemTpl.replace(/__TYPE__/g, 'bucustomer');
								itemTpl = itemTpl.replace(/__CLASS__/g, 'col-md-3');
								itemTpl = itemTpl.replace(/tpl/g, '');
								
								buCustomerHtml += itemTpl;
							});
							
							$("#BUCustList").html(buCustomerHtml);
							
							if(buCustomers.length > 0){
								$("#noBuCustDiv").hide();
							}
							
							if(selCustomers.length > 0){
								$.each($("#BUCustList input.cbox[for='bucustomer']"), function(idx, elem){
										if(selCustomers.indexOf($(elem).attr('id')) >= 0){
											$(elem).prop('checked','checked');
											$(elem).closest("span.option").addClass("selected");
										}
								});
							}
							$("#BUCustList").parent('div').removeClass('clear');
							$('#spinner').hide();
							checkCount('bucustomer');
   						},
   						error: function (xhr, status, error) { 
   								$('#spinner').hide();
   		   			    }
					});
				} else{
        		 	$("#BUCustList").parent('div').addClass('clear');
        		}
        		
				$("#custDlg").dialog('open');
			}
			
			function checkCount(type){
				var count = $(".optionList input.cbox[for='"+type+"']:checked").not('.selections').length;
				
				switch(type){
				
					case 'bucustomer'	:   if(count == buCustomersCount && count != 0){
												$("#selectAllBUCust").prop('checked','checked');
											} else{
												$("#selectAllBUCust").prop('checked','');
											}
											break;
					case 'customer'		:	if(count == customerCount && count != 0){
												$("#selectAllCust").prop('checked','checked');
											} else{
												$("#selectAllCust").prop('checked','');
											}
											break;
				}
			}
	</script>
</body>
</html>