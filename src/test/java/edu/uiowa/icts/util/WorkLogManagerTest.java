package edu.uiowa.icts.util;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;

import edu.uiowa.icts.inv.domain.Task;
import edu.uiowa.icts.inv.domain.WorkLog;

public class WorkLogManagerTest {

	private final String ASSIGNEDTO = "ASSIGNEDTO";
	private final String TASKTYPE = "TASKTYPE";
	private final String USER = "USER";
	private final String NOTES = "NOTES";
	private final Date DATE = new Date();
	private final String NAME = ASSIGNEDTO +":"+TASKTYPE;
	
	private Task t;
	
	@Before
	public void setup() {
		t = new Task();
		t.setAssignedTo(ASSIGNEDTO);
		t.setCreated(DATE);
		t.setName(NAME);
		t.setTaskType(TASKTYPE);
	}
	
	@Test
	public void testCompleteTaskTask() {
		WorkLog wl = WorkLogManager.completeTask(t);
		assertEquals(wl.getAssignedTo(), "DEFAULT");
		assertEquals(wl.getTaskType(),TASKTYPE);
		
	}

	@Test
	public void testCompleteTaskTaskUsernameNotes() {
		assertEquals(t.getAssignedTo(), ASSIGNEDTO);
		WorkLog wl = WorkLogManager.completeTask(t, USER, NOTES);
		
		assertEquals(wl.getTaskType(),TASKTYPE);
		
		assertEquals(wl.getAssignedTo(),USER);
		assertEquals(wl.getNote(),NOTES);
	}

}
