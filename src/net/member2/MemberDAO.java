package net.member2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.bbs.BbsDTO;
import net.utility.Utility;
import DBPKG.DBOpen;

public class MemberDAO {

	public int login(String id,String passwd){
		int res=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql= new StringBuilder();
			sql.append(" select count(id) as cnt ");
			sql.append(" from member ");
			sql.append(" where id=? AND passwd=? ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				res=rs.getInt("cnt");
			}
		}catch(Exception e){System.out.println("로그인 실패"+e);}
		return res;
	}

}

