package com.flk.mng.equipment.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.common.dataaccess.util.FlkMap;
import com.flk.mng.equipment.domain.AutoCtrl;

@Repository
public interface AutoCtrlMapper {
	
	/**자동제어 리스트 조회
	 * @param autoCtrl
	 * @return
	 */
	List<FlkMap> selectAutoCtrlList(AutoCtrl autoCtrl);
	
	/**자동제어 상세
	 * @param autoCtrl
	 * @return
	 */
	FlkMap selectAutoCtrlInfo(AutoCtrl autoCtrl);
	
	/**자동제어 등록
	 * @param autoCtrl
	 */
	void insertAutoCtrlInfo(AutoCtrl autoCtrl);
	
	/**자동제어 수정
	 * @param autoCtrl
	 */
	void updateAutoCtrlInfo(AutoCtrl autoCtrl);
	
	/**자동제어 삭제 
	 * @param autoCtrl
	 */
	void updateUseFlag(AutoCtrl autoCtrl);

}
