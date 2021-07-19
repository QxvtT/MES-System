package mes.prd.res.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.prd.res.service.GridDataVO;
import mes.prd.res.service.ProcessResultDefaultVO;
import mes.prd.res.service.ProcessResultService;
import mes.prd.res.service.ProcessResultVO;
import mes.sal.out.service.ItemHistoryVO;
/**
 * @Class Name : ProcessResultServiceImpl.java
 * @Description : ProcessResult Business Implement class
 * @Modification Information
 *
 * @author seongwon
 * @since 20210706
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("processResultService")
public class ProcessResultServiceImpl extends EgovAbstractServiceImpl implements
        ProcessResultService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(ProcessResultServiceImpl.class);

    @Resource(name="processResultMapper")
    private ProcessResultMapper processResultDAO;
    
    //@Resource(name="processResultDAO")
    //private ProcessResultDAO processResultDAO;
    
    /** ID Generation */
    //@Resource(name="{egovProcessResultIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * PROCESS_RESULT을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ProcessResultVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertProcessResult(ProcessResultVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	processResultDAO.insertProcessResult(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * PROCESS_RESULT을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ProcessResultVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateProcessResult(ProcessResultVO vo) throws Exception {
        processResultDAO.updateProcessResult(vo);
    }

    /**
	 * PROCESS_RESULT을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ProcessResultVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteProcessResult(ProcessResultVO vo) throws Exception {
        processResultDAO.deleteProcessResult(vo);
    }
    public void updatePrcEnd(ProcessResultVO vo) throws Exception {
    	System.out.println(vo.getPrcEndTime());
        processResultDAO.updatePrcEnd(vo);
    }
    public void updatePrcStr(ProcessResultVO vo) throws Exception {
        processResultDAO.updatePrcStr(vo);
    }
    public void dataReset(ProcessResultVO vo) throws Exception {
        processResultDAO.dataReset(vo);
    }
    
    
    /**
	 * PROCESS_RESULT을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ProcessResultVO
	 * @return 조회한 PROCESS_RESULT
	 * @exception Exception
	 */
    public ProcessResultVO selectProcessResult(ProcessResultVO vo) throws Exception {
        ProcessResultVO resultVO = processResultDAO.selectProcessResult(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * PROCESS_RESULT 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PROCESS_RESULT 목록
	 * @exception Exception
	 */
    public List<?> selectProcessResultList(ProcessResultVO searchVO) throws Exception {
        return processResultDAO.selectProcessResultList(searchVO);
    }
    
    public List<?> processResultSelect(ProcessResultVO searchVO) throws Exception {
        return processResultDAO.processResultSelect(searchVO);
    }
    public List<?> produceSelect(ProcessResultVO searchVO) throws Exception {
        return processResultDAO.produceSelect(searchVO);
    }
    
    public List<?> ProcessListR(ProcessResultVO searchVO) throws Exception {
        return processResultDAO.ProcessListR(searchVO);
    }
    public List<?> processSelectMovNum(ProcessResultVO searchVO) throws Exception {
        return processResultDAO.processSelectMovNum(searchVO);
    }
    
     
    
    public List<?> setProduceSelect(ProcessResultVO searchVO) throws Exception {
    	List list = processResultDAO.setProduceSelect(searchVO);
    	if(list.size() <1) {
    		list = processResultDAO.setProduceSelect2(searchVO);
    	}
        return list;
    }
    public void resultSuccess(GridDataVO gridDataVO) throws Exception {
    	System.out.println(gridDataVO.getProcessResultVO().getMacCode());
    	 if(gridDataVO.getUpdatedRows() != null) {
    		 if(gridDataVO.getUpdatedRows().get(0).getPrcState().equals("진행")) {
	    			 ProcessResultVO vo= gridDataVO.getUpdatedRows().get(0);
	    			 vo.setEmpId(gridDataVO.getProcessResultVO().getEmpId());
	    			 vo.setMacCode(gridDataVO.getProcessResultVO().getMacCode());
	    			 vo.setPrcWorkNum(gridDataVO.getProcessResultVO().getPrcWorkNum());
	    			 processResultDAO.resultSuccess(gridDataVO.getUpdatedRows().get(0));
	    		 }
    			 
    	 }
    	
    }
    
 
    
    
    /**
	 * PROCESS_RESULT 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PROCESS_RESULT 총 갯수
	 * @exception
	 */
    public int selectProcessResultListTotCnt(ProcessResultDefaultVO searchVO) {
		return processResultDAO.selectProcessResultListTotCnt(searchVO);
	}

	

    
}
