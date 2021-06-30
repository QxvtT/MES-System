package mes.common.modal.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import mes.common.modal.service.ItemVO;
import mes.common.modal.service.MachineVO;
import mes.common.modal.service.MaterialVO;
import mes.common.modal.service.OperationDefaultVO;
import mes.common.modal.service.OperationVO;
import mes.common.modal.service.ProcessVO;

/**
 * @Class Name : OperationMapper.java
 * @Description : Operation Mapper Class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-06-29
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Mapper("operationMapper")
public interface OperationMapper {

	/**
	 * OPERATION을 등록한다.
	 * @param vo - 등록할 정보가 담긴 OperationVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertOperation(OperationVO vo) throws Exception;

    /**
	 * OPERATION을 수정한다.
	 * @param vo - 수정할 정보가 담긴 OperationVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateOperation(OperationVO vo) throws Exception;

    /**
	 * OPERATION을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 OperationVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteOperation(OperationVO vo) throws Exception;

    /**
	 * OPERATION을 조회한다.
	 * @param vo - 조회할 정보가 담긴 OperationVO
	 * @return 조회한 OPERATION
	 * @exception Exception
	 */
    public OperationVO selectOperation(OperationVO vo) throws Exception;

    /**
	 * OPERATION 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return OPERATION 목록
	 * @exception Exception
	 */
    public List<?> selectOperationList(OperationDefaultVO searchVO) throws Exception;

    /**
	 * OPERATION 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return OPERATION 총 갯수
	 * @exception
	 */
    public int selectOperationListTotCnt(OperationDefaultVO searchVO);
    
    //
    public ItemVO selectItem(ItemVO vo) throws Exception;

    /**
	 * OPERATION 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return OPERATION 목록
	 * @exception Exception
	 */
    public List<?> selectItemList(ItemVO searchVO) throws Exception;

    /**
	 * OPERATION 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return OPERATION 총 갯수
	 * @exception
	 */
    
    //
    public ProcessVO selectProcess(ProcessVO vo) throws Exception;

    /**
	 * OPERATION 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return OPERATION 목록
	 * @exception Exception
	 */
    public List<?> selectProcessList(ProcessVO searchVO) throws Exception;

    /**
	 * OPERATION 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return OPERATION 총 갯수
	 * @exception
	 */
    
    //
    public MaterialVO selectMaterial(MaterialVO vo) throws Exception;

    /**
	 * OPERATION 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return OPERATION 목록
	 * @exception Exception
	 */
    public List<?> selectMaterialList(MaterialVO searchVO) throws Exception;

    //
    public MachineVO selectMachine(MachineVO vo) throws Exception;

    /**
	 * OPERATION 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return OPERATION 목록
	 * @exception Exception
	 */
    public List<?> selectMachineList(MachineVO searchVO) throws Exception;
   
    

}
