<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/include/taglib.jsp" %>  

<style type="text/css">
	.blockDiagram_area .basicpump .fan {position:absolute;top:8px;left:145px;width:25px;height:25px;background: url(/resources/ems/images/fan.png) 0 0 no-repeat;background-size: 100%;}
	.blockDiagram_area .basicpump .fan.on {background: url(/resources/ems/images/fan_ani.gif) 0 0 no-repeat;background-size: 100%;}
	.blockDiagram_area .header_lamp .text {position:absolute;top:9px;left:192px;}
	.blockDiagram_area .header_lamp .outtemp {position:absolute;top:34px;left:187px;}
	.blockDiagram_area .header_lamp .temp {position:absolute;top:34px;left:227px;}
</style>

<script type="text/javaScript">

	var fridge1_day = null;
	var fridge1_night = null;
	var fridge2_day = null;
	var fridge2_night = null;
	var cool1_fs = null;
	var cool2_fs = null;
	var cool3_fs = null;
	var coolpump1 = null;
	var coolpump2 = null;
	var coolpump3 = null;
	var coolpump4 = null;
	var coolpump5 = null;
	var brine1_fs = null;
	var brine2_fs = null;
	var mv1 = null;
	var brinepump1 = null;
	var brinepump2 = null;
	var brinepump3 = null;
	var mv2a = null;
	var mv2b = null;
	var coolwater1_fs = null;
	var coolwater2_fs = null;
	var coolwater3_fs = null;
	var coolwaterpump1 = null;
	var coolwaterpump2 = null;
	var coolwaterpump3 = null;
	var coolwaterpump4 = null;
	var coolwaterpump5 = null;
	
	
	// 삭제하지 마세요!
	function checkDoublePipe() {
		fridge1_day = $("input[class='E35501_fridge1_day']").val();
		fridge1_night = $("input[class='E35501_fridge1_night']").val();
		
		if (fridge1_day==1 || fridge1_night==1) {
			$("a[id='E35501_fridge1_day']").removeClass("off").addClass("on");
			$("a[id='E35501_fridge1_day']").text("기동");
		} else {
			$("a[id='E35501_fridge1_day']").removeClass("on").addClass("off");
			$("a[id='E35501_fridge1_day']").text("정지");
		}
		
		fridge2_day = $("input[class='E35501_fridge2_day']").val();
		fridge2_night = $("input[class='E35501_fridge2_night']").val();
		
		if (fridge2_day==1 || fridge2_night==1) {
			$("a[id='E35501_fridge2_day']").removeClass("off").addClass("on");
			$("a[id='E35501_fridge2_day']").text("기동");
		} else {
			$("a[id='E35501_fridge2_day']").removeClass("on").addClass("off");
			$("a[id='E35501_fridge2_day']").text("정지");
		}
		
		cool1_fs = $("input[class='E35501_cool1_fs']").val();
		
		if(cool1_fs == '1'){
			$("span[name = 'E35501_pipe1']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe1']").removeClass("on");
			
		}
		
		cool2_fs = $("input[class='E35501_cool2_fs']").val();
		
		if(cool2_fs == '1'){
			$("span[name = 'E35501_pipe2']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe2']").removeClass("on");
		}
		
		cool3_fs = $("input[class='E35501_cool3_fs']").val();
		
		if(cool3_fs == '1'){
			$("span[name = 'E35501_pipe3']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe3']").removeClass("on");
		}
		
		coolpump1 = $("input[class='E35501_coolpump1']").val();
		coolpump2 = $("input[class='E35501_coolpump2']").val();
		coolpump3 = $("input[class='E35501_coolpumpsb']").val();
		coolpump4 = $("input[class='E35501_coolpump4']").val();
		coolpump5 = $("input[class='E35501_coolpump5']").val();
		
		if(coolpump1 == '1'){
			$("span[name = 'E35501_pipe4']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe4']").removeClass("on");
		}
		
		if(coolpump2 == '1'){
			$("span[name = 'E35501_pipe5']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe5']").removeClass("on");
		}
		
		if(coolpump3 == '1'){
			$("span[name = 'E35501_pipe6']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe6']").removeClass("on");
		}
		
		if(coolpump4 == '1'){
			$("span[name = 'E35501_pipe7']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe7']").removeClass("on");
		}
		
		if(coolpump5 == '1'){
			$("span[name = 'E35501_pipe8']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe8']").removeClass("on");
		}
		
		if((cool1_fs == '1' && coolpump2 == '1') || (cool2_fs == '1' && coolpump2 == '1')){
			$("span[name = 'E35501_pipe9']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe9']").removeClass("on");
		}
		
		if((cool2_fs == '1' && coolpump1 == '1') || (cool1_fs == '1' && (coolpump3 == '1' || coolpump2 == '1' ) )){
			$("span[name = 'E35501_pipe10']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe10']").removeClass("on");
		}
		
		brine1_fs = $("input[class='E35501_brine1_fs']").val();
		
		if(brine1_fs == '1'){
			$("span[name = 'E35501_pipe11']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe11']").removeClass("on");
		}
		
		brine2_fs = $("input[class='E35501_brine2_fs']").val();
		
		if(brine2_fs == '1'){
			$("span[name = 'E35501_pipe12']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe12']").removeClass("on");
		}
		
		if(brine1_fs == '1' || brine2_fs == '1'){
			$("span[name = 'E35501_pipe13']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe13']").removeClass("on");
		}
		
		mv1 = $("input[class='E35501_mv1_per']").val();
		//heatstorage_other_per
		
		$('#mv1_other_per').text((100 - mv1));
		$('#mv1_per').text(mv1);
		if((brine1_fs == '1' || brine2_fs == '1')  && mv1 > 0){
			$("span[name = 'E35501_pipe15']").addClass("on");
		} else{
			$("span[name = 'E35501_pipe15']").removeClass("on");
		}
		
		if((brine1_fs == '1' || brine2_fs == '1') && (100 - mv1) > 0){
			$("span[name = 'E35501_pipe14']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe14']").removeClass("on");
		}
		
		brinepump1 = $("input[class='E35501_brinepump1']").val();
		brinepump2 = $("input[class='E35501_brinepump2']").val();
		brinepump3 = $("input[class='E35501_brinepumpsb']").val();
		
		if(brinepump1 == '1'){
			$("span[name = 'E35501_pipe16']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe16']").removeClass("on");
		}
		
		if(brinepump2 == '1'){
			$("span[name = 'E35501_pipe17']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe17']").removeClass("on");
		}
		
		if(brinepump3 == '1'){
			$("span[name = 'E35501_pipe18']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe18']").removeClass("on");
		}
		
		if((brine1_fs == '1' && (brinepump2 == '1' || brinepump3 == '1')) || (brine2_fs == '1' && brinepump1 == '1') ){
			$("span[name = 'E35501_pipe19']").addClass("on");
		} else{
			$("span[name = 'E35501_pipe19']").removeClass("on");
		}
		
		if((brine2_fs == '1' && (brinepump1 == '1' || brinepump3 == '1')) || (brine1_fs == '1' && brinepump2 == '1') ){
			$("span[name = 'E35501_pipe20']").addClass("on");
		} else{
			$("span[name = 'E35501_pipe20']").removeClass("on");
		}
		
		mv2a = $("input[class='E35501_mv2a_per']").val();
		
		$('#mv2a_other_per').text((100 - mv2a));
		$('#mv2a_per').text(mv2a);
		
		if(brine1_fs == '1' && mv2a > 0 ){
			$("span[name = 'E35501_pipe22']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe22']").removeClass("on");
		}
		
		if(brine1_fs == '1' && (100 - mv2a) > 0){
			$("span[name = 'E35501_pipe21']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe21']").removeClass("on");
		}
		
		mv2b = $("input[class='E35501_mv2b_per']").val();
		$('#mv2b_other_per').text((100 - mv2b));
		$('#mv2b_per').text(mv2b);
		if(brine2_fs == '1' && mv2b > 0 ){
			$("span[name = 'E35501_pipe24']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe24']").removeClass("on");
		}
		
		if(brine2_fs == '1' && (100 - mv2b) > 0){
			$("span[name = 'E35501_pipe23']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe23']").removeClass("on");
		}
		
		coolwater1_fs = $("input[class='E35501_coolwater1_fs']").val();
		
		if(coolwater1_fs == '1'){
			$("span[name = 'E35501_pipe25']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe25']").removeClass("on");
		}
		
		coolwater2_fs = $("input[class='E35501_coolwater2_fs']").val();
		
		if(coolwater2_fs == '1'){
			$("span[name = 'E35501_pipe26']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe26']").removeClass("on");
		}
		
		coolwater3_fs = $("input[class='E35501_coolwater3_fs']").val();
		
		if(coolwater3_fs == '1'){
			$("span[name = 'E35501_pipe27']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe27']").removeClass("on");
		}
		
		coolwaterpump1 = $("input[class='E35501_coolwaterpump1']").val();
		coolwaterpump2 = $("input[class='E35501_coolwaterpump2']").val();
		coolwaterpump3 = $("input[class='E35501_coolwaterpumpsb']").val();
		coolwaterpump4 = $("input[class='E35501_coolwaterpump4']").val();
		coolwaterpump5 = $("input[class='E35501_coolwaterpump5']").val();
		
		if(coolwaterpump1 == '1'){
			$("span[name = 'E35501_pipe28']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe28']").removeClass("on");
		}
		
		if(coolwaterpump2 == '1'){
			$("span[name = 'E35501_pipe29']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe29']").removeClass("on");
		}
		
		if(coolwaterpump3 == '1'){
			$("span[name = 'E35501_pipe30']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe30']").removeClass("on");
		}
		
		if(coolwaterpump4 == '1'){
			$("span[name = 'E35501_pipe31']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe31']").removeClass("on");
		}
		
		if(coolwaterpump5 == '1'){
			$("span[name = 'E35501_pipe32']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe32']").removeClass("on");
		}
		
		if((coolwater2_fs =='1' && (coolwaterpump1 == '1' || coolwaterpump3 == '1')) || (coolwater1_fs == '1' && coolwaterpump2 == '1') ){
			$("span[name = 'E35501_pipe33']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe33']").removeClass("on");
		}
		
		if((coolwater1_fs =='1' && (coolwaterpump2 == '1' || coolwaterpump3 == '1')) || (coolwater2_fs == '1' && coolwaterpump1 == '1') ){
			$("span[name = 'E35501_pipe34']").addClass("on");
		}else{
			$("span[name = 'E35501_pipe34']").removeClass("on");
		}
		
		//빙축열냉동기 #1 순시열량
		//var frige1_inspect_heat = 0;
		//if (fridge1_day == 1) {
		//	frige1_inspect_heat = Math.round(($("input[class='E35501_brine1_in_temp']").val() - $("input[class='E35501_brine1_out_temp']").val()) * $("input[class='E35501_coolwater1_inspect_flux']").val()*1033*0.94/3024);
		//		}
		//$("#frige1_inspect_heat").text(frige1_inspect_heat);
		
		//빙축열냉동기 #1 순시열량
		//var frige2_inspect_heat = 0;
		//if (fridge2_day == 1) {
		//	frige2_inspect_heat = Math.round(($("input[class='E35501_brine2_in_temp']").val() - $("input[class='E35501_brine2_out_temp']").val()) * $("input[class='E35501_coolwater2_inspect_flux']").val()*1033*0.94/3024);
		//}
		//$("#frige2_inspect_heat").text(frige2_inspect_heat);
		
		//축냉순시열량
		//var inspect_icestorage_heat = frige1_inspect_heat + frige2_inspect_heat;
		//$("#inspect_icestorage_heat").text(inspect_icestorage_heat);
		
		//상온냉동기 순시열량
		//var fridge3 = $("input[class='E35501_fridge3']").val();
		//var frige3_inspect_heat = 0;
		//if (fridge3 == 1) {
		//	frige3_inspect_heat = Math.round(($("input[class='E35501_coolwater3_in_temp']").val() - $("input[class='E35501_coolwater3_out_temp']").val()) * $("input[class='E35501_coolwater3_inspect_flux']").val()*1000/3024);
		//}
		//$("#frige3_inspect_heat").text(frige3_inspect_heat);
		
		//열교환기 #1 순시열량
		//var heatchange1_inspect_heat = Math.round(($("input[class='E35501_heatchange1_out_temp']").val() - $("input[class='E35501_heatchange1_in_temp']").val()) * $("input[class='E35501_coolwater1_inspect_flux']").val()*1033*0.94/3024);
		//$("#heatchange1_inspect_heat").text(heatchange1_inspect_heat);
		
		//열교환기 #2 순시열량
		//var heatchange2_inspect_heat = Math.round(($("input[class='E35501_heatchange2_out_temp']").val() - $("input[class='E35501_heatchange2_in_temp']").val()) * $("input[class='E35501_coolwater2_inspect_flux']").val()*1033*0.94/3024);
		//$("#heatchange2_inspect_heat").text(heatchange2_inspect_heat);
		
		//방냉순시열량
		//var storagetank_inspect_heat = frige3_inspect_heat + heatchange1_inspect_heat + heatchange2_inspect_heat;
		//$("#storagetank_inspect_heat").text(storagetank_inspect_heat);
		
		//축열조(%)
		//var storagetank_heatstorage = Math.round((inspect_icestorage_heat /60) - ((heatchange1_inspect_heat + heatchange2_inspect_heat /60)) /3150);
		//console.log(storagetank_heatstorage);
		//$("#storagetank_heatstorage").text(storagetank_heatstorage);
		//$(".heat_storaging_tank").find("span").css("height",storagetank_heatstorage+"%");
	}

