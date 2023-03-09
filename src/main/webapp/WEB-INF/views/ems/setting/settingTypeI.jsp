<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<script type="text/javaScript">
	$(document).ready(function(){
		//상온 총 순시전력
		var wattmeter1_electric = $("input[class='T03010_wattmeter1_electric']").val();
		var wattmeter2_electric = $("input[class='T03010_wattmeter2_electric']").val();
		var wattmeter_electric1 = parseInt(wattmeter1_electric.replace(/,/g,"")) + parseInt(wattmeter2_electric.replace(/,/g,""));
		$("#wattmeter_electric1").text(wattmeter_electric1);
		//상온 총 적산전력
		var wattmeter1_wattage = $("input[class='T03010_wattmeter1_wattage']").val();
		var wattmeter2_wattage = $("input[class='T03010_wattmeter2_wattage']").val();
		var wattmeter_wattage1 = parseInt(wattmeter1_wattage.replace(/,/g,"")) + parseInt(wattmeter2_wattage.replace(/,/g,""));
		$("#wattmeter_wattage1").text(wattmeter_wattage1);
		
		//심야 총 순시전력
		var wattmeter3_electric = $("input[class='T03010_wattmeter3_electric']").val();
		var wattmeter4_electric = $("input[class='T03010_wattmeter4_electric']").val();
		var wattmeter_electric2 = parseInt(wattmeter3_electric.replace(/,/g,"")) + parseInt(wattmeter4_electric.replace(/,/g,""));
		$("#wattmeter_electric2").text(wattmeter_electric2);
		//심야 총 적산전력
		var wattmeter3_wattage = $("input[class='T03010_wattmeter3_wattage']").val();
		var wattmeter4_wattage = $("input[class='T03010_wattmeter4_wattage']").val();
		var wattmeter_wattage3 = parseInt(wattmeter3_wattage.replace(/,/g,"")) + parseInt(wattmeter4_wattage.replace(/,/g,""));
		$("#wattmeter_wattage2").text(wattmeter_wattage3);
	});
	
	
</script>

