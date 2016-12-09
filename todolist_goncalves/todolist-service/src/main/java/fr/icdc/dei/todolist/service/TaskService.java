package fr.icdc.dei.todolist.service;

import java.util.Date;
import java.util.List;
import fr.icdc.dei.todolist.persistence.entity.Task;

public interface TaskService {

	List<Task> list();

	Task add(Task task);

	Task find(long idTaskOver);

	boolean isOver(Task find);

	boolean plannedEndingDateIsInInterval(Task find, Date begin, Date ending);

	List<Task> listUserTasksNotOverInInterval(long idUser, Date begin, Date end);

}
