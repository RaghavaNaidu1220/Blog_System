package com.blog.controller;


import java.io.IOException;
import java.io.InputStream;
import java.net.http.HttpHeaders;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.blog.entity.Admin;
import com.blog.entity.Contact;
import com.blog.entity.CreateBlog;
import com.blog.entity.User;
import com.blog.entity.comment;
import com.blog.model.AdminService;
import com.blog.model.CommentService;
import com.blog.model.ContactService;
import com.blog.model.CreateBlogService;
import com.blog.model.UserService;
import com.mysql.cj.Session;

import io.micrometer.core.instrument.util.IOUtils;
import io.micrometer.core.ipc.http.HttpSender.Request;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.PathParam;

@Controller
//@RequestMapping("/user/")
public class UserController {

	@Autowired
	UserService us;
	
	@Autowired
	AdminService as;
	
	@Autowired
	CreateBlogService cbs;
	
	@Autowired
	CommentService cs;
	
	@Autowired
	ContactService cos;
	
	@GetMapping("/")
	public String main()
	{
		return "redirect:/home";
	}
	
	@GetMapping("/home")
	 public ModelAndView viewbloghome(@RequestParam(name = "refresh", defaultValue = "false") boolean refresh) {
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("index");
//		
	    // ModelAndView mv = new ModelAndView();

	     // Retrieve user details based on the user ID
	     
//	     if (refresh) {
//	         // Add a check to prevent continuous refresh
//	         String refreshScript = "<script>location.reload(true);</script>";
//	         mv.addObject("refreshScript", refreshScript);
//	     }
	     
	     List<CreateBlog> bloglist = cbs.viewAllBlog();
	     mv.addObject("blogs", bloglist);

	     return mv;
	 }
	
	@GetMapping("/viewblog")
	public ModelAndView viewblognuser(@RequestParam("id") int id) {
		// Retrieve the blog and comment data by ID
	     CreateBlog cb = cbs.getBlogWithComments(id);
	     //comment comments = as.viewallcommentbyid(id); // Assuming you have a list of comments

	     // Create a ModelAndView and pass both the blog and comments to the view
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("userpreviewblogs");
	     mv.addObject("blog", cb); // Add the blog to the model
	     //mv.addObject("comment", comments); // Add the comments to the model

	     return mv;
	 }
	
	@PostMapping("insert")
	public ModelAndView insertaction(HttpServletRequest request) {
	    String msg = null;
	    ModelAndView mv = new ModelAndView();

	    try {
	        String name = request.getParameter("username");
	        String email = request.getParameter("email");
	        String pass = request.getParameter("pass");

	        User emp = new User();
	        emp.setUsername(name);
	        emp.setEmail(email);
	        emp.setPass(pass);

	       

	        msg = us.AddUser(emp);

	        mv.setViewName("login");
	        mv.addObject("message", msg);
	    } catch (Exception e) {
	        msg = "Invalid Register";
	        mv.setViewName("register");
	        mv.addObject("message", msg);
	        request.setAttribute("errorMessage", "Invalid Register. Please try again.");
	    }

	    return mv;
	}

	
																				//Create Blog
	
	@GetMapping("addBlog")
	public ModelAndView addblogdemo()
	{
		ModelAndView mv = new ModelAndView("addblog");
		return mv;
	}
	
	

