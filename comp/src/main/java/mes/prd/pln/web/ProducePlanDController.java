package mes.prd.pln.web;

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
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import mes.prd.pln.service.GridData;
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
 *      Copyright (C) All right reserved.
 */

@Controller
//@SessionAttributes(types=ProducePlanDVO.class)
public class ProducePlanDController {


	@Resource(name = "producePlanDService")
	private ProducePlanDService producePlanDService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	//CRUD
	@RequestMapping(value="/prd/pln/ProducePlanUpdate")
	@ResponseBody
	public String producePlanUpdate(@RequestBody GridData gridData) throws Exception {
		return producePlanDService.producePlanUpdate(gridData);
	}
	
	//master삭제 detail도 함께 삭제됌
	@RequestMapping(value = "/prd/pln/ProducePlanDelete")
	@ResponseBody
	public void producePlanDelete(@ModelAttribute("prdVO") ProducePlanDVO prdVO) throws Exception {
		producePlanDService.producePlanDelete(prdVO);
	}
	
	// 생산계획 ajax
	@RequestMapping(value = "/prd/pln/SelectProducePlanD")
	@ResponseBody
	public List<?> ajaxPrd(@ModelAttribute("prdVO") ProducePlanDVO prdVO) throws Exception {
		List<?> prdList = producePlanDService.selectProducePlanList(prdVO);
		return prdList;	
	}
	
	// 미생산계획 ajax
	@RequestMapping(value = "/prd/pln/UnProducePlanList")
	@ResponseBody
	public List<?> ajaxUnPrd(@ModelAttribute("prdVO") ProducePlanDVO prdVO) throws Exception {
		List<?> prdList = producePlanDService.selectUnProducePlanList(prdVO);
		return prdList;	
	}

	// 제품 List
	@RequestMapping(value = "/prd/pln/ItemList")
	@ResponseBody
	public List<?> ajaxItemList(@ModelAttribute("itmVO") ProducePlanDVO itmVO) throws Exception {
		List<?> itemList = producePlanDService.selectItemList(itmVO);
		return itemList;
	}

	// 제품 Select
	@RequestMapping(value = "/prd/pln/SelectItem")
	@ResponseBody
	public ProducePlanDVO selectItem(@ModelAttribute("itmVO") ProducePlanDVO itmVO) throws Exception {
		return producePlanDService.selectItem(itmVO);
	}


	// 생산계획 관리 페이지
	@RequestMapping(value = "/prd/pln/ProducePlanDList.do")
	public String selectProducePlanDList(@ModelAttribute("searchVO") ProducePlanDVO searchVO, ModelMap model)
			throws Exception {
		return "prd/pln/ProducePlanDList.page";
	}

	// 생산계획 디테일 조회 ajax 처리
	@RequestMapping(value = "/prd/pln/ProducePlanDList", method = RequestMethod.GET)
	@ResponseBody
	public List<?> ajax(@ModelAttribute("searchVO") ProducePlanDVO searchVO) throws Exception {
		List<?> list = producePlanDService.selectProducePlanDList(searchVO);
		return list;
	}
	
	// 생산계획 조회 페이지 
	@RequestMapping("/ProducePlanDView.do")
	public String addProducePlanDView(@ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, Model model)
			throws Exception {
		return "prd/pln/ProducePlanDRegister.page";
	}
	
	// 생산계획조회  리스트 ajax 처리
	@RequestMapping(value = "/ProducePlanList", method = RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxPlanList(@ModelAttribute("searchVO") ProducePlanDVO searchVO) throws Exception {
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
		List<?> list = producePlanDService.producePlanList(searchVO);
		return list;
	}

	@RequestMapping("/prd/pln/addProducePlanD.do")
	public String addProducePlanD(ProducePlanDVO producePlanDVO,
			@ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, SessionStatus status) throws Exception {
		producePlanDService.insertProducePlanD(producePlanDVO);
		status.setComplete();
		return "forward:/prd/pln/ProducePlanDList.do";
	}

	@RequestMapping("/prd/pln/updateProducePlanDView.do")
	public String updateProducePlanDView(@RequestParam("prdPlanDNum") java.math.BigDecimal prdPlanDNum,
			@ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, Model model) throws Exception {
		ProducePlanDVO producePlanDVO = new ProducePlanDVO();
		producePlanDVO.setPrdPlanDNum(prdPlanDNum);
		// 변수명은 CoC 에 따라 producePlanDVO
		model.addAttribute(selectProducePlanD(producePlanDVO, searchVO));
		return "prd/pln/ProducePlanDRegister.page";
	}

	@RequestMapping("/prd/pln/selectProducePlanD.do")
	public @ModelAttribute("producePlanDVO") ProducePlanDVO selectProducePlanD(ProducePlanDVO producePlanDVO,
			@ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO) throws Exception {
		return producePlanDService.selectProducePlanD(producePlanDVO);
	}

	@RequestMapping("/prd/pln/updateProducePlanD.do")
	public String updateProducePlanD(ProducePlanDVO producePlanDVO,
			@ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, SessionStatus status) throws Exception {
		producePlanDService.updateProducePlanD(producePlanDVO);
		status.setComplete();
		return "forward:/prd/pln/ProducePlanDList.do";
	}

	@RequestMapping("/prd/pln/deleteProducePlanD.do")
	public String deleteProducePlanD(ProducePlanDVO producePlanDVO,
			@ModelAttribute("searchVO") ProducePlanDDefaultVO searchVO, SessionStatus status) throws Exception {
		producePlanDService.deleteProducePlanD(producePlanDVO);
		status.setComplete();
		return "forward:/prd/pln/ProducePlanDList.do";
	}

}
