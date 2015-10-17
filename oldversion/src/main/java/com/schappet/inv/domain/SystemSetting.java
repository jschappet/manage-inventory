package com.schappet.inv.domain;

import java.util.Set;
import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;
import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Table;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import org.springframework.format.annotation.DateTimeFormat;
import org.hibernate.annotations.*;
import javax.persistence.CascadeType;
import com.schappet.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/** 
 * Generated by Protogen - www.icts.uiowa.edu/protogen 
 * @date 07/03/2014 13:14:00 CDT
 */ 

@Entity(name="com_schappet_inv_domain_systemSetting")
@Table(name = "system_setting", schema="inv")
public class SystemSetting { 

	private static final Log log = LogFactory.getLog(SystemSetting.class);

        private String name;
        private String value;
        private Boolean active;
        private String notes;
        private String lastUpdatedBy;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date lastUpdated;

    public SystemSetting()    {
        this.name = "";
        this.value = "";
        this.active = null;
        this.notes = "";
        this.lastUpdatedBy = "";
        this.lastUpdated = null;
    }

    public SystemSetting(String name, String value, Boolean active, String notes, String lastUpdatedBy, Date lastUpdated)
    {
        this.name = name;
        this.value = value;
        this.active = active;
        this.notes = notes;
        this.lastUpdatedBy = lastUpdatedBy;
        this.lastUpdated = lastUpdated;
    }

    /*****name*****/
    @Id
    @Column(name = "name", unique = true, nullable = false)
    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    /*****value*****/
    @Column(name = "value")
    public String getValue(){
        return value;
    }

    public void setValue(String value){
        this.value = value;
    }

    /*****active*****/
    @Column(name = "active")
    public Boolean getActive(){
        return active;
    }

    public void setActive(Boolean active){
        this.active = active;
    }

    /*****notes*****/
    @Column(name = "notes")
    public String getNotes(){
        return notes;
    }

    public void setNotes(String notes){
        this.notes = notes;
    }

    /*****lastUpdatedBy*****/
    @Column(name = "last_updated_by")
    public String getLastUpdatedBy(){
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(String lastUpdatedBy){
        this.lastUpdatedBy = lastUpdatedBy;
    }

    /*****lastUpdated*****/
    @Column(name = "last_updated")
    public Date getLastUpdated(){
        return lastUpdated;
    }

    public void setLastUpdated(Date lastUpdated){
        this.lastUpdated = lastUpdated;
    }

    public void setLastUpdated(String lastUpdated){
        try{
            DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            formatter.setLenient(true);
            this.lastUpdated = formatter.parse(lastUpdated);
        } catch (ParseException e) { 
            log.error(" ParseException setting date for LastUpdated", e);
        }
    }


}