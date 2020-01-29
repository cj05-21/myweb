package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import DBPKG.DBOpen;

public class BbsDAO {
	//Data Aceess Object 데이터베이스 관련 작업

	public int insert(BbsDTO dto){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql= new StringBuilder();
			sql.append(" INSERT INTO tb_bbs(bbsno,wname,subject,content,passwd,grpno,ip) ");
			sql.append(" VALUES(  ");
			sql.append(" (select nvl(max(bbsno),0)+1 from tb_bbs) ");
			sql.append(" ,?,?,?,? ");
			sql.append(" ,(select nvl(max(bbsno),0)+1 from tb_bbs) ");
			sql.append(" ,? ");
			sql.append(" ) ");
			
			
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1,dto.getWname());
			pstmt.setString(2,dto.getSubject());
			pstmt.setString(3,dto.getContent());
			pstmt.setString(4,dto.getPasswd());
			pstmt.setString(5,dto.getIp());
			
			cnt=pstmt.executeUpdate();
		}catch(Exception e){System.out.println("실패"+e);}
		return cnt;
	}
	
	
	
	
	
	public ArrayList<BbsDTO> list(){
		//DB에서 가져온 데이터를 list에 모아서 
		//bbsList.jsp에 전달한다
		//즉,ResultSet이 가지고 있는 정보를 list에 모아서 전달!!!
		ArrayList<BbsDTO> list=null;
			
		try{
		Connection con=DBOpen.getConnection();
		StringBuilder sql= new StringBuilder();
		sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent ");
		sql.append(" FROM tb_bbs");
		sql.append(" ORDER BY grpno DESC,ansnum ASC");
		
		PreparedStatement pstmt=null;
		pstmt=con.prepareStatement(sql.toString());
		ResultSet rs=pstmt.executeQuery();
		//현재 작업을 BbsDAO에서 작업을 하고 있지만 보여주는 것은 BbsList.jsp에서 보여준다
		//페이지가 달라졌다
		//rs 가  List의 내용을 다 가지고 있기 때문에 rs 를 return으로 보내줘야 한다
		
		//※쿼리문으로 작성해서 조회한 데이터들이 rs에 맨 윗줄을 커서로 가리키며 담겨있다
		if(rs.next()){
			list=new ArrayList<BbsDTO>();
			
			do{
				BbsDTO dto= new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setRegdt(rs.getString("regdt"));
				dto.setIndent(rs.getInt("indent"));
				list.add(dto);
			}while(rs.next());
		}else{
			list=null;
		}
		}catch(Exception e){System.out.println("목록실패!!!"+e);}
			return list;
	
	}//list() end
	
	public ArrayList<BbsDTO> list(String col, String word){
		
		ArrayList<BbsDTO> list=null;
			
		try{
		Connection con=DBOpen.getConnection();
		StringBuilder sql= new StringBuilder();
		sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent ");
		sql.append(" FROM tb_bbs");
		
		if(word.trim().length()>=1){//검색어가 있다면
			String search="";
			if(col.equals("wname")){
				search+=" WHERE wname LIKE '%"+word+"%' ";
			}
			if(col.equals("subject")){
				search+=" WHERE subject LIKE '%"+word+"%' ";
			}
			if(col.equals("content")){
				search+=" WHERE content LIKE '%"+word+"%' ";
			}
			if(col.equals("subject_content")){
				search+=" WHERE subject LIKE '%"+word+"%' ";
				search+=" OR content LIKE '%"+word+"%' ";
			}
			sql.append(search);
		}
		sql.append(" ORDER BY grpno DESC,ansnum ASC");
		
		PreparedStatement pstmt=null;
		pstmt=con.prepareStatement(sql.toString());
		ResultSet rs=pstmt.executeQuery();
		
		if(rs.next()){
			list=new ArrayList<BbsDTO>();
			
			do{
				BbsDTO dto= new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setRegdt(rs.getString("regdt"));
				dto.setIndent(rs.getInt("indent"));
				list.add(dto);
			}while(rs.next());
		}else{
			list=null;
		}
		}catch(Exception e){System.out.println("검색실패!!!"+e);}
			return list;
	
	}//list() end
	
	  public ArrayList<BbsDTO> list(String col, String word, int nowPage, int recordPerPage){
	        ArrayList<BbsDTO> list=null;
	        
	        // 페이지당 출력할 레코드 갯수 (10개를 기준)
	        // 1 page : WHERE r>=1 AND r<=10
	        // 2 page : WHERE r>=11 AND r<=20
	        // 3 page : WHERE r>=21 AND r<=30
	        int startRow = ((nowPage-1) * recordPerPage) + 1 ;
	        int endRow   = nowPage * recordPerPage;
	        
	        try{
	            Connection con=DBOpen.getConnection();
	            StringBuilder sql=new StringBuilder();
	          
	          word = word.trim(); //검색어의 좌우 공백 제거
	          
	          if(word.length()==0) { //검색을 하지 않는 경우
	            sql.append(" SELECT bbsno,subject,wname,readcnt,indent,regdt, r");
	            sql.append(" FROM( SELECT bbsno,subject,wname,readcnt,indent,regdt,rownum as r");
	            sql.append("       FROM ( SELECT bbsno,subject,wname,readcnt,indent,regdt");
	            sql.append("              FROM tb_bbs");
	           
	            sql.append("              ORDER BY grpno DESC, ansnum ASC");
	            sql.append("           )");
	            sql.append("     )");
	            sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
	          } else {
	            //검색을 하는 경우
	            sql.append(" SELECT bbsno,subject,wname,readcnt,indent,regdt, r");
	            sql.append(" FROM( SELECT bbsno,subject,wname,readcnt,indent,regdt,rownum as r");
	            sql.append("       FROM ( SELECT bbsno,subject,wname,readcnt,indent,regdt");
	            sql.append("              FROM tb_bbs");
	            
	            String search="";
	            if(col.equals("wname")) {
	              search += " WHERE wname LIKE '%" + word + "%'";
	            } else if(col.equals("subject")) {
	              search += " WHERE subject LIKE '%" + word + "%'";
	            } else if(col.equals("content")) {
	              search += " WHERE content LIKE '%" + word + "%'";
	            } else if(col.equals("subject_content")) {
	              search += " WHERE subject LIKE '%" + word + "%'";
	              search += " OR content LIKE '%" + word + "%'";
	            }
	            
	            sql.append(search);        
	            
	            sql.append("              ORDER BY grpno DESC, ansnum ASC");
	            sql.append("           )");
	            sql.append("     )");
	            sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
	          }//if end
	          
	          PreparedStatement pstmt=con.prepareStatement(sql.toString());
	          ResultSet rs=pstmt.executeQuery();
	          if(rs.next()){
	            list=new ArrayList<>();
	            do{
	              BbsDTO dto=new BbsDTO();
	              dto.setBbsno(rs.getInt("bbsno"));
	              dto.setSubject(rs.getString("subject"));
	              dto.setWname(rs.getString("wname"));
	              dto.setReadcnt(rs.getInt("readcnt"));
	              dto.setRegdt(rs.getString("regdt"));
	              dto.setIndent(rs.getInt("indent"));
	              list.add(dto);
	            }while(rs.next());
	          }//if end
	          
	        }catch(Exception e) {
	          System.out.println("목록 페이징 실패: "+e);
	        }   
	        return list;
	      }//list() end  
	    
	
	
	
	public int count(String col, String word){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append("		FROM tb_bbs ");
			if(word.trim().length()>=1){//검색어가 있다면
				String search="";
				if(col.equals("wname")){
					search+=" WHERE wname LIKE '%"+word+"%' ";
				}
				if(col.equals("subject")){
					search+=" WHERE subject LIKE '%"+word+"%' ";
				}
				if(col.equals("content")){
					search+=" WHERE content LIKE '%"+word+"%' ";
				}
				if(col.equals("subject_content")){
					search+=" WHERE subject LIKE '%"+word+"%' ";
					search+=" OR content LIKE '%"+word+"%' ";
				}
				sql.append(search);
			}
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("cnt");
				
			}

		}catch(Exception e){System.out.println("글개수 실패"+e);}
		return cnt;
	}
	
