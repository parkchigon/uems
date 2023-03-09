package com.flk.mng.equipment.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.equipment.domain.Chiller;

@Repository
public interface ChillerMapper {
	/**냉동기 리스트 조회
	 * @param chiller
	 * @return
	 */
	List<FlkMap> selectChillerList(Chiller chiller);
	
	/**냉동기타입 리스트 조회
	 * @param chiller
	 * @return
	 */
	List<FlkMap> selectChillerTypeList(Chiller chiller);
	
	/**냉동기 상세
	 * @param chiller
	 * @return
	 */
	FlkMap selectChillerInfo(Chiller chiller);
	
	/**냉동기 등록
	 * @param chiller
	 */
	void insertChillerInfo(Chiller chiller);
	
	/**냉동기 수정
	 * chiller
	 */
	void updateChillerInfo(Chiller chiller);
	
	/**냉동기 삭제 
	 * @param chiller
	 */
	void updateUseFlag(Chiller chiller);
	
	/**냉동기 번호 카운트 조회 
	 * @param chiller
	 */
	int selectChiilerNoExistCount(Chiller chiller);
}
