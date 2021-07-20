package mes.mac.web;

import java.io.File;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadForm {

	private String path = "C:/Users/admin/git/MES-System/comp/src/main/webapp/images/machinemng";

	@RequestMapping("/result")
	@ResponseBody
	public String result(@RequestParam("file1") MultipartFile multi, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String url = null;

		try {

			// String uploadpath = request.getServletContext().getRealPath(path);
			String uploadpath = path;
			String originFilename = multi.getOriginalFilename();
			long size = multi.getSize();
			String saveFileName = originFilename;

			System.out.println("uploadpath : " + uploadpath);

			System.out.println("originFilename : " + originFilename);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);

			if (!multi.isEmpty()) {
				File file = new File(uploadpath, saveFileName);
				multi.transferTo(file);

				model.addAttribute("filename", multi.getOriginalFilename());
				model.addAttribute("uploadPath", file.getAbsolutePath());

				return "filelist";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "success";
	}

}
