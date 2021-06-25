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

import mes.mat.stc.service.MaterialService;
import mes.mat.stc.service.MaterialDefaultVO;
import mes.mat.stc.service.MaterialVO;

/**
 * @Class Name : MaterialController.java
 * @Description : Material Controller class
 * @Modification Information
 *
 * @author material
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@SessionAttributes(types=MaterialVO.class)
public class MaterialController {

    @Resource(name = "materialService")
    private MaterialService materialService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * material 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MaterialDefaultVO
	 * @return "/material/MaterialList"
	 * @exception Exception
	 */
    @RequestMapping(value="/mat/stc/MaterialList.do")
    public String selectMaterialList(@ModelAttribute("searchVO") MaterialDefaultVO searchVO, 
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
		
        List<?> materialList = materialService.selectMaterialList(searchVO);
        model.addAttribute("resultList", materialList);
        
        int totCnt = materialService.selectMaterialListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "mat/stc/MaterialList.page";
    } 
    
    @RequestMapping("/mat/stc/addMaterialView.do")
    public String addMaterialView(
            @ModelAttribute("searchVO") MaterialDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("materialVO", new MaterialVO());
        return "mat/stc/MaterialRegister.page";
    }
    
    @RequestMapping("/mat/stc/addMaterial.do")
    public String addMaterial(
            MaterialVO materialVO,
            @ModelAttribute("searchVO") MaterialDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialService.insertMaterial(materialVO);
        status.setComplete();
        return "forward:/material/MaterialList.do";
    }
    
    @RequestMapping("/mat/stc/updateMaterialView.do")
    public String updateMaterialView(
            @RequestParam("matCode") java.lang.String matCode ,
            @ModelAttribute("searchVO") MaterialDefaultVO searchVO, Model model)
            throws Exception {
        MaterialVO materialVO = new MaterialVO();
        materialVO.setMatCode(matCode);
        // 변수명은 CoC 에 따라 materialVO
        model.addAttribute(selectMaterial(materialVO, searchVO));
        return "mat/stc/MaterialRegister.page";
    }

    @RequestMapping("mat/stc/selectMaterial.do")
    public @ModelAttribute("materialVO")
    MaterialVO selectMaterial(
            MaterialVO materialVO,
            @ModelAttribute("searchVO") MaterialDefaultVO searchVO) throws Exception {
        return materialService.selectMaterial(materialVO);
    }

    @RequestMapping("/mat/stc/updateMaterial.do")
    public String updateMaterial(
            MaterialVO materialVO,
            @ModelAttribute("searchVO") MaterialDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialService.updateMaterial(materialVO);
        status.setComplete();
        return "forward:/mat/stc/MaterialList.do";
    }
    
    @RequestMapping("/mat/stc/deleteMaterial.do")
    public String deleteMaterial(
            MaterialVO materialVO,
            @ModelAttribute("searchVO") MaterialDefaultVO searchVO, SessionStatus status)
            throws Exception {
        materialService.deleteMaterial(materialVO);
        status.setComplete();
        return "forward:/mat/stc/MaterialList.do";
    }

}
