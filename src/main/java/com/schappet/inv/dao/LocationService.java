package com.schappet.inv.dao;

import edu.uiowa.icts.spring.*;
import com.schappet.inv.domain.*;
import java.util.ArrayList;
import java.util.List;
import edu.uiowa.icts.util.SortColumn;

/**
 * Generated by Protogen 
 * @date 07/03/2014 12:55:47 CDT
 */
public interface LocationService extends GenericDaoInterface<Location> {

    public Location findById( Integer id );

}