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

@Entity(name="com_schappet_inv_domain_location")
@Table(name = "location", schema="inv")
public class Location { 

	private static final Log log = LogFactory.getLog(Location.class);

        private Integer locationId;
        private String name;
        private String description;
        private String address1;
        private String address2;
        private String city;
        private String state;
        private String zipCode;
        private Set<Property> propertys = new HashSet<Property>(0);

    public Location()    {
        this.locationId = null;
        this.name = "";
        this.description = "";
        this.address1 = "";
        this.address2 = "";
        this.city = "";
        this.state = "";
        this.zipCode = "";
        this.propertys = new HashSet<Property>(0);
    }

    public Location(Integer locationId, String name, String description, String address1, String address2, String city, String state, String zipCode, Set<Property> propertys)
    {
        this.locationId = locationId;
        this.name = name;
        this.description = description;
        this.address1 = address1;
        this.address2 = address2;
        this.city = city;
        this.state = state;
        this.zipCode = zipCode;
        this.propertys = propertys;
    }

    /*****locationId*****/
    @javax.persistence.SequenceGenerator(  name="gen",  sequenceName="inv.seqnum",allocationSize=1)
    @Id
    @GeneratedValue( strategy=GenerationType.AUTO,generator="gen")
    @Column(name = "location_id", unique = true, nullable = false)
    public Integer getLocationId(){
        return locationId;
    }

    public void setLocationId(Integer locationId){
        this.locationId = locationId;
    }

    /*****name*****/
    @Column(name = "name")
    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    /*****description*****/
    @Column(name = "description")
    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }

    /*****address1*****/
    @Column(name = "address_1")
    public String getAddress1(){
        return address1;
    }

    public void setAddress1(String address1){
        this.address1 = address1;
    }

    /*****address2*****/
    @Column(name = "address_2")
    public String getAddress2(){
        return address2;
    }

    public void setAddress2(String address2){
        this.address2 = address2;
    }

    /*****city*****/
    @Column(name = "city")
    public String getCity(){
        return city;
    }

    public void setCity(String city){
        this.city = city;
    }

    /*****state*****/
    @Column(name = "state")
    public String getState(){
        return state;
    }

    public void setState(String state){
        this.state = state;
    }

    /*****zipCode*****/
    @Column(name = "zip_code")
    public String getZipCode(){
        return zipCode;
    }

    public void setZipCode(String zipCode){
        this.zipCode = zipCode;
    }

    /*****propertys*****/
    @OneToMany(fetch = FetchType.LAZY,   mappedBy = "location", targetEntity=Property.class, cascade=CascadeType.REMOVE)
    public Set<Property> getPropertys(){
        return propertys;
    }

    public void setPropertys(Set<Property> propertys){
        this.propertys = propertys;
    }


}