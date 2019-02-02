package com.andrewkim.pagination.controllers;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.andrewkim.pagination.services.DojoNinjaService;
import com.andrewkim.pagination.models.Ninja;

@Controller
public class DojoNinjaController {
	private final DojoNinjaService dojoNinjaService;
	
	public DojoNinjaController(DojoNinjaService dojoNinjaService) {
        this.dojoNinjaService = dojoNinjaService;
    }
	
	@RequestMapping("/")
	public String home(Model model) {
		List<Object[]> table = dojoNinjaService.dojoNinjas();
		model.addAttribute("table", table);
		return "home.jsp";
	}
	
	@RequestMapping("/ninjas/{pageNumber}")
	public String getNinjasPerPage(Model model, @PathVariable("pageNumber") int pageNumber) {
	    Page<Ninja> ninjas = dojoNinjaService.ninjasPerPage(pageNumber - 1);
	    int totalPages = ninjas.getTotalPages();
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("ninjas", ninjas);
	    return "ninjas.jsp";
	}
	
	@RequestMapping("/dojos/{number}")
	public String getDojosPerPage(Model model, @PathVariable("number") int number) {
	    Page<Object[]> dojos = dojoNinjaService.sortedDojos(number - 1);
	    int totalPages = dojos.getTotalPages();
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("dojos", dojos);
	    return "dojos.jsp";
	}
}
