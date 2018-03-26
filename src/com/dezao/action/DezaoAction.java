package com.dezao.action;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import com.common.BaseActionSupport;
import com.common.BaseDAO;
import com.common.CheckIdCardUtils;
import com.common.Transaction;
import com.dezao.bean.TUserBean;

public class DezaoAction extends BaseActionSupport {
	private BaseDAO dao = new BaseDAO();
	
	public void importData(){
		final JSONObject root = new JSONObject();
		String csv=request.getParameter("csv");
		final JSONArray jsonArr=JSONObject.fromObject(csv).getJSONArray("Sheet1");
		boolean flag = new Transaction(){

				@Override
				public void run() throws Exception {
					int succ=0;
					int fail=0;
					String nums="";
					StringBuffer msg=new StringBuffer();
					
					for(int i=0;i<jsonArr.size();i++){
						//String username = jsonArr.getJSONObject(i).getString("username").trim();
						//String phone =jsonArr.getJSONObject(i).getString("phone").trim();
						//String postNo = jsonArr.getJSONObject(i).getString("postNo").trim();
						//String id = jsonArr.getJSONObject(i).getString("id");
						String username = jsonArr.getJSONObject(i).getString("姓名").replaceAll("\\s*", "").replaceAll("\n", "");
						String postNo = jsonArr.getJSONObject(i).getString("身份证号码").replaceAll("\\s*", "").replaceAll("\n", "");
						String id=jsonArr.getJSONObject(i).getString("序号");
						Object[] parm={postNo};
						Integer count=dao.j.queryForInteger("select count(*) from t_user where post_no=?",parm);
						boolean valid = CheckIdCardUtils.validateCard(postNo);
						if(count!=0||!valid){
							fail++;
							if(count!=0){
								nums+="第"+id+"行:"+"身份证重复\r\n<br/>";
							}
							if(!valid){
								nums+="第"+id+"行:"+"身份证非法\r\n<br/>";
							}
						}else{
							TUserBean bean = new TUserBean();
							//bean.setPhone(phone);
							bean.setUsername(username);
							bean.setPostNo(postNo);
							String constellation=CheckIdCardUtils.getConstellationById(postNo);
							String sql = "select id from t_constellation where name=?";
							Object[] param={constellation};
							Long constellationId = dao.j.queryForLong(sql,param);
							bean.setConstellationId(constellationId);
							dao.insert(bean);
							succ++;
						}
					}
					msg.append("导入成功"+succ+"个\r\n<br/>");
					msg.append("导入失败"+fail+"个\r\n<br/>");
					msg.append("失败明细：\r\n<br/>"+nums);
					root.put("msg", msg.toString());
				}}.start();
		if(flag){
			root.put("result", 1);
		}else{
			root.put("result", 0);
		}
		outPrint(root.toString());
	}
	
	public void getSearchNum(){
		String sql="select value from t_sys_param where id=1";
		Integer base = dao.j.queryForInteger(sql);
		JSONObject obj = new JSONObject();
		sql="select count(*) from t_user where comment is not null";
		Integer num = dao.j.queryForInteger(sql);
		obj.put("searchNum", base+num);
		outPrint(obj.toString());
	}
	
	public String getCommentList(){
		String sql="select * from t_constellation order by weight ";
		List<Map<String,Object>> list = dao.j.queryForList(sql);
		request.setAttribute("list", list);
		return "comment";
	}
	
	public void getComment(){
		String id=request.getParameter("id");
		String num = request.getParameter("num");
		JSONObject obj = new JSONObject();
		String sql="select comment from t_comment where constellation_id=? and weight=?";
		Object[] param={id,num};
		String comment=dao.j.queryForBean(String.class, sql,param);
		obj.put("comment", comment);
		outPrint(obj.toString());
	}
	
	public void updateComment(){
		String id=request.getParameter("id");
		String num = request.getParameter("num");
		String comment =request.getParameter("comment");
		
		JSONObject obj = new JSONObject();
		String sql="update t_comment set comment=? where constellation_id=? and weight=?";
		Object[] param={comment,id,num};
		boolean result =dao.j.execute(sql,param);
		if(result){
			obj.put("result", 1);
		}else{
			obj.put("result", 0);
		}
		outPrint(obj.toString());
	}
	
	public String getCharacterList(){
		String sql="select * from t_constellation order by weight ";
		List<Map<String,Object>> list = dao.j.queryForList(sql);
		request.setAttribute("list", list);
		return "character";
	}
	
	public void getCharater(){
		String id=request.getParameter("id");
		JSONObject obj = new JSONObject();
		String sql="select character_analysis from t_constellation where id=?";
		Object[] param={id};
		String charater=dao.j.queryForBean(String.class, sql,param);
		obj.put("charater", charater);
		outPrint(obj.toString());
	}
	
	public void updateCharater(){
		String id=request.getParameter("id");
		String charater =request.getParameter("charater");
		
		JSONObject obj = new JSONObject();
		String sql="update t_constellation set character_analysis=? where id=?";
		Object[] param={charater,id};
		boolean result =dao.j.execute(sql,param);
		if(result){
			obj.put("result", 1);
		}else{
			obj.put("result", 0);
		}
		outPrint(obj.toString());
	}
}