</script>

<div class="blockDiagram_area typeA">

	<div class="hw" style="display: ;">
		
		<span class="pipe_hw_ud down pipe001" name="E35501_pipe3"></span>
		<span class="pipe_hw_ud down pipe002" name="E35501_pipe2"></span>
		<span class="pipe_hw_ud down pipe003" name="E35501_pipe1"></span>
		<span class="pipe_hw_ud up pipe004" name="E35501_pipe3"></span>
		<span class="pipe_hw_ud up pipe005" name="E35501_pipe2"></span>
		<span class="pipe_hw_ud up pipe006" name="E35501_pipe1"></span>
		<span class="pipe_hw_ud down pipe007" name="E35501_pipe1"></span>
		<span class="pipe_hw_ud down pipe008" name="E35501_pipe2"></span>
		<span class="pipe_hw_ud up pipe009" name=""></span>
		<span class="pipe_hw_ud up pipe010" name="E35501_pipe9"></span>
		<span class="pipe_hw_ud up pipe011" name="E35501_pipe10"></span>
		<span class="pipe_hw_ud down pipe012" name=""></span>
		<span class="pipe_hw_ud down pipe013" name="E35501_pipe9"></span>
		<span class="pipe_hw_ud down pipe014" name="E35501_pipe10"></span>
		<!-- <span class="pipe_hw_ud pipe015" name=""></span> -->
		<!-- <span class="pipe_hw_ud pipe016" name=""></span> -->
		<span class="pipe_hw_ud down pipe017" name="E35501_pipe1"></span>
		<span class="pipe_hw_ud down pipe018" name="E35501_pipe2"></span>
		<span class="pipe_hw_ud down pipe301" name="E35501_pipe8"></span>
		<span class="pipe_hw_ud down pipe302" name="E35501_pipe8"></span>
		<span class="pipe_hw_ud down pipe303" name="E35501_pipe3"></span>
		
		<span class="pipe_hw_lr right pipe001" name="E35501_pipe3"></span>
		<span class="pipe_hw_lr right pipe002" name="E35501_pipe2"></span>
		<span class="pipe_hw_lr right pipe003" name="E35501_pipe1"></span>
		<span class="pipe_hw_lr right pipe005" name="E35501_pipe2"></span>
		<span class="pipe_hw_lr right pipe006" name="E35501_pipe1"></span>
		<span class="pipe_hw_lr right pipe007" name="E35501_pipe7"></span>
		<span class="pipe_hw_lr right pipe008" name="E35501_pipe5"></span>
		<span class="pipe_hw_lr right pipe009" name="E35501_pipe6"></span>
		<span class="pipe_hw_lr right pipe010" name="E35501_pipe4"></span>
		<span class="pipe_hw_lr right pipe013" name="E35501_pipe1"></span>
		<span class="pipe_hw_lr left pipe014" name="E35501_pipe1"></span>
		<span class="pipe_hw_lr left pipe015" name="E35501_pipe2"></span>
		<span class="pipe_hw_lr left pipe016" name="E35501_pipe3"></span>
		<span class="pipe_hw_lr right pipe201" name="E35501_pipe2"></span>
		<span class="pipe_hw_lr right pipe301" name="E35501_pipe3"></span>
		<!-- <span class="pipe_hw_lr right pipe302" name="E35501_pipe7"></span> -->
		<span class="pipe_hw_lr right pipe303" name="E35501_pipe3"></span>
		<span class="pipe_hw_lr right pipe304" name="E35501_pipe8"></span>
		
		<span class="pipe_hw_corner_dl corner001"></span>
		<span class="pipe_hw_corner_dl corner002"></span>
		<span class="pipe_hw_corner_dl corner003"></span>
		<span class="pipe_hw_corner_dr corner001"></span>
		<span class="pipe_hw_corner_dr corner002"></span>
		<span class="pipe_hw_corner_dr corner003"></span>
		<span class="pipe_hw_corner_dr corner004"></span>
		<span class="pipe_hw_corner_dr corner005"></span>
		<span class="pipe_hw_corner_ul corner004"></span>
		<span class="pipe_hw_corner_ul corner005"></span>
		<span class="pipe_hw_corner_ul corner006"></span>
		<span class="pipe_hw_corner_ul corner007"></span>
		<span class="pipe_hw_corner_ul corner201"></span>
		<span class="pipe_hw_corner_ul corner202"></span>
		<span class="pipe_hw_corner_ul corner301"></span>
		<span class="pipe_hw_corner_ul corner302"></span>
		<span class="pipe_hw_corner_ur corner001"></span>
		<span class="pipe_hw_corner_ur corner002"></span>
		<span class="pipe_hw_corner_ur corner003"></span>
		<span class="pipe_hw_corner_ur corner201"></span>
		<span class="pipe_hw_corner_ur corner301"></span>
		<span class="pipe_hw_t_x corner003"></span>
		<span class="pipe_hw_t_x corner004"></span>
		<span class="pipe_hw_t_lru corner001"></span>
		<span class="pipe_hw_t_lru corner002"></span>
		<span class="pipe_hw_t_lru corner301"></span>
		<span class="pipe_hw_t_lru corner302"></span>
		
		<span class="sensor_u_temperature sensor001"><em><span id="E35501_cool1_out_temp" title="냉각수출구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em><span id="E35501_cool1_in_temp" title="냉각수입구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em><span id="E35501_cool2_out_temp" title="냉각수출구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em><span id="E35501_cool2_in_temp" title="냉각수입구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor005"><em><span id="E35501_cool3_out_temp" title="냉각수출구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em><span id="E35501_cool3_in_temp" title="냉각수입구온도"></span> ℃</em></span>
		
		<div class="coolpump_area">
			<a class="coolpump type2 No5" href="javascript:openLayerPop('#layerPop_type1','E35501', 'coolpump5');">
				<span class="fan off" id="E35501_coolpump5"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct" id="E35501_coolpump5_auto_yn"></span>
			</a>
			
			<a class="coolpump type2 No4" href="javascript:openLayerPop('#layerPop_type1','E35501', 'coolpump4');">
				<span class="fan off" id="E35501_coolpump4"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct" id="E35501_coolpump4_auto_yn"></span>
			</a>
			<strong class="text_info no2">상온냉각수펌프</strong>
			<a href="javascript:openLayerPop('#layerPop_type25','E35501', 'coolpump_select');" class="pumpchoice no2">선택</a>
			
			<a class="coolpump No3" href="javascript:openLayerPop('#layerPop_type1','E35501', 'coolpump2');">
				<span class="fan off" id="E35501_coolpump2"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct" id="E35501_coolpump2_auto_yn"></span>
			</a>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1','E35501', 'coolpumpsb');">
				<span class="fan off" id="E35501_coolpumpsb"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct direct" id="E35501_coolpumpsb_auto_yn"></span>
			</a>
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type1','E35501', 'coolpump1');">
				<span class="fan off" id="E35501_coolpump1"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct" id="E35501_coolpump1_auto_yn"></span>
			</a>
			<strong class="text_info no1">냉각수펌프</strong>
			<a href="javascript:openLayerPop('#layerPop_type26','E35501', 'coolpump_select');" class="pumpchoice no1">선택</a>
		</div>
		
		<div class="coolingtower No1">
			<div class="one_inner">
				<a href="javascript:openLayerPop('#layerPop_type1','E35501','cooltower1');" class="power off" id="E35501_cooltower1">정지</a><!-- 모달팝업 -->
				<span class="icon_direct direct" id="E35501_cooltower1_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<strong class="name">냉각탑#1</strong>
		</div>
		<div class="coolingtower No2">
			<div class="one_inner">
				<a href="javascript:openLayerPop('#layerPop_type1','E35501', 'cooltower2');" class="power off" id="E35501_cooltower2">정지</a><!-- 모달팝업 -->
				<span class="icon_direct direct" id="E35501_cooltower2_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<strong class="name">냉각탑#2</strong>
		</div>
		<div class="coolingtower duo No3">
			<div class="duo_inner">
				<span class="text">3-1</span>
				<a href="javascript:openLayerPop('#layerPop_type1','E35501','cooltower3_1');" class="power off" id="E35501_cooltower3_1">정지</a><!-- 모달팝업 -->
				<span class="icon_direct auto" id="E35501_cooltower3_1_auto_yn"></span><!-- 자동일경우 none -->
			</div>
			<div class="duo_inner">
				<span class="text">3-2</span>
				<a href="javascript:openLayerPop('#layerPop_type1','E35501','cooltower3_2');" class="power off" id="E35501_cooltower3_2">정지</a>
				<span class="icon_direct auto" id="E35501_cooltower3_2_auto_yn"></span>
			</div>
		</div>
	</div>
	
	<div class="chw">

 		<span class="pipe_chw_ud down pipe002" name="E35501_pipe15"></span>
		<span class="pipe_chw_ud up pipe004" name="E35501_pipe16"></span>
		<span class="pipe_chw_ud down pipe005" name="E35501_pipe17"></span>
		<span class="pipe_chw_ud down pipe101" name="E35501_pipe11"></span>
		<span class="pipe_chw_ud down pipe102" name="E35501_pipe13"></span>
		<span class="pipe_chw_ud down pipe103" name="E35501_pipe14"></span>
		<span class="pipe_chw_ud down pipe104" name="E35501_pipe19"></span>
		<span class="pipe_chw_ud down pipe105" name="E35501_pipe20"></span>
		<!-- <span class="pipe_chw_ud down pipe301" name="E35501_pipe27"></span> -->
		
		<span class="pipe_chw_lr left pipe001" name="E35501_pipe11"></span>
		<span class="pipe_chw_lr left pipe002" name="E35501_pipe12"></span>
		<span class="pipe_chw_lr right pipe004" name="E35501_pipe15"></span>
		<span class="pipe_chw_lr right pipe005" name="E35501_pipe14"></span>
		<span class="pipe_chw_lr right pipe006" name="E35501_pipe13"></span>
		<span class="pipe_chw_lr right pipe010" name=""></span>
		<span class="pipe_chw_lr left pipe015" name="E35501_pipe22"></span>
		<span class="pipe_chw_lr right pipe105" name="E35501_pipe16"></span>
		<span class="pipe_chw_lr right pipe106" name="E35501_pipe18"></span>
		<span class="pipe_chw_lr right pipe107" name="E35501_pipe17"></span>
		<span class="pipe_chw_lr right pipe108" name="E35501_pipe11"></span>
		<span class="pipe_chw_lr right pipe109" name="E35501_pipe12"></span>
		<span class="pipe_chw_lr right pipe110" name="E35501_pipe24"></span>
		<span class="pipe_chw_lr left pipe111" name="E35501_pipe24"></span>
		<span class="pipe_chw_lr right pipe112" name="E35501_pipe22"></span>
		<!-- <span class="pipe_chw_lr left pipe301" name="E35501_pipe27"></span> -->
		<!-- <span class="pipe_chw_lr left pipe302" name="E35501_pipe27"></span> -->
		
		<span class="pipe_chw_ud up pipe106" name="E35501_pipe11"></span>
		<span class="pipe_chw_ud up pipe107" name="E35501_pipe21"></span>
		<span class="pipe_chw_ud up pipe108" name="E35501_pipe11"></span>
		<span class="pipe_chw_ud up pipe201" name="E35501_pipe12"></span>
		<span class="pipe_chw_ud up pipe202" name="E35501_pipe23"></span>
		
		<span class="pipe_chw_corner_ur corner001"></span>
		<span class="pipe_chw_corner_ur corner002"></span>
		
		<span class="pipe_chw_corner_ul corner001"></span>
		<span class="pipe_chw_corner_ul corner002"></span>
		<span class="pipe_chw_corner_ul corner004"></span>
		
		<span class="pipe_chw_corner_dr corner001"></span>
		<span class="pipe_chw_corner_dr corner002"></span>
		
		<span class="pipe_chw_corner_dl corner001"></span>
		
		<span class="pipe_chw_t_x corner001"></span>
		
		<span class="pipe_chw_t_udr corner001"></span>
		<span class="pipe_chw_t_udr corner004"></span>
		<span class="pipe_chw_t_lru corner001"></span>
		<span class="pipe_chw_t_lru corner002"></span>
		<span class="pipe_chw_t_lru corner003"></span>
		<span class="pipe_chw_t_lrd corner001"></span>
		<span class="pipe_chw_t_udl corner001"></span>
		
		<span class="sensor_d_temperature sensor001"><em class="font_sky"><span id="E35501_brine1_out_temp" title="브라인출구온도"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_sky"><span id="E35501_brine1_in_temp" title="브라인입구온도"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor003"><em class="font_sky"><span id="E35501_brine2_out_temp" title="브라인출구온도"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor004"><em class="font_sky"><span id="E35501_brine2_in_temp" title="브라인입구온도"></span> ℃</em></span>
		
		<span class="sensor_l_temperature sensor001"><em class="font_sky"><span id="E35501_storagetank_high_temp" title="축열조상부온도"></span> ℃</em></span>
		<span class="sensor_l_temperature sensor002"><em class="font_sky"><span id="E35501_storagetank_low_temp" title="축열조하부온도"></span> ℃</em></span>
		
		<span class="sensor_u_temperature sensor001"><em class="font_sky"><span id="E35501_storagetank_mix_temp" title="축열조혼합온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor002"><em class="font_sky"><span id="E35501_heatchange1_out_temp" title="열교환기출구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em class="font_sky"><span id="E35501_heatchange1_in_temp" title="열교환기입구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em class="font_sky"><span id="E35501_heatchange2_out_temp" title="열교환기출구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor005"><em class="font_sky"><span id="E35501_heatchange2_in_temp" title="열교환기입구온도"></span> ℃</em></span>
		
		<div class="coolpump_area">
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type1','E35501', 'brinepump1');">
				<span class="fan off" id="E35501_brinepump1"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct" id="E35501_brinepump1_auto_yn"></span>
			</a>
			<strong class="text_info no1 font_yellow"><span id="E35501_brinepump1_inv_frequency" title="브라인펌프#1 인버터"></span> Hz</strong>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1','E35501', 'brinepumpsb');">
				<span class="fan off" id="E35501_brinepumpsb"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct direct" id="E35501_brinepumpsb_auto_yn"></span>
			</a>
			<a class="coolpump No3" href="javascript:openLayerPop('#layerPop_type1','E35501', 'brinepump2');">
				<span class="fan off" id="E35501_brinepump2"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct" id="E35501_brinepump2_auto_yn"></span>
			</a>
			<strong class="text_info no2 font_yellow"><span id="E35501_brinepump2_inv_frequency" title="브라인펌프#2 인버터"></span> Hz</strong>
			<strong class="text_info">브라인펌프</strong>
			<a href="javascript:openLayerPop('#layerPop_type27','E35501', 'brinepump_select');" class="pumpchoice no3">선택</a>
		</div>
		
		<div class="vv-011k No1">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2','E35501', 'mv1');"></a>
			<strong class="name">MV1</strong>
			<span class="text_inner text01"><span id="mv1_other_per"></span>%</span>
			<span class="text_inner text02"><span id="mv1_per"></span>%</span>
			<span class="icon_direct direct" id="E35501_mv1_auto_yn"></span>
		</div>
		<div class="vv-011k No2">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2','E35501', 'mv2a');"></a>
			<strong class="name">MV2A</strong>
			<span class="text_inner text01"><span id="mv2a_other_per"></span>%</span>
			<span class="text_inner text02"><span id="mv2a_per"></span>%</span>
			<span class="icon_direct direct" id="E35501_mv2a_auto_yn"></span>
		</div>
		<div class="vv-011k No3">
			<a class="btn" href="javascript:openLayerPop('#layerPop_type2','E35501', 'mv2b');"></a>
			<strong class="name">MV2B</strong>
			<span class="text_inner text01"><span id="mv2b_other_per"></span>%</span>
			<span class="text_inner text02"><span id="mv2b_per"></span>%</span>
			<span class="icon_direct direct" id="E35501_mv2b_auto_yn"></span>
		</div>
		<div class="heat_storaging_tank">
			<span class="bg" style="height:0%;"></span>
			<strong class="text"><span id="E35501_storagetank_heatstorage"></span>%</strong>
		</div>
		
	</div>
	
	<div class="glycol">
		
		<div class="hx_plate_v No1">
			<strong class="name">열교환기#1</strong>
		</div>
		<div class="hx_plate_v No2">
			<strong class="name">열교환기#2</strong>
		</div>
		
		<span class="pipe_glycol_lr left pipe301" name="E35501_pipe27"></span>
		<span class="pipe_glycol_lr right pipe302" name="E35501_pipe27"></span>
		<span class="pipe_glycol_lr left pipe303" name="E35501_pipe27"></span>
		<span class="pipe_glycol_lr left pipe001" name="E35501_pipe26"></span>
		<span class="pipe_glycol_lr left pipe002" name="E35501_pipe25"></span>
		<span class="pipe_glycol_lr right pipe004" name="E35501_pipe29"></span>
		<span class="pipe_glycol_lr right pipe005" name="E35501_pipe26"></span>
		<span class="pipe_glycol_lr right pipe006" name="E35501_pipe30"></span>
		<span class="pipe_glycol_lr right pipe007" name="E35501_pipe28"></span>
		<span class="pipe_glycol_lr right pipe008" name="E35501_pipe25"></span>
		<span class="pipe_glycol_lr right pipe009" name="E35501_pipe32"></span>
		<span class="pipe_glycol_lr right pipe010" name="E35501_pipe27"></span>
		<span class="pipe_glycol_lr right pipe011" name="E35501_pipe31"></span>
		<span class="pipe_glycol_lr left pipe014" name="E35501_pipe27"></span>
		<span class="pipe_glycol_lr left pipe016" name="E35501_pipe25"></span>
		<span class="pipe_glycol_lr right pipe017" name="E35501_pipe25"></span>
		<span class="pipe_glycol_lr left pipe018" name="E35501_pipe26"></span>
		<span class="pipe_glycol_lr right pipe019" name="E35501_pipe26"></span>
		
		<span class="pipe_glycol_ud up pipe004" name="E35501_pipe33"></span>
		<span class="pipe_glycol_ud up pipe005" name="E35501_pipe34"></span>
		<span class="pipe_glycol_ud up pipe006" name="E35501_pipe31"></span>
		<span class="pipe_glycol_ud down pipe007" name="E35501_pipe27"></span>
		<span class="pipe_glycol_ud down pipe008" name="E35501_pipe25"></span>
		<span class="pipe_glycol_ud down pipe009" name="E35501_pipe26"></span>
		<span class="pipe_glycol_ud up pipe011" name="E35501_pipe25"></span>
		<span class="pipe_glycol_ud up pipe012" name="E35501_pipe26"></span>
		<span class="pipe_glycol_ud down pipe301" name="E35501_pipe27"></span>
		<span class="pipe_glycol_ud up pipe310" name="E35501_pipe27"></span>
		
		<span class="pipe_glycol_corner_ur corner003"></span>
		<span class="pipe_glycol_corner_ul corner303"></span>
		<span class="pipe_glycol_corner_dl corner303"></span>		
		
		<span class="pipe_glycol_corner_ul corner001"></span>
		<span class="pipe_glycol_corner_ul corner002"></span>
		<span class="pipe_glycol_corner_ul corner004"></span>
		<span class="pipe_glycol_corner_ul corner005"></span>
		<span class="pipe_glycol_corner_ul corner006"></span>
		
		<span class="pipe_glycol_corner_dl corner001"></span>
		<span class="pipe_glycol_corner_dl corner002"></span>
		<span class="pipe_glycol_corner_dl corner004"></span>
		<span class="pipe_glycol_corner_dl corner005"></span>
		<span class="pipe_glycol_corner_dl corner006"></span>
		<span class="pipe_glycol_corner_dl corner007"></span>
		
		<span class="pipe_glycol_corner_dr corner003"></span>
		
		<span class="pipe_glycol_t_udl corner001"></span>
		
		<span class="pipe_glycol_t_lru corner001"></span>
		
		<span class="pipe_glycol_t_lrd corner002"></span>
		<span class="pipe_glycol_t_lrd corner003"></span>
		
		<span class="sensor_d_temperature sensor001"><em class="font_yellow"><span id="E35501_coolwater3_in_temp" title="냉수입구온도"></span> ℃</em></span>
		<span class="sensor_d_temperature sensor002"><em class="font_yellow"><span id="E35501_coolwater3_out_temp" title="냉수출구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor003"><em class="font_yellow"><span id="E35501_coolwater1_in_temp" title="냉수입구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor004"><em class="font_yellow"><span id="E35501_coolwater1_out_temp" title="냉수출구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor005"><em class="font_yellow"><span id="E35501_coolwater2_in_temp" title="냉수입구온도"></span> ℃</em></span>
		<span class="sensor_u_temperature sensor006"><em class="font_yellow"><span id="E35501_coolwater2_out_temp" title="냉수출구온도"></span> ℃</em></span>
		
		<div class="centrifugal_area">
			<div class="centrifugal No1">
				<strong class="name">빙축열냉동기 #1</strong>
				<a href="javascript:openLayerPop('#layerPop_type30','E35501','fridge1');" class="power no3 off" id="E35501_fridge1_day">정지</a>
				<span class="icon_direct no1 auto" id="E35501_fridge1_auto_yn"></span>
			</div>
			<div class="centrifugal No2">
				<strong class="name">빙축열냉동기 #2</strong>
				<a href="javascript:openLayerPop('#layerPop_type30','E35501', 'fridge2');" class="power no3 off" id="E35501_fridge2_day">정지</a>
				<span class="icon_direct no1 direct" id="E35501_fridge2_auto_yn"></span>
			</div>
			<a href="javascript:openLayerPop('#layerPop_type32','E35501', 'fridge');" class="pumpchoice no6">교번선택</a>
			<div class="centrifugal No3">
				<strong class="name">냉동기 #3</strong>
				<a href="javascript:openLayerPop('#layerPop_type1','E35501', 'fridge3');" class="power no3 off"  id="E35501_fridge3">운전</a>
				<span class="icon_direct no1 direct" id="E35501_fridge3_auto_yn"></span>
			</div>
		</div>
		
		<div class="symbol bottom No1"><em><span id="E35501_coolwater1_inspect_flux" title="유량계1"></span> ㎡/h</em></div>
		<div class="symbol bottom No2"><em><span id="E35501_coolwater2_inspect_flux" title="유량계2"></span> ㎡/h</em></div>
		<div class="symbol bottom No3"><em><span id="E35501_coolwater3_inspect_flux" title="유량계3"></span> ㎡/h</em></div>

		<div class="coolpump_area">
			<strong class="text_info no2">상온냉수펌프</strong>
			<a class="coolpump No1" href="javascript:openLayerPop('#layerPop_type1','E35501', 'coolwaterpump2');">
				<span class="fan off" id="E35501_coolwaterpump2"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct" id="E35501_coolwaterpump2_auto_yn"></span>
			</a>
			<strong class="text_info hz1 font_yellow"><span id="E35501_coolwaterpump2_inv_frequency" title="냉수펌프#2 인버터"></span> Hz</strong>
			<a class="coolpump No2" href="javascript:openLayerPop('#layerPop_type1','E35501', 'coolwaterpumpsb');">
				<span class="fan off" id="E35501_coolwaterpumpsb"></span>
				<strong class="name">SB</strong>
				<span class="icon_direct direct" id="E35501_coolwaterpumpsb_auto_yn"></span>
			</a>
			<strong class="text_info hz2 font_yellow"><span id="E35501_coolwaterpump1_inv_frequency" title="냉수펌프#1 인버터"></span> Hz</strong>
			<a class="coolpump No3" href="javascript:openLayerPop('#layerPop_type1','E35501', 'coolwaterpump1');">
				<span class="fan off" id="E35501_coolwaterpump1"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct" id="E35501_coolwaterpump1_auto_yn"></span>
			</a>
			<a class="coolpump type2 No4" href="javascript:openLayerPop('#layerPop_type1','E35501', 'coolwaterpump5');">
				<span class="fan off" id="E35501_coolwaterpump5"></span>
				<strong class="name">#2</strong>
				<span class="icon_direct direct" id="E35501_coolwaterpump5_auto_yn"></span>
			</a>
			<a class="coolpump type2 No5" href="javascript:openLayerPop('#layerPop_type1','E35501', 'coolwaterpump4');">
				<span class="fan off" id="E35501_coolwaterpump4"></span>
				<strong class="name">#1</strong>
				<span class="icon_direct direct" id="E35501_coolwaterpump4_auto_yn"></span>
			</a>
			<strong class="text_info no1">냉수펌프</strong>
		</div>
		<!-- 
		<div class="header No1">공<br />급<br />헤<br />더<em></em></div>
		<div class="header No2">환<br />수<br />헤<br />더<em></em></div>
		 -->
		<div class="header_long No1">
			<em class="header_u"></em>
			<span class="name">공<br />급<br />헤<br />더</span>
			<em class="header_d"></em>
		</div>
		<div class="header_long No2">
			<em class="header_u"></em>
			<span class="name">환<br />수<br />헤<br />더</span>
			<em class="header_d"></em>
		</div>
		
		<a href="javascript:openLayerPop('#layerPop_type28','E35501', 'coolwaterpump_select');" class="pumpchoice no4">선택</a>
		<a href="javascript:openLayerPop('#layerPop_type29','E35501', 'coolwaterpump_select');" class="pumpchoice no5">선택</a>
	</div>

	<div class="header_lamp">
<!-- 		<dl>
			<dt>보일러1</dt>
			<dd><span class="lamp on" id="E35501_boiler1_run_yn"></span><span id="E35501_boiler1_run_yn_text">정지중</span></dd>
		</dl>
		<dl>
			<dt>보일러2</dt>
			<dd><span class="lamp off" id="E35501_boiler2_run_yn"></span><span id="E35501_boiler2_run_yn_text">정지중</span></dd>
		</dl>
		<dl>
			<dt>보일러3</dt>
			<dd><span class="lamp off" id="E35501_boiler3_run_yn"></span><span id="E35501_boiler3_run_yn_text">정지중</span></dd>
		</dl> -->
		<dl>
			<dt>냉온수기</dt>
			<dd><a class="basicpump"><span class="fan off" id="E35501_cold_hot_fridge_run_yn"></span></a><!-- <span class="lamp off" id="E35501_cold_hot_fridge_run_yn"></span> --><span class="text" id="E35501_cold_hot_fridge_run_yn_text">정지</span></dd>
			<dt>냉온수기 출구</dt>
			<dd><span id="E35501_cold_hot_out_temp" class="outtemp"></span><span class="temp">℃</span></dd>
		</dl>
	</div>

</div>