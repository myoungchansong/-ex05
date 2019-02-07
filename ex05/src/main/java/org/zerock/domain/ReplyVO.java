package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int bno;
	private int rno;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
	
}
