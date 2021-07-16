package mes.mac.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import mes.mac.service.MachinemagDefaultVO;
import mes.mac.service.MachinemagService;
import mes.mac.service.MachinemagVO;
import mes.prd.res.service.ProcessResultVO;

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

	/** Eg ovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * MACHINE 목록을 조회한다. (pageing)
	 * 
	 * @param searchVO - 조회할 정보가 담긴 MachineDefaultVO
	 * @return "/machine/MachineList"
	 * @exception Exception
	 */

	@RequestMapping(value = "/mac/machine/MachineList.do")
	@ResponseBody
	public List<?> ajaxselectMachineList(MachinemagVO searchVO) throws Exception {

		List<?> machineList = machineService.selectMachineList(searchVO);

		return machineList;
	}

	@RequestMapping("/mac/machine/MacMng.do")
	public String MacMng(MachinemagVO searchVO) throws Exception {
		return "mac/machine/MachineList.page";
	}

	@RequestMapping("/machine/addMachineView.do")
	public String addMachineView(@ModelAttribute("searchVO") MachinemagDefaultVO searchVO, Model model)
			throws Exception {
		model.addAttribute("machineVO", new MachinemagVO());
		return "/machine/MachineRegister.page";
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

	@RequestMapping(value = "/mac/machine/machineUdate")
	@ResponseBody
	public void maachineUdate(@RequestBody MachinemagVO MachinemagVO) throws Exception {
		machineService.updatemachine(MachinemagVO);
	}
	
	@RequestMapping(value = "/mac/machine/machineInsert")
	@ResponseBody
	public void machineInsert(@RequestBody MachinemagVO MachinemagVO) throws Exception {
		machineService.insertMachine(MachinemagVO);
	}
	
	@RequestMapping(value = "/mac/machine/machineDelete")
	@ResponseBody
	public void machineDelete(@RequestBody MachinemagVO MachinemagVO) throws Exception {
		machineService.deleteMachine(MachinemagVO);
	}



}
