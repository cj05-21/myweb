package net.pds;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Savepoint;
import java.util.*;

import net.bbs.BbsDTO;
import net.utility.Utility;
import DBPKG.DBOpen;

public class PdsDAO {
		
	public boolean pdsIns(PdsDTO dto){
		boolean flag=false;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql= new StringBuilder();
			sql.append(" insert into tb_pds(pdsno,wname,subject,passwd,filename,filesize,regdate,id) ");
			sql.append(" Values( (select nvl(max(pdsno),0)+1 from tb_pds) ");
			sql.append(" ,?,?,?,?,?,sysdate,? ) ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1,dto.getWname());
			pstmt.setString(2,dto.getSubject());
			pstmt.setString(3,dto.getPasswd());
			pstmt.setString(4,dto.getFilename());
			pstmt.setLong(5,dto.getFilesize());
			pstmt.setString(6,dto.getId());
			 int cnt=pstmt.executeUpdate();
			 if(cnt==1){
				 flag=true;
			 }else{
				 flag=false;
			 }
		}catch(Exception e){System.out.println("사진 추가 실패!!!"+e);}
		return flag;
	}//pdsIns end
	
	public synchronized ArrayList<PdsDTO> list(){
		ArrayList<PdsDTO> list=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT pdsno,subject,wname,passwd,regdate,readcnt,filename,filesize");
			sql.append(" FROM tb_pds ");
			sql.append(" ORDER BY regdate DESC");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<PdsDTO>();
				do{
					PdsDTO dto= new PdsDTO();
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setSubject(rs.getString("subject"));
					dto.setWname(rs.getString("wname"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setFilename(rs.getString("filename"));
					dto.setFilesize(rs.getLong("filesize"));
					list.add(dto);
				}while(rs.next());
			}else{
				list=null;
			}
		}catch(Exception e){System.out.println("목록 조회 실패"+e);}
		return list;
	}//ArrayList end

	public synchronized ArrayList<PdsDTO> list(String col,String word){
		ArrayList<PdsDTO> list=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT pdsno,subject,wname,passwd,regdate,readcnt,filename,filesize");
			sql.append(" FROM tb_pds ");
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
			sql.append(" ORDER BY regdate DESC");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<PdsDTO>();
				do{
					PdsDTO dto= new PdsDTO();
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setSubject(rs.getString("subject"));
					dto.setWname(rs.getString("wname"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setFilename(rs.getString("filename"));
					dto.setFilesize(rs.getLong("filesize"));
					list.add(dto);
				}while(rs.next());
			}else{
				list=null;
			}
		}catch(Exception e){System.out.println("목록 조회 실패"+e);}
		return list;
	}//ArrayList end
	
	 public ArrayList<PdsDTO> list(String col, String word, int nowPage, int recordPerPage){
	        ArrayList<PdsDTO> list=null;
	        
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
	            sql.append(" SELECT  pdsno,subject,wname,passwd,regdate,readcnt,filename,filesize, r");
	            sql.append(" FROM( SELECT  pdsno,subject,wname,passwd,regdate,readcnt,filename,filesize,rownum as r");
	            sql.append("       FROM ( SELECT  pdsno,subject,wname,passwd,regdate,readcnt,filename,filesize");
	            sql.append("              FROM tb_pds");
	           
	            sql.append("              ORDER BY pdsno DESC");
	            sql.append("           )");
	            sql.append("     )");
	            sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
	          } else {
	            //검색을 하는 경우
	            sql.append(" SELECT pdsno,subject,wname,passwd,regdate,readcnt,filename,filesize, r");
	            sql.append(" FROM( SELECT pdsno,subject,wname,passwd,regdate,readcnt,filename,filesize,rownum as r");
	            sql.append("       FROM ( SELECT pdsno,subject,wname,passwd,regdate,readcnt,filename,filesize");
	            sql.append("              FROM tb_pds");
	            
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
	            
	            sql.append("              ORDER BY pdsno DESC");
	            sql.append("           )");
	            sql.append("     )");
	            sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
	          }//if end
	          
