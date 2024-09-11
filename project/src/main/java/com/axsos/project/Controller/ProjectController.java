package com.axsos.project.Controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.validation.BindingResult;

import com.axsos.project.Services.UserService;
import com.axsos.project.models.User;
import com.axsos.project.validator.UserValidator;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ProjectController {
	private UserService userService;
	  private UserValidator userValidator;

	public ProjectController(UserService userService , UserValidator userValidator) {
	        this.userService = userService;
	        this.userValidator=userValidator;
	    }

	@GetMapping("/registration")
	public String showRegistrationForm(@ModelAttribute("user") User user) {
		return "registrationPage";
	}
	
	 @PostMapping("/registration")
	    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
	        // NEW
	        userValidator.validate(user, result);
	        if (result.hasErrors()) {
	        	System.out.println(result.toString() + "^^^^^^");
	            return "registrationPage";
	        }
	        
	        userService.saveWithUserRole(user);
	        return "redirect:/login";
	    }

//	@PostMapping("/registration")
//	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
//			HttpSession session) {
//		if (result.hasErrors()) {
//			return "registrationPage.jsp";
//		}
//		userService.saveWithUserRole(user);
//		return "redirect:/login";
//	}
	 
	 
//	 @GetMapping("/login")
//	 public String login(@RequestParam(value="error", required=false) String error, 
//	                     @RequestParam(value="logout", required=false) String logout, 
//	                     Model model) {
//	     if (error != null) {
//	         model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
//	     }
//	     if (logout != null) {
//	         model.addAttribute("logoutMessage", "Logout Successful!");
//	     }
//	     model.addAttribute("loginUser", new LoginUser()); // Use LoginUser DTO
//	     return "loginPage";
//	 }
//
//	 @PostMapping("/loginn")
//	 public String login2(@Valid @ModelAttribute("loginUser") LoginUser loginUser, 
//	                      BindingResult result, 
//	                      Model model, 
//	                      HttpSession session) {
//	     User user = userService.findByEmail(loginUser.getEmail());
//	     if (user == null) {
//	         System.out.println("error +++@@+@+@+ user not found ");
//	         return "loginPage";
//	     }
//	     if (result.hasErrors()) {
//	         System.out.println("^^^^^FDDSDW&&&&");
//	         System.out.println("error = " + result.toString());
//	         return "loginPage";
//	     }
//	     System.out.println(user.getPassword());
//	     System.out.println(user.getEmail());
//	     System.out.println(user.getUserName());
//	     session.setAttribute("userLogin", user);
//	     return "homePage";
//	 }
//
//	 
	 
	 
	 
	 @RequestMapping("/login")
	 public String login(@RequestParam(value="error", required=false) String error, 
	                     @RequestParam(value="logout", required=false) String logout, 
	                     Model model, HttpSession session , HttpServletRequest request) {
	     if (error != null) {
	         model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
	         Exception
	         authException = (Exception) request.getSession().getAttribute(
	         "SPRING_SECURITY_LAST_EXCEPTION"
	         );        
	         if
	         (authException != null) {            
	         // Log the reason for the failure
	                     System.out.println(
	         "Login failed: "
	         + authException.getMessage());             model.addAttribute(
	         "errorMessage"
	         , authException.getMessage());         }
	         else
	         { model.addAttribute(
	         "errorMessage"
	         ,
	         "Invalid Credentials, Please try again."
	         ); }
	         
	         System.out.println("error ," + error );
	     }
	     if (logout != null) {
	         model.addAttribute("logoutMessage", "Logout Successful!");
	     }
	     //model.addAttribute("loginUser", new User()); // Add this line to ensure loginUser is available
	     return "loginPage";
	 }

//	 @PostMapping("/loginn")
//	 public String login2(@Valid @ModelAttribute("loginUser") User loginUser, 
//	                      BindingResult result, 
//	                      Model model, 
//	                      HttpSession session) {
//	     User user = userService.findByEmail(loginUser.getEmail());
//	     if (user == null) {
//	         System.out.println("error +++@@+@+@+ user not found ");
//	         return "loginPage";
//	     }
//	     if (result.hasErrors()) {
//	         System.out.println("^^^^^FDDSDW&&&&");
//	         System.out.println("error = " + result.toString());
//	         return "loginPage";
//	     }
//	     System.out.println(user.getPassword());
//	     return "";
//	 }


//	 @GetMapping("/login")
//	    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
//	        if(error != null) {
//	        	System.out.println("error =" + error.length() + "  "+ error.getClass() );
//	            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
//	        }
//	        if(logout != null) {
//	            model.addAttribute("logoutMessage", "Logout Successful!");
//	        }
//	        return "loginPage";
//	    }
//	 @PostMapping("/login")
//	 public String login2(@Valid @ModelAttribute("loginUser") User LoginUser ,Model model , BindingResult result ,HttpSession session ) {
//		 User user = userService.findByEmail(LoginUser.getEmail());
//		 if(user == null) {
//			 System.out.println("error +++@@+@+@+ user not found ");
//			 return "loginPage";
//		 }
//		 if(result.hasErrors()) {
//			 System.out.println("^^^^^FDDSDW&&&&");
//			 return "loginPage";
//		 }
//	System.out.println(	user.getPassword());
//		 
//		 return "";
//		 
//	 }
	    @RequestMapping(value = {"/home"})
	    public String home(Principal principal, Model model , HttpSession session) {
	        String email = principal.getName();
	      // System.out.println("*******email "+email);
	        model.addAttribute("currentUser", userService.findByUsername(email));
	        return "homePage";
	    }
	    
	    @RequestMapping("/admin")
	    public String adminPage(Principal principal, Model model) {
	        String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
	        return "adminPage";
	    }
}
