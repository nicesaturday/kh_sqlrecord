package com.sqlrecord.crtl;


import java.sql.Array;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sqlrecord.dto.Product;
import com.sqlrecord.service.ClientOrderService;

@Controller
@RequestMapping("/clientOrder")
public class ClientOrderController {
	
	private static final Logger log = LoggerFactory.getLogger(ClientOrderController.class);
	
	
	@Autowired
	private ClientOrderService clientOrderService;
	
	
	@PostMapping("/post")
	public String insOrderOne(HttpServletRequest request , @RequestParam("pno") int[] pnoList ) {
		log.info(""+ pnoList[0]);
		int price = Integer.parseInt(request.getParameter("price"));
		
		return "redirect:/";
	}
}
