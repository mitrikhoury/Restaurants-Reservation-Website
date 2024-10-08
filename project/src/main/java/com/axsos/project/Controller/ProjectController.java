package com.axsos.project.Controller;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.validation.BindingResult;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.axsos.project.Services.TableService;
import com.axsos.project.Services.UserService;
import com.axsos.project.models.TableClass;
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

	private TableService tableService;

	public ProjectController(UserService userService, UserValidator userValidator, TableService tableService) {
		this.userService = userService;
		this.userValidator = userValidator;
		this.tableService = tableService;
	}

	@GetMapping("/registration")
	public String showRegistrationForm(@ModelAttribute("user") User user) {
		return "registrationPage";
	}

	@PostMapping("/registration")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		// NEW
		userValidator.validate(user, result);
		System.out.println(user.getUsername());
		if (result.hasErrors()) {
			System.out.println(result.toString() + "^^^^^^");
			model.addAttribute("errorMessageRegestration", "Validation failed: " + result.getAllErrors());
			return "registrationPage";
		}
		User us = userService.findByEmail(user.getEmail());  // null not acord  // not null acord
		
		if (us != null) {
			model.addAttribute("errorRegistration", "Pleace try with anther email . ");
            return "registrationPage";
		}
		
		if(!user.getPassword().equals(user.getPasswordConfirmation())) {
		  System.out.println("not match");
		  model.addAttribute("errorPassword", "password not match. ");
		}
		
		userService.saveWithUserRole(user);
	    return "redirect:/login";

	}

	@GetMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model, HttpSession session,
			HttpServletRequest request) {
		if (error != null) {
			model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
			Exception authException = (Exception) request.getSession().getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
			if (authException != null) {
				// Log the reason for the failure
				System.out.println("Login failed: " + authException.getMessage());
				model.addAttribute("errorMessage", authException.getMessage());
			} else {
				model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
			}

			System.out.println("error ," + error);
		}
		if (logout != null) {
			model.addAttribute("logoutMessage", "Logout Successful!");
		}
		// model.addAttribute("loginUser", new User()); // Add this line to ensure
		// loginUser is available
		return "loginPage";
	}

	@PostMapping("/loginn")
	public String login2(@ModelAttribute("loginUser") User loginUser, BindingResult result, Model model,
			HttpSession session) {
		if (result.hasErrors()) {
			model.addAttribute("errorMessage", "Validation failed: " + result.getAllErrors());
			return "loginPage";
		}

		// Fetch the user from the database using the email
		User user = userService.findByEmail(loginUser.getEmail());
		if (user == null) {
			model.addAttribute("errorMessage", "User not found.");
			return "loginPage";
		}

		// Initialize BCryptPasswordEncoder
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		// Compare the hashed password from the form with the one stored in the database
		if (!passwordEncoder.matches(loginUser.getPassword(), user.getPassword())) {
			System.out.println("Stored (hashed) password: " + user.getPassword());
			System.out.println("Entered password: " + loginUser.getPassword());
			model.addAttribute("errorMessage", "Invalid password.");
			return "loginPage";
		}

		// Login success, set user in session and redirect to the dashboard
		session.setAttribute("loggedInUser", user);
		return "redirect:/home";
	}

	@RequestMapping(value = { "/home" })
	public String home(Principal principal, Model model, HttpSession session) {
		// String email = principal.getName();

		User user = (User) session.getAttribute("loggedInUser");
		List<TableClass> Tables = tableService.findTablesByUser(user);
		model.addAttribute("userTables", Tables);
		return "homePage";
	}

	/// *******************************************
	@GetMapping("/tables/new")
	public String newTable(@ModelAttribute("table") TableClass table, HttpSession session) {
		if (session.getAttribute("loggedInUser").equals(null)) {
			return "/login";
		}

		return "newTable";
	}

	@PostMapping("/tables/new")
	public String newTable2(@Valid @ModelAttribute("table") TableClass table, BindingResult result,
			HttpSession session) {
		if (session.getAttribute("loggedInUser").equals(null)) {
			return "/login";
		}
		if (result.hasErrors()) {
			return "newTable";
		}

		User user = (User) session.getAttribute("loggedInUser");

		table.setUser(user);
		tableService.createTable(table);
		return "redirect:/home";

	}

	@GetMapping("/tables")
	public String allTables(HttpSession session, Model model) {
		if (session.getAttribute("loggedInUser").equals(null)) {
			return "/login";
		}
		User user = (User) session.getAttribute("loggedInUser");
		List<TableClass> Tables = tableService.getTablesWithUserId();
		List<TableClass> OpenTables = tableService.getTablesWithoutUserId();

		model.addAttribute("Tables", Tables);
		model.addAttribute("Open_table", OpenTables);
		return "allTablles";
	}

	@GetMapping("/tables/{id}/edit")
	public String edit(@PathVariable("id") Long id, HttpSession session, Model model) {
		if (session.getAttribute("loggedInUser").equals(null)) {
			return "/login";
		}
		TableClass table = tableService.findTable(id);
		if (table == null) {
			return "homePage";
		}
		User user = (User) session.getAttribute("loggedInUser");
		System.out.println("user id " + user.getId());
		System.out.println("user id of table =" + table.getUser().getId());
		model.addAttribute("table", table);
		if (user.getId() == table.getUser().getId()) {
			return "editTable";
		} else {
			System.out.println("you dont have access to this table ");
			return "access-denied";// add page for access denied
		}

	}

	@PostMapping("/tables/{id}/edit")
	public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("table") TableClass table,
			BindingResult result, HttpSession session) {
		if (session.getAttribute("loggedInUser").equals(null)) {
			return "/login";
		}
		if (result.hasErrors()) {
			return "editTable";
		}
		User user = (User) session.getAttribute("loggedInUser");
		tableService.updateTable(new TableClass(id, table.getNameGuest(), table.getNumberOfGuests(), table.getNotes(),
				table.getCreatedAt(), user));
		return "redirect:/home";
	}

	@PostMapping("/table/delete/{id}")
	public String deletetable(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("loggedInUser").equals(null)) {
			return "/login";
		}

		tableService.deleteTable(tableService.findTable(id));
		return "redirect:/home";
	}

	@PostMapping("/Give_Up_Table/{id}")
	public String Give_up_Table(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login";
		}
		tableService.giveUpTable(id);
		return "redirect:/tables";
	}

	@PostMapping("/Pick_Up_Table/{id}")
	public String Pick_up_table(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login";
		}
		User user = (User) session.getAttribute("loggedInUser");
		tableService.pickUpTable(id, user);
		return "redirect:/home";
	}
	
	@RequestMapping("/")
	public String page() {
		return "mainPage";
	}
    @RequestMapping("/access-denied")
    public String accessDenied() {
        return "access-denied";  // This should be the name of your JSP file without the .jsp extension
    }
	

	@RequestMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		String username = principal.getName();

		model.addAttribute("currentUser", userService.findByUsername(username));
		return "adminPage";
	}
}
