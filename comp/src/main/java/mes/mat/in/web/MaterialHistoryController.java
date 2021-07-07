package mes.mat.in.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import lombok.Data;
import mes.mat.in.service.GridDataVO;
import mes.mat.in.service.MaterialHistoryDefaultVO;
import mes.mat.in.service.MaterialHistoryService;
import mes.mat.in.service.MaterialHistoryVO;
import mes.mat.stc.service.MaterialDefaultVO;
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
//@SessionAttributes(types=MaterialHistoryVO.class)
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
    
    // 자재 입고 CUD
    @RequestMapping("/updateMatIn")
    public void updateMatIn(@RequestBody GridDataVO gridData) throws Exception{
    	materialHistoryService.updateMatIn(gridData);
    }
    
    // 자재 입고 관리 조회
    @RequestMapping(value="/mat/in/MatInMng", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajaxMatInMng(MaterialHistoryVO searchVO) throws Exception {
    	System.out.println(searchVO.toString());
    	searchVO.setOperCodeList(null);
    	// 업체 코드 다중 선택 처리
    	if(searchVO.getOperCodes() != null && searchVO.getOperCodes() != "") {
    		String[] operList = searchVO.getOperCodes().split(",");
    		for(int i = 0; i<operList.length; i++) {
    			operList[i] = operList[i].trim();
    		}
    		List<String> ol = new ArrayList<String>();
    		ol = Arrays.asList(operList);
    		searchVO.setOperCodeList(ol);
    		
    		System.out.println(searchVO.getOperCodeList().get(0));
    	}
    	List<?> selectMatInMng = materialHistoryService.selectMatInMng(searchVO);
    	
    	System.out.println("a");
    	System.out.println(selectMatInMng);
    	return selectMatInMng;
    }
    
    @RequestMapping("/mat/in/MatInMng.do")
    public String selectMatInMng(@ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO, ModelMap model) throws Exception{
    	return "mat/in/MatInMng.page";
    } // end 자재 입고 관리 조회
    
    
    //자재 입고 조회
    @RequestMapping(value="/mat/in/MatInList", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajaxMatInList(MaterialHistoryVO searchVO) throws Exception {
    	System.out.println(searchVO.toString());
    	searchVO.setMatCodeList(null);
    	//자재 코드 다중선택 처리
    	if(searchVO.getMatCodes() != null && searchVO.getMatCodes() != "") {
			String[] rowList = searchVO.getMatCodes().split(",");
			for(int i = 0; i < rowList.length; i++) {
				rowList[i] = rowList[i].trim();
			}
			List<String> al = new ArrayList<String>();
			al = Arrays.asList(rowList);
			searchVO.setMatCodeList(al);
    	}
    	List<?> list = materialHistoryService.selectMatInList(searchVO);
    	
    	System.out.println("a");
    	System.out.println(list);
    	return list;
    }
    
    @RequestMapping("/mat/in/MatInList.do")
    public String selectMatInList(@ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO, ModelMap model) throws Exception{
    	return "mat/in/MatInList.page";
    } // end 자재 입고 조회
    
    // 일 입고 자료 LIST 조회
    @RequestMapping(value="/mat/in/MatInDayList", method = RequestMethod.GET)
    @ResponseBody
    public List<?> ajaxMatInDayList(@ModelAttribute("matInDayVO") MaterialHistoryVO matInDayVO) throws Exception{
    	List<?> matInDayList = materialHistoryService.matInDayList(matInDayVO);
    	System.out.println(matInDayList);
    	return matInDayList;
    }
    // end 일 입고 자료 리스트 조회
    
 // 일 출고 자료 LIST 조회
    @RequestMapping(value="/mat/in/MatOutDayList", method = RequestMethod.GET)
    @ResponseBody
    public List<?> MatOutDayList(@ModelAttribute("matOutDayVO") MaterialHistoryVO matOutDayVO) throws Exception{
    	List<?> matOutDayList = materialHistoryService.matInDayList(matOutDayVO);
    	System.out.println(matOutDayList);
    	return matOutDayList;
    }
    // end 일 출고 자료 리스트 조회
    
    // 자재 출고 관리 조회
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
    
    @RequestMapping("/materialHistory/selectMaterialHistory.do")
    public @ModelAttribute("materialHistoryVO")
    MaterialHistoryVO selectMaterialHistory(
            MaterialHistoryVO materialHistoryVO,
            @ModelAttribute("searchVO") MaterialHistoryDefaultVO searchVO) throws Exception {
        return materialHistoryService.selectMaterialHistory(materialHistoryVO);
    }

}
