package mes.mat.stc.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.fdl.property.EgovPropertyService;
import mes.mat.stc.service.MaterialStockDefaultVO;
import mes.mat.stc.service.MaterialStockService;
import mes.mat.stc.service.MaterialStockVO;

/**
 * @Class Name : MaterialStockController.java
 * @Description : MaterialStock Controller class
 * @Modification Information
 *
 * @author materialStock
 * @since 2021-06-25
 * @version 1.0
 * @see
 * 
 *      Copyright (C) All right reserved.
 */

@Controller
//@SessionAttributes(types=MaterialStockVO.class)
public class MaterialStockController {
	
	@Resource(name = "materialStockService")
	private MaterialStockService materialStockService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * MATERIAL_STOCK 목록을 조회한다. (pageing)
	 * 
	 * @param searchVO - 조회할 정보가 담긴 MaterialStockDefaultVO
	 * @return "/materialStock/MaterialStockList"
	 * @exception Exception
	 */

	@GetMapping("/selectMatDivList")
	public void selectMatDivList(MaterialStockVO searchVO, Model model) throws Exception {
		model.addAttribute("selectMatDivList", materialStockService.selectMatDivList(searchVO));
	}
	// 자재 구분 리스트 불러오기

	@RequestMapping(value = "/mat/stc/MatCodeList", method = RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxMatCodeList(@ModelAttribute("matCodeVO") MaterialStockVO matCodeVO) throws Exception {
		System.out.println("a");
		List<?> matCodelist = materialStockService.selectMatCodeList(matCodeVO);
		System.out.println(matCodelist);
		return matCodelist;
	}

	// end 자재 코드 조회

	@RequestMapping(value = "/mat/stc/MatStcList", method = RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxMatStcList(MaterialStockVO searchVO) throws Exception {

		List<?> list = materialStockService.selectMatStcList(searchVO);

		System.out.println("a");
		System.out.println(list);
		return list;
	}

//	@RequestMapping(value = "/mat/stc/MatStcList", method = RequestMethod.GET)
//	@ResponseBody
//	public String selectMatList(MaterialStockVO MaterialStockVO, @ModelAttribute("searchVO") MaterialStockVO searchVO, SessionStatus status) throws Exception {
//
//		materialStockService.insertMaterialStock(MaterialStockVO);
//		status.setComplete();
//
//		return "redirect:/MatStcList.do";
//	}

	@RequestMapping("/mat/stc/MatStcList.do")
	public String selectMatStcList(@ModelAttribute("searchVO") MaterialStockDefaultVO searchVO, ModelMap model)
			throws Exception {
		return "mat/stc/MatStcList.page";
	}
	// end 자재 재고 조회
	
	// 자재 LOT 재고 조회
	@RequestMapping(value = "/mat/stc/MatLotStcList", method = RequestMethod.GET)
	@ResponseBody
	public List<?> ajaxMatLotStcList(MaterialStockVO searchVO) throws Exception {
		System.out.println(searchVO.toString());
		searchVO.setMatCodeList(null);
		// 자재 코드 다중 선택 처리
		if(searchVO.getMatCodes() != null && searchVO.getMatCodes() != "") {
			String[] rowList = searchVO.getMatCodes().split(",");
			for(int i = 0; i < rowList.length; i++) {
				rowList[i] = rowList[i].trim();
			}
			List<String> mc = new ArrayList<String>();
			mc = Arrays.asList(rowList);
			searchVO.setMatCodeList(mc);
		}
		List<?> list = materialStockService.selectMatLotStcList(searchVO);

		System.out.println("a");
		System.out.println(list);
		return list;
	}

	@RequestMapping("/mat/stc/MatLotStcList.do")
	public String selectMatLotStcList(@ModelAttribute("searchVO") MaterialStockDefaultVO searchVO, ModelMap model) throws Exception {
		return "mat/stc/MatLotStcList.page";
	}
	// end 자재 LOT 재고 조회

}
