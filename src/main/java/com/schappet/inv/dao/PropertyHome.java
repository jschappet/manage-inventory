package com.schappet.inv.dao;

import edu.uiowa.icts.spring.*;
import com.schappet.inv.domain.*;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import edu.uiowa.icts.util.SortColumn;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.Log;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.criterion.Restrictions;

/**
 * Generated by Protogen
 * Fri Jun 27 07:27:13 CDT 2014
 */
@Repository("com_schappet_inv_dao_PropertyHome")
@Transactional
public class PropertyHome extends GenericDao<Property> implements PropertyService {

    private static final Log log = LogFactory.getLog(PropertyHome.class);

    public PropertyHome() {
        setDomainName("com.schappet.inv.domain.Property");
    }

    public Property findById(Integer id) {
        return (Property)this.sessionFactory.getCurrentSession().get(getDomainName(), id);
    }

}