package mes.prd.pln.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.prd.pln.service.GridData;
import mes.prd.pln.service.ProducePlanDDefaultVO;
import mes.prd.pln.service.ProducePlanDService;
import mes.prd.pln.service.ProducePlanDVO;
import mes.sal.out.service.ItemHistoryVO;
/**
 * @Class Name : ProducePlanDServiceImpl.java
 * @Description : ProducePlanD Business Implement class
 * @Modification Information
 *
 * @author Jeoung
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("producePlanDService")
public class ProducePlanDServiceImpl extends EgovAbstractServiceImpl implements
        ProducePlanDService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(ProducePlanDServiceImpl.class);

    @Resource(name="producePlanDMapper")
    private ProducePlanDMapper producePlanDDAO;
    
    //@Resource(name="producePlanDDAO")
    //private ProducePlanDDAO producePlanDDAO;
    
    /** ID Generation */
    //@Resource(name="{egovProducePlanDIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * PRODUCE_PLAN_D을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ProducePlanDVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertProducePlanD(ProducePlanDVO vo) throws Exception {
        producePlanDDAO.insertProducePlanD(vo);
    }

    /**
	 * PRODUCE_PLAN_D을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ProducePlanDVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateProducePlanD(ProducePlanDVO vo) throws Exception {
        producePlanDDAO.updateProducePlanD(vo);
    }

    /**
	 * PRODUCE_PLAN_D을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ProducePlanDVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteProducePlanD(ProducePlanDVO vo) throws Exception {
        producePlanDDAO.deleteProducePlanD(vo);
    }

    /**
	 * PRODUCE_PLAN_D을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ProducePlanDVO
	 * @return 조회한 PRODUCE_PLAN_D
	 * @exception Exception
	 */
    public ProducePlanDVO selectProducePlanD(ProducePlanDVO vo) throws Exception {
        ProducePlanDVO resultVO = producePlanDDAO.selectProducePlanD(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * PRODUCE_PLAN_D 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_PLAN_D 목록
	 * @exception Exception
	 */
    public List<?> selectProducePlanDList(ProducePlanDDefaultVO searchVO) throws Exception {
        return producePlanDDAO.selectProducePlanDList(searchVO);
    }

    // 생산계획 목록 조회
	public List<?> selectProducePlanList(ProducePlanDVO prdVO) throws Exception {
		return producePlanDDAO.selectProducePlanList(prdVO);
	}
    
	// 미생산계획 조회
	public List<?> selectUnProducePlanList(ProducePlanDVO prdVO) throws Exception {
		return producePlanDDAO.selectUnProducePlanList(prdVO);
	}
	
    /**
	 * PRODUCE_PLAN_D 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return PRODUCE_PLAN_D 총 갯수
	 * @exception
	 */
    public int selectProducePlanDListTotCnt(ProducePlanDDefaultVO searchVO) {
		return producePlanDDAO.selectProducePlanDListTotCnt(searchVO);
	}
    
    // 제품테이블 조회
	public List<?> selectItemList(ProducePlanDVO itmVO) throws Exception {
		return producePlanDDAO.selectItemList(itmVO);
	}

	public ProducePlanDVO selectItem(ProducePlanDVO itmVO) throws Exception {
		ProducePlanDVO resultVO = producePlanDDAO.selectItem(itmVO);
		if(resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	// cud 통합
	public void producePlanUpdate(GridData gridData) throws Exception {
		
		if(gridData.getUpdatedRows() != null && gridData.getUpdatedRows().size() != 0  || gridData.getProducePlanDVO() != null) {
        	ProducePlanDVO vo = new ProducePlanDVO();
        	vo.setPrdNum(gridData.getProducePlanDVO().getPrdNum());
        	vo.setPrdDate(gridData.getProducePlanDVO().getPrdDate());
			vo.setPrdName(gridData.getProducePlanDVO().getPrdName());
			vo.setPrdNote(gridData.getProducePlanDVO().getPrdNote());
			String unpStartDate = (gridData.getProducePlanDVO().getUnpStartDate());
			if(unpStartDate != null) {
				producePlanDDAO.insertProducePlanD(vo);
				String prdNum = vo.getPrdNum();
				for (int i = 0; i < gridData.getUpdatedRows().size(); i++) {
	        		vo = gridData.getUpdatedRows().get(i);
	        		vo.setPrdNum(prdNum);
	        		producePlanDDAO.insertProducePlanD(vo);
	        	}
			} else {
				producePlanDDAO.updateProducePlanD(vo);
				for(int i =0; i<gridData.getUpdatedRows().size(); i++) {
					vo = gridData.getUpdatedRows().get(i);
					producePlanDDAO.updateProducePlanD(vo);
				}
			}
        }
        
        if(gridData.getCreatedRows() != null && gridData.getCreatedRows().size() != 0) {
        	// 이미 있는 생산계획에 계획을 추가할 경우 prdNum을 뽑아냄
        	String prdNum = gridData.getProducePlanDVO().getPrdNum();
        	System.out.println(prdNum);
			if (prdNum == null) { // 생산계획이 없는 경우 마스터 insert 생산계획 생성됌
				ProducePlanDVO vo = new ProducePlanDVO();
				vo.setPrdDate(gridData.getProducePlanDVO().getPrdDate());
				vo.setPrdName(gridData.getProducePlanDVO().getPrdName());
				vo.setPrdNote(gridData.getProducePlanDVO().getPrdNote());
				producePlanDDAO.insertProducePlanD(vo);
				prdNum = vo.getPrdNum();
				
        	}
			for (int i = 0; i < gridData.getCreatedRows().size(); i++) {
        		ProducePlanDVO vo = gridData.getCreatedRows().get(i);
        		System.out.println(vo);
        		vo.setPrdNum(prdNum);
        		producePlanDDAO.insertProducePlanD(vo);
        	}
        }
        
        if(gridData.getDeletedRows() != null && gridData.getDeletedRows().size() != 0) {
        	for(int i =0; i<gridData.getDeletedRows().size(); i++) {
        		producePlanDDAO.deleteProducePlanD(gridData.getDeletedRows().get(i));
        	}
        }
    }
	
	//master삭제 detail도 함께 삭제
	public void producePlanDelete(ProducePlanDVO prdVO) throws Exception {
		producePlanDDAO.producePlanDelete(prdVO);
	}

	// 생산계획조회 페이지 뷰 리스트
	public List<?> producePlanList(ProducePlanDVO searchVO) throws Exception {
		return producePlanDDAO.producePlanList(searchVO);
	}


	
    
}
