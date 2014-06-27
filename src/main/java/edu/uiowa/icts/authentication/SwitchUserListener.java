package edu.uiowa.icts.authentication;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.security.web.authentication.switchuser.AuthenticationSwitchUserEvent;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import edu.uiowa.icts.log4j.AuditLogger;


@Service
public class SwitchUserListener      implements ApplicationListener<AuthenticationSwitchUserEvent>  {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub


	}

	private static final Log log = LogFactory.getLog(AuthHandle.class);

//    private static final Logger log = LoggerFactory.getLogger(SwitchUserListener.class);

    @Override
    public void onApplicationEvent(AuthenticationSwitchUserEvent event) {
    	//ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    	//HttpSession session = attr.getRequest().getSession();

	
        AuditLogger.info("",  event.getAuthentication().getName(),
        		"Switch User","User switch from "+event.getAuthentication().getName()+" to " + event.getTargetUser().getUsername() );

        log.info("User switch from "+event.getAuthentication().getName()+" to " + event.getTargetUser().getUsername() );
    }

}

