package mes.common.modal.service;

import java.util.List;

/**
 * @Class Name : OperationService.java
 * @Description : Operation Business class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface OperationService {
	
	/**
	 * OPERATION을 등록한다.
	 * @param vo - 등록할 정보가 담긴 OperationVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertOperation(OperationVO vo) throws Exception;
    
    /**
	 * OPERATION을 수정한다.
	 * @param vo - 수정할 정보가 담긴 OperationVO
	 * @return void형
	 * @exception Exception
	 */
    void updateOperation(OperationVO vo) throws Exception;
    
    /**
	 * OPERATION을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 OperationVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteOperation(OperationVO vo) throws Exception;
    
    /**
	 * OPERATION을 조회한다.
	 * @param vo - 조회할 정보가 담긴 OperationVO
	 * @return 조회한 OPERATION
	 * @exception Exception
	 */
    OperationVO selectOperation(OperationVO vo) throws Exception;
    
    /**
	 * OPERATION 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return OPERATION 목록
	 * @exception Exception
	 */
    List selectOperationList(OperationVO searchVO) throws Exception;
    
    /**
	 * OPERATION 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return OPERATION 총 갯수
	 * @exception
	 */
    int selectOperationListTotCnt(OperationVO searchVO);
    
}