	@PostMapping("insert-blog-post")
	public ModelAndView insertblog(HttpServletRequest request, @RequestParam("image") MultipartFile file) throws IOException, SQLException {
	    String msg = null;
	    ModelAndView mv = new ModelAndView();

	    try {
	        String title = request.getParameter("title");
	        String author = request.getParameter("author");
	        String content = request.getParameter("content");
	        int uid=Integer.parseInt(request.getParameter("uid"));

	        byte[] bytes = file.getBytes();
	       Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
	       
	       User user = us.viewuserbyid(uid);
	        CreateBlog cb = new CreateBlog();
	        cb.setTitle(title);
	        cb.setAuthor(author);
	        cb.setContent(content);
	        cb.setImage(blob);
	        cb.setUid(user);

	        msg = cbs.Addblog(cb);
	        System.out.println(msg);
	        
//	        String refreshScript = "<script>location.reload(true);</script>";
//	        mv.addObject("refreshScript", refreshScript);
	        
	        mv.setViewName("viewAllblog");
	        mv.addObject("message", msg);
	    } catch (Exception e) {
	        msg = e.getMessage();
	        System.out.println(msg.toString());
	        mv.setViewName("CreatePost");
	        mv.addObject("message", msg);
	    }
	   // return new ModelAndView("redirect:/viewAllblog?refresh=true");
	    return mv;

	}
	
	
	@PostMapping("addcomment")
		public String addComment(@RequestParam int id, @RequestParam String comment,@RequestParam String name,@RequestParam int uid, HttpServletRequest request) {
		    // Get the name from the request parameter
			 String msg = null;
			    
			    ModelAndView mv = new ModelAndView();
			    
			    HttpSession session = request.getSession();
			    
			      mv.addObject("name", session.getAttribute("ename"));
			      mv.addObject("userid",session.getAttribute("uid"));
			     // int eid = (int) session.getAttribute("eid");
			      
			      try
				   {
			    	  String uname = request.getParameter("namme");
			    	  
			    	  
			    	  User emp = new User();
			    	  emp.setName(uname);
			    	
				     msg = us.updateUser(emp);
				      mv.setViewName("viewblogindetail");
				      mv.addObject("message",msg);
				   } catch(Exception e) {
					   msg = e.getMessage();
					     
					     mv.setViewName("viewAllblog");
					      mv.addObject("message",msg);
				   }
			
			comment c = new comment();
	     c.setName(name);
	     c.setComment(comment);
	     c.setUid(uid);
	     cs.AddComment(id, c);
	     return "redirect:/viewblogindetail?id=" + id;
		}

	@PostMapping("AddContact")
	public ModelAndView AddContact(HttpServletRequest request) {
		String msg = null;
	    ModelAndView mv = new ModelAndView();

	    try {
	       String  name = request.getParameter("name");
	       String email = request.getParameter("email");
	         String message = request.getParameter("message");

	        Contact emp = new Contact();
	        emp.setName(name);
	        emp.setEmail(email);
	        emp.setMessage(message);

	       

	        msg = cos.AddContact(emp);

	        mv.setViewName("dashboard");
	        mv.addObject("message", msg);
	    } catch (Exception e) {
	        msg = "Invalid Register";
	        mv.setViewName("Contact");
	        mv.addObject("message", msg);
	        request.setAttribute("errorMessage", "Invalid Contact. Please try again.");
	    }

	    return mv;
	}
	
	@PostMapping("AddContacts")
	public ModelAndView AddContacts(HttpServletRequest request) {
		String msg = null;
	    ModelAndView mv = new ModelAndView();

	    try {
	       String  name = request.getParameter("name");
	       String email = request.getParameter("email");
	         String message = request.getParameter("message");

	        Contact emp = new Contact();
	        emp.setName(name);
	        emp.setEmail(email);
	        emp.setMessage(message);

	       

	        msg = cos.AddContact(emp);

	        mv.setViewName("home");
	        mv.addObject("message", msg);
	    } catch (Exception e) {
	        msg = "Invalid Register";
	        mv.setViewName("Contact");
	        mv.addObject("message", msg);
	        request.setAttribute("errorMessage", "Invalid Contact. Please try again.");
	    }

	    return mv;
	}
	
