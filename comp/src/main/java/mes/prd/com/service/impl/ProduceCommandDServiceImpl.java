package mes.prd.com.service.impl;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.prd.com.service.GridDataVO;
import mes.prd.com.service.ProduceCommandDDefaultVO;
import mes.prd.com.service.ProduceCommandDService;
import mes.prd.com.service.ProduceCommandDVO;
import mes.sal.out.service.ItemHistoryVO;
/**
 * @Class Name : ProduceCommandDServiceImpl.java
 * @Description : ProduceCommandD Business Implement class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210625
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("produceCommandDService")
public class ProduceCommandDServiceImpl extends EgovAbstractServiceImpl implements
        ProduceCommandDService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(ProduceCommandDServiceImpl.class);

    @Resource(name="produceCommandDMapper")
    private ProduceCommandDMapper produceCommandDDAO;
    
    //@Resource(name="produceCommandDDAO")
    //private ProduceCommandDDAO produceCommandDDAO;
    
    /** ID Generation */
    //@Resource(name="{egovProduceCommandDIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * PRODUCE_COMMAND_D을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ProduceCommandDVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertProduceCommandD(ProduceCommandDVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	produceCommandDDAO.insertProduceCommandD(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * PRODUCE_COMMAND_D을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ProduceCommandDVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateProduceCommandD(ProduceCommandDVO vo) throws Exception {
        produceCommandDDAO.updateProduceCommandD(vo);
    }

    /**
	 * PRODUCE_COMMAND_D을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ProduceCommandDVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteProduceCommandD(ProduceCommandDVO vo) throws Exception {
        produceCommandDDAO.deleteProduceCommandD(vo);
    }

    /**
	 * PRODUCE_COMMAND_D을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ProduceCommandDVO
	 * @return 조회한 PRODUCE_COMMAND_D
	 * @exception Exception
	 */
    public ProduceCommandDVO selectProduceCommandD(ProduceCommandDVO vo) throws Exception {
        ProduceCommandDVO resultVO = produceCommandDDAO.selectProduceCommandD(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * PRODUCE_COMMAND 목록을 조회한다. 조회할 작업지시 선택용
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_COMMAND_D 목록
	 * @exception Exception
	 */
    /** 작업지시 조회 */
    public List<?> selectProduceCommandList(ProduceCommandDVO searchVO) throws Exception {
        return produceCommandDDAO.selectProduceCommandList(searchVO);
    }
    
    /** 작업지시디테일 조회 */
    public List<?> selectProduceCommandDList(ProduceCommandDVO searchVO) throws Exception {
        return produceCommandDDAO.selectProduceCommandDList(searchVO);
    }
    
    /** 작업지시자재 조회 */
    public List<?> selectProduceCommandMatList(ProduceCommandDVO searchVO) throws Exception {
    	return produceCommandDDAO.selectProduceCommandMatList(searchVO);
    }
    
    /** 모달 lotno자재 조회 */
    public List<?> seletMatStockList(ProduceCommandDVO searchVO) throws Exception {
    	return produceCommandDDAO.seletMatStockList(searchVO);
    }
    
    /** 작업지시공정흐름 조회 */
    public List<?> selectProduceCommandFlowList(ProduceCommandDVO searchVO) throws Exception {
    	return produceCommandDDAO.selectProduceCommandFlowList(searchVO);
    }
    
    /** 작업지시 update 및 insert*/
    public String produceCommandUpdate(GridDataVO gridData) throws Exception {
    	String newPrdComNum = null;
    	if(gridData.getProduceCommandDVO().getPrdComNum() != null && gridData.getProduceCommandDVO().getPrdComNum() != "") {
    		produceCommandDDAO.updateProduceCommand(gridData.getProduceCommandDVO());
    	} else {
    		String date = gridData.getProduceCommandDVO().getPrdComDate().replace("-", "");      
    		int a = produceCommandDDAO.getPrdComCount(gridData.getProduceCommandDVO());
    		System.out.println(a);
    		String num = String.format("%03d", a);
    		newPrdComNum = "PC"+date+num;
    		ProduceCommandDVO vo = gridData.getProduceCommandDVO();
    		vo.setPrdComNum(newPrdComNum);
    		produceCommandDDAO.insertProduceCommand(vo);
    		gridData.setProduceCommandDVO(vo);
    	}
    	
    	if(gridData.getDeletedRows() != null) {
        	for(int i =0; i<gridData.getDeletedRows().size(); i++) {
        		produceCommandDDAO.deleteProduceCommandD(gridData.getDeletedRows().get(i));
        	}
        }
        if(gridData.getUpdatedRows() != null) {
        	for(int i =0; i<gridData.getUpdatedRows().size(); i++) {
        		produceCommandDDAO.updateProduceCommandD(gridData.getUpdatedRows().get(i));
        	}
        }
        if(gridData.getCreatedRows() != null) {
        	if(gridData.getProduceCommandDVO().getPrdComNum()!=null && gridData.getProduceCommandDVO().getPrdComNum()!="") {
        		
        		for(int i =0; i<gridData.getCreatedRows().size(); i++) {
        			ProduceCommandDVO vo= gridData.getCreatedRows().get(i);
        			vo.setPrdComNum(gridData.getProduceCommandDVO().getPrdComNum());
            		produceCommandDDAO.insertProduceCommandD(vo);
            	}
        	} else {
        		ProduceCommandDVO vo= null;
        	}
        	
        }
        
        
        return newPrdComNum;
    }
    
    /** 작업지시 Mat update 및 insert*/
    public void produceCommandMatUpdate(GridDataVO gridData) throws Exception {
    	
    	ProduceCommandDVO vo;
    	if(gridData.getDeletedRows() != null) {
        	for(int i =0; i<gridData.getDeletedRows().size(); i++) {
        		produceCommandDDAO.deleteProduceCommandMat(gridData.getDeletedRows().get(i));
        	}
        }
        if(gridData.getUpdatedRows() != null) {
        	for(int i =0; i<gridData.getUpdatedRows().size(); i++) {
        		vo = gridData.getUpdatedRows().get(i);
        		produceCommandDDAO.updateProduceCommandMat(vo);
        	}
        }
        if(gridData.getCreatedRows() != null) {
    		for(int i =0; i<gridData.getCreatedRows().size(); i++) {
    			vo = gridData.getCreatedRows().get(i);
    			BigDecimal prdComDNum = gridData.getProduceCommandDVO().getPrdComDNum();
    	    	String matCode = gridData.getProduceCommandDVO().getMatCode();
        		vo.setPrdComDNum(prdComDNum);
        		vo.setMatCode(matCode);
        		produceCommandDDAO.insertProduceCommandMat(vo);
        	}
        }
    }
    
    /** 작업지시자재 출고 작업*/
    public void matOutUpdate(GridDataVO gridData) throws Exception {
    	
    	if(gridData.getMatRows() != null && gridData.getMatRows().size() != 0) {
	    	//입출반관리 마스터 생성
	    	String pattern = "yyyyMMdd";
	    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	    	String date = simpleDateFormat.format(new Date());
			String newMatHisNum = produceCommandDDAO.getNewMatHisNum(date);
			System.out.println(newMatHisNum);
			ProduceCommandDVO vo = gridData.getProduceCommandDVO();
			vo.setMatHisNum(newMatHisNum);
			vo.setMatHisDate(date);
			produceCommandDDAO.insertMatHis(vo);
			gridData.setProduceCommandDVO(vo);
			
			//공정흐름관리 마스터 생성(이동번호 생성방식 내일 바꿔야함)
    		int b = produceCommandDDAO.getPrcResCount();
    		System.out.println(b);
    		String num = String.format("%03d", b);
    		String newMovNum = "M"+num;
    		vo.setMovNum(newMovNum);
    		
			
			//입출반관리 디테일 생성 및 현재고 수정 및 공정실적 마스터 생성
			for(int i =0; i<gridData.getMatRows().size(); i++) {
				vo = gridData.getMatRows().get(i);
				vo.setMatHisNum(newMatHisNum);
				vo.setItmCode(gridData.getProduceCommandDVO().getItmCode());
				produceCommandDDAO.insertMatHisD(vo);
				produceCommandDDAO.updatetMatStc(vo);
				produceCommandDDAO.insertPrcRes(vo);
				for(int j =0; i<gridData.getFlowRows().size(); j++) {
					vo = gridData.getFlowRows().get(j);
					vo.setMovNum(newMovNum);
					if(j == 0) {
						produceCommandDDAO.insertPrcResDF(vo);
					} else {
						produceCommandDDAO.insertPrcResD(vo);
					}
				}
				
			}
			
			
			
    	}
    	
    }
    /**
	 * PRODUCE_COMMAND_D 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_COMMAND_D 총 갯수
	 * @exception
	 */
    public int selectProduceCommandDListTotCnt(ProduceCommandDDefaultVO searchVO) {
		return produceCommandDDAO.selectProduceCommandDListTotCnt(searchVO);
	}
    
}
