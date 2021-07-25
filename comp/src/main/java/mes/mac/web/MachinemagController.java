package mes.mac.web;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import egovframework.rte.fdl.property.EgovPropertyService;
import mes.common.modal.service.MachineVO;
import mes.mac.service.MachinemagDefaultVO;
import mes.mac.service.MachinemagService;
import mes.mac.service.MachinemagVO;

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

	//private String path = "C:/Users/admin/git/MES-System/comp/src/main/webapp/images/machinemng";
	private String path = "/usr/local/dev/upload/";

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

	@RequestMapping(value = "/mac/machine/MachineList")
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

	@RequestMapping(value = "/mac/machine/machineUpdate")
	@ResponseBody
	public void maachineUdate(@RequestParam(name = "file1", required = false) MultipartFile multi, MachinemagVO machinemagVO, Model model) throws Exception {
		String saveFileName = null;
		System.out.println("prcCode = " + machinemagVO.getPrcCode());
		System.out.println("VO 값 : " + machinemagVO);
		String prcCode = machinemagVO.getPrcCode().substring(1);
		machinemagVO.setPrcCode(prcCode);
		System.out.println("prcCode 수정 VO 값 : " + machinemagVO);
		if (multi != null && multi.getSize() > 0) {
			try {
				String uploadpath = path;
				String originFilename = multi.getOriginalFilename();
				long size = multi.getSize();
				saveFileName = originFilename;

				System.out.println("uploadpath : " + uploadpath);

				System.out.println("originFilename : " + originFilename);
				System.out.println("size : " + size);
				System.out.println("saveFileName : " + saveFileName);

				if (!multi.isEmpty()) {
					File file = new File(uploadpath, saveFileName);
					multi.transferTo(file);
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		machinemagVO.setImagePath(saveFileName);
		machineService.updatemachine(machinemagVO);
	}

	@RequestMapping(value = "/mac/machine/machineInsert")
	@ResponseBody
	public void machineInsert(@RequestParam(name = "file1", required = false) MultipartFile multi, MachinemagVO machinemagVO, Model model) throws Exception {
		String saveFileName = null;
		System.out.println("prcCode = " + machinemagVO.getPrcCode());
		System.out.println("VO 값 : " + machinemagVO);
		String prcCode = machinemagVO.getPrcCode().substring(1);
		machinemagVO.setPrcCode(prcCode);
		System.out.println("prcCode 수정 VO 값 : " + machinemagVO);
		if (multi != null && multi.getSize() > 0) {
			try {
				String uploadpath = path;
				String originFilename = multi.getOriginalFilename();
				long size = multi.getSize();
				saveFileName = originFilename;

				System.out.println("uploadpath : " + uploadpath);

				System.out.println("originFilename : " + originFilename);
				System.out.println("size : " + size);
				System.out.println("saveFileName : " + saveFileName);

				if (!multi.isEmpty()) {
					File file = new File(uploadpath, saveFileName);
					multi.transferTo(file);
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		machinemagVO.setImagePath(saveFileName);
		machineService.insertMachine(machinemagVO);
	}

	@RequestMapping(value = "/mac/machine/machineDelete")
	@ResponseBody
	public void machineDelete(@RequestBody MachinemagVO MachinemagVO) throws Exception {
		machineService.deleteMachine(MachinemagVO);
	}

}
