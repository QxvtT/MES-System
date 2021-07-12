package mes.prd.com.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.prd.com.service.ProduceCommandDDefaultVO;
import mes.prd.com.service.ProduceCommandDVO;

/**
 * @Class Name : ProduceCommandDMapper.java
 * @Description : ProduceCommandD Mapper Class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210625
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Mapper("produceCommandDMapper")
public interface ProduceCommandDMapper {

	/**
	 * PRODUCE_COMMAND_D을 등록한다.
	 * @param vo - 등록할 정보가 담긴 ProduceCommandDVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertProduceCommand(ProduceCommandDVO vo) throws Exception;
    public void insertProduceCommandD(ProduceCommandDVO vo) throws Exception;
    public void insertProduceCommandMat(ProduceCommandDVO vo) throws Exception;
    
    public void insertMatHis(ProduceCommandDVO vo) throws Exception;
    public void insertMatHisD(ProduceCommandDVO vo) throws Exception;
    public void insertPrcRes(ProduceCommandDVO vo) throws Exception;
    public void insertPrcResDF(ProduceCommandDVO vo) throws Exception;
    public void insertPrcResD(ProduceCommandDVO vo) throws Exception;

    /**
	 * PRODUCE_COMMAND_D을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ProduceCommandDVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateProduceCommand(ProduceCommandDVO vo) throws Exception;
    public void updateProduceCommandD(ProduceCommandDVO vo) throws Exception;
    public void updateProduceCommandMat(ProduceCommandDVO vo) throws Exception;
    
    public void updatetMatStc(ProduceCommandDVO vo) throws Exception;
    public void updatePrdComDY(ProduceCommandDVO vo) throws Exception;

    /**
	 * PRODUCE_COMMAND_D을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 ProduceCommandDVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteProduceCommandD(ProduceCommandDVO vo) throws Exception;
    public void deleteProduceCommandMat(ProduceCommandDVO vo) throws Exception;

    /**
	 * PRODUCE_COMMAND_D을 조회한다.
	 * @param vo - 조회할 정보가 담긴 ProduceCommandDVO
	 * @return 조회한 PRODUCE_COMMAND_D
	 * @exception Exception
	 */
    public ProduceCommandDVO selectProduceCommandD(ProduceCommandDVO vo) throws Exception;

    /**
	 * PRODUCE_COMMAND 목록을 조회한다. 조회할 작업지시 선택용
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return PRODUCE_COMMAND_D 목록
	 * @exception Exception
	 */
    /** 작업지시 조회 */
    public List<?> selectProduceCommandList(ProduceCommandDVO searchVO) throws Exception;

    /** 작업지시디테일 조회 */
	public List<?> selectProduceCommandDList(ProduceCommandDVO searchVO) throws Exception;
	
	/** 작업지시자재 조회 */
	public List<?> selectProduceCommandMatList(ProduceCommandDVO searchVO) throws Exception;
	
	/** 모달 lotno자재 조회 */
	public List<?> seletMatStockList(ProduceCommandDVO searchVO) throws Exception;
	
	/** 작업지시공정흐름 조회 */
	public List<?> selectProduceCommandFlowList(ProduceCommandDVO searchVO) throws Exception;
	
	/** 지시번호 count */
	public int getPrdComCount(ProduceCommandDVO searchVO) throws Exception;
	
	/** 입출반관리 번호 생성 */
	public String getNewMatHisNum(String date) throws Exception;
	
	/** 공정실적 이동번호 count */
	public int getPrcResCount() throws Exception;
	
    /**
	 * PRODUCE_COMMAND_D 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return PRODUCE_COMMAND_D 총 갯수
	 * @exception
	 */
    public int selectProduceCommandDListTotCnt(ProduceCommandDDefaultVO searchVO);
    
    /** 생산지시조회 count */
	public List<?> produceCommandList(ProduceCommandDVO searchVO);

}
