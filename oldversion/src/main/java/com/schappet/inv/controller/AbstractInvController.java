package com.schappet.inv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;

import com.schappet.inv.dao.InvDaoService;

/**
 * Generated by Protogen
 * Fri Jun 27 07:27:13 CDT 2014
 */
public abstract class AbstractInvController {

    /*********** invDaoService ****************/
    protected InvDaoService invDaoService;

    @Autowired 
    public void setInvDaoService(InvDaoService invDaoService) {
        this.invDaoService = invDaoService;
    }

    public String getUsername() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }
}