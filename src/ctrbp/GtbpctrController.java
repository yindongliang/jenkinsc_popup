package ctrbp;




import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.rest.DefaultHttpHeaders;
import org.apache.struts2.rest.HttpHeaders;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Validateable;
import com.opensymphony.xwork2.ValidationAwareSupport;

@Results({
    @Result(name="success", type="redirectAction", params = {"actionName" , "gtbpctr"})
})
public class GtbpctrController extends ValidationAwareSupport implements ModelDriven<Object>, Validateable{
    
	
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


	// GET /memcachedxml
    public HttpHeaders index() {
    	 
         return new DefaultHttpHeaders("index")
             .disableCaching();
    	
    }
    
    
 // GET /orders/1
 	public HttpHeaders show() throws Exception {

 		System.out.println(id);
 		
// 		String path = "/"+id.replace("&&", ".").replace("&", "/");
 		//JSONObject paramsInfo = JSONObject.fromObject(id);     
 		InputStream in = new BufferedInputStream(new FileInputStream("D:\\Y_private\\Dev\\workspace\\z_automation\\src\\build.properties"));
 		Properties p = new Properties();
 		p.load(in);
 		
 		setSet(p.entrySet());
 		result="";
 		
 		return new DefaultHttpHeaders("show");
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