	@PostMapping("login")
	public ModelAndView checklogin(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();

	    String email = request.getParameter("email");
	    String pass = request.getParameter("pass");

	    Admin admin = as.checkadminlogin(email, pass);
	    User emp = us.checklogin(email, pass);

	    if (admin != null) {
	        mv.setViewName("admindash");
	    } else if (emp != null) {
	        // Session
	        HttpSession session = request.getSession();

	        session.setAttribute("eid", emp.getId());
	        session.setAttribute("ename", emp.getName());
	        session.setAttribute("eemail", emp.getEmail());
	        session.setAttribute("eusername", emp.getUsername());
	        session.setAttribute("econtact", emp.getContactno());
	        session.setAttribute("epass", emp.getPass());
	        session.setAttribute("image", emp.getImage());

	        // Fetch the list of blogs
	        List<CreateBlog> bloglist = cbs.viewAllBlog();

	        // Set the list of blogs in the session
	        session.setAttribute("blogs", bloglist);

	        mv.setViewName("viewAllblog");
	    } else {
	        mv.setViewName("login");
	        mv.addObject("message", "Login Failed");
	        request.setAttribute("errorMessage", "Incorrect email or password. Please try again.");
	    }

	    return mv;
	}

	
	@PostMapping("/countusers")
	public ModelAndView Countnoofusers(ModelAndView modelAndView) {
	    long usercount = as.countuser();
	    modelAndView.addObject("usercount", usercount);
	    modelAndView.setViewName("admindash");
	    return modelAndView;
	}

	
	@PostMapping("update")
	public ModelAndView updateAction(HttpServletRequest request, @RequestParam("contact") String contact, @RequestParam("image") MultipartFile file) throws IOException, SQLException {
	    String msg = null;
	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    mv.addObject("id", session.getAttribute("eid"));
	    mv.addObject("name", session.getAttribute("ename"));
	    mv.addObject("username", session.getAttribute("eusername"));
	    mv.addObject("email", session.getAttribute("eemail"));
	    mv.addObject("contact", session.getAttribute("econtact"));
	    mv.addObject("pass", session.getAttribute("epass"));
	    mv.addObject("image", session.getAttribute("image"));

	    int id = (int) session.getAttribute("eid");

	    try {
	        String name = request.getParameter("name");
	        String username = request.getParameter("username");
	        String contact1 = request.getParameter("contact");
	        String email = request.getParameter("email");
	        String pass = request.getParameter("pass");

	        User emp = new User();
	        emp.setId(id);
	        emp.setName(name);
	        emp.setUsername(username);
	        emp.setContactno(contact1);
	        emp.setEmail(email);
	        emp.setPass(pass);

	        // Check if the file content is present before processing it
	        if (file != null && file.getBytes().length > 0) {
	            byte[] bytes = file.getBytes();
	            Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
	            emp.setImage(blob);
	        }

	        msg = us.updateUser(emp);

	        // Set a flag or message to indicate that the image is not provided
	        if (msg.equals("Image is null")) {
	            mv.addObject("imgmsg", "Image is not provided");
	        }

	        // Redirect to the userprofile controller with the username parameter
	        return new ModelAndView("redirect:/profile/" + username);

	    } catch (Exception e) {
	        msg = e.getMessage();
	        mv.setViewName("login");
	        mv.addObject("message", msg);
	    }
	    return mv;
	}
	
	
	@GetMapping("/blog-update")
	public ModelAndView updateBlog(@RequestParam("id") int id) {
	    ModelAndView mv = new ModelAndView("viewblogindetailbyuseredit");
	    CreateBlog cr = cbs.getBlogWithComments(id);
	    mv.addObject("blog", cr);
	    mv.addObject("id", id);
	    return mv;
	}

	
	@PostMapping("updateblog")
	public ModelAndView updateblog(HttpServletRequest request) throws IOException, SQLException {
	    String msg = null;
	    HttpSession session=request.getSession();
	    ModelAndView mv = new ModelAndView();

	    try {
	        int id=Integer.parseInt(request.getParameter("id"));
	        String title = request.getParameter("title");
	        //String author=request.getParameter("author");
	        String content = request.getParameter("content");
	       // int userid =Integer.parseInt(request.getParameter("uid"));

	       // System.out.println("uid: " + userid);

	        CreateBlog emp = new CreateBlog();
	        emp.setId(id);
	        emp.setTitle(title);
	        emp.setContent(content);

	        msg = cbs.updateblog(emp);

	        return new ModelAndView("redirect:/viewblogwithcommentbyuid?id=" + id);
	    } catch (Exception e) {
	        msg = e.getMessage();
	        mv.setViewName("viewAllblog");
	        mv.addObject("message", msg);
	        System.out.println("error");
	    }
	    return mv;
	}




	
	 @GetMapping("loghome")
	  public ModelAndView loghome(HttpServletRequest request)
	  {
		HttpSession session = request.getSession();
		int eid = (int)session.getAttribute("id"); //eid is a session variable
		String ename = (String)session.getAttribute("name"); //ename is a session variable
		
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("loghome");
	    
	    mv.addObject("eid", eid);
	    mv.addObject("ename", ename);
	    return mv;
	  }
	 
