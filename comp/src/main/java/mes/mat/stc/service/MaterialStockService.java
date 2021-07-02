package mes.mat.stc.service;

import java.util.List;
import mes.mat.stc.service.MaterialStockDefaultVO;
import mes.mat.stc.service.MaterialStockVO;

/**
 * @Class Name : MaterialStockService.java
 * @Description : MaterialStock Business class
 * @Modification Information
 *
 * @author materialStock
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface MaterialStockService {
	
	/**
	 * MATERIAL_STOCK을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MaterialStockVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertMaterialStock(MaterialStockVO vo) throws Exception;
    
    /**
	 * MATERIAL_STOCK을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MaterialStockVO
	 * @return void형
	 * @exception Exception
	 */
    void updateMaterialStock(MaterialStockVO vo) throws Exception;
    
    /**
	 * MATERIAL_STOCK을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MaterialStockVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteMaterialStock(MaterialStockVO vo) throws Exception;
    
    /**
	 * MATERIAL_STOCK을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MaterialStockVO
	 * @return 조회한 MATERIAL_STOCK
	 * @exception Exception
	 */
    MaterialStockVO selectMaterialStock(MaterialStockVO vo) throws Exception;
    
    /**
	 * MATERIAL_STOCK 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_STOCK 목록
	 * @exception Exception
	 */
    List selectMatStcList(MaterialStockVO searchVO) throws Exception; // 자재 재고 조회
    
    /**
	 * MATERIAL_STOCK 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return MATERIAL_STOCK 총 갯수
	 * @exception
	 */
    
    List selectMatLotStcList(MaterialStockVO searchVO) throws Exception; // 자재 LOT 재고 조회
    
    List selectMatCodeList(MaterialStockVO searchVO) throws Exception; // 자재 코드 조회
    
    List selectMatDivList(MaterialStockVO searchVO) throws Exception; // 자재 구분 리스트 불러오기
    
    int selectMaterialStockListTotCnt(MaterialStockDefaultVO searchVO);
    
}
