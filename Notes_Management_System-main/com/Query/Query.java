package com.Query;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.UserD.UserDetails;
public class Query {
    private Connection con;
    public Query(Connection con)
    {
    	super();
    	this.con=con;
    }
    public boolean registerQuery(UserDetails us)
    {
    	boolean f=false;
    	try {
    		String q="INSERT INTO `userdb`(`name`,`email`,`password`) VALUES(?,?,?)";
        	PreparedStatement s=con.prepareStatement(q);
        	s.setString(1,us.getName());
        	s.setString(2,us.getEmail());
        	s.setString(3, us.getPassword());
        	int c=s.executeUpdate();
        	if(c==1)
        	{
        		f=true;
        	}
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    	return f;
    }
    public UserDetails loginQuery(UserDetails us)
    {
    	UserDetails user=null;
    	try {
    		String q="SELECT * FROM `userdb` WHERE `email`=? AND `password`=?";
    		PreparedStatement s=con.prepareStatement(q);
    		s.setString(1, us.getEmail());
    		s.setString(2,us.getPassword());
    		ResultSet r=s.executeQuery();
    		if(r.next())
    		{
    			user = new UserDetails();
    			user.setName(r.getString("name"));
    			user.setEmail(r.getString("email"));
    			user.setPassword(r.getString("password"));
    			user.setId(r.getInt("id"));
    			
    		}
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    	return user;
    }
    
}
