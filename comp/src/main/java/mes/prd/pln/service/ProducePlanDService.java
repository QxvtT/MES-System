package mes.prd.pln.service;

import java.util.List;

/**
 * @Class Name : ProducePlanDService.java
 * @Description : ProducePlanD Business class
 * @Modification Information
 *
 * @author Jeoung
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface ProducePlanDService {
	
	/**
	 * PRODUCE_PLAN_D을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ProducePlanDVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    void insertProducePlanD(ProducePlanDVO vo) throws Exception;
    
    /**
	 * PRODUCE_PLAN_D을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ProducePlanDVO
	 * @return void형
	 * @exception Exception
	 */
    void updateProducePlanD(ProducePlanDVO vo) throws Exception;
    
    /**
	 * PRODUCE_PLAN_D을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ProducePlanDVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteProducePlanD(ProducePlanDVO vo) throws Exception;
    
    /**
	 * PRODUCE_PLAN_D을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ProducePlanDVO
	 * @return 조회한 PRODUCE_PLAN_D
	 * @exception Exception
	 */
    ProducePlanDVO selectProducePlanD(ProducePlanDVO vo) throws Exception;
    
    /**
	 * PRODUCE_PLAN_D 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_PLAN_D 목록
	 * @exception Exception
	 */
    List selectProducePlanDList(ProducePlanDDefaultVO searchVO) throws Exception;
    
    /**
	 * PRODUCE_PLAN_D 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_PLAN_D 총 갯수
	 * @exception
	 */
    int selectProducePlanDListTotCnt(ProducePlanDDefaultVO searchVO);

	List<?> selectProducePlanList(ProducePlanDVO prdVO) throws Exception;
	
	List<?> selectItemList(ProducePlanDVO itmVO) throws Exception;

	ProducePlanDVO selectItem(ProducePlanDVO itmVO) throws Exception;

	void producePlanUpdate(GridData gridData) throws Exception;

	void producePlanDelete(ProducePlanDVO prdVO) throws Exception;

	List<?> producePlanList(ProducePlanDVO searchVO) throws Exception;
    
}
