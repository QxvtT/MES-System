package mes.prd.res.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.prd.res.service.GridDataVO;
import mes.prd.res.service.ProcessResultDefaultVO;
import mes.prd.res.service.ProcessResultVO;

/**
 * @Class Name : ProcessResultMapper.java
 * @Description : ProcessResult Mapper Class
 * @Modification Information
 *
 * @author seongwon
 * @since 20210706
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Mapper("processResultMapper")
public interface ProcessResultMapper {

	/**
	 * PROCESS_RESULT을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ProcessResultVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertProcessResult(ProcessResultVO vo) throws Exception;

    /**
	 * PROCESS_RESULT을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ProcessResultVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateProcessResult(ProcessResultVO vo) throws Exception;
    
    public void resultSuccess(ProcessResultVO vo) throws Exception;

    /**
	 * PROCESS_RESULT을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ProcessResultVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteProcessResult(ProcessResultVO vo) throws Exception;
    public void updatePrcEnd (ProcessResultVO vo) throws Exception;
    public void updatePrcStr (ProcessResultVO vo) throws Exception;
    
    /**
	 * PROCESS_RESULT을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ProcessResultVO
	 * @return 조회한 PROCESS_RESULT
	 * @exception Exception
	 */
    public ProcessResultVO selectProcessResult(ProcessResultVO vo) throws Exception;

    /**
	 * PROCESS_RESULT 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return PROCESS_RESULT 목록
	 * @exception Exception
	 */
    public List<?> selectProcessResultList(ProcessResultDefaultVO searchVO) throws Exception;
    public List<?> processResultSelect(ProcessResultDefaultVO searchVO) throws Exception;
    public List<?> produceSelect(ProcessResultVO searchVO) throws Exception;
    public List<?> setProduceSelect(ProcessResultVO searchVO) throws Exception;
    public List<?> setProduceSelect2(ProcessResultVO searchVO) throws Exception;
    
   
    
    
    
    /**
	 * PROCESS_RESULT 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return PROCESS_RESULT 총 갯수
	 * @exception
	 */
    public int selectProcessResultListTotCnt(ProcessResultDefaultVO searchVO);

}
