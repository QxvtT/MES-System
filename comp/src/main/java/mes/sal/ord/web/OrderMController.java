package mes.sal.ord.web;

import java.util.ArrayList;
import java.util.Arrays;
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
import mes.sal.ord.service.OrderMDefaultVO;
import mes.sal.ord.service.OrderMService;
import mes.sal.ord.service.OrderMVO;

/**
 * @Class Name : OrderMController.java
 * @Description : OrderM Controller class
 * @Modification Information
 *
 * @author seongwon
 * @since 2021-06-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@SessionAttributes(types=OrderMVO.class)
public class OrderMController {

    @Resource(name = "orderMService")
    private OrderMService orderMService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * ORDER_M 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 OrderMDefaultVO
	 * @return "/orderM/OrderMList"
	 * @exception Exception
	 */
    //주문조회 페이지 리스트
    @RequestMapping(value="/sal/ord/OrderMList", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajax(OrderMVO searchVO ) throws Exception {
    	if(searchVO.getOperCode() != null && searchVO.getOperCode() != "") {
    		String[] operCodeList = searchVO.getOperCode().split(",");
    		for(int i =0; i<operCodeList.length; i++) {
    			operCodeList[i] = operCodeList[i].trim();
    		}
    		List<String> operCodes = new ArrayList<String>();
    		operCodes = Arrays.asList(operCodeList);
    		searchVO.setOperCodes(operCodes);
    	}
        List<?> orderMList = orderMService.selectOrderMList(searchVO);
        return orderMList;
    }
    //주문조회 페이지     
    @RequestMapping(value="/sal/ord/OrderMList.do")
    public String OrderMList(@ModelAttribute("searchVO") OrderMDefaultVO searchVO, 
    		ModelMap model)
            throws Exception {
		return "sal/ord/OrderMList.page";
	}
    
  //주분번호 페이지 리스트
    @RequestMapping(value="/sal/ord/OrderNumList", method=RequestMethod.GET)
    @ResponseBody
    public List<?> ajaxmodal(OrderMVO searchVO ) throws Exception {
    	
        List<?> orderMList = orderMService.OrderNumList(searchVO);
        return orderMList;
    }
    //주문번호      
    @RequestMapping(value="/sal/ord/OrderNumList.do")
    public String OrderNumList(@ModelAttribute("searchVO") OrderMDefaultVO searchVO, 
    		ModelMap model)
            throws Exception {
		return "sal/ord/OrderMList.page";
	}

    
  
    
    @RequestMapping("/sal/ord/addOrderMView.do")
    public String addOrderMView(
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("orderMVO", new OrderMVO());
        return "sal/ord/OrderMRegister.page";
    }
    
    @RequestMapping("/sal/ord/addOrderM.do")
    public String addOrderM(
            OrderMVO orderMVO,
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO, SessionStatus status)
            throws Exception {
        orderMService.insertOrderM(orderMVO);
        status.setComplete();
        return "redirect:/sal/ord/OrderMList.do";
    }
    
    @RequestMapping("/sal/ord/updateOrderMView.do")
    public String updateOrderMView(
            @RequestParam("ordNum") java.lang.String ordNum ,
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO, Model model)
            throws Exception {
        OrderMVO orderMVO = new OrderMVO();
        orderMVO.setOrdNum(ordNum);
        // 변수명은 CoC 에 따라 orderMVO
        model.addAttribute(selectOrderM(orderMVO, searchVO));
        return "sal/ord/OrderMRegister.page";
    }

    @RequestMapping("/sal/ord/selectOrderM.do")
    public @ModelAttribute("orderMVO")
    OrderMVO selectOrderM(
            OrderMVO orderMVO,
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO) throws Exception {
        return orderMService.selectOrderM(orderMVO);
    }

    @RequestMapping("/sal/ord/updateOrderM.do")
    public String updateOrderM(
            OrderMVO orderMVO,
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO, SessionStatus status)
            throws Exception {
        orderMService.updateOrderM(orderMVO);
        status.setComplete();
        return "forward:/sal/ord/OrderMList.do";
    }
    
    @RequestMapping("/sal/ord/deleteOrderM.do")
    public String deleteOrderM(
            OrderMVO orderMVO,
            @ModelAttribute("searchVO") OrderMDefaultVO searchVO, SessionStatus status)
            throws Exception {
        orderMService.deleteOrderM(orderMVO);
        status.setComplete();
        return "forward:/sal/ord/OrderMList.do";
    }

}
