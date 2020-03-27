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
 * Servlet implementation class HelpNoticeModifyServlet
 */
@WebServlet("/update.b.no")
public class HelpNoticeModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpNoticeModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\board_upfiles\\";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int memNo = 21;
			
			int nno = Integer.parseInt(multiRequest.getParameter("nno"));
			int showNotice = Integer.parseInt(multiRequest.getParameter("showNotice"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
		
			Notice n = new Notice();
			
			n.setNoticeNo(nno);
			n.setNoticeImport(showNotice);
			n.setNoticeTitle(title);
			n.setNoticeContent(content);
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			for(int i=1; i<=3; i++) {
				String name = "upfile" + i;
				
				// 첨부된 파일이 있을 경우만 ArrayList에 담게
				if(multiRequest.getOriginalFileName(name) != null) {
					
					// 첨부파일의 원본명
					String originName = multiRequest.getOriginalFileName(name);
					String changeName = multiRequest.getFilesystemName(name);
					
					Attachment at = new Attachment();
					at.setFileName(originName);
					at.setRename(changeName);
					at.setFilePath(savePath);
					
					list.add(at);
				}
			}
			
			int result = new NoticeService().branchUpdateNotice(n, list, memNo);
			
			if(result > 0) {
				response.sendRedirect("notice.b.no");
			} else {
				
				for(int i=0; i<list.size(); i++) {
					File deleteFile = new File(savePath + list.get(i).getRename());
					deleteFile.delete();
				}
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
