package com.dezao.bean;

import com.avatar.db.annotation.*;
import com.common.*;

/**
 * 人员
 * @author xin.chou
 *
 */
@Table(name="t_user")
public class TUserBean {

	/**
	 *  
	*/
	@Column(name="id",primaryKey=true,generatorType=GeneratorType.AUTO_INCREMENT)
	private Long id;

	/**
	 * '学生姓名' 
	*/
	@Column(name="username")
	private String username;

	/**
	 * '身份证' 
	*/
	@Column(name="post_no")
	private String postNo;

	/**
	 * '手机号' 
	*/
	@Column(name="phone")
	private String phone;

	/**
	 * 星座id 
	*/
	@Column(name="constellation_id")
	private Long constellationId;

	/**
	 * 评语 
	*/
	@Column(name="comment")
	private String comment;

	/**
	 * 综合评定 
	*/
	@Column(name="level")
	private String level;

	/**
	 * 性格分析 
	*/
	@Column(name="character_analysis")
	private String characterAnalysis;
    	
    /** 
     * 
     * @return 
     */ 
    public Long getId() {
    	return id;
    }
    
    /** 
     * 
     * @param 
     */ 
    public void setId(Long id) {
    	this.id = id;
    }
    	
    /** 
     * '学生姓名'
     * @return 
     */ 
    public String getUsername() {
    	return username;
    }
    
    /** 
     * '学生姓名'
     * @param 
     */ 
    public void setUsername(String username) {
    	this.username = username;
    }
    	
    /** 
     * '身份证'
     * @return 
     */ 
    public String getPostNo() {
    	return postNo;
    }
    
    /** 
     * '身份证'
     * @param 
     */ 
    public void setPostNo(String postNo) {
    	this.postNo = postNo;
    }
    	
    /** 
     * '手机号'
     * @return 
     */ 
    public String getPhone() {
    	return phone;
    }
    
    /** 
     * '手机号'
     * @param 
     */ 
    public void setPhone(String phone) {
    	this.phone = phone;
    }
    	
    /** 
     * 星座id
     * @return 
     */ 
    public Long getConstellationId() {
    	return constellationId;
    }
    
    /** 
     * 星座id
     * @param 
     */ 
    public void setConstellationId(Long constellationId) {
    	this.constellationId = constellationId;
    }
    	
    /** 
     * 评语
     * @return 
     */ 
    public String getComment() {
    	return comment;
    }
    
    /** 
     * 评语
     * @param 
     */ 
    public void setComment(String comment) {
    	this.comment = comment;
    }
    	
    /** 
     * 综合评定
     * @return 
     */ 
    public String getLevel() {
    	return level;
    }
    
    /** 
     * 综合评定
     * @param 
     */ 
    public void setLevel(String level) {
    	this.level = level;
    }
    	
    /** 
     * 性格分析
     * @return 
     */ 
    public String getCharacterAnalysis() {
    	return characterAnalysis;
    }
    
    /** 
     * 性格分析
     * @param 
     */ 
    public void setCharacterAnalysis(String characterAnalysis) {
    	this.characterAnalysis = characterAnalysis;
    }
}