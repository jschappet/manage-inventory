package com.schappet.inv.dao;

import edu.uiowa.icts.spring.*;

import com.schappet.inv.domain.*;

import java.util.ArrayList;
import java.util.List;

import edu.uiowa.icts.util.SortColumn;

/**
 * Generated by Protogen
 * Fri Jun 27 07:27:13 CDT 2014
 */
public interface TaskService extends GenericDaoInterface<Task> {
    public Task  findById(Integer id);

	public List<Task> listByUsername(String username);
}