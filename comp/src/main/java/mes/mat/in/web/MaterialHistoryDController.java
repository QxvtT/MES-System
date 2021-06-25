package mes.mat.in.web;

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
import mes.mat.in.service.MaterialHistoryDDefaultVO;
import mes.mat.in.service.MaterialHistoryDService;
import mes.mat.in.service.MaterialHistoryDVO;

/**
 * @Class Name : MaterialHistoryDController.java
 * @Description : MaterialHistoryD Controller class
 * @Modification Information
 *
 * @author soyeon
 * @since 20210625
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@SessionAttributes(types=MaterialHistoryDVO.class)
public class MaterialHistoryDController {

    @Resource(name = "materialHistoryDService")
    private MaterialHistoryDService materialHistoryDService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * MATERIAL_HISTORY_D 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MaterialHistoryDDefaultVO
	 * @return "/materialHistoryD/MaterialHistoryDList"
	 * @exception Exception
	 */
    @RequestMapping(value="/mat/in/MaterialHistoryDList.do")
    public String selectMaterialHistoryDList(@ModelAttribute("searchVO") MaterialHistoryDDefaultVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<?> materialHistoryDList = materialHistoryDService.selectMaterialHistoryDList(searchVO);
        model.addAttribute("resultList", materialHistoryDList);
        
        int totCnt = materialHistoryDService.selectMaterialHistoryDListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "mat/in/MaterialHistoryDList.page";
    } 
    
    @RequestMapping("/mat/in/addMaterialHistoryDView.do")
    public String addMaterialHistoryDView(
            @ModelAttribute("searchVO") MaterialHistoryDDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("materialHistoryDVO", new MaterialHistoryDVO());
        return "mat/in/MaterialHistoryDRegister.page";
    }
    
    @RequestMapping("/mat/in/addMaterialHistoryD.do")
    public String addMaterialHistoryD(
            MaterialHistoryDVO materialHistoryDVO,
            @ModelAttribute("searchVO") MaterialHistoryDDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialHistoryDService.insertMaterialHistoryD(materialHistoryDVO);
        status.setComplete();
        return "forward:/mat/in/MaterialHistoryDList.do";
    }
    
    @RequestMapping("/mat/in/updateMaterialHistoryDView.do")
    public String updateMaterialHistoryDView(
            @RequestParam("matHisDNum") java.math.BigDecimal matHisDNum ,
            @ModelAttribute("searchVO") MaterialHistoryDDefaultVO searchVO, Model model)
            throws Exception {
        MaterialHistoryDVO materialHistoryDVO = new MaterialHistoryDVO();
        materialHistoryDVO.setMatHisDNum(matHisDNum);
        // 변수명은 CoC 에 따라 materialHistoryDVO
        model.addAttribute(selectMaterialHistoryD(materialHistoryDVO, searchVO));
        return "mat/in/MaterialHistoryDRegister.page";
    }

    @RequestMapping("/mat/in/selectMaterialHistoryD.do")
    public @ModelAttribute("materialHistoryDVO")
    MaterialHistoryDVO selectMaterialHistoryD(
            MaterialHistoryDVO materialHistoryDVO,
            @ModelAttribute("searchVO") MaterialHistoryDDefaultVO searchVO) throws Exception {
        return materialHistoryDService.selectMaterialHistoryD(materialHistoryDVO);
    }

    @RequestMapping("/mat/in/updateMaterialHistoryD.do")
    public String updateMaterialHistoryD(
            MaterialHistoryDVO materialHistoryDVO,
            @ModelAttribute("searchVO") MaterialHistoryDDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialHistoryDService.updateMaterialHistoryD(materialHistoryDVO);
        status.setComplete();
        return "forward:/mat/in/MaterialHistoryDList.do";
    }
    
    @RequestMapping("/mat/in/deleteMaterialHistoryD.do")
    public String deleteMaterialHistoryD(
            MaterialHistoryDVO materialHistoryDVO,
            @ModelAttribute("searchVO") MaterialHistoryDDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialHistoryDService.deleteMaterialHistoryD(materialHistoryDVO);
        status.setComplete();
        return "forward:/mat/in/MaterialHistoryDList.do";
    }

}
