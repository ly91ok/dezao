package com.common;

import com.avatar.db.annotation.*;
import com.common.*;

/**
 * 后台用户表
 * @author xin.chou
 *
 */
@Table(name="t_sys_user")
public class TSysUserBean {

	/**
	 *  
	*/
	@Column(name="id",primaryKey=true,generatorType=GeneratorType.AUTO_INCREMENT)
	private Long id;

	/**
	 * '用户名' 
	*/
	@Column(name="username")
	private String username;

	/**
	 * '密码' 
	*/
	@Column(name="password")
	private String password;
    	
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
     * '用户名'
     * @return 
     */ 
    public String getUsername() {
    	return username;
    }
    
    /** 
     * '用户名'
     * @param 
     */ 
    public void setUsername(String username) {
    	this.username = username;
    }
    	
    /** 
     * '密码'
     * @return 
     */ 
    public String getPassword() {
    	return password;
    }
    
    /** 
     * '密码'
     * @param 
     */ 
    public void setPassword(String password) {
    	this.password = password;
    }
}