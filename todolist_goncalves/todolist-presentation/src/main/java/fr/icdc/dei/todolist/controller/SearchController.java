package fr.icdc.dei.todolist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller

@RequestMapping("/recherche")
public class SearchController {
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView searchTasks() {
		ModelAndView page = new ModelAndView("SearchTasks");
		return page;
	}
}