	 @GetMapping("updateprofile")
	  public ModelAndView updateuser(HttpServletRequest request)
	  {
	    ModelAndView mv = new ModelAndView();
	    
	    HttpSession session = request.getSession();
	    
	    mv.setViewName("userprofileedit");
	    
	    mv.addObject("eid", session.getAttribute("eid"));
	    mv.addObject("ename", session.getAttribute("ename"));
	    mv.addObject("eusername", session.getAttribute("eusername"));
	    mv.addObject("eemail", session.getAttribute("eemail"));
	    mv.addObject("econtact", session.getAttribute("econtact"));
	    mv.addObject("epass", session.getAttribute("epass"));
	    mv.addObject("image", session.getAttribute("image"));
	    
	    int id = (int) session.getAttribute("eid");
	    
	    User emp = us.viewuserbyid(id);
	    
	    mv.addObject("emp", emp);
	    
	    return mv;
	  }
	 
	 @GetMapping("/userlognav")
	 public ModelAndView userLogNav(HttpServletRequest request) {
	     HttpSession session = request.getSession();

	     // Retrieve user details from the session
	     int eid = (int) session.getAttribute("eid");

	     // Fetch the latest user details from the database
	     User user = us.viewuserbyid(eid);

	     // Create a ModelAndView and set user details in the model attribute
	     ModelAndView mv = new ModelAndView("userlognav");
	     mv.addObject("user", user);

	     return mv;
	 }


	/* @GetMapping("/user-image/{username}")
	    public ResponseEntity<byte[]> getUserImage(@PathVariable String username) {
	        byte[] imageBytes = us.getUserImageByUsername(username);

	        // If image is null, return default avatar image
	        if (imageBytes == null) {
	            // Load and serve default avatar image
	            try {
	                InputStream inputStream = getClass().getResourceAsStream("/static/path/to/default-avatar.jpg");
	                imageBytes = IOUtils.toByteArray(inputStream);
	            } catch (IOException e) {
	                e.printStackTrace(); // Handle exception appropriately
	            }
	        }

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.IMAGE_JPEG);
	        return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
	    }
	 */
	 
	 @GetMapping("displayprofileimage")
	 public ResponseEntity<byte[]> displayprofileimage(@RequestParam("id") int id) throws IOException, SQLException {
	     User user = us.viewuserbyid(id);
	     
	     if (user != null && user.getImage() != null) {
	         byte[] imageBytes = user.getImage().getBytes(1, (int) user.getImage().length());
	         return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	     } else {
	         // If no user or no image, return a default image or handle it as needed
	         return ResponseEntity.notFound().build();
	     }
	 }

	 
	 @GetMapping("viewalluser")
		public ModelAndView viewemps()
		{
			List<User>userlist=as.viewalluser();
			
			ModelAndView mv=new ModelAndView("viewalluser");
			mv.addObject("userdata", userlist);
			return mv;
			
		}
	 
	 @GetMapping("viewallblogsadmin")
	 public ModelAndView viewblogsadmin() {
		 List<CreateBlog> cblist=cbs.viewAllBlog();
		 ModelAndView mv=new ModelAndView("viewallpostadmin");
		 mv.addObject("blogadmin",cblist);
		 return mv;
	 }
	 
	 @GetMapping("viewAllblog")
	 public ModelAndView viewblog(@RequestParam(name = "refresh", defaultValue = "false") boolean refresh) {
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("viewAllblog");
//		
	    // ModelAndView mv = new ModelAndView();

	     // Retrieve user details based on the user ID
	     
//	     if (refresh) {
//	         // Add a check to prevent continuous refresh
//	         String refreshScript = "<script>location.reload(true);</script>";
//	         mv.addObject("refreshScript", refreshScript);
//	     }
	     
	     List<CreateBlog> bloglist = cbs.viewAllBlog();
	     mv.addObject("blogs", bloglist);

	     return mv;
	 }


	 
	 @GetMapping("viewallblogmyuid{uid}")
	 public ModelAndView viewblogsbyuid(@PathVariable int uid) {
	     // Retrieve blogs based on the uid path variable and sorted by user id
	     List<CreateBlog> blogs = cbs.viewallblogbyuidSortedByUid(uid);

	     ModelAndView mv = new ModelAndView();
	     mv.addObject("blogs", blogs);
	     mv.setViewName("viewblogbyuserid");

	     return mv;
	 }




	 
	 @GetMapping("viewblogindetail")
	 public ModelAndView viewblogindetail(@RequestParam("id") int id) {
		 CreateBlog cb=as.viewallbyblogid(id);
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("viewblogindetail");
		 mv.addObject("blog",cb);
		 return mv;
	 }
	 
