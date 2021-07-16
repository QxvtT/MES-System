package mes.prd.com.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import mes.prd.com.service.GridDataVO;
import mes.prd.com.service.ProduceCommandDService;
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
//@SessionAttributes(types=ProduceCommandDVO.class)
public class ProduceCommandDController {

    @Resource(name = "produceCommandDService")
    private ProduceCommandDService produceCommandDService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /** 화면 조회 */
    @RequestMapping(value="/prd/com/PrdComMng.do")
    public String produceCommandDList(ProduceCommandDVO searchVO)
    				throws Exception {
    	return "prd/com/PrdComMng.page";
    }
    
    /**
	 * PRODUCE_COMMAND_D 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 ProduceCommandDDefaultVO
	 * @return "/produceCommandD/ProduceCommandDList"
	 * @exception Exception
	 */
    /** 작업지시 조회 */
	@RequestMapping(value ="/prd/com/ProduceCommandList", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajax(ProduceCommandDVO searchVO) throws Exception {
		
    	System.out.println("이름 : ");
    	List<?> list = produceCommandDService.selectProduceCommandList(searchVO);
    	return list;
    }
	
	/** 작업지시디테일 조회 */
	@RequestMapping(value ="/prd/com/ProduceCommandDList", method=RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxSelectProduceCommandDList(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		List<?> list = produceCommandDService.selectProduceCommandDList(searchVO);
		return list;
	}
	
	/** 미생산 계획내역 조회 */
	@RequestMapping(value ="/prd/com/PrdPlnDList", method=RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxSelectPrdPlnDList(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		List<?> list = produceCommandDService.selectPrdPlnDList(searchVO); 
		return list;
	}
	
	/** 제품목록 조회 */
	@RequestMapping(value ="/prd/com/ItemList", method=RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxSelectItemList(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		List<?> list = produceCommandDService.selectItemList(searchVO); 
		return list;
	}
	
	/** 선택제품 조회 */
	@RequestMapping(value ="/prd/com/SelectItem", method=RequestMethod.GET)
	@ResponseBody
	public ProduceCommandDVO ajaxSelectItem(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		searchVO = produceCommandDService.selectItem(searchVO); 
		return searchVO;
	}
	
	/** 작업지시자재 조회 */
	@RequestMapping(value ="/prd/com/ProduceCommandMatList", method=RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxSelectProduceCommandMatList(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		List<?> list = produceCommandDService.selectProduceCommandMatList(searchVO);
		return list;
	}
	
	/** 모달 lotno자재 조회 */
	@RequestMapping(value ="/prd/com/MatStockList", method=RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxMatStockList(ProduceCommandDVO searchVO) throws Exception {
		System.out.println("이름 : ");
		List<?> list = produceCommandDService.seletMatStockList(searchVO);
		return list;
	}
	
	/** 작업지시공정흐름 조회 */
	@RequestMapping(value ="/prd/com/ProduceCommandFlowList", method=RequestMethod.GET)
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
    
    /** 공정이동표 자재 조회 */
   	@RequestMapping(value ="/ProcessMatList", method=RequestMethod.GET)
   	@ResponseBody
   	public List<?> ajaxSelectProcessMatList(ProduceCommandDVO searchVO) throws Exception {
   		System.out.println("이름 : ");
   		List<?> list = produceCommandDService.selectProcessMatList(searchVO);
   		return list;
   	}
       
   /** 공정이동표 인쇄 페이지 */
   @RequestMapping(value="/ProcessMovePrt.do")
   public String processMovePrt(ProduceCommandDVO searchVO, 
   		ModelMap model)
   				throws Exception {
   	return "mes/prd/com/ProcessMovePrt";
   }
   
    /** 공정이동표 flow ajax 전송 */
   	@RequestMapping(value ="/ProcessMoveFlowPrt")
   	@ResponseBody
   	public String ajaxProcessMoveFlowPrt(@RequestBody List<ProduceCommandDVO> list, Model model) throws Exception {
   		System.out.println(list);
   		model.addAttribute("list", list);
   		return "mes/prd/com/ProcessMovePrt";
   	}
	
	/*업데이트*/
	@RequestMapping(value="/prd/com/ProduceCommandUpdate")
	@ResponseBody
	public ProduceCommandDVO ProduceCommandUpdate(@RequestBody GridDataVO gridData) throws Exception {
		System.out.println("들어가는 숫자값 확인용");
		System.out.println(gridData.getProduceCommandDVO());
		System.out.println(gridData.getCreatedRows());
		
		return produceCommandDService.produceCommandUpdate(gridData);
	}
	
	@RequestMapping(value="/prd/com/ProduceCommandDelete")
	@ResponseBody
	public void ProduceCommandDelete(ProduceCommandDVO searchVO) throws Exception {
		produceCommandDService.ProduceCommandDelete(searchVO);
	}
	
	@RequestMapping(value="/prd/com/ProduceCommandMatUpdate")
	@ResponseBody
	public String ProduceCommandMatUpdate(@RequestBody GridDataVO gridData) throws Exception {
		produceCommandDService.produceCommandMatUpdate(gridData);
		return null;
	}
	
	@RequestMapping(value="/prd/com/MatOutUpdate")
	@ResponseBody
	public String MatOutUpdate(@RequestBody GridDataVO gridData) throws Exception {
		produceCommandDService.matOutUpdate(gridData);
		return null;
	}
    
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
    
	

}
