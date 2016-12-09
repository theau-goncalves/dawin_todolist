package fr.icdc.dei.todolist.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fr.icdc.dei.todolist.service.TaskService;

@Controller
@RequestMapping("/liste_des_taches")
public class TasksInIntervalController {
	@Autowired
	private TaskService taskService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listUserTasksNotOverInInterval(@RequestParam long id_user, @RequestParam Date begin, @RequestParam Date end) {
		ModelAndView page = new ModelAndView("TasksInInterval");
		page.addObject("tasks", taskService.listUserTasksNotOverInInterval(id_user, begin, end));
		return page;
	}
}