	          PreparedStatement pstmt=con.prepareStatement(sql.toString());
	          ResultSet rs=pstmt.executeQuery();
	          if(rs.next()){
	            list=new ArrayList<PdsDTO>();
	            do{
	            
	              PdsDTO dto=new PdsDTO();
	              dto.setPdsno(rs.getInt("pdsno"));
	              dto.setSubject(rs.getString("subject"));
	              dto.setWname(rs.getString("wname"));
	              dto.setPasswd(rs.getString("passwd"));
	              dto.setReadcnt(rs.getInt("readcnt"));
	              dto.setRegdate(rs.getString("regdate"));
	              dto.setFilename(rs.getString("filename"));
	              dto.setFilesize(rs.getLong("filesize"));
	              list.add(dto);
	            }while(rs.next());
	          }//if end
	          
	        }catch(Exception e) {
	          System.out.println("목록 페이징 실패: "+e);
	        }   
	        return list;
	      }//list() end  
	
	public void pdsDeleteRe(int pdsno){
	
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" DELETE FROM tb_pds_reple ");
			sql.append(" WHERE pdsno=?");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1,pdsno);
			
			pstmt.executeUpdate();
		}catch(Exception e){System.out.println("사진 삭제실패!!"+e);}
		
	}//pdsDelete end
	public int pdsDelete(int pdsno, String basePath){
		int cnt=0;
		try{
				//삭제하고자 하는 파일명을 가져온다
				String filename="";
				PdsDTO oldDTO=pdsRead(pdsno);
				if(oldDTO!=null){
					filename=oldDTO.getFilename();
				}
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" DELETE FROM tb_pds ");
			sql.append(" WHERE pdsno=?  ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1,pdsno);
			cnt=pstmt.executeUpdate();
			
			if(cnt==1){	//테이블에서 행삭제가 성공했으므로
							//첨부된 파일도 삭제해줘야함
				Utility.deleteFile(saveDir,filename);
			}//if end
		}catch(Exception e){System.out.println("사진 삭제실패!!"+e);}
		return cnt;
	}//pdsDelete end

	
	
	
	public PdsDTO pdsRead(int pdsno){
		PdsDTO dto=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT pdsno,wname,subject,regdate,passwd,readcnt,filename,filesize");
			sql.append(" FROM tb_pds");
			sql.append(" WHERE pdsno=?");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
		
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				dto= new PdsDTO();
				dto.setPdsno(rs.getInt("pdsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));
			}else{
				dto=null;
			}
		}catch(Exception e){System.out.println("사진 정보 불러오기 실패"+e);}
		return dto;
		
	}
	
	public PdsDTO pdsRead(int pdsno,String passwd){
		PdsDTO dto=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT pdsno,wname,subject,regdate,passwd,readcnt,filename,filesize");
			sql.append(" FROM tb_pds");
			sql.append(" WHERE pdsno=? AND passwd=?");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			pstmt.setString(2, passwd);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				dto= new PdsDTO();
				dto.setPdsno(rs.getInt("pdsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));
			}else{
				dto=null;
			}
		}catch(Exception e){System.out.println("사진 정보 불러오기 실패"+e);}
		return dto;
		
	}
	public PdsDTO pdsReadMem(String id,String passwd){
		PdsDTO dto=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT id,passwd,job,mlevel");
			sql.append(" FROM member");
			sql.append(" WHERE id=? AND passwd=?");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				dto= new PdsDTO();
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setJob(rs.getString("job"));
				dto.setMlevel(rs.getString("mlevel"));
			}else{
				dto=null;
			}
		}catch(Exception e){System.out.println("사진 정보 불러오기 실패"+e);}
		return dto;
		
	}
	
	public int pdsUpdate(PdsDTO dto,String saveDirectory){
		int cnt=0;
		PdsDAO dao=new PdsDAO();
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			
			PdsDTO oldfile=dao.pdsRead(dto.getPdsno());
			
			if(dto.getFilename()==null){
				dto.setFilename(oldfile.getFilename());
				dto.setFilesize(oldfile.getFilesize());
			}

			sql.append(" UPDATE tb_pds");
			sql.append(" SET wname=?,subject=?,passwd=?,filename=?,filesize=?");
			sql.append(" WHERE pdsno=?");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getFilename());
			pstmt.setLong(5, dto.getFilesize());
			pstmt.setLong(6, dto.getPdsno());
			
			cnt=pstmt.executeUpdate();
			
			if(cnt==1){
				if(!oldfile.equals(dto.getFilename())){
					Utility.deleteFile(saveDirectory,oldfile.getFilename());
				}
			}

		}catch(Exception e){System.out.println("수정 실패!!"+e);}
		
		return cnt;
	}
	
	public void increaseCnt(int pdsno){
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE tb_pds SET ");
			sql.append(" readcnt=readcnt+1 ");
			sql.append(" WHERE pdsno=? ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			pstmt.executeUpdate();
		}catch(Exception e){System.out.println("조회수 증가 실패"+e);}
	}
	
	public int repleset(int pdsno,String id,String reple){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO tb_pds_reple(pdsno,reple,resno,id,regdt1) ");
			sql.append(" VALUES (?,?,(select NVL(max(resno),0)+1 from tb_pds_reple),?,sysdate ");
			sql.append(" ) ");
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			pstmt.setString(2, reple);
			pstmt.setString(3, id);
			cnt=pstmt.executeUpdate();

		}catch(Exception e){System.out.println("댓글 입력 실패"+e);}
		return cnt;
	}
	
	public ArrayList<PdsDTO> repleget(int pdsno){
		ArrayList<PdsDTO> list=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT member.mlevel,member.id,tb.pdsno,tb.reple,tb.resno,tb.regdt1 ");
			sql.append(" FROM member join tb_pds_reple tb ");
			sql.append(" on member.id=tb.id ");
			sql.append(" WHERE pdsno=? ");
			sql.append(" ORDER BY resno ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<PdsDTO>();
				do{
					PdsDTO dto=new PdsDTO();
					dto.setMlevel(rs.getString("mlevel"));
					dto.setId(rs.getString("id"));
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setReple(rs.getString("reple"));
					dto.setResno(rs.getInt("resno"));
					dto.setRegdt1(rs.getString("regdt1"));
					list.add(dto);
				}while(rs.next());
			}else{
				list=null;
			}

		}catch(Exception e){System.out.println("목록 조회 실패"+e);}
		return list;
	}

	public int replecount(int pdsno){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append("		FROM tb_pds_reple ");
			sql.append("		WHERE pdsno=?");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("cnt");
				
			}

		}catch(Exception e){System.out.println("글개수 실패"+e);}
		return cnt;
	}
	
	public int count(String col, String word){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append("		FROM tb_pds ");
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
	
	
}//PdsDAO end


