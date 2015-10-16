package edu.uiowa.icts.inv.domain;

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
import javax.validation.constraints.NotNull;
import com.fasterxml.jackson.annotation.*;
import edu.uiowa.icts.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/** 
 * Generated by Protogen - www.icts.uiowa.edu/protogen 
 * @since 10/16/2015 11:14:56 AM CDT
 */
@Entity( name = "edu_uiowa_icts_inv_domain_task" )
@Table( name = "task", schema = "inv" )
@JsonIgnoreProperties( { "hibernateLazyInitializer", "handler" } )
public class Task { 

	private static final Log log = LogFactory.getLog( Task.class );

        private Integer taskId;
        private String taskType;
        private String name;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date created;
        private String createdBy;
        private String assignedTo;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date deadline;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date completed;
        private Property property;


    @javax.persistence.SequenceGenerator(  name="gen",  sequenceName="inv.seqnum",allocationSize=1)
    @Id
    @GeneratedValue( strategy=GenerationType.AUTO,generator="gen")
    @Column(name = "task_id", unique = true, nullable = false)
    public Integer getTaskId(){
        return taskId;
    }

    public void setTaskId(Integer taskId){
        this.taskId = taskId;
    }

    @Column(name = "task_type")
    public String getTaskType(){
        return taskType;
    }

    public void setTaskType(String taskType){
        this.taskType = taskType;
    }

    @Column(name = "name")
    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    @Column(name = "created")
    public Date getCreated(){
        return created;
    }

    @JsonSetter
    public void setCreated(Date created){
        this.created = created;
    }

    @JsonIgnore
    public void setCreated( String created ){
        try{
            DateFormat formatter = new SimpleDateFormat( "MM/dd/yyyy" );
            formatter.setLenient(true);
            this.created = formatter.parse(created);
        } catch ( ParseException e ) { 
            log.error( "ParseException setting date for Created", e );
        }
    }

    @Column(name = "created_by")
    public String getCreatedBy(){
        return createdBy;
    }

    public void setCreatedBy(String createdBy){
        this.createdBy = createdBy;
    }

    @Column(name = "assigned_to")
    public String getAssignedTo(){
        return assignedTo;
    }

    public void setAssignedTo(String assignedTo){
        this.assignedTo = assignedTo;
    }

    @Column(name = "deadline")
    public Date getDeadline(){
        return deadline;
    }

    @JsonSetter
    public void setDeadline(Date deadline){
        this.deadline = deadline;
    }

    @JsonIgnore
    public void setDeadline( String deadline ){
        try{
            DateFormat formatter = new SimpleDateFormat( "MM/dd/yyyy" );
            formatter.setLenient(true);
            this.deadline = formatter.parse(deadline);
        } catch ( ParseException e ) { 
            log.error( "ParseException setting date for Deadline", e );
        }
    }

    @Column(name = "completed")
    public Date getCompleted(){
        return completed;
    }

    @JsonSetter
    public void setCompleted(Date completed){
        this.completed = completed;
    }

    @JsonIgnore
    public void setCompleted( String completed ){
        try{
            DateFormat formatter = new SimpleDateFormat( "MM/dd/yyyy" );
            formatter.setLenient(true);
            this.completed = formatter.parse(completed);
        } catch ( ParseException e ) { 
            log.error( "ParseException setting date for Completed", e );
        }
    }

    @ManyToOne(fetch = FetchType.LAZY,  targetEntity=Property.class )
    @JoinColumn(name = "property_id",nullable = true)
    public Property getProperty(){
        return property;
    }

    public void setProperty(Property property){
        this.property = property;
    }


}