public BbsDTO read(int bbsno){
		
		BbsDTO dto=null;
		try{
		Connection con=DBOpen.getConnection();
		StringBuilder sql= new StringBuilder();
		sql.append( " SELECT bbsno, wname, subject, content, passwd, readcnt, regdt,grpno,indent,ansnum,ip " );
		sql.append(	" FROM tb_bbs ");
		sql.append( " WHERE bbsno=? ");
		
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, bbsno);
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			dto=new BbsDTO();
			dto.setBbsno(rs.getInt("bbsno"));
			dto.setWname(rs.getString("wname"));
			dto.setSubject(rs.getString("subject"));
			dto.setContent(rs.getString("content"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReadcnt(rs.getInt("readcnt"));
			dto.setRegdt(rs.getString("regdt"));
			dto.setGrpno(rs.getInt("grpno"));
			dto.setIndent(rs.getInt("indent"));
			dto.setAnsnum(rs.getInt("ansnum"));
			dto.setIp(rs.getString("ip"));
		}else{
			dto=null;
		}
		}catch(Exception e){System.out.println("상세보기실패:"+e);};
		return dto;
	
	}
public BbsDTO read(int bbsno, String passwd){
	
	BbsDTO dto=null;
	try{
		Connection con=DBOpen.getConnection();
		StringBuilder sql= new StringBuilder();
		sql.append( " SELECT bbsno, wname, passwd " );
		sql.append(	" FROM tb_bbs ");
		sql.append( " WHERE bbsno=? AND passwd=? ");
		
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, bbsno);
		pstmt.setString(2, passwd);
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			dto=new BbsDTO();
			dto.setBbsno(rs.getInt("bbsno"));
			dto.setWname(rs.getString("wname"));
			
			dto.setPasswd(rs.getString("passwd"));
		
		}else{
			dto=null;
		}
	}catch(Exception e){System.out.println("상세보기실패:"+e);};
	return dto;
	
}
	

		public int delete(BbsDTO dto){
			int cnt=0;
		try{
		Connection con=DBOpen.getConnection();
		
		StringBuilder sql = new StringBuilder();
		sql.append(" DELETE FROM tb_bbs ");
		sql.append(" WHERE bbsno=? AND passwd=?");

		PreparedStatement pstmt= con.prepareStatement(sql.toString());
		pstmt.setInt(1, dto.getBbsno());
		pstmt.setString(2, dto.getPasswd());
		cnt=pstmt.executeUpdate();
		}catch(Exception e){System.out.println("삭제실패:"+e);}
			return cnt;
		}
		
		public int deleteRe(int bbsno){
			int cnt=0;
			try{
				Connection con= DBOpen.getConnection();
				StringBuilder sql=new StringBuilder();
				sql.append(" DELETE ");
				sql.append(" FROM tb_reple ");
				sql.append(" WHERE bbsno=?" );
				PreparedStatement pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, bbsno);
				cnt=pstmt.executeUpdate();
				
			}catch(Exception e){System.out.println("댓글 삭제 싫패"+e);}
			return cnt;
		}
	
		 public BbsDTO updateform(BbsDTO dto){
		        try {    
		          Connection con=DBOpen.getConnection();
		          StringBuilder sql=new StringBuilder();
		          sql.append(" SELECT wname, subject, content, passwd ");
		          sql.append(" FROM tb_bbs ");
		          sql.append(" WHERE bbsno=? AND passwd=?");
		          PreparedStatement pstmt=con.prepareStatement(sql.toString());
		          pstmt.setInt(1,dto.getBbsno());
		          pstmt.setString(2, dto.getPasswd());
		          ResultSet rs=pstmt.executeQuery();
		          if(rs.next()){
		             dto=new BbsDTO();
		             dto.setWname(rs.getString("wname"));
		             dto.setSubject(rs.getString("subject"));
		             dto.setContent(rs.getString("content"));
		             dto.setPasswd(rs.getString("passwd"));
		          }else{
		             dto=null;
		          }//if end
		          
		        }catch(Exception e) {
		          System.out.println("수정 조회 실패 : " + e);
		        }//try end  
		        return dto;
		      }//updateForm() end

		public int updateProc(BbsDTO dto){
			
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE  tb_bbs SET wname=?,subject=?,content=?,passwd=?,ip=? ");
			sql.append(" WHERE bbsno=? ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			pstmt.setInt(6, dto.getBbsno());
			
			cnt= pstmt.executeUpdate();		
		}catch(Exception e){System.out.println("수정실패:"+e);}
			return cnt;
			}
	
		  
		public void incrementCnt(int bbsno){
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql =new StringBuilder();
			sql.append(" UPDATE tb_bbs SET ");
			sql.append(" readcnt=readcnt+1 ");
			sql.append(" WHERE bbsno=? ");
			PreparedStatement pstmt= con.prepareStatement(sql.toString());
			pstmt.setInt(1,bbsno);
			pstmt.executeUpdate();	
		}catch(Exception e){System.out.println("조회수 증가 실패"+e);}
			
		}
	
		public int reply(BbsDTO dto){
			int cnt=0;
			try{
				Connection con=DBOpen.getConnection();
				StringBuilder sql=new StringBuilder();
				//1)부모글 정보 가져오기(select문)
				// (그룹번호,들여쓰기, 글순)
				int grpno=0, indent=0, ansnum=0;
				sql.append(" SELECT grpno, indent, ansnum ");
				sql.append(" FROM tb_bbs ");
				sql.append(" WHERE bbsno=? ");
				PreparedStatement pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, dto.getBbsno());
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()){
					grpno=rs.getInt("grpno");
					indent=(rs.getInt("indent"));
					ansnum=(rs.getInt("ansnum"));
				}//if end
				
				//2) 글순서 재조정 하기(update문)
				//	1)에서 사용했던 sql참조변수값을 지우시
				sql.delete(0,sql.length());
				sql.append(" UPDATE tb_bbs ");
				sql.append(" SET ansnum=ansnum+1 ");
				sql.append(" WHERE grpno=? AND ansnum>? ");
				
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1,grpno);
				pstmt.setInt(2,ansnum);
				pstmt.executeUpdate();
				
				//3) 답변글 추가하기(insert문)
				sql.delete(0,sql.length());
				sql.append(" INSERT INTO tb_bbs( ");
				sql.append(" bbsno, wname, subject, content, passwd, grpno, indent, ansnum, ip )");
				sql.append(" VALUES( (SELECT NVL(MAX(bbsno),0)+1 FROM tb_bbs) ");
				sql.append(" ,?,?,?,?,?,?,?,?");
				sql.append("  ) ");
				
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getWname());
				pstmt.setString(2, dto.getSubject());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getPasswd());
				pstmt.setInt(5, grpno);			//부모글 그룹번호
				pstmt.setInt(6, indent+1);  		//부모글 들여쓰기+1
				pstmt.setInt(7, ansnum+1);		//부모글 글순서+1
				pstmt.setString(8, dto.getIp());
				
				cnt=pstmt.executeUpdate();
			}catch(Exception e){System.out.println("답변 실패"+e);}
			return cnt;
		}
	
}