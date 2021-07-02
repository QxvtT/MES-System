package mes.prd.pln.web;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import mes.prd.pln.service.ProducePlanDDefaultVO;
import mes.prd.pln.service.ProducePlanDService;
import mes.prd.pln.service.ProducePlanDVO;

/**
 * @Class Name : ProducePlanDController.java
 * @Description : ProducePlanD Controller class
 * @Modification Information
 *
 * @author Jeoung
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

class GridData {
	List<ProducePlanDVO> updatedRows;
	List<ProducePlanDVO> createRows;
	List<ProducePlanDVO> deletedRows;	
}

@Controller
//@SessionAttributes(types=ProducePlanDVO.class)
public class ProducePlanDController {

	@PutMapping(value = "/ajax/updateCode")
	@ResponseBody
	public Map updateCode(@RequestBody GridData gridData) {
		System.out.println(gridData.updatedRows);
		Map<String, Object> data = new HashMap();
		data.put("result", true);
		data.put("data", gridData.updatedRows);
		return data;
	}
	
    @Resource(name = "producePlanDService")
    private ProducePlanDService producePlanDService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    
    //생산계획 ajax
    @RequestMapping(value = "/prd/pln/ProducePlanList")
    @ResponseBody
    public List<?> ajaxPrd(@ModelAttribute("prdVO") ProducePlanDVO prdVO) throws Exception {
    	List<?> prdList = producePlanDService.selectProducePlanList(prdVO);
    	return prdList;
    }
    
    //제품 List
    @RequestMapping(value = "/prd/pln/ItemList")
    @ResponseBody
    public List<?> ajaxItemList(@ModelAttribute("itmVO") ProducePlanDVO itmVO) throws Exception {
    	List<?> itemList = producePlanDService.selectItemList(itmVO);
    	return itemList;
    }
    
	/*
	 * // 제품 Select
	 * 
	 * @RequestMapping(value = "/prd/pln/SelectItem")
	 * 
	 * @ResponseBody public List<?> ajaxSelectItem(@ModelAttribute("itmVO")
	 * ProducePlanDVO itmVO) throws Exception { return
	 * producePlanDService.selectItem(itmVO);; }
	 */
    
    /**
	 * PRODUCE_PLAN_D 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 ProducePlanDDefaultVO
	 * @return "/producePlanD/ProducePlanDList"
	 * @exception Exception
	 */
    
    //생산계획 디테일 조회 ajax 처리
    @RequestMapping(value ="/prd/pln/ProducePlanDList", method = RequestMethod.GET)
    @ResponseBody
    public List<?> ajax(@ModelAttribute("searchVO") ProducePlanDVO searchVO) throws Exception {
    	List<?> list = producePlanDService.selectProducePlanDList(searchVO);
    	return list;
    }
    
    @RequestMapping(value="/prd/pln/ProducePlanDList.do")
    public String selectProducePlanDList(@ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, 
    		ModelMap model)
            throws Exception {
        return "prd/pln/ProducePlanDList.page";
    } 
    
    @RequestMapping("/prd/pln/addProducePlanDView.do")
    public String addProducePlanDView(
            @ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("producePlanDVO", new ProducePlanDVO());
        return "prd/pln/ProducePlanDRegister.page";
    }
    
    @RequestMapping("/prd/pln/addProducePlanD.do")
    public String addProducePlanD(
            ProducePlanDVO producePlanDVO,
            @ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, SessionStatus status)
            throws Exception {
        producePlanDService.insertProducePlanD(producePlanDVO);
        status.setComplete();
        return "forward:/prd/pln/ProducePlanDList.do";
    }
    
    @RequestMapping("/prd/pln/updateProducePlanDView.do")
    public String updateProducePlanDView(
            @RequestParam("prdPlanDNum") java.math.BigDecimal prdPlanDNum ,
            @ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, Model model)
            throws Exception {
        ProducePlanDVO producePlanDVO = new ProducePlanDVO();
        producePlanDVO.setPrdPlanDNum(prdPlanDNum);
        // 변수명은 CoC 에 따라 producePlanDVO
        model.addAttribute(selectProducePlanD(producePlanDVO, searchVO));
        return "prd/pln/ProducePlanDRegister.page";
    }

    @RequestMapping("/prd/pln/selectProducePlanD.do")
    public @ModelAttribute("producePlanDVO")
    ProducePlanDVO selectProducePlanD(
            ProducePlanDVO producePlanDVO,
            @ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO) throws Exception {
        return producePlanDService.selectProducePlanD(producePlanDVO);
    }

    @RequestMapping("/prd/pln/updateProducePlanD.do")
    public String updateProducePlanD(
            ProducePlanDVO producePlanDVO,
            @ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, SessionStatus status)
            throws Exception {
        producePlanDService.updateProducePlanD(producePlanDVO);
        status.setComplete();
        return "forward:/prd/pln/ProducePlanDList.do";
    }
    
    @RequestMapping("/prd/pln/deleteProducePlanD.do")
    public String deleteProducePlanD(
            ProducePlanDVO producePlanDVO,
            @ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, SessionStatus status)
            throws Exception {
        producePlanDService.deleteProducePlanD(producePlanDVO);
        status.setComplete();
        return "forward:/prd/pln/ProducePlanDList.do";
    }

}
