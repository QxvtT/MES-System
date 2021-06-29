package mes.mat.in.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import mes.mat.in.service.MaterialHistoryDefaultVO;
import mes.mat.in.service.MaterialHistoryService;
import mes.mat.in.service.MaterialHistoryVO;
import mes.mat.in.service.impl.MaterialHistoryServiceImpl;
import mes.mat.stc.service.MaterialStockDefaultVO;
import mes.mat.stc.service.MaterialStockVO;

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
    
    @RequestMapping(value="/mat/in/MatInMng", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajaxMatInMng(MaterialHistoryVO searchVO) throws Exception {
    	
    	List<?> list = materialHistoryService.selectMatInMng(searchVO);
    	
    	System.out.println("a");
    	System.out.println(list);
    	return list;
    }
    
    @RequestMapping("/mat/in/MatInMng.do")
    public String selectMatInMng(@ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO, ModelMap model) throws Exception{
    	return "mat/in/MatInMng.page";
    } // end 자재 입고 관리 조회
    
    @RequestMapping(value="/mat/in/MatInList", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajaxMatInList(MaterialHistoryVO searchVO) throws Exception {
    	
    	List<?> list = materialHistoryService.selectMatInList(searchVO);
    	
    	System.out.println("a");
    	System.out.println(list);
    	return list;
    }
    
    @RequestMapping("/mat/in/MatInList.do")
    public String selectMatInList(@ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO, ModelMap model) throws Exception{
    	return "mat/in/MatInList.page";
    } // end 자재 입고 조회
    
    @RequestMapping(value="/mat/in/MatOutMng", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajaxMatOutMng(MaterialHistoryVO searchVO) throws Exception {
    	
    	List<?> list = materialHistoryService.selectMatOutMng(searchVO);
    	
    	System.out.println("a");
    	System.out.println(list);
    	return list;
    }
    
    @RequestMapping("/mat/in/MatOutMng.do")
    public String selectMatOutMng(@ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO, ModelMap model) throws Exception{
    	return "mat/in/MatOutMng.page";
    } // end 자재 출고 관리 조회
    
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
