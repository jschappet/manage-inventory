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
@Entity( name = "edu_uiowa_icts_inv_domain_message" )
@Table( name = "message", schema = "inv" )
@JsonIgnoreProperties( { "hibernateLazyInitializer", "handler" } )
public class Message { 

	private static final Log log = LogFactory.getLog( Message.class );

        private Integer messageId;
        private String messageName;
        private String messageType;
        private Integer version;
        private String messageText;
        private Boolean irbApproval;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date irbApprovalStartDate;
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private Date irbApprovalEndDate;
        private String description;


    @javax.persistence.SequenceGenerator(  name="gen",  sequenceName="inv.seqnum",allocationSize=1)
    @Id
    @GeneratedValue( strategy=GenerationType.AUTO,generator="gen")
    @Column(name = "message_id", unique = true, nullable = false)
    public Integer getMessageId(){
        return messageId;
    }

    public void setMessageId(Integer messageId){
        this.messageId = messageId;
    }

    @Column(name = "message_name")
    public String getMessageName(){
        return messageName;
    }

    public void setMessageName(String messageName){
        this.messageName = messageName;
    }

    @Column(name = "message_type")
    public String getMessageType(){
        return messageType;
    }

    public void setMessageType(String messageType){
        this.messageType = messageType;
    }

    @Column(name = "version")
    public Integer getVersion(){
        return version;
    }

    public void setVersion(Integer version){
        this.version = version;
    }

    @Column(name = "message_text")
    public String getMessageText(){
        return messageText;
    }

    public void setMessageText(String messageText){
        this.messageText = messageText;
    }

    @Column(name = "irb_approval")
    public Boolean getIrbApproval(){
        return irbApproval;
    }

    public void setIrbApproval(Boolean irbApproval){
        this.irbApproval = irbApproval;
    }

    @Column(name = "irb_approval_start_date")
    public Date getIrbApprovalStartDate(){
        return irbApprovalStartDate;
    }

    @JsonSetter
    public void setIrbApprovalStartDate(Date irbApprovalStartDate){
        this.irbApprovalStartDate = irbApprovalStartDate;
    }

    @JsonIgnore
    public void setIrbApprovalStartDate( String irbApprovalStartDate ){
        try{
            DateFormat formatter = new SimpleDateFormat( "MM/dd/yyyy" );
            formatter.setLenient(true);
            this.irbApprovalStartDate = formatter.parse(irbApprovalStartDate);
        } catch ( ParseException e ) { 
            log.error( "ParseException setting date for IrbApprovalStartDate", e );
        }
    }

    @Column(name = "irb_approval_end_date")
    public Date getIrbApprovalEndDate(){
        return irbApprovalEndDate;
    }

    @JsonSetter
    public void setIrbApprovalEndDate(Date irbApprovalEndDate){
        this.irbApprovalEndDate = irbApprovalEndDate;
    }

    @JsonIgnore
    public void setIrbApprovalEndDate( String irbApprovalEndDate ){
        try{
            DateFormat formatter = new SimpleDateFormat( "MM/dd/yyyy" );
            formatter.setLenient(true);
            this.irbApprovalEndDate = formatter.parse(irbApprovalEndDate);
        } catch ( ParseException e ) { 
            log.error( "ParseException setting date for IrbApprovalEndDate", e );
        }
    }

    @Column(name = "description")
    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }


}
