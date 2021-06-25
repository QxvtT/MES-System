package mes.prd.com.web;

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

import mes.prd.com.service.ProduceCommandDService;
import mes.prd.com.service.ProduceCommandDDefaultVO;
import mes.prd.com.service.ProduceCommandDVO;

/**
 * @Class Name : ProduceCommandDController.java
 * @Description : ProduceCommandD Controller class
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
@SessionAttributes(types=ProduceCommandDVO.class)
public class ProduceCommandDController {

    @Resource(name = "produceCommandDService")
    private ProduceCommandDService produceCommandDService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * PRODUCE_COMMAND_D 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 ProduceCommandDDefaultVO
	 * @return "/produceCommandD/ProduceCommandDList"
	 * @exception Exception
	 */
    @RequestMapping(value="/prd/com/ProduceCommandDList.do")
    public String selectProduceCommandDList(@ModelAttribute("searchVO") ProduceCommandDDefaultVO searchVO, 
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
		
        List<?> produceCommandDList = produceCommandDService.selectProduceCommandDList(searchVO);
        model.addAttribute("resultList", produceCommandDList);
        
        int totCnt = produceCommandDService.selectProduceCommandDListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "prd/com/ProduceCommandDList.page";
    } 
    
    @RequestMapping("/prd/com/addProduceCommandDView.do")
    public String addProduceCommandDView(
            @ModelAttribute("searchVO") ProduceCommandDDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("produceCommandDVO", new ProduceCommandDVO());
        return "prd/com/ProduceCommandDRegister.page";
    }
    
    @RequestMapping("/prd/com/addProduceCommandD.do")
    public String addProduceCommandD(
            ProduceCommandDVO produceCommandDVO,
            @ModelAttribute("searchVO") ProduceCommandDDefaultVO searchVO, SessionStatus status)
            throws Exception {
        produceCommandDService.insertProduceCommandD(produceCommandDVO);
        status.setComplete();
        return "forward:/prd/com/ProduceCommandDList.do";
    }
    
    @RequestMapping("/prd/com/updateProduceCommandDView.do")
    public String updateProduceCommandDView(
            @RequestParam("prdComDNum") java.math.BigDecimal prdComDNum ,
            @ModelAttribute("searchVO") ProduceCommandDDefaultVO searchVO, Model model)
            throws Exception {
        ProduceCommandDVO produceCommandDVO = new ProduceCommandDVO();
        produceCommandDVO.setPrdComDNum(prdComDNum);
        // 변수명은 CoC 에 따라 produceCommandDVO
        model.addAttribute(selectProduceCommandD(produceCommandDVO, searchVO));
        return "prd/com/ProduceCommandDRegister.page";
    }

    @RequestMapping("/prd/com/selectProduceCommandD.do")
    public @ModelAttribute("produceCommandDVO")
    ProduceCommandDVO selectProduceCommandD(
            ProduceCommandDVO produceCommandDVO,
            @ModelAttribute("searchVO") ProduceCommandDDefaultVO searchVO) throws Exception {
        return produceCommandDService.selectProduceCommandD(produceCommandDVO);
    }

    @RequestMapping("/prd/com/updateProduceCommandD.do")
    public String updateProduceCommandD(
            ProduceCommandDVO produceCommandDVO,
            @ModelAttribute("searchVO") ProduceCommandDDefaultVO searchVO, SessionStatus status)
            throws Exception {
        produceCommandDService.updateProduceCommandD(produceCommandDVO);
        status.setComplete();
        return "forward:/prd/com/ProduceCommandDList.do";
    }
    
    @RequestMapping("/prd/com/deleteProduceCommandD.do")
    public String deleteProduceCommandD(
            ProduceCommandDVO produceCommandDVO,
            @ModelAttribute("searchVO") ProduceCommandDDefaultVO searchVO, SessionStatus status)
            throws Exception {
        produceCommandDService.deleteProduceCommandD(produceCommandDVO);
        status.setComplete();
        return "forward:/prd/com/ProduceCommandDList.do";
    }

}
