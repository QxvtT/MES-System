package mes.mat.in.service;

import java.util.List;

import mes.prd.pln.service.ProducePlanDVO;

/**
 * @Class Name : MaterialHistoryService.java
 * @Description : MaterialHistory Business class
 * @Modification Information
 *
 * @author materialHistory
 * @since 2021-06-28
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface MaterialHistoryService {
	
    MaterialHistoryVO selectMaterialHistory(MaterialHistoryVO vo) throws Exception;

    List selectMatInList(MaterialHistoryVO searchVO) throws Exception; // 자재 입고 조회
    
    List selectMatInMng(MaterialHistoryVO searchVO) throws Exception; // 자재 입고 관리 조회
    List selectMatOutMng(MaterialHistoryVO searchVO) throws Exception; // 자재 출고 관리 조회
    
    List matInDayList(MaterialHistoryVO searchVO) throws Exception; // 일 입고 자료 리스트
    List matOutDayList(MaterialHistoryVO searchVO) throws Exception; // 일 출고 자료 리스트
    
    List nordList(MaterialHistoryVO searchVO) throws Exception; // 미입고 자료 리스트 조회
    List nordListModal(MaterialHistoryVO searchVO) throws Exception; // 미입고 발주 리스트 모달 조회
    MaterialHistoryVO selectComNumm(MaterialHistoryVO nordVO) throws Exception; // 발주 번호 선택
    
    List selectMaterialList(MaterialHistoryVO searchVO) throws Exception; // 자재 코드 리스트 조회
    MaterialHistoryVO selectMatCodee(MaterialHistoryVO nordVO) throws Exception; // 자재 코드 선택
    
    String matHisMngUpdate(GridDataVO gridData) throws Exception;	// 자재 입고 관리 crud
    String insertMatInMngD(MaterialHistoryVO vo) throws Exception; // 자재 입고 관리 등록
    public void updateMatInMngD(MaterialHistoryVO vo) throws Exception; // 자재 입고 관리 그리드 행 수정
    public void deleteMatInMngD(MaterialHistoryVO vo) throws Exception; // 자재 입고 관리 행 삭제
    
    public void addMatHisVol(MaterialHistoryVO vo) throws Exception; // 건수 추가
    public void deleteMatHisVol(MaterialHistoryVO vo) throws Exception; // 건수 삭제
    
}
