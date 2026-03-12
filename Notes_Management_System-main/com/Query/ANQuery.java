package com.Query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.UserD.Postdetails;
public class ANQuery {
	private Connection con;
    public ANQuery(Connection con)
    {
    	super();
    	this.con=con;
    }
    public boolean postQuery(String t,String c,int i)
    {
    	boolean f=false;
    	try {
    		String q="INSERT INTO `post`(`title`,`content`,`uid`) VALUES(?,?,?)";
        	PreparedStatement s=con.prepareStatement(q);
        	s.setString(1,t);
        	s.setString(2,c);
        	s.setInt(3, i);
        	int e=s.executeUpdate();
        	if(e==1)
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
   
    public List<Postdetails> getData(int id)
    {
    	List<Postdetails> list=new ArrayList<Postdetails>();
    	Postdetails p=null;
    	try {
    		String q="SELECT * FROM `post` WHERE `uid`=?";
    		PreparedStatement s=con.prepareStatement(q);
    		s.setInt(1, id);
    		ResultSet r=s.executeQuery();
    		while(r.next())
    		{
    			p=new Postdetails();
    			p.setId(r.getInt(1));
    			p.setTitle(r.getString(2));
    			p.setContent(r.getString(3));
    			p.setPdate(r.getTimestamp(4));
    			list.add(p);
    		}
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return list;
    }
    public Postdetails getInfo(int id)
    {
    	Postdetails p=null;
    	try {
    		String s="SELECT * FROM `post` WHERE `id`=?";
    		PreparedStatement p1=con.prepareStatement(s);
    		p1.setInt(1, id);
    		ResultSet r=p1.executeQuery();
    		while(r.next())
    		{
    			p=new Postdetails();
    			p.setId(r.getInt(1));
    			p.setTitle(r.getString(2));
    			p.setContent(r.getString(3));
    		}
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return p;
    	
    }
    public boolean setInfo(int id,String ti,String co)
    {
    
    	boolean f=false;
    	try {
    		String s="UPDATE `post` SET `title`=? , `content`=? WHERE `id`=?";
    		PreparedStatement p1=con.prepareStatement(s);
    		p1.setString(1, ti);
    		p1.setString(2, co);
    		p1.setInt(3, id);
    		int e=p1.executeUpdate();
    		if(e==1)
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
    public boolean delete(int id)
    {
    	boolean f=false;
    	try {
    		String s="DELETE FROM `post` WHERE `id`=?";
    		PreparedStatement p1=con.prepareStatement(s);
    		p1.setInt(1, id);
    		int e=p1.executeUpdate();
    		if(e==1)
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
}
