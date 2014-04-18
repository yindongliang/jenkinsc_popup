package ctrbp;




import java.io.File;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.rest.DefaultHttpHeaders;
import org.apache.struts2.rest.HttpHeaders;

import cn.com.oracle.nokk.ProjectDocument;
import cn.com.oracle.nokk.ProjectDocument.Project;
import cn.com.oracle.nokk.ProjectDocument.Project.Target;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Validateable;
import com.opensymphony.xwork2.ValidationAwareSupport;

@Results({
    @Result(name="success", type="redirectAction", params = {"actionName" , "anthelper"})
})
public class AnthelperController extends ValidationAwareSupport implements ModelDriven<Object>, Validateable{
    
	
	private String id;
	
	private Properties p;
	
	private Set set;
	
	private String result;
	
    public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}



    public HttpHeaders index() {
    	 
         return new DefaultHttpHeaders("index")
             .disableCaching();
    	
    }
    
    
 // GET /orders/1
 	public  HttpHeaders show() throws Exception {
 		
// 		String path="D:\\Y_private\\Dev\\workspace\\z_automation\\src\\automation";
 		String path="/home/oracle/automation";
 		File dir = new File(path);
 		
 		GitUtil.gitFolder(dir);

 		
 		Map<String, ProjectDocument> xmlmap = new HashMap<String, ProjectDocument>();
		Map<String, Properties> propmap = new HashMap<String, Properties>();  
 		
		GitUtil.setMaps(xmlmap,propmap,dir);

		
		Iterator<String> it =xmlmap.keySet().iterator();
		
		int i=0;
		
		StringBuilder xmlinfo = new StringBuilder();
		// loop all build files
		while(it.hasNext()){
			String key=(String)it.next();
			ProjectDocument doc=xmlmap.get(key);
			Project pj = doc.getProject();
			
			
			if(i==0){
				xmlinfo.append("{");
			}
			xmlinfo = xmlinfo.append("'"+key+".xml':{");
			
			
			Target[] targets = pj.getTargetArray();
			// loop all targets
			for (int k=0;k< targets.length;k++) {
				Target target =targets[k];
				String name = target.getName();

				String src = target.toString().replaceAll("xml-fragment", "target");
				src = src.replaceAll("\r\n", "<br>");
				src = src.replaceAll("\n", "<br>");
				
				Set<String> set=new HashSet<String>();
				findFirstV(src,set);
				String keyvalues="{";
				// loop all variables
				
				Iterator itset=set.iterator();
				
				
				int j=0;
				
				
				while(itset.hasNext()){
					String keyofp=(String)itset.next();
					if(propmap.get(key)==null){
						
						break;
					}
					String valueofp=propmap.get(key).getProperty(keyofp);
					
					if(j==set.size()-1){
						
						keyvalues=keyvalues+"'"+keyofp+"'"+":"+"'"+valueofp+"'";
					}else{
						keyvalues=keyvalues+"'"+keyofp+"'"+":"+"'"+valueofp+"'"+",";
					}
					j++;
				}
				
				keyvalues=keyvalues+"}";
				
				String tmp = "'" + name + "'" + ":{" + "'src'" + ":'" + src + "'"
						+ "," + "'keyvalues' :"+keyvalues + "}";
				
				if(k!=targets.length-1){
					tmp=tmp+",";
				}
				
				xmlinfo.append(tmp);
				
			}
			if(i==xmlmap.keySet().size()-1){
				xmlinfo.append("}}");
			}else{
				xmlinfo.append("},");
			}
			
			
			i++;
		}
		
 		this.result=xmlinfo.toString();
// 		JSONObject tempjson = JSONObject.fromObject(this.result);
 		
 		return new DefaultHttpHeaders("show");
 	}
 	



	
 	
 	private static void findFirstV(String param,Set<String> set){
		int start=param.indexOf("${");
		int end =param.indexOf("}");
		if(start==-1){
			return;
		}
		

		if(start+2<end){
			String v=param.substring(start+2, end);
			set.add(v);
		}
		
		
		findFirstV(param.substring(end+1),set);
		
 	}
 	
   
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void validate() {
		// TODO Auto-generated method stub
		
	}


	public Properties getP() {
		return p;
	}


	public void setP(Properties p) {
		this.p = p;
	}


	public Set getSet() {
		return set;
	}


	public void setSet(Set set) {
		this.set = set;
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	
}
