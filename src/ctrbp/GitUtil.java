package ctrbp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.xmlbeans.XmlException;
import org.eclipse.jgit.api.CloneCommand;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.errors.GitAPIException;
import org.eclipse.jgit.api.errors.InvalidRemoteException;
import org.eclipse.jgit.api.errors.TransportException;
import org.eclipse.jgit.internal.storage.file.FileRepository;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.transport.CredentialsProvider;
import org.eclipse.jgit.transport.UsernamePasswordCredentialsProvider;

import cn.com.oracle.nokk.ProjectDocument;

public class GitUtil {

	public synchronized static void gitFolder(File dir) throws InvalidRemoteException, TransportException, GitAPIException, IOException{
		String username = "git";
 		String password = "welcome1";
 		String url = "git@cdcjp03.cn.oracle.com:/home/git/repositories/automation.git";
 		
 		
 		// credentials
 		CredentialsProvider cp = new UsernamePasswordCredentialsProvider(username,
 				password);
 	
 		if (dir.exists()) {
 			dir = new File(dir.toString() + File.separator + ".git");
 			Repository repos = new FileRepository(dir);
 			Git git = new Git(repos);
 			git.pull().setCredentialsProvider(cp).call();
 	 		git.close();
 		} else {
 			CloneCommand cc = Git.cloneRepository().setCredentialsProvider(cp).setURI(url).setDirectory(dir);
 			Git git = cc.call();
 			git.close();
 		}
 		
// 	 	if (dir.exists()) {
// 			deleteFile(dir);
// 			dir.delete();
//
// 		}
//
// 	 	
// 	 	CloneCommand cc = new CloneCommand().setCredentialsProvider(cp)
//					.setDirectory(dir).setURI(url);
//		Git git = cc.call();
//		git.close();

	}
	
	private static void deleteFile(File f) {
		if (f.isDirectory()) {
			File[] files = f.listFiles();
			for (File file : files) {
				deleteFile(file);
			}
			
		}
		
		f.delete();
		
		
	}
	
	public synchronized static void setMaps(Map<String, ProjectDocument> xmlmap,Map<String, Properties> propmap,File dir) throws XmlException, IOException{
		

		File[] files = dir.listFiles();
		
		for (int i = 0; i < files.length; i++) {
			String name = files[i].getName();

			if (files[i].isDirectory()) {

			} else if (name.endsWith(".xml")) {
				FileInputStream fis = new FileInputStream(files[i]);
				ProjectDocument doc = ProjectDocument.Factory.parse(fis);
				fis.close();
				xmlmap.put(name.replace(".xml", ""), doc);

			} 
			else if (name.endsWith(".properties")) {
				FileInputStream fis = new FileInputStream(files[i]);
				Properties p = new Properties();
				p.load(fis);
				fis.close();
				propmap.put(name.replace(".properties", ""), p);
			}

		}
	}
	
}
