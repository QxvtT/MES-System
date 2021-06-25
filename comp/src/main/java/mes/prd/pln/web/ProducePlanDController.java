package mes.prd.pln.web;

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

import mes.prd.pln.service.ProducePlanDService;
import mes.prd.pln.service.ProducePlanDDefaultVO;
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

@Controller
@SessionAttributes(types=ProducePlanDVO.class)
public class ProducePlanDController {

    @Resource(name = "producePlanDService")
    private ProducePlanDService producePlanDService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * PRODUCE_PLAN_D 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 ProducePlanDDefaultVO
	 * @return "/producePlanD/ProducePlanDList"
	 * @exception Exception
	 */
    @RequestMapping(value="/prd/pln/ProducePlanDList.do")
    public String selectProducePlanDList(@ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, 
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
		
        List<?> producePlanDList = producePlanDService.selectProducePlanDList(searchVO);
        model.addAttribute("resultList", producePlanDList);
        
        int totCnt = producePlanDService.selectProducePlanDListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
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
