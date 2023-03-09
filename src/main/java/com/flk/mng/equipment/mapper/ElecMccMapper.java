package com.flk.mng.equipment.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.equipment.domain.ElecMcc;

@Repository
public interface ElecMccMapper {
	
	/**심야전기리스트 select
	 * @param elecMcc
	 * @return
	 */
	List<FlkMap> selectElecMccList(ElecMcc elecMcc);
	
	/**심야전기상세조회 select
	 * @param elecMcc
	 * @return
	 */
	FlkMap selectElecMccInfo(ElecMcc elecMcc);
    
	/**심야전기 정보 등록 insert
	 * @param elecMcc
	 */
	void insertElecMccInfo(ElecMcc elecMcc);
    
	/**심야전기정보수정 update
	 * @param elecMcc
	 */
    void updateElecMccInfo(ElecMcc elecMcc);
   
    /**심야전기정보삭제 
	 * @param elecMcc
	 */
    void updateUseFlag(ElecMcc elecMcc);
}