	 @GetMapping("viewallcomments/{blog_id}")
	 public ModelAndView viewallcomments(@RequestParam("id")int id) {
		 ModelAndView mv = new ModelAndView();
		    List<comment> comments = cs.allcomment(id); // Replace with your actual service method to get comments.
		    mv.addObject("comments", comments);
		    mv.setViewName("viewAllComments"); // Create a view to display all comments.
		    return mv;
		 
		 
	 }
	 
	 @GetMapping("displayuserimage")
	 public ResponseEntity<byte[]> displayuserimage(@RequestParam("id")int id) throws IOException, SQLException{
		 User img = us.viewuserbyid(id);
		 byte[] imagebytes=null;
		 imagebytes = img.getImage().getBytes(1,(int) img.getImage().length());
		 return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imagebytes);
	 }
	 
	 @GetMapping("displayproimage")
	 public ResponseEntity<byte[]> displayprodimagedemo(@RequestParam("id") int id) throws IOException, SQLException {
	     CreateBlog post =  cbs.viewallblogsbyid(id);
	     byte [] imageBytes = null;
	      imageBytes = post.getImage().getBytes(1,(int) post.getImage().length());

	     return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	 }
	 
	 @GetMapping("viewalluserdetails")
	 public ModelAndView viewempdemo(@RequestParam("id") int id)
	   {
	     User user = as.viewallbyid(id);
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("viewalluserdetails");
	     mv.addObject("user", user);
	     return mv;
	   }
	 
	 @GetMapping("/viewpostindetail")
	 public ModelAndView viewpostdetail(@RequestParam("id") int id) {
	     // Retrieve the blog and comment data by ID
	     CreateBlog cb = cbs.getBlogWithComments(id);
	     //comment comments = as.viewallcommentbyid(id); // Assuming you have a list of comments

	     // Create a ModelAndView and pass both the blog and comments to the view
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("viewallpostdetails");
	     mv.addObject("blog", cb); // Add the blog to the model
	     //mv.addObject("comment", comments); // Add the comments to the model

	     return mv;
	 }
	 
	 @GetMapping("/viewallmsg")
	 public ModelAndView viewallmsg() {
		 ModelAndView mv=new ModelAndView();
		  mv.setViewName("viewallcontact");
///*
//	     if (refresh) {
//	         // Add a check to prevent continuous refresh
//	         String refreshScript = "<script>location.reload(true);</script>";
//	         mv.addObject("refreshScript", refreshScript);
//	     }
	     
	     List<Contact> bloglist = as.viewallmsg();
	     mv.addObject("contact", bloglist);

	     return mv;
		 
		
		 
	 }

		 /*		 CreateBlog cb=as.viewallbyblogid(id);
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("viewallpostdetails");
		 mv.addObject("blog",cb);
		 return mv;*/
	 
	 @GetMapping("/viewblogwithcommentinuser")
	 public ModelAndView viewblogwithcommentinuser(@RequestParam("id") int id) {
		// Retrieve the blog and comment data by ID
	     CreateBlog cb = cbs.getBlogWithComments(id);
	     //comment comments = as.viewallcommentbyid(id); // Assuming you have a list of comments

	     // Create a ModelAndView and pass both the blog and comments to the view
	     ModelAndView mv = new ModelAndView();
	     mv.setViewName("viewblogindetail");
	     mv.addObject("blog", cb); // Add the blog to the model
	     //mv.addObject("comment", comments); // Add the comments to the model

	     return mv;
	 }
	 
	 @GetMapping("/viewblogwithcommentbyuid")
	 public ModelAndView viewblogwithcommentuserbyuid(@RequestParam("id") int id) {
			// Retrieve the blog and comment data by ID
		     CreateBlog cb = cbs.getBlogWithComments(id);
		     //comment comments = as.viewallcommentbyid(id); // Assuming you have a list of comments

		     // Create a ModelAndView and pass both the blog and comments to the view
		     ModelAndView mv = new ModelAndView();
		     mv.setViewName("viewblogindetailofuser");
		     mv.addObject("blog", cb); // Add the blog to the model
		     //mv.addObject("comment", comments); // Add the comments to the model

		     return mv;
		 }
	 
	 
	 @GetMapping("viewallcommentsbyidadmin")	
	 public ModelAndView viewallcommentbyidadmin() {
		 
		 ModelAndView mv=new ModelAndView();
		mv.setViewName("viewAllcomments");
		List<comment> userlist =as.ViewallComments();
		mv.addObject("comment", userlist);
		return mv;
		/*List<CreateBlog> cblist=cbs.viewAllBlog();
		 ModelAndView mv=new ModelAndView("viewallpostadmin");
		 mv.addObject("blogadmin",cblist);
		 return mv;*/
		}
	 
	 
	 
	 @GetMapping("viewallcommentsbyid")
	 public ModelAndView viewallcommentsbyid(@RequestParam("id") int id) {
		 comment cb=cs.viewallcomment(id);
		 ModelAndView mv=new ModelAndView();
		 mv.setViewName("viewblogindetail");
		 mv.addObject("blogadmin",cb);
		 return mv;
	 }
	 
	 @GetMapping("/profile/{username}")
	 public ModelAndView userprofile(@PathVariable("username") String username) {
	     ModelAndView mv = new ModelAndView("userprofile");

	     // Retrieve user details based on the username
	     User user = us.getUserByUsername(username);

	     // Pass the user details to the view
	     mv.addObject("user", user);

	     return mv;
	 }
	 
	 @GetMapping("/profile/{username}/update")
	 public ModelAndView userprofileedit(@PathVariable("username") String username) {
	     ModelAndView mv = new ModelAndView("userprofileedit");

	     // Retrieve user details based on the username
	     User user = us.getUserByUsername(username);

	     // Pass the user details to the view
	     mv.addObject("user", user);

	     return mv;
	 }
	 
	 @GetMapping("/author/{authorname}")
	 public ModelAndView blogauthor(@PathVariable("authorname") String username) {
	     ModelAndView mv = new ModelAndView();

	     // Retrieve user details based on the user ID
	     User user = us.getUserByUsername(username);
	     mv.addObject("user", user);

	     // Retrieve all blogs by the user ID
	     List<CreateBlog> blogs = cbs.viewallblogbyauthor(username);
	     mv.addObject("blogs", blogs);

	     mv.setViewName("profile");
	     return mv;
	 }




	 
	 @GetMapping("deleteuser/{id}")
	 public String deleteuser(@PathVariable("id") int id) {
		 as.deleteuser(id);
		 return"redirect:/viewalluser";
	 }
	 
	 @GetMapping("deletepost/{id}")
	 public String deletepost(@PathVariable("id") int id) {
		 as.deletepost(id);
		 return"redirect:/viewallblogsadmin";
	 }
	 
	 @GetMapping("/deleteuserpost/{id}")
	 public String deleteuserpost(@PathVariable("id") int id, @RequestParam("uid") int uid, HttpServletRequest request) {
	     ModelAndView mv = new ModelAndView();
	     
	     HttpSession session = request.getSession();
	     mv.addObject("eid", session.getAttribute("eid"));
	     as.deletepost(id);
	     int eid = (int) session.getAttribute("eid");
	     return "redirect:/viewallblogmyuid" + eid;
	 }

	 
	 @GetMapping("deletecommentadmin/{id}")
	 public String deletecommentadmin(@PathVariable("id") int id) {
		 as.deletecommentadmin(id);
		 return"redirect:/viewallcommentsbyidadmin";
	 }
	 
	 @GetMapping("deletecomment/{id}")
	 public String deletecomment(@PathVariable("id") int id) {
		 
		 as.deletecomment(id);
		 return"redirect:/viewallpostdetails?id=" + id;
	 }
	 
	 @GetMapping("deletecommentbyauthor/{commentid}")
	 public String deletecommentbyuser(@PathVariable("commentid") int commentid,@RequestParam("id") int id) {
//		 
//	     
//	     HttpSession session = request.getSession();
//	     mv.addObject("blogid", session.getAttribute("id"));
		 as.deletecomment(commentid);
		// int bid = (int) session.getAttribute("id");
		 return"redirect:/viewblogwithcommentbyuid?id=" + id;
	 }
	 
	 @GetMapping("/deleteuserimage/{id}")
	 public String deleteuserimage(@PathVariable("id") int id, @RequestParam("username") String username, HttpServletRequest request) {
	     try {
	         String message = us.deleteprofileimage(id);
	         return "redirect:/profile/"+username+"/update";
	     } catch (Exception e) {
	         // Handle exceptions appropriately (e.g., log them)
	         e.printStackTrace();
	         return "redirect:/error"; // Redirect to an error page
	     }
	 }

	
}
