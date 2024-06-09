package com.sqlrecord.crtl;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sqlrecord.dto.Product;
import com.sqlrecord.dto.basket.Basket;
import com.sqlrecord.dto.basket.BasketForUser;
import com.sqlrecord.service.BasketService;
import com.sqlrecord.service.ProductService;

@Controller
@RequestMapping("/basket")
public class BasketController {
	
	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private BasketService basketService;
	
	@GetMapping("/")
	public String getBasket(Model model) {
		
		List<Basket> list = basketService.getBaskets();
		for(Basket a : list) {
			a.getBskno();
		}
		model.addAttribute("list",list);
		
		return "basket/basket";
	}
}
