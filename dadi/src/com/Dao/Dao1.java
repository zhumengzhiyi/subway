package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Bean.Bean1;
import com.Util.Util1;

public class Dao1 {
	
	public List<Bean1> selectByName(String name) {
		List<Bean1> list = new ArrayList<Bean1>();
		try {
	        //获得链接对象
	        Connection connection = Util1.getConnection();
			String sql = "select * from date where name=?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,name);
			System.out.println("遍历");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Bean1 subject = new Bean1();
				subject.setID(rs.getInt("ID"));
				System.out.println(rs.getInt("ID"));
				subject.setName(rs.getString("name"));
				System.out.println(rs.getString("name"));
				subject.setNol(rs.getString("nol"));
				list.add(subject);
			}
			rs.close();
			pstmt.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//由线路查询，车站点
	public List<Bean1> selectByNol(String nol) {
		List<Bean1> list = new ArrayList<Bean1>();
		try {
	        //获得链接对象
	        Connection connection = Util1.getConnection();
			String sql = "select * from date where nol=?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,nol);
			System.out.println("遍历");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Bean1 subject = new Bean1();
				subject.setID(rs.getInt("ID"));
				subject.setName(rs.getString("name"));
				System.out.println(rs.getString("name"));
				subject.setNol(rs.getString("nol"));
				list.add(subject);
			}
			rs.close();
			pstmt.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	    

}
