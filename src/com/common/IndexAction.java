package com.common;

import java.util.Map;

import org.json.simple.JSONObject;



public class IndexAction  extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private BaseDAO dao = new BaseDAO();
	private String username;
	private String password;
	private String[] levelArr={"A","B"};
		
	public String index(){
		String result="input";
		if(session.get("user")!=null){
			return "index";
		}
		String sql="select * from t_sys_user where username=? and password=?";
		Object[] param={username,password};
		TSysUserBean user = dao.j.queryForBean(TSysUserBean.class, sql,param);
		if(user!=null){
			session.put("user", user);
			result="index";
		}
		return result;
	}
	
	public String search(){
		String name = request.getParameter("name");
		String postNo = request.getParameter("postNo");
		String phone = request.getParameter("phone");
		String sql ="select id,constellation_id,level,character_analysis,comment,phone from t_user where username=? and post_no=?";
		Object[] param={name,postNo};
		Map<String,Object> result =dao.j.queryForMap(sql,param);
		if(result!=null){
			String phoneS = result.get("phone").toString();
			String comment = result.get("comment").toString();
			String constellation_id = result.get("constellation_id").toString();
			String id = result.get("id").toString();
			String phoneStr = "";
			if(phoneS!=null&&phoneS.trim().length()>0){
				String[] arr = phoneS.split(",");
				int count=0;
				for(String s:arr){
					if(phone.equals(s)){
						phoneStr=phoneS;
						break;
					}else{
						count++;
					}
				}
				if(count==arr.length){
					phoneStr=phoneS+","+phone;
					sql="update t_user set phone=? where id=?";
					dao.j.execute(sql,new String[]{phoneStr,id});
				}
			}else{
				phoneStr=phone;
			}
			if(comment==null||comment.trim().length()==0){
				sql="select IF(RAND()>0.5,'A','B') AS LEVEL,a.character_analysis,comment from t_constellation a left join t_comment b on a.id=b.constellation_id where a.id=? ORDER BY RAND() LIMIT 1";
				Map<String,Object> map = dao.j.queryForMap(sql,new String[]{constellation_id});
				sql="update t_user set level=?,comment=?,character_analysis=?,phone=? where id=?";
				Object[] parm={map.get("level").toString(),map.get("comment").toString(),map.get("character_analysis").toString(),phoneStr,id};
				dao.j.execute(sql,parm);
				result=map;
			}
		}
		request.setAttribute("result", result);
		return "view";
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
