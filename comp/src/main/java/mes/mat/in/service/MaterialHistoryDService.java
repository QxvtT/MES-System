package mes.mat.in.service;

import java.util.List;

/**
 * @Class Name : MaterialHistoryDService.java
 * @Description : MaterialHistoryD Business class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210625
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface MaterialHistoryDService {
	
	/**
	 * MATERIAL_HISTORY_D을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MaterialHistoryDVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertMaterialHistoryD(MaterialHistoryDVO vo) throws Exception;
    
    /**
	 * MATERIAL_HISTORY_D을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MaterialHistoryDVO
	 * @return void형
	 * @exception Exception
	 */
    void updateMaterialHistoryD(MaterialHistoryDVO vo) throws Exception;
    
    /**
	 * MATERIAL_HISTORY_D을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialHistoryDVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteMaterialHistoryD(MaterialHistoryDVO vo) throws Exception;
    
    /**
	 * MATERIAL_HISTORY_D을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MaterialHistoryDVO
	 * @return 조회한 MATERIAL_HISTORY_D
	 * @exception Exception
	 */
    MaterialHistoryDVO selectMaterialHistoryD(MaterialHistoryDVO vo) throws Exception;
    
    /**
	 * MATERIAL_HISTORY_D 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_HISTORY_D 목록
	 * @exception Exception
	 */
    List selectMaterialHistoryDList(MaterialHistoryDDefaultVO searchVO) throws Exception;
    
    /**
	 * MATERIAL_HISTORY_D 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_HISTORY_D 총 갯수
	 * @exception
	 */
    int selectMaterialHistoryDListTotCnt(MaterialHistoryDDefaultVO searchVO);
    
}
