package edu.uiowa.icts.inv.dao;

import edu.uiowa.icts.spring.*;
import edu.uiowa.icts.inv.domain.*;

/**
 * Generated by Protogen 
 * @since 10/16/2015 11:14:56 CDT
 */
public interface LocationService extends GenericDaoInterface<Location> {

	public Location findById( Integer id );

}