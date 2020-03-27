package com.bbc.faq.model.vo;

// FAQ 테이블	.fa
public class Faq {
	
	private int faqNo;			// 번호
	private String faqTitle;	// 제목
	private String faqContent;	// 내용
	private int memberNo;		// 회원 이름
	
	public Faq() {
		
	}
	
//	용환 추가
	public Faq(String faqTitle, String faqContent) {
		super();
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}

	public Faq(int faqNo, String faqTitle, String faqContent) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}
	
//	용환 추가 끝
	
	
	
	public Faq(int faqNo, String faqTitle, String faqContent, int memberNo) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.memberNo = memberNo;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", memberNo="
				+ memberNo + "]";
	}
	
	
	
	
}
