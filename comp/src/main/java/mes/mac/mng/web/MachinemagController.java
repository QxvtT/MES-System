package mes.mac.mng.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import mes.mac.mng.service.MachinemagService;
import mes.mac.mng.service.MachinemagDefaultVO;
import mes.mac.mng.service.MachinemagVO;

/**
 * @Class Name : MachineController.java
 * @Description : Machine Controller class
 * @Modification Information
 *
 * @author sunghwan
 * @since 2021-07-02
 * @version 1.0
 * @see
 * 
 *      Copyright (C) All right reserved.
 */

@Controller
@SessionAttributes(types = MachinemagVO.class)
public class MachinemagController {

	@Resource(name = "machineService")
	private MachinemagService machineService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * MACHINE 목록을 조회한다. (pageing)
	 * 
	 * @param searchVO - 조회할 정보가 담긴 MachineDefaultVO
	 * @return "/machine/MachineList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/machine/MachineList.do")
	@ResponseBody
	public List<?> ajaxselectMachineList(MachinemagDefaultVO searchVO, ModelMap model)
			throws Exception {

		List<?> machineList = machineService.selectMachineList(searchVO);
		
		return machineList;
	}

	@RequestMapping("/machine/addMachineView.do")
	public String addMachineView(@ModelAttribute("searchVO") MachinemagDefaultVO searchVO, Model model) throws Exception {
		model.addAttribute("machineVO", new MachinemagVO());
		return "/machine/MachineRegister";
	}

	@RequestMapping("/machine/addMachine.do")
	public String addMachine(MachinemagVO machineVO, @ModelAttribute("searchVO") MachinemagDefaultVO searchVO,
			SessionStatus status) throws Exception {
		machineService.insertMachine(machineVO);
		status.setComplete();
		return "forward:/machine/MachineList.do";
	}

	@RequestMapping("/machine/updateMachineView.do")
	public String updateMachineView(@RequestParam("macCode") java.lang.String macCode,
			@ModelAttribute("searchVO") MachinemagDefaultVO searchVO, Model model) throws Exception {
		MachinemagVO machineVO = new MachinemagVO();
		machineVO.setMacCode(macCode);
		// 변수명은 CoC 에 따라 machineVO
		model.addAttribute(selectMachine(machineVO, searchVO));
		return "/machine/MachineRegister";
	}

	@RequestMapping("/machine/selectMachine.do")
	public @ModelAttribute("machineVO") MachinemagVO selectMachine(MachinemagVO machineVO,
			@ModelAttribute("searchVO") MachinemagDefaultVO searchVO) throws Exception {
		return machineService.selectMachine(machineVO);
	}

	@RequestMapping("/machine/updateMachine.do")
	public String updateMachine(MachinemagVO machineVO, @ModelAttribute("searchVO") MachinemagDefaultVO searchVO,
			SessionStatus status) throws Exception {
		machineService.updateMachine(machineVO);
		status.setComplete();
		return "forward:/machine/MachineList.do";
	}

	@RequestMapping("/machine/deleteMachine.do")
	public String deleteMachine(MachinemagVO machineVO, @ModelAttribute("searchVO") MachinemagDefaultVO searchVO,
			SessionStatus status) throws Exception {
		machineService.deleteMachine(machineVO);
		status.setComplete();
		return "forward:/machine/MachineList.do";
	}

}