package com.bbc.attachment.model.vo;

// 첨부 파일 테이블	.at
public class Attachment {
	
	private int fileNo;			// 파일 번호
	private String fileName;	// 파일 이름
	private String rename;		// 리네임
	private int noticeNo;		// 문서 번호
	private String filePath;	// 파일 저장된 폴더 경로
		
	public Attachment() {
		
	}

	public Attachment(int fileNo, String fileName, String rename, int noticeNo, String filePath) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.rename = rename;
		this.noticeNo = noticeNo;
		this.filePath = filePath;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRename() {
		return rename;
	}

	public void setRename(String rename) {
		this.rename = rename;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", fileName=" + fileName + ", rename=" + rename + ", noticeNo="
				+ noticeNo + ", filePath=" + filePath + "]";
	}
	
	
	
}
