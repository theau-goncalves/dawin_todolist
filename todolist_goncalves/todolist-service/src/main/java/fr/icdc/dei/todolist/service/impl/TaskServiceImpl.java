package fr.icdc.dei.todolist.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fr.icdc.dei.todolist.persistence.dao.TaskDao;
import fr.icdc.dei.todolist.persistence.entity.Task;
import fr.icdc.dei.todolist.service.TaskService;

@Service("TaskService")
public class TaskServiceImpl implements TaskService {
	
	@Autowired
	private TaskDao taskDao;

	@Override
	public List<Task> list() {
		return taskDao.findAll();
	}

	@Override
	public Task add(Task task) {
		if(task.getUser().getTasks().size() < 10)
			return taskDao.save(task);
		return null;
	}

	@Override
	public Task find(long idTaskOver) {
		return taskDao.findOne(idTaskOver);
	}

	@Override
	public boolean isOver(Task find) {
		return find.getEndingDate() != null;
	}

	@Override
	public boolean plannedEndingDateIsInInterval(Task find, Date begin, Date ending) {
		Date tmp = find.getPlannedEndingDate();
		return(tmp.after(begin) && tmp.before(ending));
	}

	@Override
	public List<Task> listUserTasksNotOverInInterval(long idUser, Date begin, Date end) {
		List<Task> tasksUser = taskDao.findAllByUserId(idUser);
		List<Task> checkTasks = new ArrayList<Task>();
		
		for(Task task : tasksUser) {
			if(!isOver(task) && plannedEndingDateIsInInterval(task, begin, end)) {
				checkTasks.add(task);
			}
		}
		return checkTasks;
	}

}
