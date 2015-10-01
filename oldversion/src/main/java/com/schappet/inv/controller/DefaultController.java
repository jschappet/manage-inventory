package com.schappet.inv.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.schappet.inv.domain.Message;
import com.schappet.inv.domain.Person;

import edu.uiowa.icts.exception.MappingNotFoundException;


@Controller
@RequestMapping("/*")
public class DefaultController extends AbstractInvController { 
	
	private static final Log log = LogFactory.getLog(DefaultController.class);
	
	@RequestMapping("/**")
	public void mappingNotFound(HttpServletRequest request, HttpServletResponse response) throws MappingNotFoundException {
		throw new MappingNotFoundException(request.getRequestURL().toString());
	}
	
	@RequestMapping(value = "indentified.html", method = RequestMethod.GET)
	public ModelAndView indentified( HttpServletRequest req,HttpServletResponse res ){
		ModelMap model = new ModelMap();
		return new ModelAndView("indentified",model);
	}
	
	@RequestMapping(value = "de-indentified.html", method = RequestMethod.GET)
	public ModelAndView deIndentified( HttpServletRequest req,HttpServletResponse res ){
		ModelMap model = new ModelMap();
		return new ModelAndView("de-indentified",model);
	}

	@RequestMapping(value = "{ page }.html", method = RequestMethod.GET)
	public ModelAndView displayDefault(@PathVariable String page,HttpServletRequest req,HttpServletResponse res){
		ModelMap model = new ModelMap();
		return new ModelAndView(page,model);
	}
	
	@RequestMapping(value = "access_denied.html", method = RequestMethod.GET)
	public ModelAndView accessDenied(@RequestParam(value="requestUri", required=false) String page, HttpServletRequest req,HttpServletResponse res){
		ModelMap model = new ModelMap();
		model.addAttribute("message", invDaoService.getMessageService().getCurrentMessage("ACCESS_DENIED"));
		model.addAttribute("page", page);
		return new ModelAndView("access_denied", model);
	}
	
	@RequestMapping(value = "alive.html", method = RequestMethod.GET)
	public void alive( HttpServletResponse response ) {
		try {
			ByteArrayInputStream bais = new ByteArrayInputStream("ALIVE".getBytes());
			IOUtils.copy(bais, response.getOutputStream());
			bais.close();
		} catch (IOException e){
			log.error("error during keep alive",e);
		}
	}
	
	@RequestMapping(value = "faq.html", method = RequestMethod.GET)
	public ModelAndView faq(HttpServletRequest req,HttpServletResponse res){
		ModelMap model = new ModelMap();
		model.addAttribute("message", invDaoService.getMessageService().getCurrentMessage("faq"));
		return new ModelAndView("faq", model);
	}
	
	@RequestMapping(value = "profile.html", method = RequestMethod.GET)
	public ModelAndView profile(HttpServletRequest req,HttpServletResponse res){
		ModelMap model = new ModelMap();
		Person person = invDaoService.getPersonService().findByUsername(getUsername());
		model.addAttribute("person",person);
        return new ModelAndView("inv/person/edit",model);
	}


	@RequestMapping(value = "contact.html", method = RequestMethod.GET)
	public ModelAndView contact(HttpServletRequest req,HttpServletResponse res){
		ModelMap model = new ModelMap();
		model.addAttribute("message", invDaoService.getMessageService().getCurrentMessage("contact"));
		return new ModelAndView("contact",model);
	}
	
	@RequestMapping(value = "message.html", method = RequestMethod.GET)
	public ModelAndView message(HttpServletRequest req,HttpServletResponse res, 
			@RequestParam("message") String message, 
			@RequestParam(value="error",required=false,defaultValue="false") Boolean error ){
		ModelMap model = new ModelMap();
		model.addAttribute("message", message);
		model.addAttribute("error", error);
		return new ModelAndView("message",model);
	}
	
	@RequestMapping(value = {"/","index.html"}, method = RequestMethod.GET)
	public ModelAndView index( HttpServletRequest request, @RequestParam(value="error", required=false) String error, @RequestParam(value="info", required=false) String info) {
		ModelMap model = new ModelMap();
		Message message = invDaoService.getMessageService().getCurrentMessage("main.index");
		if( message == null ){
			message = new Message();
			message.setMessageText( "<div class=\"alert alert-error\">main.index message not found</div>" );
		}
		model.addAttribute("message", message );
		if( info != null ){
			model.addAttribute("info", info);
		}
		if( error != null ){
			model.addAttribute("error", error);
		}
		return new ModelAndView("index",model);
	}
	
	@RequestMapping(value = "error.html", method = RequestMethod.GET)
	public ModelAndView error(HttpServletRequest request) {
		ModelMap model = new ModelMap();
		log.error("Error URI: " + request.getAttribute("javax.servlet.error.request_uri")) ;
		log.error("Error Message: " + request.getAttribute("javax.servlet.error.message"), (Throwable) request.getAttribute("javax.servlet.error.exception"));
		return new ModelAndView("error",model);
	}
	
	@RequestMapping(value = "switch_user.html", method = RequestMethod.GET)
	public ModelAndView switch_user(@RequestParam(value="error", required=false) Boolean error) {
		ModelMap model = new ModelMap();
		model.addAttribute("error", error);
		return new ModelAndView("/admin/switch_user",model);
	}
	
	@RequestMapping(value = "charts.html")
	public ModelAndView charts(HttpServletRequest req) {
		ModelMap model = new ModelMap();

		return new ModelAndView("mainTemplate|charts",model);
	}
	

	
	@RequestMapping(value = "get_names.html")
	public ModelAndView getNames(@RequestParam("first") String first, @RequestParam("last") String last, @RequestParam("var_name") String var_name){
		ModelMap model = new ModelMap();
		model.addAttribute("first", first);
		model.addAttribute("last", last);
		model.addAttribute("var", var_name);
		return new ModelAndView("bodyOnlyTemplate|get_names", model);
	}
	
	@RequestMapping(value = "login.html", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required=false) String error, HttpServletRequest req) {
		ModelMap model = new ModelMap();
		model.addAttribute("error", error);
		return new ModelAndView("baseTemplateWide|login",model);
	}
	
	@RequestMapping(value = "logout.html", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest req, HttpServletResponse res) {
		ModelMap model = new ModelMap();
		req.getSession().invalidate();
		return new ModelAndView("redirect:index.html",model);
	}
	
	
	@RequestMapping(value = "roles.html")
	public String roles() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if( auth != null ){
			Collection<? extends GrantedAuthority> auths = auth.getAuthorities();
			for( GrantedAuthority ga : auths ){
				log.debug( ga.getAuthority() );
			}
		} else {
			log.debug( "no authentication object" );
		}
		return "redirect:/index.html";
	}
	
	
}