package mes.prd.res.service;

import java.util.List;
import mes.prd.res.service.ProcessResultDefaultVO;
import mes.prd.res.service.ProcessResultVO;

/**
 * @Class Name : ProcessResultService.java
 * @Description : ProcessResult Business class
 * @Modification Information
 *
 * @author seongwon
 * @since 20210706
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface ProcessResultService {
	
	/**
	 * PROCESS_RESULT을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ProcessResultVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertProcessResult(ProcessResultVO vo) throws Exception;
    
    /**
	 * PROCESS_RESULT을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ProcessResultVO
	 * @return void형
	 * @exception Exception
	 */
    void updateProcessResult(ProcessResultVO vo) throws Exception;
    
    /**
	 * PROCESS_RESULT을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ProcessResultVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteProcessResult(ProcessResultVO vo) throws Exception;
    
    /**
	 * PROCESS_RESULT을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ProcessResultVO
	 * @return 조회한 PROCESS_RESULT
	 * @exception Exception
	 */
    ProcessResultVO selectProcessResult(ProcessResultVO vo) throws Exception;
    
    /**
	 * PROCESS_RESULT 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PROCESS_RESULT 목록
	 * @exception Exception
	 */
    List selectProcessResultList(ProcessResultVO searchVO) throws Exception;
    List processResultSelect(ProcessResultVO searchVO) throws Exception;
    List produceSelect(ProcessResultVO searchVO) throws Exception;
    List setProduceSelect(ProcessResultVO searchVO) throws Exception;
    void resultSuccess(GridDataVO gridDataVO) throws Exception;
    
    
    
    /**
	 * PROCESS_RESULT 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PROCESS_RESULT 총 갯수
	 * @exception
	 */
    int selectProcessResultListTotCnt(ProcessResultDefaultVO searchVO);
    
}
