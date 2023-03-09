package com.flk.mng.equipment.mapper;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.equipment.domain.HeatExc;
import com.flk.mng.equipment.domain.HeatStg;


@Repository
public interface HeatStgMapper {
	
	/**축열조 및 배관 리스트 조회
	 * @param heatExc
	 * @return
	 */
	List<FlkMap> selectHeatStgList(HeatStg heatStg);

	/**축열조 및 배관 등록
	 * @param heatExc
	 * @return
	 */
	void insertHeatStgInfo(HeatStg heatStg);

	/**축열조 및 배관 삭제
	 * @param heatExc
	 * @return
	 */
	void updateUseFlag(HeatStg heatStg);

	/**축열조 및 배관 수정
	 * @param heatExc
	 * @return
	 */
	void updateHeatStgInfo(HeatStg heatStg);

	/**축열조 및 배관 상세정보
	 * @param heatExc
	 * @return
	 */
	FlkMap selectHeatStgInfo(HeatStg heatStg);
	
}
