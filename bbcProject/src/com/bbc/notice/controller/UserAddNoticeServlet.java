package com.bbc.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.bbc.attachment.model.vo.Attachment;
import com.bbc.common.MyFileRenamePolicy;
import com.bbc.notice.model.service.NoticeService;
import com.bbc.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class UserAddNoticeServlet
 */
@WebServlet("/uAddNoitce.t.no")
public class UserAddNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 if(ServletFileUpload.isMultipartContent(request)) {
			 // 전송 파일 용량 제한 : 10Mbyte
			 int maxSize = 1024*1024*10;
			 
			 // /resources 까지의 절대경로 알아내기
			 String resources = request.getSession().getServletContext().getRealPath("/resources");
			 
			 // 파일이 실제 저장될 실제 경로 작성
			 String savePath = resources + "\\notice_upfiles\\";
			 
			 
			 // 파일명 리네임 작업 호출 후 저장
			 MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			 
			 // 객체에 담기
			 String title = multiRequest.getParameter("notice-title");
			 String content = multiRequest.getParameter("notice-content");
			 int memNo = Integer.parseInt(multiRequest.getParameter("memNo"));
			 String[] noticeV = multiRequest.getParameterValues("noticeV");
			 String[] check = multiRequest.getParameterValues("importCheck");
			 int checkNo = Integer.parseInt(check[0]);
			 
			 Notice n = new Notice();
			 n.setNoticeTitle(title);
			 n.setNoticeContent(content);
			 n.setMemberNo(memNo);
			 n.setNoticeImport(checkNo);
			 // nullPoint error 때문에  빈값은 빠지게끔 조건 처리
			 if(noticeV[0].isEmpty()) {
				 int branch = Integer.parseInt(noticeV[1]);
				 n.setNoticeField(branch);
			 }else {
				 int user = Integer.parseInt(noticeV[0]);
				 n.setNoticeField(user);
			 }
			 
			 // 원본명, 수정명, 저장경로 Attachment객체 ArrayList에 담기
			 ArrayList<Attachment> list = new ArrayList<>();
			 
			 for(int i=1; i<=3; i++) {
				 String name = "file" + i;
				 
				 // 첨부파일이 있을 경우만 ArrayList에 담기게끔
				 if(multiRequest.getOriginalFileName(name) != null) {
					 // 첨부파일 원본명
					 String originName = multiRequest.getOriginalFileName(name);
					 // 첨부파일 수정명
					 String changeName = multiRequest.getFilesystemName(name);
					 
					 Attachment at = new Attachment();
					 at.setFileName(originName);
					 at.setRename(changeName);
					 at.setFilePath(savePath);
					 
					 list.add(at);
				 }
			 }
			 
			 // 공지사항 작성 서비스 요청(Notice객체, 첨부파일리스트 전달)
			 int result = new NoticeService().adminUserAddNotice(n, list);
			 
			 if(result > 0) {
				 response.sendRedirect("uList.t.no");
			 }else {				 
				 
				 //실패한 경우 서버에 업로드된 파일도 같이 삭제해줘야한다.
				 for(int i=0; i<list.size(); i++) {
					 File deleteFile = new File(savePath + list.get(i).getRename());
					 deleteFile.delete();
				 }
				 request.setAttribute("msg", "공지사항 등록 실패");
				 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			 }
			 
		 }
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
