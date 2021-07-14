package mes.mat.in.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import mes.mat.in.service.GridDataVO;
import mes.mat.in.service.MaterialHistoryDefaultVO;
import mes.mat.in.service.MaterialHistoryService;
import mes.mat.in.service.MaterialHistoryVO;

/**
 * @Class Name : MaterialHistoryServiceImpl.java
 * @Description : MaterialHistory Business Implement class
 * @Modification Information
 *
 * @author materialHistory
 * @since 2021-06-28
 * @version 1.0
 * @see
 * 
 *      Copyright (C) All right reserved.
 */

@Service("materialHistoryService")
public class MaterialHistoryServiceImpl extends EgovAbstractServiceImpl implements MaterialHistoryService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MaterialHistoryServiceImpl.class);

	@Resource(name = "materialHistoryMapper")
	private MaterialHistoryMapper materialHistoryDAO;

	// 자재 입고 조회
	public List<?> selectMatInList(MaterialHistoryVO searchVO) throws Exception {
		return materialHistoryDAO.selectMatInList(searchVO);
	}
	
	// 자재 입고 관리 조회
	public List<?> selectMatInMng(MaterialHistoryVO searchVO) throws Exception {
		return materialHistoryDAO.selectMatInMng(searchVO);
	}
	
	// 자재 출고 관리 조회
	public List<?> selectMatOutMng(MaterialHistoryVO searchVO) throws Exception {
		return materialHistoryDAO.selectMatOutMng(searchVO);
	}
	
	// 일 입고 리스트 조회
	public List<?> matInDayList(MaterialHistoryVO searchVO) throws Exception {
		return materialHistoryDAO.matInDayList(searchVO);
	}
	
	// 미입고 리스트 조회
		public List<?> nordList(MaterialHistoryVO searchVO) throws Exception {
			return materialHistoryDAO.nordList(searchVO);
		}
	
	// 일 출고 리스트 조회
	public List<?> matOutDayList(MaterialHistoryVO searchVO) throws Exception {
		return materialHistoryDAO.matOutDayList(searchVO);
	}

	// 자재 입고 관리 CRUD
	@Override
	public String matHisMngUpdate(GridDataVO gridDataVO) throws Exception {
		String newMatHisNum = null;
		if (gridDataVO.getMaterialHistoryVO().getMatHisNum() != null
				&& gridDataVO.getMaterialHistoryVO().getMatHisNum() != "") {
			materialHistoryDAO.updateMatInMng(gridDataVO.getMaterialHistoryVO());
		} else {
			String date = gridDataVO.getMaterialHistoryVO().getMatHisDate().replace("-", "");
			int a = materialHistoryDAO.getMatInMngCount(gridDataVO.getMaterialHistoryVO());
			System.out.println(a);
			String num = String.format("%03d", a);
			newMatHisNum = "MIN" + date + num;
			MaterialHistoryVO vo = gridDataVO.getMaterialHistoryVO();
			vo.setMatHisNum(newMatHisNum);
			materialHistoryDAO.insertMatInMng(vo);
			gridDataVO.setMaterialHistoryVO(vo);
		}
		if (gridDataVO.getUpdatedRows() != null) {
			for (int i = 0; i < gridDataVO.getUpdatedRows().size(); i++) {
				materialHistoryDAO.updateMatInMngD(gridDataVO.getUpdatedRows().get(i));
			}

		}
		if (gridDataVO.getCreatedRows() != null) {
			if (gridDataVO.getMaterialHistoryVO().getMatHisNum() != null
					&& gridDataVO.getMaterialHistoryVO().getMatHisNum() != "") {
				for (int i = 0; i < gridDataVO.getCreatedRows().size(); i++) {
					MaterialHistoryVO vo = gridDataVO.getCreatedRows().get(i);
					vo.setMatHisNum(gridDataVO.getMaterialHistoryVO().getMatHisNum());
					materialHistoryDAO.insertMatInMngD(vo);
				}
			} else {
				MaterialHistoryVO vo = null;
			}
		}
		if (gridDataVO.getDeletedRows() != null) {
			for (int i = 0; i < gridDataVO.getDeletedRows().size(); i++) {
				materialHistoryDAO.deleteMatInMngD(gridDataVO.getDeletedRows().get(i));
			}
//			int r = gridDataVO.getDeletedRows().size();
//			materialHistoryDAO.updateMatHisVol(gridDataVO.getMaterialHistoryVO().setActiveVol(r));
		}
		return newMatHisNum;
	}
	// end 자재 입고 관리 CRUD

	// 자재 입고 관리 DETAIL 등록
	@Override
	public String insertMatInMngD(MaterialHistoryVO vo) throws Exception {
		materialHistoryDAO.insertMatInMngD(vo);
		return null;
	}
	
	// 자재 입고 관리 DETAIL 수정
	@Override
	public void updateMatInMngD(MaterialHistoryVO vo) throws Exception {
		materialHistoryDAO.updateMatInMngD(vo);
	}

	// 자재 입고 관리 DETAIL 삭제
	@Override
	public void deleteMatInMngD(MaterialHistoryVO vo) throws Exception {
		materialHistoryDAO.deleteMatInMngD(vo);
	}
	
	public MaterialHistoryVO selectMaterialHistory(MaterialHistoryVO vo) throws Exception {
		MaterialHistoryVO resultVO = materialHistoryDAO.selectMaterialHistory(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}
	public int selectMaterialHistoryListTotCnt(MaterialHistoryDefaultVO searchVO) {
		return materialHistoryDAO.selectMaterialHistoryListTotCnt(searchVO);
	}
}
