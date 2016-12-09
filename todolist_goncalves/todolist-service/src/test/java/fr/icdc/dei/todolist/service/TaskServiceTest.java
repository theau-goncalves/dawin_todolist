package fr.icdc.dei.todolist.service;

import static org.junit.Assert.*;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.collections.CollectionUtils;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import fr.icdc.dei.todolist.persistence.entity.Task;
import fr.icdc.dei.todolist.persistence.entity.User;
import fr.icdc.dei.todolist.persistence.entity.UserFree;

public class TaskServiceTest extends AbstractServiceTest {
	
	private static final String TASK_LABEL = "taskLabel";

	private final static Task task = new Task();
	private final static User user = new UserFree();

	private static final long ID_TASK_OVER = 4L;
	private static final long ID_TASK_NOT_OVER = 5L;
	private static final long ID_TASK_ENDING_IN_INTERVAL = 6L;

	private static final int INTERVAL_MONTH = 10;	//Les mois commencent à 0, donc c'est novembre et non pas octobre
	private static final int INTERVAL_YEAR = 2016;

	private static final long ID_USER = 3L;

	private static Date BEGIN_DATE_INTERVAL;
	private static Date END_DATE_INTERVAL;


	@Autowired
	private TaskService taskService;
	
	@BeforeClass
	public static void setUp() {
		task.setLabel(TASK_LABEL);
		user.setId(2L);
		task.setUser(user);
		
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.set(INTERVAL_YEAR, INTERVAL_MONTH, 14);
		BEGIN_DATE_INTERVAL = calendar.getTime();
		calendar.set(INTERVAL_YEAR, INTERVAL_MONTH, 25);
		END_DATE_INTERVAL = calendar.getTime();
	}

	@Test
	public void testListTasks() {
		assertTrue(CollectionUtils.isNotEmpty(taskService.list()));
	}
	
	@Test
	public void testAddTaskSucceedWithLessThanTenTasksForFreeUser() {
		assertNotNull(taskService.add(task));
	}
	
	@Test
	public void testEndedTaskIsOver() {
		assertTrue(taskService.isOver(taskService.find(ID_TASK_OVER)));
	}
	
	@Test
	public void testNotEndedTaskIsNotOver() {
		assertFalse(taskService.isOver(taskService.find(ID_TASK_NOT_OVER)));
	}
	
	@Test
	public void testTaskPlannedEndingDateIsInInterval() {
		assertTrue(taskService.plannedEndingDateIsInInterval(taskService.find(ID_TASK_ENDING_IN_INTERVAL), BEGIN_DATE_INTERVAL, END_DATE_INTERVAL));
	}
	
	@Test
	public void testListUserTasksNotOverInInterval() {
		assertFalse(taskService.listUserTasksNotOverInInterval(ID_USER, BEGIN_DATE_INTERVAL, END_DATE_INTERVAL).isEmpty());
	}
	

}
