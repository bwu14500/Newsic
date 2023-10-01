package Util;
import java.util.*;

/**
 * The class used to model a business
 */
public class Users {
    
	//TODO Initialization code
	private String name;
	private String email;
	private String password;
	private String genre;
	private String time;
	private String bio;
	private ArrayList<Post> UserPosts;
	
	
	public ArrayList<Post> getUserPosts() {
		return UserPosts;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getGenre() {
		return genre;
	}
	public String getTime() {
		return time;
	}
	public String getBio() {
		return bio;
	}
	
	public Users(String name, String email, String password, String genre, String time, String bio, ArrayList<Post> UserPosts) {
		
		this.name = name;
		this.email = email;
		this.password = password;
		this.genre = genre;
		this.time = time;
		this.bio = bio;
		this.UserPosts = UserPosts;
		
	}
}

