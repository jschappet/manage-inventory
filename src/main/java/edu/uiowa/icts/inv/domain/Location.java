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
@Entity( name = "edu_uiowa_icts_inv_domain_location" )
@Table( name = "location", schema = "inv" )
@JsonIgnoreProperties( { "hibernateLazyInitializer", "handler" } )
public class Location { 

	@Override
	public String toString() {
		return "Location: " + name + " (" + description + "; " + city + ", " + state + ")";
	}

	private static final Log log = LogFactory.getLog( Location.class );

        private Integer locationId;
        private String name;
        private String description;
        private String address1;
        private String address2;
        private String city;
        private String state;
        private String zipCode;
        private Set<Property> propertys = new HashSet<Property>(0);


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

    @Column(name = "name")
    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    @Column(name = "description")
    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }

    @Column(name = "address_1")
    public String getAddress1(){
        return address1;
    }

    public void setAddress1(String address1){
        this.address1 = address1;
    }

    @Column(name = "address_2")
    public String getAddress2(){
        return address2;
    }

    public void setAddress2(String address2){
        this.address2 = address2;
    }

    @Column(name = "city")
    public String getCity(){
        return city;
    }

    public void setCity(String city){
        this.city = city;
    }

    @Column(name = "state")
    public String getState(){
        return state;
    }

    public void setState(String state){
        this.state = state;
    }

    @Column(name = "zip_code")
    public String getZipCode(){
        return zipCode;
    }

    public void setZipCode(String zipCode){
        this.zipCode = zipCode;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,   mappedBy = "location", targetEntity=Property.class, cascade=CascadeType.REMOVE)
    public Set<Property> getPropertys(){
        return propertys;
    }

    public void setPropertys(Set<Property> propertys){
        this.propertys = propertys;
    }


}
