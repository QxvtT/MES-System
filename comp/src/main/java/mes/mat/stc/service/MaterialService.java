package mes.mat.stc.service;

import java.util.List;
import mes.mat.stc.service.MaterialDefaultVO;
import mes.mat.stc.service.MaterialVO;

/**
 * @Class Name : MaterialService.java
 * @Description : Material Business class
 * @Modification Information
 *
 * @author material
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface MaterialService {
	
	/**
	 * material을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MaterialVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertMaterial(MaterialVO vo) throws Exception;
    
    /**
	 * material을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MaterialVO
	 * @return void형
	 * @exception Exception
	 */
    void updateMaterial(MaterialVO vo) throws Exception;
    
    /**
	 * material을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteMaterial(MaterialVO vo) throws Exception;
    
    /**
	 * material을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MaterialVO
	 * @return 조회한 material
	 * @exception Exception
	 */
    MaterialVO selectMaterial(MaterialVO vo) throws Exception;
    
    /**
	 * material 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return material 목록
	 * @exception Exception
	 */
    List selectMaterialList(MaterialDefaultVO searchVO) throws Exception;
    
    /**
	 * material 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return material 총 갯수
	 * @exception
	 */
    int selectMaterialListTotCnt(MaterialDefaultVO searchVO);
    
}
