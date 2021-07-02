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

import mes.mac.mng.service.MachineService;
import mes.mac.mng.service.MachineDefaultVO;
import mes.mac.mng.service.MachineVO;

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
@SessionAttributes(types = MachineVO.class)
public class MachineController {

	@Resource(name = "machineService")
	private MachineService machineService;

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
	public List<?> ajaxselectMachineList(MachineDefaultVO searchVO, ModelMap model)
			throws Exception {

		List<?> machineList = machineService.selectMachineList(searchVO);
		
		return machineList;
	}

	@RequestMapping("/machine/addMachineView.do")
	public String addMachineView(@ModelAttribute("searchVO") MachineDefaultVO searchVO, Model model) throws Exception {
		model.addAttribute("machineVO", new MachineVO());
		return "/machine/MachineRegister";
	}

	@RequestMapping("/machine/addMachine.do")
	public String addMachine(MachineVO machineVO, @ModelAttribute("searchVO") MachineDefaultVO searchVO,
			SessionStatus status) throws Exception {
		machineService.insertMachine(machineVO);
		status.setComplete();
		return "forward:/machine/MachineList.do";
	}

	@RequestMapping("/machine/updateMachineView.do")
	public String updateMachineView(@RequestParam("macCode") java.lang.String macCode,
			@ModelAttribute("searchVO") MachineDefaultVO searchVO, Model model) throws Exception {
		MachineVO machineVO = new MachineVO();
		machineVO.setMacCode(macCode);
		// 변수명은 CoC 에 따라 machineVO
		model.addAttribute(selectMachine(machineVO, searchVO));
		return "/machine/MachineRegister";
	}

	@RequestMapping("/machine/selectMachine.do")
	public @ModelAttribute("machineVO") MachineVO selectMachine(MachineVO machineVO,
			@ModelAttribute("searchVO") MachineDefaultVO searchVO) throws Exception {
		return machineService.selectMachine(machineVO);
	}

	@RequestMapping("/machine/updateMachine.do")
	public String updateMachine(MachineVO machineVO, @ModelAttribute("searchVO") MachineDefaultVO searchVO,
			SessionStatus status) throws Exception {
		machineService.updateMachine(machineVO);
		status.setComplete();
		return "forward:/machine/MachineList.do";
	}

	@RequestMapping("/machine/deleteMachine.do")
	public String deleteMachine(MachineVO machineVO, @ModelAttribute("searchVO") MachineDefaultVO searchVO,
			SessionStatus status) throws Exception {
		machineService.deleteMachine(machineVO);
		status.setComplete();
		return "forward:/machine/MachineList.do";
	}

}