<div id="data_area">

	<div class="data_area_inner">
		<dl>
			<dt>인버터 제어 설정</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="32%">
					<col width="*">
					<col width="32%">
					<col width="18%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">브라인펌프1 수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03010','brinepump1_manual_frequency_set');" class="font_purple setPop" ><span id="T03010_brinepump1_manual_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
							<th scope="row">브라인펌프2수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03010','brinepump1_manual_frequency_set');" class="font_purple setPop" ><span id="T03010_brinepump1_manual_frequency_set"> </span> </a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">냉수펌프1 수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03010','coolwaterpump1_manual_frequency_set');" class="font_purple setPop" ><span id="T03010_coolwaterpump1_manual_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
							<th scope="row">냉수펌프2수동 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03010','coolwaterpump2_manual_frequency_set');" class="font_purple setPop" ><span id="T03010_coolwaterpump2_manual_frequency_set"> </span> </a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">브라인펌프1 축냉 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03010','brinepump1_heatstorage_frequency_set');" class="font_purple setPop" ><span id="T03010_brinepump1_heatstorage_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
							<th scope="row">브라인펌프1 방냉 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03010','brinepump1_icestorage_frequency_set');" class="font_purple setPop" ><span id="T03010_brinepump1_icestorage_frequency_set"> </span> </a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">브라인펌프2 축냉 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03010','brinepump2_heatstorage_frequency_set');" class="font_purple setPop" ><span id="T03010_brinepump2_heatstorage_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
							<th scope="row">브라인펌프2 방냉 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03010','brinepump2_icestorage_frequency_set');" class="font_purple setPop" ><span id="T03010_brinepump2_icestorage_frequency_set"> </span> </a> <span class="font_yellow">Hz</span></td>
						</tr>
						<tr>
							<th scope="row">냉수펌프1 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03010','coolwaterpump1_frequency_set');" class="font_purple setPop" ><span id="T03010_coolwaterpump1_frequency_set" > </span> </a> <span class="font_yellow">Hz</span></td>
							<th scope="row">냉수펌프2 주파수</th>
							<td><a href="javascript:openLayerPop('#layerPop_type3','T03010','coolwaterpump2_frequency_set');" class="font_purple setPop" ><span id="T03010_coolwaterpump2_frequency_set"> </span> </a> <span class="font_yellow">Hz</span></td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>유량계</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="23%">
					<col width="27%">
					<col width="23%">
					<col width="27%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">유량계1 순시</th>
							<td class="font_yellow"><span id="T03010_flow1_inspect">0</span> ㎡/h</td>
							<th scope="row">유량계1 적산</th>
							<td class="font_yellow"><span id="T03010_flow1_accum">0</span> ㎡</td>
						</tr>
						<tr>
							<th scope="row">유량계2 순시</th>
							<td class="font_yellow"><span id="T03010_flow2_inspect">0</span> ㎡/h</td>
							<th scope="row">유량계2 적산</th>
							<td class="font_yellow"><span id="T03010_flow2_accum">0</span> ㎡</td>
						</tr>
						
						<tr>
							<th scope="row">유량계3 순시</th>
							<td class="font_yellow"><span id="T03010_flow3_inspect">0</span> ㎡/h</td>
							<th scope="row">유량계3 적산</th>
							<td class="font_yellow"><span id="T03010_flow3_accum">0</span> ㎡</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>상온전력</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="23%">
					<col width="27%">
					<col width="23%">
					<col width="27%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">상온전력1</th>
							<td class="font_yellow"><span id="T03010_wattmeter1_electric">0</span> kW</td>
							<th scope="row">상온전력량1</th>
							<td class="font_yellow"><span id="T03010_wattmeter1_wattage">0</span> kWh</td>
						</tr>
						<tr>
							<th scope="row">상온전력2</th>
							<td class="font_yellow"><span id="T03010_wattmeter2_electric">0</span> kW</td>
							<th scope="row">상온전력량2</th>
							<td class="font_yellow"><span id="T03010_wattmeter2_wattage">0</span> kWh</td>
						</tr>
						<tr>
							<th scope="row">상온 총 순시전력</th>
							<td class="font_yellow"><span id="wattmeter_electric1">0</span> kW</td>
							<th scope="row">상온 총 누적전력</th>
							<td class="font_yellow"><span id="wattmeter_wattage1">0</span> kWh</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>심야전력</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="23%">
					<col width="27%">
					<col width="23%">
					<col width="27%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">심야전력1</th>
							<td class="font_yellow"><span id="T03010_wattmeter3_electric">0</span> kW</td>
							<th scope="row">심야전력량1</th>
							<td class="font_yellow"><span id="T03010_wattmeter3_wattage">0</span> kWh</td>
						</tr>
						<tr>
							<th scope="row">심야전력2</th>
							<td class="font_yellow"><span id="T03010_wattmeter4_electric">0</span> kW</td>
							<th scope="row">심야전력량2</th>
							<td class="font_yellow"><span id="T03010_wattmeter4_wattage">0</span> kWh</td>
						</tr>
						<tr>
							<th scope="row">심야 총 순시전력</th>
							<td class="font_yellow"><span id="wattmeter_electric2">0</span> kW</td>
							<th scope="row">심야 총 누적전력</th>
							<td class="font_yellow"><span id="wattmeter_wattage2">0</span> kWh</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
	<div class="data_area_inner mt10">
		<dl>
			<dt>일반전력</dt>
			<dd>
				<table class="data_row">
				<caption>caption</caption>
				<colgroup>
					<col width="23%">
					<col width="27%">
					<col width="23%">
					<col width="27%">
				</colgroup>

					<tbody>
						<tr>
							<th scope="row">일반전력</th>
							<td class="font_yellow"><span id="T03010_wattmeter5_electric">0</span> kW</td>
							<th scope="row">일반전력량</th>
							<td class="font_yellow"><span id="T03010_wattmeter5_wattage">0</span> kWh</td>
						</tr>
					</tbody>
				</table>
			</dd>
		</dl>
	</div>
	
</div>
<!-- e : data_area -->

