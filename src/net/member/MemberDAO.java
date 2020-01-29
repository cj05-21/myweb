package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.bbs.BbsDTO;
import net.utility.Utility;
import DBPKG.DBOpen;

public class MemberDAO {
	//Data Aceess Object 데이터베이스 관련 작업

	public String loginProc(MemberDTO dto){
		String mlevel=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql= new StringBuilder();
			sql.append(" select mlevel ");
			sql.append(" from member ");
			sql.append(" where id=? and passwd=? ");
			sql.append(" and mlevel in ('A1','B1','C1','D1') ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				mlevel=rs.getString("mlevel");

			}else{
				mlevel=null;
			}
			
		}catch(Exception e){System.out.println("로그인 실패"+e);}
		return mlevel;
	}

	public int duplecateID(String id){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql= new StringBuilder();
			sql.append(" select count(*) as cnt ");
			sql.append(" from member ");
			sql.append(" where id=? ");
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			ResultSet rs= pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("cnt");
			}
		}catch(Exception e){System.out.println("아이디 중복 확인 실패"+e);}
		return cnt;
	}
	public int duplecateEmail(String email){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql= new StringBuilder();
			sql.append(" select count(*) as cnt ");
			sql.append(" from member ");
			sql.append(" where email=? ");
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			ResultSet rs= pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("cnt");
			}
		}catch(Exception e){System.out.println("이메일 중복 확인 실패"+e);}
		return cnt;
	}

public int insert(MemberDTO dto){
	int cnt=0;
	try{
		Connection con=DBOpen.getConnection();
		StringBuilder sql=new StringBuilder();
		sql.append(" insert into member(id,passwd,mname,tel,email,zipcode,address1,address2,job,mlevel,mdate ) ");
		sql.append(" values( ?,?,?,?,?,?,?,?,?   " );
		sql.append("  ,'D1',sysdate ");
		sql.append("  )");
		PreparedStatement pstmt= con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPasswd());
		pstmt.setString(3, dto.getMname());
		pstmt.setString(4, dto.getTel());
		pstmt.setString(5, dto.getEmail());
		pstmt.setString(6, dto.getZipcode());
		pstmt.setString(7, dto.getAddress1());
		pstmt.setString(8, dto.getAddress2());
		pstmt.setString(9, dto.getJob());
		
		cnt=pstmt.executeUpdate();
	}catch(Exception e){System.out.println("회원정보 입력 실패"+e);}
	return cnt;
}

public MemberDTO memberRead(String id, String passwd){
	MemberDTO dto=null;
	try{
	Connection con=DBOpen.getConnection();
	StringBuilder sql= new StringBuilder();
	sql.append(" select id,passwd,mname,tel,email,zipcode,address1,address2,job,mlevel,mdate ");
	sql.append(" from member ");
	sql.append(" where id=? AND passwd=? ");
	PreparedStatement pstmt=con.prepareStatement(sql.toString());
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	ResultSet rs=pstmt.executeQuery();
	if(rs.next()){
		dto=new MemberDTO();
		dto.setId(rs.getString("id"));
		dto.setPasswd(rs.getString("passwd"));
		dto.setMname(rs.getString("mname"));
		dto.setTel(rs.getString("tel"));
		dto.setEmail(rs.getString("email"));
		dto.setZipcode(rs.getString("zipcode"));
		dto.setAddress1(rs.getString("address1"));
		dto.setAddress2(rs.getString("address2"));
		dto.setJob(rs.getString("job"));
		dto.setMlevel(rs.getString("mlevel"));
		dto.setMdate(rs.getString("mdate"));
	}else{
		dto=null;
	}
	
	}catch(Exception e){System.out.println("회원 읽어오기 실패!!"+e);}
	return dto;
}


public int update(MemberDTO dto){
	int cnt=0;
	try{
		Connection con=DBOpen.getConnection();
		StringBuilder sql=new StringBuilder();
		sql.append(" update member set passwd=?,tel=?,zipcode=?,address1=?,address2=?,job=? ");
		sql.append(" where id=? ");
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getPasswd());
		pstmt.setString(2, dto.getTel());
		pstmt.setString(3, dto.getZipcode());
		pstmt.setString(4, dto.getAddress1());
		pstmt.setString(5, dto.getAddress2());
		pstmt.setString(6, dto.getJob());
		pstmt.setString(7, dto.getId());
		
		cnt=pstmt.executeUpdate();
	}catch(Exception e){System.out.println("회원수정에 실패!!"+e);}
	return cnt;
}

public int memberDelete(String id, String passwd){
	int cnt=0;
	try{
		Connection con=DBOpen.getConnection();
		StringBuilder sql=new StringBuilder();
		sql.append(" update member set mlevel='F1' ");
		sql.append(" WHERE id=? AND passwd=? ");
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		
		cnt=pstmt.executeUpdate();
	}catch(Exception e){System.out.println("회원 정보삭제 실패!!"+e);}
	return cnt;
}


public MemberDTO SearchId(MemberDTO dto){
	try{
		Connection con=DBOpen.getConnection();
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT mname,email,id,passwd ");
		sql.append(" FROM member ");
		sql.append(" WHERE mname=? AND email=? ");
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getMname());
		pstmt.setString(2, dto.getEmail());
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			dto.setId(rs.getString("id"));
			dto.setMname(rs.getString("mname"));
			dto.setEmail(rs.getString("email"));
			dto.setPasswd(rs.getString("passwd"));
		}else{
			dto=null;
		}
		
	}catch(Exception e){System.out.println("이메일 검색 실패!!"+e);}
	return dto;
}
public MemberDTO SearchPw(MemberDTO dto){
	try{
		Connection con=DBOpen.getConnection();
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT mname,email,id,passwd ");
		sql.append(" FROM member ");
		sql.append(" WHERE id=? AND email=? ");
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getEmail());
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			dto.setId(rs.getString("id"));
			dto.setMname(rs.getString("mname"));
			dto.setEmail(rs.getString("email"));
			dto.setPasswd(rs.getString("passwd"));
		}else{
			dto=null;
		}
		
	}catch(Exception e){System.out.println("이메일 검색 실패!!"+e);}
	return dto;
}

public String Random(String id){
	String ranPw="";
	try{
		ranPw=Utility.randomPw();
		Connection con=DBOpen.getConnection();
		StringBuilder sql=new StringBuilder();
		sql.append(" Update member SET ");
		sql.append(" passwd=? ");
		sql.append(" WHERE id=? ");
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, ranPw);
		pstmt.setString(2, id);
		int cnt=pstmt.executeUpdate();
		if(cnt!=1){
			ranPw=null;
		}
	}catch(Exception e){System.out.println("임시 비밀번호 생성 실패"+e);}
	return ranPw;
}


}

