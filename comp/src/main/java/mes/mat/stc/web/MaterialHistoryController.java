package mes.mat.stc.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import mes.mat.stc.service.MaterialHistoryService;
import mes.mat.stc.service.MaterialHistoryDefaultVO;
import mes.mat.stc.service.MaterialHistoryVO;

/**
 * @Class Name : MaterialHistoryController.java
 * @Description : MaterialHistory Controller class
 * @Modification Information
 *
 * @author materialHistory
 * @since 2021-06-28
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@SessionAttributes(types=MaterialHistoryVO.class)
public class MaterialHistoryController {

    @Resource(name = "materialHistoryService")
    private MaterialHistoryService materialHistoryService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * MATERIAL_HISTORY 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MaterialHistoryDefaultVO
	 * @return "/materialHistory/MaterialHistoryList"
	 * @exception Exception
	 */
/*    
    @RequestMapping(value="/materialHistory/MaterialHistoryList.do")
    public String selectMaterialHistoryList(@ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
    	/** EgovPropertyService.sample 
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing 
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<?> materialHistoryList = materialHistoryService.selectMaterialHistoryList(searchVO);
        model.addAttribute("resultList", materialHistoryList);
        
        int totCnt = materialHistoryService.selectMaterialHistoryListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/materialHistory/MaterialHistoryList";
    } */
    
    @RequestMapping("/materialHistory/addMaterialHistoryView.do")
    public String addMaterialHistoryView(
            @ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("materialHistoryVO", new MaterialHistoryVO());
        return "/materialHistory/MaterialHistoryRegister";
    }
    
    @RequestMapping("/materialHistory/addMaterialHistory.do")
    public String addMaterialHistory(
            MaterialHistoryVO materialHistoryVO,
            @ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialHistoryService.insertMaterialHistory(materialHistoryVO);
        status.setComplete();
        return "forward:/materialHistory/MaterialHistoryList.do";
    }
    
    @RequestMapping("/materialHistory/updateMaterialHistoryView.do")
    public String updateMaterialHistoryView(
            @RequestParam("matHisNum") java.math.BigDecimal matHisNum ,
            @ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO, Model model)
            throws Exception {
        MaterialHistoryVO materialHistoryVO = new MaterialHistoryVO();
        materialHistoryVO.setMatHisNum(matHisNum);
        // 변수명은 CoC 에 따라 materialHistoryVO
        model.addAttribute(selectMaterialHistory(materialHistoryVO, searchVO));
        return "/materialHistory/MaterialHistoryRegister";
    }

    @RequestMapping("/materialHistory/selectMaterialHistory.do")
    public @ModelAttribute("materialHistoryVO")
    MaterialHistoryVO selectMaterialHistory(
            MaterialHistoryVO materialHistoryVO,
            @ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO) throws Exception {
        return materialHistoryService.selectMaterialHistory(materialHistoryVO);
    }

    @RequestMapping("/materialHistory/updateMaterialHistory.do")
    public String updateMaterialHistory(
            MaterialHistoryVO materialHistoryVO,
            @ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialHistoryService.updateMaterialHistory(materialHistoryVO);
        status.setComplete();
        return "forward:/materialHistory/MaterialHistoryList.do";
    }
    
    @RequestMapping("/materialHistory/deleteMaterialHistory.do")
    public String deleteMaterialHistory(
            MaterialHistoryVO materialHistoryVO,
            @ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialHistoryService.deleteMaterialHistory(materialHistoryVO);
        status.setComplete();
        return "forward:/materialHistory/MaterialHistoryList.do";
    }

}
