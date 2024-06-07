package com.sqlrecord.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/admin_main")
	public void main(Model model) {
		System.out.println("관리자 메인 페이지로 이동");
		model.addAttribute("",);
	}
}
