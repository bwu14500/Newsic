package Util;
import java.util.*;

/**
 * The class used to model a business
 */
public class Post {
    
	//TODO Initialization code
	private String time;
	private String name;
	private String track;
	


	private String collection;
	private String url;
	private String artUrl;
	private String comment;

	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getName() {
		return name;
	}
	public String getCollection() {
		return collection;
	}
	public String getUrl() {
		return url;
	}
	public String getArtUrl() {
		return artUrl;
	}

	public String getTrack() {
		return track;
	}
	public String getComment() {
		return comment;
	}

	
	
	public Post(String time, String name, String track, String collection, String url, String artUrl, String comment) {
		this.time = time;
		this.name = name;
		this.track = track;
		this.collection = collection;
		this.url = url;
		this.artUrl = artUrl;
		this.comment = comment;
	}
	
	

	
	
}

