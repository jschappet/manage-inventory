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
@Entity( name = "edu_uiowa_icts_inv_domain_personRole" )
@Table( name = "person_role", schema = "inv" )
@JsonIgnoreProperties( { "hibernateLazyInitializer", "handler" } )
public class PersonRole { 

	private static final Log log = LogFactory.getLog( PersonRole.class );

        private Integer personRoleId;
        private Role role;
        private Person person;


    @javax.persistence.SequenceGenerator(  name="gen",  sequenceName="inv.seqnum",allocationSize=1)
    @Id
    @GeneratedValue( strategy=GenerationType.AUTO,generator="gen")
    @Column(name = "person_role_id", unique = true, nullable = false)
    public Integer getPersonRoleId(){
        return personRoleId;
    }

    public void setPersonRoleId(Integer personRoleId){
        this.personRoleId = personRoleId;
    }

    @ManyToOne(fetch = FetchType.LAZY,  targetEntity=Role.class )
    @JoinColumn(name = "role_id",nullable = true)
    public Role getRole(){
        return role;
    }

    public void setRole(Role role){
        this.role = role;
    }

    @ManyToOne(fetch = FetchType.LAZY,  targetEntity=Person.class )
    @JoinColumn(name = "person_id",nullable = true)
    public Person getPerson(){
        return person;
    }

    public void setPerson(Person person){
        this.person = person;
    }


}
