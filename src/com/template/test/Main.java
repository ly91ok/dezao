package com.template.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;

import com.avatar.db.DBFactory;
import com.avatar.db.jdbc.JdbcHandler;
import com.common.Transaction;

public class Main {
	JdbcHandler jh = DBFactory.create("write");
	public static void main(String[] args){
		File file=new File("src");
		System.out.println(file.getAbsolutePath());
		deal(file);
//		System.out.println(replaceString("applyaccountBean.setNote(map.get(\"note\")==null?null:(String)map.get(\"note\"));"));
	}
	
	private static void deal(File file){
		if(file.isDirectory()){
			for(File sub:file.listFiles()){
				deal(sub);
			}
		}else{
			try {
				dealFile(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	private static void dealFile(File file) throws IOException{
		//..读取
		StringBuffer sb=new StringBuffer();
		InputStreamReader read = new InputStreamReader(
                new FileInputStream(file),"utf-8");//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;

                while((lineTxt = bufferedReader.readLine()) != null){
                	sb.append(lineTxt).append("\r\n");
                }
                read.close();
              String content=sb.toString();
            //查找
              boolean hasFind=false;
              String replace=null;
              do{
            	  replace=replaceLong(content);
            	  if(replace!=null){
            		  content=replace;
            		  hasFind=true;
            	  }
              }while(replace!=null);
              do{
            	  replace=replaceString(content);
            	  if(replace!=null){
            		  content=replace;
            		  hasFind=true;
            	  }
              }while(replace!=null);
              //写
              if(hasFind){
            	  Writer writer = new OutputStreamWriter(new FileOutputStream(file), "utf-8");
            	  writer.write(content);
            	  writer.close();
              }
          System.out.println("Done");

              
	}
	public static final String SearchLong="\")==null?null:Long.parseLong(map.get(\"";
	public static final String SearchString="\")==null?null:(String)map.get(\"";
	private static String replaceLong(String content){
		int index=content.indexOf(SearchLong);
		if(index>0){
			String right=content.substring(index+SearchLong.length());
			int index2=right.indexOf('\"');
			String name=right.substring(0, index2);
			String left=content.substring(0,index-(9+name.length()));
			right=right.substring(index2+6);
			return left+"DataUtils.getLong(map.get(\""+name+"\"))"+right;
		}else{
			return null;
		}
	}
	
	private static String replaceString(String content){
		int index=content.indexOf(SearchString);
		if(index>0){
			String right=content.substring(index+SearchString.length());
			int index2=right.indexOf('\"');
			String name=right.substring(0, index2);
			String left=content.substring(0,index-(9+name.length()));
			right=right.substring(index2+2);
			return left+"DataUtils.getString(map.get(\""+name+"\"))"+right;
		}else{
			return null;
		}
	}
	
	
	
	public static void transactionTest(){
		final Main m=new Main();
		boolean result=false;
		result=Transaction.batchMethod(m,"ano");
		result=new Transaction(){
			public void run(){
				m.ano();
				m.batch();
			}
		}.start();
		System.out.println(result);
	}
	
	public void ano(){
		String[] sql={"insert into test(name) values('zhouxin')","insert into cc(a) values(1)"};
		jh.batchUpdate(sql);
	}
	
	public void batch(){
		Test test=new Test();
		test.setName("test3");
		jh.save(test);
		test.setName("test2");
		JdbcHandler jg = DBFactory.create("write");
		System.out.println("a=b?"+(jh.getConnection()==jg.getConnection()));
		jg.save(test);
	}
}
