package mes.prd.com.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import mes.prd.com.service.GridDataVO;
import mes.prd.com.service.ProduceCommandDDefaultVO;
import mes.prd.com.service.ProduceCommandDService;
import mes.prd.com.service.ProduceCommandDVO;
import mes.prd.pln.service.ProducePlanDVO;

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
	
    /** 화면 조회 */
    @RequestMapping(value="/ProduceCommandDList.do")
    public String produceCommandDList(ProduceCommandDVO searchVO, 
    		ModelMap model)
    				throws Exception {
    	return "prd/com/ProduceCommandDList.page";
    }
    
    /**
	 * PRODUCE_COMMAND_D 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 ProduceCommandDDefaultVO
	 * @return "/produceCommandD/ProduceCommandDList"
	 * @exception Exception
	 */
    /** 작업지시 조회 */
	@RequestMapping(value ="/ProduceCommandList", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajax(ProduceCommandDVO searchVO) throws Exception {
		
    	System.out.println("이름 : ");
    	List<?> list = produceCommandDService.selectProduceCommandList(searchVO);
    	return list;
    }
	
	/** 작업지시디테일 조회 */
	@RequestMapping(value ="/ProduceCommandDList", method=RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxSelectProduceCommandDList(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		List<?> list = produceCommandDService.selectProduceCommandDList(searchVO);
		return list;
	}
	
	/** 미생산 계획내역 조회 */
	@RequestMapping(value ="/PrdPlnDList", method=RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxSelectPrdPlnDList(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		List<?> list = produceCommandDService.selectPrdPlnDList(searchVO); 
		return list;
	}
	
	/** 제품목록 조회 */
	@RequestMapping(value ="/ItemList", method=RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxSelectItemList(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		List<?> list = produceCommandDService.selectItemList(searchVO); 
		return list;
	}
	
	/** 선택제품 조회 */
	@RequestMapping(value ="/SelectItem", method=RequestMethod.GET)
	@ResponseBody
	public ProduceCommandDVO ajaxSelectItem(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		searchVO = produceCommandDService.selectItem(searchVO); 
		return searchVO;
	}
	
	/** 작업지시자재 조회 */
	@RequestMapping(value ="/ProduceCommandMatList", method=RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxSelectProduceCommandMatList(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		List<?> list = produceCommandDService.selectProduceCommandMatList(searchVO);
		return list;
	}
	
	/** 모달 lotno자재 조회 */
	@RequestMapping(value ="/MatStockList", method=RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxMatStockList(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		List<?> list = produceCommandDService.seletMatStockList(searchVO);
		return list;
	}
	
	/** 작업지시공정흐름 조회 */
	@RequestMapping(value ="/ProduceCommandFlowList", method=RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxSelectProduceCommandFlowList(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		List<?> list = produceCommandDService.selectProduceCommandFlowList(searchVO);
		return list;
	}
	
	/** 공정이동표 페이지 */
    @RequestMapping(value="/ProcessMove.do")
    public String processMove(ProduceCommandDVO searchVO, 
    		ModelMap model)
    				throws Exception {
    	return "prd/com/ProcessMove.page";
    }
	
	/*업데이트*/
	@RequestMapping(value="/ProduceCommandUpdate")
	@ResponseBody
	public ProduceCommandDVO ProduceCommandUpdate(@RequestBody GridDataVO gridData) throws Exception {
		System.out.println("들어가는 숫자값 확인용");
		System.out.println(gridData.getProduceCommandDVO());
		System.out.println(gridData.getCreatedRows());
		System.out.println(gridData.getCreatedRows().get(1));
		return produceCommandDService.produceCommandUpdate(gridData);
	}
	
	@RequestMapping(value="/ProduceCommandMatUpdate")
	@ResponseBody
	public String ProduceCommandMatUpdate(@RequestBody GridDataVO gridData) throws Exception {
		produceCommandDService.produceCommandMatUpdate(gridData);
		return null;
	}
	
	@RequestMapping(value="/MatOutUpdate")
	@ResponseBody
	public String MatOutUpdate(@RequestBody GridDataVO gridData) throws Exception {
		produceCommandDService.matOutUpdate(gridData);
		return null;
	}
	
    /*
    @RequestMapping(value="/prd/com/ProduceCommandDList.do")
    public String selectProduceCommandDList(@ModelAttribute("searchVO") ProduceCommandDDefaultVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
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
    }*/
    
	/** 생산지시조회 페이지 **/
    @RequestMapping("/ProduceCommandDView.do")
    public String addProduceCommandDView(ProduceCommandDVO searchVO, 
    		ModelMap model)
            throws Exception {
        return "prd/com/ProduceCommandDRegister.page";
    }
    
 // 생산계획조회  리스트 ajax 처리
 	@RequestMapping(value = "/ProduceCommandSearch", method = RequestMethod.GET)
 	@ResponseBody
 	public List<?> ajaxComList(ProduceCommandDVO searchVO, 
    		ModelMap model) throws Exception {
 		System.out.println(searchVO);
 		// 업체 코드 다중 선택 처리
     	if(searchVO.getOperCodes() != null && searchVO.getOperCodes() != "") {
     		String[] operList = searchVO.getOperCodes().split(",");
     		for(int i = 0; i<operList.length; i++) {
     			operList[i] = operList[i].trim();
     		}
     		List<String> ol = new ArrayList<String>();
     		ol = Arrays.asList(operList);
     		searchVO.setOperCodeList(ol);
     		
     		System.out.println(searchVO.getOperCodeList());
     	}
     	
     	// 제품 코드 다중 선택 처리
     	if(searchVO.getItemCodes() != null && searchVO.getItemCodes() != "") {
     		String[] itemList = searchVO.getItemCodes().split(",");
     		for(int i = 0; i<itemList.length; i++) {
     			itemList[i] = itemList[i].trim();
     		}
     		List<String> ol = new ArrayList<String>();
     		ol = Arrays.asList(itemList);
     		searchVO.setItemCodeList(ol);
     		
     		System.out.println(searchVO.getItemCodeList());
     	}
 		List<?> list = produceCommandDService.produceCommandList(searchVO);
 		return list;
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
    
	/*
	 * @RequestMapping("/prd/com/updateProduceCommandDView.do") public String
	 * updateProduceCommandDView(
	 * 
	 * @RequestParam("prdComDNum") java.math.BigDecimal prdComDNum ,
	 * 
	 * @ModelAttribute("searchVO") ProduceCommandDDefaultVO searchVO, Model model)
	 * throws Exception { ProduceCommandDVO produceCommandDVO = new
	 * ProduceCommandDVO(); produceCommandDVO.setPrdComDNum(prdComDNum); // 변수명은 CoC
	 * 에 따라 produceCommandDVO
	 * model.addAttribute(selectProduceCommandD(produceCommandDVO, searchVO));
	 * return "prd/com/ProduceCommandDRegister.page"; }
	 
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
    }*/

}
